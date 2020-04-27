class AddPositionToCollectibles < ActiveRecord::Migration[6.0]
  def change
    add_column :collectibles, :position, :integer
  end
end
