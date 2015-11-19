class UsersController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :require_user, except: [:index, :show, :new, :create]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User updated"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def get_user
    @user = User.find(session[:user_id])
  end
end
