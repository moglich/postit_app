class UsersController < ApplicationController
  before_action :require_user, except: [:index, :show, :new, :create]

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = user.id
      flash[:notice] = "User created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
