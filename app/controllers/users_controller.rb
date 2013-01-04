class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @ribbit = Ribbit.new
    @relationship = Relationship.where(
        follower_id: current_user.id,
        followed_id: @user.id
    ).first_or_initialize if current_user
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
