class AddColumnFishingTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :fishing_types, :name, :string
  end
end
