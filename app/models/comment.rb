class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  
  mount_uploader :image, ImageUploader
  
  validates :content, presence: true, length: { maximum: 150 }
end
