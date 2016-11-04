class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        flash[:notice] = "Could not find a user with provided username or password."
        redirect_to '/login'
      end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to '/'
  end

end
