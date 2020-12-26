class CreateFishingTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :fishing_types do |t|
      t.string :content
      t.references :spot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
