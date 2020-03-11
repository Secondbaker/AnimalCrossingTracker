class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    drop_table (:collections, if_exists: true)
    create_table :collections do |t|
      t.string :title

      t.timestamps
    end
  end
end
