class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_user
  	redirect_to home_path, notice: "Yeah right, because it's that easy" unless current_user.try(:admin?)
  end

end
