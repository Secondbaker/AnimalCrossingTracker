class CreateIslandCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :island_collections do |t|
      t.string :title
      t.string :thumbnail

      t.timestamps
    end
  end
end
