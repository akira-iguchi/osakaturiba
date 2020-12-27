class ChangeColumnToFishingTypes < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :fishing_types, :spots
  end
end
