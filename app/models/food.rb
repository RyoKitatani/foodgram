class Food < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :food_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
  validates :shop_name, presence: true
  validates :image, presence: true
  
end
