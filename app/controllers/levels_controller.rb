class LevelsController < ApplicationController
	before_filter :admin_user, :only => [:create, :edit, :update, :destroy]
	before_filter :registered_user, :only => [:show]

	def show
		@level = Level.find(params[:id])
		redirect_to @level, :notice => "Being clever, are we?" if params[:redirect_to_current_location]
	end

	def create
		@level = Level.set(params[:level])
		@level_last = Level.last
		if @level.save
			@level_last.update_attributes(:next_id => Level.last.id) if @level_last
			flash[:success] = "Level successfully created"
			redirect_to @level
		else
			render 'main_pages/admin'
		end 
	end

#	def update
#		@level= Level.find(params[:id])
#		if @level.update_attributes(params[:level])
#			flash[:success] = "Change successful"
#			redirect_to @level
#		else
#			render 'main_pages/admin'
#	end

	def update
		
	end

	def destroy
		
	end

	private

	def admin_user
  		redirect_to home_path, :notice => "Yeah right, because it's that easy" unless current_user.try(:admin?)
	end

	def registered_user
		redirect_to home_path, :notice => "Register to play or SignIn" unless current_user.try(:admin?)
		if current_user and not current_user.admin
			params[:redirect_to_current_location] = true  if params[:id].to_i != current_user.score
			params[:id] = current_user.score
		end
	end
end
