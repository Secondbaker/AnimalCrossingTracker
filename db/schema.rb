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

ActiveRecord::Schema.define(version: 2020_03_20_211357) do

  create_table "bell_values", force: :cascade do |t|
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.integer "collection_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "thumbnail"
    t.string "name"
    t.boolean "complete"
    t.index ["collection_id"], name: "index_collectibles_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "months", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rarities", force: :cascade do |t|
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_of_days", force: :cascade do |t|
    t.time "start"
    t.time "end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "collectible_attributes", "collectibles"
  add_foreign_key "collectibles", "collections"
end
