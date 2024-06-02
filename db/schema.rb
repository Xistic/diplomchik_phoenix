# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_02_000002) do
  create_table "apartment_checks", force: :cascade do |t|
    t.integer "apartment_id", null: false
    t.string "checked_by"
    t.integer "status", default: 0
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_apartment_checks_on_apartment_id"
  end

  create_table "apartments", force: :cascade do |t|
    t.integer "building_id", null: false
    t.string "number"
    t.integer "floor"
    t.integer "number_of_rooms"
    t.decimal "area", precision: 10, scale: 2
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_apartments_on_building_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.integer "year_built"
    t.string "wall_material"
    t.integer "number_of_floors"
    t.string "floor_type"
    t.boolean "gas"
    t.integer "number_of_entrances"
    t.integer "number_of_apartments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "apartment_checks", "apartments"
  add_foreign_key "apartments", "buildings"
end
