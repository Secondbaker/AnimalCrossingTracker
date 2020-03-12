class AddThumbnailNameAndCompleteToCollectible < ActiveRecord::Migration[6.0]
  def change
    add_column :collectibles, :thumbnail, :string
    add_column :collectibles, :name, :string
    add_column :collectibles, :complete, :boolean
  end
end
