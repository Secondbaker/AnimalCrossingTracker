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

ActiveRecord::Schema.define(version: 2020_05_20_143048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
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

  create_table "collectible_attribute_lists", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collectible_attributes", force: :cascade do |t|
    t.integer "collectible_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "collectible_attribute_value_type"
    t.integer "collectible_attribute_value_id"
    t.integer "collectible_attribute_type_id"
    t.integer "position"
    t.integer "collectible_attribute_container_id"
    t.string "collectible_attribute_container_type"
    t.string "label"
    t.index ["collectible_attribute_container_id"], name: "collectible_attribute_container_id_index"
    t.index ["collectible_attribute_type_id"], name: "collectible_attribute_type_index"
    t.index ["collectible_attribute_value_type", "collectible_attribute_value_id"], name: "collectible_attribute_value_index"
  end

  create_table "collectibles", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "thumbnail"
    t.string "name"
    t.boolean "complete"
    t.bigint "island_collection_id"
    t.integer "position"
    t.index ["island_collection_id"], name: "index_collectibles_on_island_collection_id"
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
    t.string "slug"
    t.boolean "default"
    t.index ["slug"], name: "index_island_collections_on_slug", unique: true
  end

  create_table "island_collections_users", id: false, force: :cascade do |t|
    t.bigint "island_collection_id", null: false
    t.bigint "user_id", null: false
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

  create_table "my_collected_collectibles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "collectible_id"
    t.hstore "completions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collectible_id", "user_id"], name: "by_collectible_user", unique: true
    t.index ["collectible_id"], name: "index_my_collected_collectibles_on_collectible_id"
    t.index ["user_id", "collectible_id"], name: "by_user_collectible", unique: true
    t.index ["user_id"], name: "index_my_collected_collectibles_on_user_id"
  end

  create_table "number_collectible_attributes", force: :cascade do |t|
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shadow_sizes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "string_collectible_attributes", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "label"
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

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "auth0_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "villager_genders", force: :cascade do |t|
    t.integer "value", limit: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "collectible_attributes", "collectibles"
  add_foreign_key "my_collected_collectibles", "collectibles"
  add_foreign_key "my_collected_collectibles", "users"
  add_foreign_key "time_of_years", "collectible_attributes"
end
