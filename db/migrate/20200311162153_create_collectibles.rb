class CreateCollectibles < ActiveRecord::Migration[6.0]
  def change
    drop_table (:collectibles, if_exists: true)
    create_table :collectibles do |t|
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
