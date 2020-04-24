class CreateCollectibleAttributeListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :collectible_attribute_list_items do |t|
      t.references :collectible_attribute_list, null: false, foreign_key: true, index: { name: "index_on_list" }
      t.integer :position

      t.timestamps
    end
  end
end
