class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  mount_uploader :image, ImageUploader

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲストユーザー'
    end
  end

  has_many :favorites, dependent: :destroy
  has_many :likes, through: :favorites, source: :spot

  has_many :records, dependent: :destroy

  has_many :comments, dependent: :destroy

  def favorite(spot)
    favorites.find_or_create_by(spot_id: spot.id)
  end

  def unfavorite(spot)
    favorite = favorites.find_by(spot_id: spot.id)
    favorite.destroy if favorite
  end

  def like?(spot)
    likes.include?(spot)
  end
end
