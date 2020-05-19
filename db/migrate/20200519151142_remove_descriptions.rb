class RemoveDescriptions < ActiveRecord::Migration[6.0]
  def up
    drop_table :descriptions
  end
  def down
    create_table :descriptions do |t|
      t.text :information

      t.timestamps
    end
  end
end
