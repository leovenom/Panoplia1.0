require 'letter_avatar/has_avatar'
class User < ApplicationRecord
  include LetterAvatar::HasAvatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one_attached :avatar
  
  has_many :shots, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  acts_as_voter
  

  has_many :active_friendships, class_name: "Friendship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_friendships, class_name: "Friendship", foreign_key: "followed_id", dependent: :destroy

  has_many :followings, through: :active_friendships, source: :followed
  has_many :followers, through: :passive_friendships, source: :follower

  has_many :jobs

  #follow another user
  def follow(other_user)
    active_friendships.create(followed_id: other_user.id)
  end

  #Unfollow a other_user
  def unfollow(other_user)
    active_friendships.find_by(followed_id: other_user.id).destroy
  end
  #Is following a other_user?
  def following?(other_user)
    following_ids.include?(other_user.id)
  end
  
  ARTS = ["Illustration", "Graphic Design", "Drawing", "Photography", "Video" , "Motion" , "Sculpture", "Graffiti", "Dance", "Music", "Serigraphy", "Theater", "Painting", "Collage", "Embroidery", "Developer"]

end
