class RemoveStringCollectibleAttributeEquivalents < ActiveRecord::Migration[6.0]
  def up
    drop_table :descriptions
    drop_table :personality_types
    drop_table :villager_personalities
    drop_table :personality_types_villager_personalities
  end
  def down
    create_table :descriptions do |t|
      t.text :information

      t.timestamps
    end
    create_table :villager_personalities do |t|

      t.timestamps
    end
    create_table :personality_types do |t|
      t.string :name

      t.timestamps
    end
    create_join_table :personality_types, :villager_personalities do |t|
      t.index [:personality_type_id, :villager_personality_id], name: "personality_types_villagers"
      t.index [:villager_personality_id, :personality_type_id], name: "personality_villagers_types"
    end
  end
end
