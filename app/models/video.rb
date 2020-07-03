class Video < ApplicationRecord	
	belongs_to :user
	has_one_attached :video
	has_many :comments, dependent: :destroy
  
	is_impressionable
	acts_as_votable
end
