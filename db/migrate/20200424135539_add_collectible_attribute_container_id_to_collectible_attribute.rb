class AddCollectibleAttributeContainerIdToCollectibleAttribute < ActiveRecord::Migration[6.0]
  def up
    add_column :collectible_attributes, :collectible_attribute_container_id, :integer
    add_column :collectible_attributes, :collectible_attribute_container_type, :string
    change_column :collectible_attributes, :collectible_id, :integer, null: true
  end
  def down
    remove_column :collectible_attributes, :collectible_attribute_container_id, :integer
    remove_column :collectible_attributes, :collectible_attribute_container_type, :string
    change_column :collectible_attributes, :collectible_id, :integer, null: false
  end
end
