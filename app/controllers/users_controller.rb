class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'You have successfully registered! You are now able to access all specials.'
      remember @user
      redirect_to root_url
    end
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
