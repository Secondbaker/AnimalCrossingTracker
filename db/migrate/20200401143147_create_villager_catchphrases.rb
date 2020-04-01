class CreateVillagerCatchphrases < ActiveRecord::Migration[6.0]
  def change
    create_table :villager_catchphrases do |t|

      t.timestamps
    end
  end
end
