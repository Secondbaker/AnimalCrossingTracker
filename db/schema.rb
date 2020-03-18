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

ActiveRecord::Schema.define(version: 2020_03_18_192846) do

  create_table "collectible_attributes", force: :cascade do |t|
    t.string "name"
    t.integer "collectible_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "value"
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

  create_table "time_of_days", force: :cascade do |t|
    t.integer "collectible_id", null: false
    t.time "start"
    t.time "end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collectible_id"], name: "index_time_of_days_on_collectible_id"
  end

  create_table "time_of_years", force: :cascade do |t|
    t.integer "start"
    t.integer "end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "collectible_id"
    t.index ["collectible_id"], name: "index_time_of_years_on_collectible_id"
  end

  add_foreign_key "collectible_attributes", "collectibles"
  add_foreign_key "collectibles", "collections"
  add_foreign_key "time_of_days", "collectibles"
  add_foreign_key "time_of_years", "collectibles"
end
