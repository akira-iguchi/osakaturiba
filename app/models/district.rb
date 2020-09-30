class District < ApplicationRecord
    has_many :spots
    
    validates :name, presence: true, length: { maximum: 50 }
end
