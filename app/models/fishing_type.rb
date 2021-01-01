class FishingType < ApplicationRecord
  has_many :types
  has_many :spots, through: :types

  validates :name, presence: true, length: { maximum: 15 }
  validates :content, presence: true, length: { maximum: 300 }
end
