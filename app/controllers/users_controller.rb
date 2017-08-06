class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted."
    redirect_to root_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
