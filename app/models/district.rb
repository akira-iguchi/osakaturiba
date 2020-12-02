class District < ApplicationRecord
  has_many :spots

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
