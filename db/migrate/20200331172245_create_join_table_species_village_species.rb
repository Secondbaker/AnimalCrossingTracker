class CreateJoinTableSpeciesVillageSpecies < ActiveRecord::Migration[6.0]
  def change
    create_join_table :species, :villager_species do |t|
      # t.index [:species_id, :villager_species_id]
      # t.index [:villager_species_id, :species_id]
    end
  end
end
