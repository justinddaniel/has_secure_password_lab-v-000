class UsersController < ApplicationController

  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end

  def new
  end

  def create
    user = User.new(user_params).save
    redirect_to '/users'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
