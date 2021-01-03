class Record < ApplicationRecord
  belongs_to :user

  validates :fishingtype, presence: true, length: { maximum: 30 }
  validates :spot, presence: true, length: { maximum: 30 }
  validates :bait, length: { maximum: 30 }
  validates :weather, length: { maximum: 30 }
  validates :detail, length: { maximum: 150 }
  validates :start_time, presence: true
end
