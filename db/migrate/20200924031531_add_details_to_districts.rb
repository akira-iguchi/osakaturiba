class AddDetailsToDistricts < ActiveRecord::Migration[5.2]
  def change
    add_column :districts, :latitude, :float
    add_column :districts, :longitude, :float
  end
end
