class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @ribbit = Ribbit.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thank you for signing up for Ribbit!"
    else
      render 'new'
    end
  end

end
