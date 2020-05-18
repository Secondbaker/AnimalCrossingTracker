class AddLabelToStringCollectibleAttributes < ActiveRecord::Migration[6.0]
  def up
    add_column :string_collectible_attributes, :label, :string
    
  end
  def down


    remove_column :string_collectible_attributes, :label, :string
  end
end
