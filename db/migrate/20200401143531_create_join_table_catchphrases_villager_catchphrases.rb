class CreateJoinTableCatchphrasesVillagerCatchphrases < ActiveRecord::Migration[6.0]
  def change
    create_join_table :catchphrases, :villager_catchphrases do |t|
      # t.index [:catchphrase_id, :villager_catchphrase_id]
      # t.index [:villager_catchphrase_id, :catchphrase_id]
    end
  end
end
