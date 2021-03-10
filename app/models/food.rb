class Food < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :food_comments, dependent: :destroy
end
