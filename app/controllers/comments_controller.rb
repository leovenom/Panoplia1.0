class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]
	before_action :find_commentable

	def def new
		@comment = Comment.new
	end
	

  def create
  	# @shot = Shot.find(params[:shot_id]) # finds the shot with the associated shot_id
  	# @comment = @shot.comments.create(comment_params) # creates the comment on the shot passing in params 
  	# @comment.user_id = current_user.id if current_user # assigns logged in user's ID to comment
  	# @comment.save!

		# redirect_to shot_path(@shot)
		
		# @video = Video.find(params[:video_id]) # finds the video with the associated video_id
  	# @comment_video = @video.comments.create(comment_params) # creates the comment on the video passing in params 
  	# @comment_video.user_id = current_user.id if current_user # assigns logged in user's ID to comment
  	# @comment_video.save!

		# redirect_to video_path(@video)
		
		@comment = @commentable.comments.create(comment_params)
		@comment.user_id = current_user.id if current_user # assigns logged in user's ID to comment
		@comment.save!
		redirect_to @commentable

	end
	

  def destroy
  	# @shot = Shot.find(params[:shot_id])
  	# @comment = @shot.comments.find(params[:id])
  	# @comment.destroy
		# redirect_to shot_path(@shot)
		
		# @video = Video.find(params[:video_id])
  	# @comment_video = @video.comments.find(params[:id])
  	# @comment_video.destroy
		# redirect_to video_path(@video)
		

		@comment = @commentable.comments.find(params[:id])
		@comment.destroy
		redirect_to @commentable
	end


  private

  def comment_params 
  	params.require(:comment).permit(:name, :response)
	end
	
	def find_commentable
		if params[:shot_id]
			@commentable = Shot.find_by_id(params[:shot_id]) 
		elsif params[:video_id]
			@commentable = Video.find_by_id(params[:video_id])
		end
	end
end
