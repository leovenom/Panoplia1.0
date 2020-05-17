class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one_attached :avatar

  has_many :shots, dependent: :destroy
  has_many :comments, dependent: :destroy
  acts_as_voter

  def entity?
    type == 'Entity'
  end
  
end
