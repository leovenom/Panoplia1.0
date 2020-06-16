class SearchesController < ApplicationController
  def index
    @shots = Shot.where(["title LIKE ?", "%#{params[:search]}%"])
    @jobs = Job.where(["title LIKE ?", "%#{params[:search]}%"])
    @users  = User.where(["name LIKE ?", "%#{params[:id]}%"])
    redirect_to user_path(shot.user)
  end

  def new
    @search = Search.new
  end
  
  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Seach.find(params[:id])
  end

  def search
    @shots = Search.create(search_params)
    @user = Search.create(search_params)
    @jobs = Search.create(search_params)
  end



  private

  def search_params
    params.require(:search).permit(:keywords,:user_shot, :title, :description, :location, :art_type, :job_type, :name, :username, :bio, :art, :type, :entity)
  end

end