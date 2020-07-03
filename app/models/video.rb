class Video < ApplicationRecord	
	belongs_to :user
	belongs_to :shot
	has_one_attached :video
	has_many :comments, dependent: :destroy
  
	is_impressionable
	acts_as_votable
end
