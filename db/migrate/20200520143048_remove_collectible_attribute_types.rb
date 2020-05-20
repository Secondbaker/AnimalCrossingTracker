class RemoveCollectibleAttributeTypes < ActiveRecord::Migration[6.0]
  def up
    drop_table :collectible_attribute_types
  end
  def down
    create_table :collectible_attribute_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
