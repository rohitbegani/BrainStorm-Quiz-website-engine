class MainPagesController < ApplicationController
	def home	
	
	end
	def admin
	@level = Level.new
	@user = User.new	
	end
end
