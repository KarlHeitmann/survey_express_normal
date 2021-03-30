class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_back(fallback_location: root_path)
    else 
      redirect_to profile_path, notice: "user already exists"
    end
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
