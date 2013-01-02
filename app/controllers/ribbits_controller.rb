class RibbitsController < ApplicationController
    def index
        @ribbits = Ribbit.all include: :user
        @ribbit = Ribbit.new
    end
    def create
        @ribbit = Ribbit.new(params[:ribbit])
        @ribbit.user_id = current_user.id

        if @ribbit.save
            redirect_to current_user 
        else
            flash[:error] = "Problem!";
            redirect_to current_user
        end
    end
end
