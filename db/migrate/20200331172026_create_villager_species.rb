class CreateVillagerSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :villager_species do |t|

      t.timestamps
    end
  end
end
