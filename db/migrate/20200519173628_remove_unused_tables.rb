class RemoveUnusedTables < ActiveRecord::Migration[6.0]
  def up
    drop_table :collectible_attribute_list_items
    drop_table :milestone_values
    drop_table :milestones
    drop_table :mood_names
    drop_table :mood_names_moods
    drop_table :moods
    drop_table :rarities
    drop_table :reward_title_positions
    drop_table :reward_titles
    drop_table :passport_titles
  end
  def down
    create_table "collectible_attribute_list_items", force: :cascade do |t|
      t.bigint "collectible_attribute_list_id", null: false
      t.integer "position"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["collectible_attribute_list_id"], name: "index_on_list"
    end
    create_table "milestone_values", force: :cascade do |t|
      t.bigint "milestone_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.integer "value"
      t.index ["milestone_id"], name: "index_milestone_values_on_milestone_id"
    end
    create_table "milestones", force: :cascade do |t|
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
    create_table "mood_names", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  
    create_table "mood_names_moods", id: false, force: :cascade do |t|
      t.integer "mood_id", null: false
      t.integer "mood_name_id", null: false
    end
  
    create_table "moods", force: :cascade do |t|
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    create_table "passport_titles", force: :cascade do |t|
      t.string "value"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  
    create_table "rarities", force: :cascade do |t|
      t.integer "value"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  
    create_table "reward_title_positions", force: :cascade do |t|
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.integer "position"
      t.bigint "reward_title_id"
      t.bigint "passport_title_id"
      t.index ["passport_title_id"], name: "index_reward_title_positions_on_passport_title_id"
      t.index ["reward_title_id"], name: "index_reward_title_positions_on_reward_title_id"
    end
  
    create_table "reward_titles", force: :cascade do |t|
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    add_foreign_key "collectible_attribute_list_items", "collectible_attribute_lists"
    add_foreign_key "milestone_values", "milestones"
    add_foreign_key "reward_title_positions", "passport_titles"
    add_foreign_key "reward_title_positions", "reward_titles"
  end
end
