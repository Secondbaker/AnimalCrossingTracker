class CreateJoinTablePersonalityTypeVillagerPersonality < ActiveRecord::Migration[6.0]
  def change
    create_join_table :personality_types, :villager_personalities do |t|
      # t.index [:personality_type_id, :villager_personality_id]
      # t.index [:villager_personality_id, :personality_type_id]
    end
  end
end
