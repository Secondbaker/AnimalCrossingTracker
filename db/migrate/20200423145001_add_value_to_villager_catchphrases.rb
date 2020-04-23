class AddValueToVillagerCatchphrases < ActiveRecord::Migration[6.0]
  def change
    add_column :villager_catchphrases, :value, :string
  end
end
