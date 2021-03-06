class Spot < ApplicationRecord
  belongs_to :district
  has_many :favorites, dependent: :destroy
  has_many :like_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :types
  has_many :fishing_types, through: :types

  validates :name, presence: true
  validates :explanation, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
