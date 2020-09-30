class RenameImagesColumnToSpots < ActiveRecord::Migration[5.2]
  def change
    rename_column :spots, :images, :image
  end
end
