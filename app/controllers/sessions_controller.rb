class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in"
      redirect_to root_path
    else
      flash[:error] = "Username or password not valid"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You logged out"
    redirect_to root_path
  end

end
