class CreateCollectibleAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :collectible_attributes do |t|
      t.string :name
      t.references :collectible, null: false, foreign_key: true

      t.timestamps
    end
  end
end
