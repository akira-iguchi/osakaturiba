class AddImagesToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :images, :string
  end
end
