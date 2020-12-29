class Record < ApplicationRecord
  belongs_to :user

  validates :fishingtype, presence: true, length: { maximum: 20 }
  validates :spot, presence: true, length: { maximum: 20 }
  validates :bait, length: { maximum: 20 }
  validates :detail, length: { maximum: 200 }
  validates :start_time, presence: true
end
