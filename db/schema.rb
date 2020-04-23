# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_23_141923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bell_values", force: :cascade do |t|
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "birthdays", force: :cascade do |t|
    t.date "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bug_locations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "bug_locations_spots", id: false, force: :cascade do |t|
    t.integer "bug_location_id", null: false
    t.integer "bug_spot_id", null: false
  end

  create_table "bug_spots", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "catchphrases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "catchphrases_villager_catchphrases", id: false, force: :cascade do |t|
    t.integer "catchphrase_id", null: false
    t.integer "villager_catchphrase_id", null: false
  end

  create_table "collectible_attribute_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collectible_attributes", force: :cascade do |t|
    t.integer "collectible_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "collectible_attribute_value_type"
    t.integer "collectible_attribute_value_id"
    t.integer "collectible_attribute_type_id"
    t.integer "position"
    t.index ["collectible_attribute_type_id"], name: "collectible_attribute_type_index"
    t.index ["collectible_attribute_value_type", "collectible_attribute_value_id"], name: "collectible_attribute_value_index"
    t.index ["collectible_id"], name: "index_collectible_attributes_on_collectible_id"
  end

  create_table "collectibles", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "thumbnail"
    t.string "name"
    t.boolean "complete"
    t.bigint "island_collection_id"
    t.index ["island_collection_id"], name: "index_collectibles_on_island_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "descriptions", force: :cascade do |t|
    t.text "information"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fish_sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fish_sizes_shadow_sizes", id: false, force: :cascade do |t|
    t.integer "fish_size_id", null: false
    t.integer "shadow_size_id", null: false
  end

  create_table "fishing_locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fishing_locations_spots", id: false, force: :cascade do |t|
    t.integer "fishing_location_id", null: false
    t.integer "fishing_spot_id", null: false
  end

  create_table "fishing_spots", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hours", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hours_time_of_days", id: false, force: :cascade do |t|
    t.bigint "hour_id", null: false
    t.bigint "time_of_day_id", null: false
  end

  create_table "island_collections", force: :cascade do |t|
    t.string "title"
    t.string "thumbnail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "months", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "months_time_of_years", id: false, force: :cascade do |t|
    t.integer "month_id", null: false
    t.integer "time_of_year_id", null: false
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

  create_table "personality_types", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "personality_types_villager_personalities", id: false, force: :cascade do |t|
    t.integer "personality_type_id", null: false
    t.integer "villager_personality_id", null: false
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

  create_table "shadow_sizes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "species_villager_species", id: false, force: :cascade do |t|
    t.integer "species_id", null: false
    t.integer "villager_species_id", null: false
  end

  create_table "time_of_days", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_of_years", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "collectible_attribute_id"
    t.index ["collectible_attribute_id"], name: "index_time_of_years_on_collectible_attribute_id"
  end

  create_table "villager_catchphrases", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "villager_genders", force: :cascade do |t|
    t.integer "value", limit: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "villager_personalities", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "villager_species", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "collectible_attributes", "collectibles"
  add_foreign_key "milestone_values", "milestones"
  add_foreign_key "reward_title_positions", "passport_titles"
  add_foreign_key "reward_title_positions", "reward_titles"
  add_foreign_key "time_of_years", "collectible_attributes"
end
