class AddDefaultToIslandCollection < ActiveRecord::Migration[6.0]
  def change
    add_column :island_collections, :default, :boolean
  end
end
