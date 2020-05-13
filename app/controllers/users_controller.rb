class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @user_shots  = @user.shots
  end

  def edit
    @user = current_user
  end

  def update
  end
end
