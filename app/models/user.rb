class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :foods, dependent: :destroy
  has_many :food_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  attachment :profile_image
  
  acts_as_followable
  acts_as_follower
  
end
