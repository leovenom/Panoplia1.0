class Comment < ApplicationRecord
	belongs_to :shot
	belongs_to :user
	#belongs_to :video
end
