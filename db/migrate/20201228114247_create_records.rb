class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :fishingtype
      t.string :spot
      t.string :bait
      t.string :weather
      t.time :fishing_start_time
      t.time :fishing_end_time
      t.string :detail
      t.datetime :start_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
