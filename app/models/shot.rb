class Shot < ApplicationRecord
	belongs_to :user
	has_many :comments, as: :commentable, dependent: :destroy
	
	mount_uploader :user_shot, UserShotUploader
	is_impressionable
	acts_as_votable

	validate :user_shot_size_validation

	private

  def user_shot_size_validation
    errors[:user_shot] << "should be less than 2MB" if user_shot.size > 2.megabytes
  end
end