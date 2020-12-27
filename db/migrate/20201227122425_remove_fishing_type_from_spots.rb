class RemoveFishingTypeFromSpots < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :spots, :fishing_types
  end
end