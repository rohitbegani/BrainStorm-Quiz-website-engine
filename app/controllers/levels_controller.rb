class LevelsController < ApplicationController
 	
 	before_filter :admin_user, :only => [:create, :edit, :update, :destroy]
  before_filter :registered_user, :only => [:show, :play]
   before_filter :game_playable?, :only => [:show, :play]

	def show
	  @level = Level.find(params[:id])
	  @attempt = current_user.attempts.build
	  @attempts = Attempt.find_all_by_user_id_and_level_id(current_user.id, @level.id)
	  redirect_to @level, :notice => "sorry" if params[:redirect_to_correct_location]
	end

	def play
	  redirect_to level_path(current_user.score)
	end

	def create
	  @level = Level.set(params[:level])
	  @level_last = Level.last

	  if @level.save
	    @level_last.update_attributes(:next_id => Level.last.id ) if @level_last
	    flash[:success] = "Level Created"
	    redirect_to @level
	  
	  end
    end

    def update 
      @level = Level.find(params[:id])
      if @level.update_attributes(params[:level])
      	flash[:success] = "Level successfully Updated"
      	redirect_to @level
      else
      	render 'extra_pages/edit_level'
      end
    end



  private
  def admin_user
    redirect_to home_path, notice: "sudo says: YOU SHALL NOT PASS!" unless current_user and current_user.admin?
  end

  def registered_user
    redirect_to home_path, notice: "Register or Sign in to play." unless current_user
    if current_user and not current_user.admin?
      params[:redirect_to_correct_location] = true if params[:id].to_i != current_user.score
      params[:id] = current_user.score
    end
  end
  
   

end
