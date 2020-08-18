class SearchesController < ApplicationController
  def index
    
    @shots = Shot.where(["title ILIKE ?", "%#{params[:search]}%"]).order('created_at DESC')
    @shots_description = Shot.where(["description ILIKE ?", "%#{params[:search]}%"]).order('created_at DESC')
    #@shots = @shots_description + @shot

    # @jobs = Job.where(["title ILIKE ?", "%#{params[:search]}%"]).order('created_at DESC')
    # @jobs_description = Job.where(["description ILIKE ?", "%#{params[:search]}%"]).order('created_at DESC')
    # @jobs_job_type = Job.where(["job_type ILIKE ?", "%#{params[:search]}%"]).order('created_at DESC')
    # @jobs_location = Job.where(["location ILIKE ?", "%#{params[:search]}%"]).order('created_at DESC')
    # @jobs_art_type = Job.where(["art_type ILIKE ?", "%#{params[:search]}%"]).order('created_at DESC')
    #@jobs = @jobs_title + @jobs_description + @jobs_job_type + @jobs_location + @jobs_art_type
    
    @users = User.where(["name ILIKE ? OR location ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%"]).order('created_at DESC')
    #@users_bio = User.where(["bio ILIKE ?", "%#{params[:search]}%"]).order('created_at DESC')
    #@users_username = User.where(["username ILIKE ?", "%#{params[:search]}%"]).order('created_at DESC')
    #@users_location = User.where(["location ILIKE ?", "%#{params[:search]}%"]).order('created_at DESC')

    @videos = Video.where(["videos.title ILIKE ?", "%#{params[:search]}%"]).order('created_at DESC')
    @videos = Video.where(["videos.description ILIKE ?", "%#{params[:search]}%"]).order('created_at DESC')
    #, :case_sensitive => false???
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
    #@jobs = Job.where(["title ILIKE ?", "%#{params[:search]}%"]).order('created_at DESC')
    @resources = (@shots + @videos).sort {|a,b| b.created_at <=> a.created_at }
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


  private

  def search_params
    params.require(:search).permit(:keywords, :user_shot, :title, :description, :location, :art_type, :job_type, :name, :username, :bio, :art, :type, :entity)
  end

end