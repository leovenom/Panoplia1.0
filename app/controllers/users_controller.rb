class UsersController < ApplicationController
  before_action :check_authorization, only: [:edit, :update]
  before_action :set_user
  
  def show
    @user = User.find(params[:id])
    @user_shots  = @user.shots.order('shots.created_at DESC')
    @user_videos = @user.videos.order('videos.created_at DESC')
    @video = Video.find_by(id: params[:id])
    @resources = (@user_shots + @user_videos).sort {|a,b| b.created_at <=> a.created_at }
  end

  def edit
    @user = current_user
    redirect_to profile_path
  end

  private

  def check_authorization
    unless current_user.id == params[:id].to_i
      redirect_to root_url
    end
  end

  def set_user
    @user = User.find(params[:id])
  end 
end
