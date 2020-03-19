class CreateBellValues < ActiveRecord::Migration[6.0]
  def change
    create_table :bell_values do |t|
      t.integer :value
      t.references :collectible, null: false, foreign_key: true

      t.timestamps
    end
  end
end
