class AddSlugToIslandCollections < ActiveRecord::Migration[6.0]
  def change
    add_column :island_collections, :slug, :string
    add_index :island_collections, :slug, unique: true
  end
end
