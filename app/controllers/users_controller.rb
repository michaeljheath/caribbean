class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    #store the hotel id for redirect following successful register
    hotel_id = params[:hotel_id]
    session[:hotel_id] = hotel_id

    @user = User.new
    render partial: 'users/new'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      remember @user
      flash[:success] = 'You have successfully registered! You are now able to access all specials.'
      redirect_to "/accommodations/#{session[:hotel_id]}"
      session[:hotel_id] = nil
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
