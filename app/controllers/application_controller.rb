class ApplicationController < ActionController::Base
  	

 	def user_admin
 	  unless current_user and current_user.admin?
		redirect_to home_path, :alert => "Restricted area" 
	  end
	end

	def current_level
	  return(Level.last ? Level.last.id : 0) if current_user.admin?
	  current_user.score
	end

	
  def game_playable?
    if (Game.first and Game.first.is_playable) or current_user.admin?
    else
      redirect_to home_path, :notice => "We know YOU Love Brainstorm but it isn't playable yet."
    end
  end

  def sterlize(value)
  	value.chomp.downcase.gsub(/[\W\n\s]/,'')
  end



end
