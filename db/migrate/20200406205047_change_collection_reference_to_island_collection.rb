class ChangeCollectionReferenceToIslandCollection < ActiveRecord::Migration[6.0]
  def change
    remove_reference :collectibles, :collection, index:true
    add_reference :collectibles, :island_collection, index:true 
  end
end
