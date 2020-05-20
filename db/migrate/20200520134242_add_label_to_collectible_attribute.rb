class AddLabelToCollectibleAttribute < ActiveRecord::Migration[6.0]
  def change
    add_column :collectible_attributes, :label, :string
  end
end
