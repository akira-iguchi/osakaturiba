class CreateFishingTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :fishing_types do |t|
      t.string :name,   null: false, default: ""
      t.string :content, null: false, default: ""

      t.timestamps
    end
  end
end
