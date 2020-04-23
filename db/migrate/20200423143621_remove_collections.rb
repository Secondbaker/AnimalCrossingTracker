class RemoveCollections < ActiveRecord::Migration[6.0]
  def up
    drop_table :collections
  end
  def down
    create_table :collections do |t|
      t.string :title

      t.timestamps
    end
  end
end
