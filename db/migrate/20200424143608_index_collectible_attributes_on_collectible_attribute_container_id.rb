class IndexCollectibleAttributesOnCollectibleAttributeContainerId < ActiveRecord::Migration[6.0]
  def change
    add_index :collectible_attributes, :collectible_attribute_container_id, name: "collectible_attribute_container_id_index"
    remove_index :collectible_attributes, :collectible_id
  end
end
