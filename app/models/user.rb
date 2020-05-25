class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one_attached :avatar

  has_many :shots, dependent: :destroy
  has_many :comments, dependent: :destroy
  acts_as_voter

  has_many :active_friendships, class_name: "Friendship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_friendships, class_name: "Friendship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_friendships, source: :followed
  has_many :followers, through: :passive_friendships, source: :follower

  #follow another user
  def follow(user)
    active_friendships.create(followed_id: user.id)
  end

  #Unfollow a user
  def unfollow(user)
    active_friendships.find_by(followed_id: user.id).destroy
  end
  #Is following a user?
  def following?(user)
    following.include?(user)
  end
  

  def entity?
    type == 'Entity'
  end
  
end
