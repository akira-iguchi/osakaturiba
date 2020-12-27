class FishingType < ApplicationRecord
  has_many :types
  has_many :spots, through: :types

  validates :name, presence: true
  validates :content, presence: true
end
