class RemoveCatchphrase < ActiveRecord::Migration[6.0]
  def up
    drop_table :catchphrases
    drop_table :catchphrases_villager_catchphrases
  end
  def down
    create_table :catchphrases do |t|
      t.string :name

      t.timestamps
    end
    create_join_table :catchphrases, :villager_catchphrases do |t|
      # t.index [:catchphrase_id, :villager_catchphrase_id]
      # t.index [:villager_catchphrase_id, :catchphrase_id]
    end
  end
end
