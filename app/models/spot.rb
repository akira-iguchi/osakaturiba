class Spot < ApplicationRecord
  belongs_to :district
  has_many :favorites
  has_many :like_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :explanation, presence: true
  validates :address, presence: true
end
