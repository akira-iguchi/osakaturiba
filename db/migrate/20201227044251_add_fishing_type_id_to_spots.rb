class AddFishingTypeIdToSpots < ActiveRecord::Migration[6.0]
  def change
    add_reference :spots, :fishing_types, foreign_key: true
  end
end
