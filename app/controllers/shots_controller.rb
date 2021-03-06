class ShotsController < ApplicationController
  respond_to :js, :html, :json
  before_action :set_shot, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :like, :unlike]
  impressionist :actions=> [:show]


  # GET /shots
  # GET /shots.json
  def index
    #@shots = Shot.all.order('created_at DESC')
    @all_shots = Shot.includes(:user).where.not(id: @shot).order('created_at DESC').limit(12).all
    #@shots = Shot.includes(:user).where.not(id: @shot).where(users: { entity: false}).order('shots.created_at DESC')
    #@shots = @all_shots.select { |shot| !shot.user.entity? }
    @shots = @all_shots
    #@random_shot = Shot.where.not(id: @shot).order("RANDOM()").first
    #@entity_shot = Shot.includes(:user).where.not(id: @shot).where(users: { entity: true}).order('shots.created_at DESC').first
    @entity_shots = @all_shots.limit(1).all.select { |shot| shot.user.entity? }
    @jobs = Job.all.order("created_at desc")
    #@videos = Video.all.order("created_at desc")
    #@resources = @videos.zip(@shots)
    @videos = Video.all.order("created_at desc").limit(12).all
    #@shots = Shot.includes(:user).where.not(id: @shot).order('created_at DESC')
    #@resources = @videos.zip(@shots)
    #@resources = (@videos + @shots).sort_by { |element| element.created_at }
    @resources = (@shots + @videos).sort {|a,b| b.created_at <=> a.created_at }
  end

  # GET /shots/1
  # GET /shots/1.json
  def show
    #@user_shot = current_user.shots.all.order(created_at: 'DESC')
    @random_shot = Shot.where.not(id: @shot).order("RANDOM()").first
    #@random_shot = Shot.includes(:user).where.not(id: @shot).where(users: { entity: false}).order("RANDOM()").first
  end

  # GET /shots/new
  def new
    @shot = current_user.shots.build
  end

  # GET /shots/1/edit
  def edit
  end

  # POST /shots
  # POST /shots.json
  def create
    @shot = current_user.shots.build(shot_params)

    respond_to do |format|
      if @shot.save
        format.html { redirect_to @shot, notice: 'Shot was successfully created.' }
        format.json { render :show, status: :created, location: @shot }
      else
        format.html { render :new }
        format.json { render json: @shot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shots/1
  # PATCH/PUT /shots/1.json
  def update
    respond_to do |format|
      if @shot.update(shot_params)
        format.html { redirect_to @shot, notice: 'Shot was successfully updated.' }
        format.json { render :show, status: :ok, location: @shot }
      else
        format.html { render :edit }
        format.json { render json: @shot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shots/1
  # DELETE /shots/1.json
  def destroy
    @shot.destroy
    respond_to do |format|
      format.html { redirect_to shots_url, notice: 'Shot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @shot = Shot.find(params[:id])
    if params[:format] == 'likes'
      @shot.liked_by current_user
    elsif  params[:format] == 'unlikes'
      @shot.unliked_by current_user
    else
    @shot.liked_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.json { render layout:false }
    end
  end
  end

  def unlike
    @shot.unliked_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.json { render layout:false }
    end
  end

  # def like
  #   @shot = Shot.find(params[:id])
  #   if params[:format] == 'likes'
  #     @shot.liked_by current_user
  #   elsif  params[:format] == 'unlikes'
  #     @shot.unliked_by current_user
  #   end
  # end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shot
      @shot = Shot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shot_params
      params.require(:shot).permit(:title, :description, :user_shot)
    end
end
