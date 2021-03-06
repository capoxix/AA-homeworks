class UsersController < ApplicationController
  def new
    @users = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
