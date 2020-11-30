class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { in: 6..32 }, presence: true, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
 
  mount_uploader :image, ImageUploader
  
  has_many :favorites, dependent: :destroy
  has_many :likes, through: :favorites, source: :spot
  
  has_many :comments, dependent: :destroy
  
  def favorite(spot)
    self.favorites.find_or_create_by(spot_id: spot.id)
  end

  def unfavorite(spot)
    favorite = self.favorites.find_by(spot_id: spot.id)
    favorite.destroy if favorite
  end

  def like?(spot)
    self.likes.include?(spot)
  end

end
