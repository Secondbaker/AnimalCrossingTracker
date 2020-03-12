class AddValueToCollectibleAttribute < ActiveRecord::Migration[6.0]
  def change
    add_column :collectible_attributes, :value, :string
  end
end
