class UserController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to new_users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)

end
