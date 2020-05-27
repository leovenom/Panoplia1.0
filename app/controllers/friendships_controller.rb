class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def create
    current_user.follow(@user)
    redirect_to @user
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to @user
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
