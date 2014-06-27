class ExtraPagesController < ApplicationController

   before_filter :user_admin, :only => [:admin, :edit_level]

   	def admin
   		@level = Level.new
   		@users = User.all
   	end

   	def leaderboard
   	  @users = User.order('score DESC, last_correct_answer_at ASC, updated_at ASC').paginate(:page => params[:page], :per_page => 50)
   	  @page  = (params[:page].to_i) -1 if params[:page]
   	end

   	def edit_level
   	  @level = Level.find(params[:id])
   	end

      def rules
      end

      def team
      end

end
