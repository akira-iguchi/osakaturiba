class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.references :district, foreign_key: true
      t.string :name
      t.string :explanation
      t.string :address

      t.timestamps
    end
  end
end
