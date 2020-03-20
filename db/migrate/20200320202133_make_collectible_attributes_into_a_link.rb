class MakeCollectibleAttributesIntoALink < ActiveRecord::Migration[6.0]
  def change
    remove_column :bell_values, :collectible_id, :integer
    remove_column :rarities, :collectible_id, :integer
    remove_column :time_of_days, :collectible_id, :integer
    remove_column :collectible_attributes, :name, :string
    remove_column :collectible_attributes, :value, :string

    add_reference :collectible_attributes, :collectible_attribute_value, polymorphic: true, index: {name: "collectible_attribute_value_index"}
    add_reference :collectible_attributes, :collectible_attribute_type, index: {name: "collectible_attribute_type_index"}
  end
end
