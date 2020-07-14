class Comment < ApplicationRecord
	#belongs_to :shot
	belongs_to :user
	#belongs_to :video
	belongs_to :commentable, polymorphic: true
end
