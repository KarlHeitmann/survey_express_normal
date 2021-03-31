class UsersController < ApplicationController
  def show
    redirect_to root_path
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_back(fallback_location: root_path)
    else 
      redirect_to profile_path, notice: "values already exists"
    end

  end

  def user_params
      params.require(:user).permit(:username, :email)
  end
end
