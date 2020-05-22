class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @user_shots  = @user.shots
  end

  def edit
    @user = current_user
    redirect_to profile_path
  end

  def update
  end
end
