class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.references :spot, null: false, foreign_key: true
      t.references :fishing_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
