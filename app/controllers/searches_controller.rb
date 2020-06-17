class SearchesController < ApplicationController
  def index
    @shot = Shot.where(["title LIKE ?", "%#{params[:search]}%"])
    @shots_description = Shot.where(["description LIKE ?", "%#{params[:search]}%"])
    @shots_user_shot = Shot.where(["user_shot LIKE ?", "%#{params[:search]}%"])
    @shots = @shots_description + @shots_user_shot + @shot
    @jobs_title = Job.where(["title LIKE ?", "%#{params[:search]}%"])
    @jobs_description = Job.where(["description LIKE ?", "%#{params[:search]}%"])
    @jobs_job_type = Job.where(["job_type LIKE ?", "%#{params[:search]}%"])
    @jobs_location = Job.where(["location LIKE ?", "%#{params[:search]}%"])
    @jobs_art_type = Job.where(["art_type LIKE ?", "%#{params[:search]}%"])
    @jobs = @jobs_title + @jobs_description + @jobs_job_type + @jobs_location + @jobs_art_type

    # if params[:search].present? && params[:search][:query].present?
    #   @shots = policy_scope(Shot).where("title ILIKE '%#{params[:search][:query]}%'")
    #   @shots_description = policy_scope(Shot).where("description ILIKE '%#{params[:search][:query]}%'")
    #   @shots_user_shot = policy_scope(Shot).where("user_shot ILIKE '%#{params[:search][:query]}%'")
    #   @shots = @shots_description + @shots_user_shot + @shots
    #   else
    #   @shots = policy_scope(Shot).order(created_at: :desc)
    #   end
  
    #   if params[:search].present? && params[:search][:query].present?
    #   @jobs = policy_scope(JOB).where(["title ILIKE ?", "%#{params[:search]}%"])
    #   end
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

  # def search
  #   @shots = Search.create(search_params)
  #   @user = Search.create(search_params)
  #   @jobs = Search.create(search_params)
  # end



  private

  def search_params
    params.require(:search).permit(:keywords, :user_shot, :title, :description, :location, :art_type, :job_type, :name, :username, :bio, :art, :type, :entity)
  end

end