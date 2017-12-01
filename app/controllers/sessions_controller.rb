class SessionsController < ApplicationController

  def new
  end

  def create
    raise params.inspect
    @user = User.find_by(name: params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to "/users"
  end

end
