class RemoveVillagerCatchphrase < ActiveRecord::Migration[6.0]
  def up
    drop_table :villager_catchphrases
  end
  def down
    create_table :villager_catchphrases do |t|

      t.timestamps
    end
    add_column :villager_catchphrases, :value, :string
  end
end
