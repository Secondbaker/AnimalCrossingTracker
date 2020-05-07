class CreateJoinTableIslandCollectionsUsers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :island_collections, :users do |t|
      # t.index [:island_collection_id, :user_id]
      # t.index [:user_id, :island_collection_id]
    end
  end
end
