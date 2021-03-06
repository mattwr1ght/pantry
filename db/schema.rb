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

ActiveRecord::Schema.define(version: 2022_04_27_175320) do

  create_table "food_items", force: :cascade do |t|
    t.string "item"
    t.string "food_type"
    t.string "category"
    t.string "measure"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "import_events", force: :cascade do |t|
    t.string "import_type"
    t.string "status"
    t.string "file_name"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.decimal "quantity"
    t.integer "order", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "recipe_id", null: false
    t.integer "food_item_id", null: false
    t.string "measure"
    t.string "description"
    t.string "quantity_str"
  end

  create_table "instructions", force: :cascade do |t|
    t.text "description"
    t.integer "order", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "recipe_id", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "cuisine"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "vegetarian", limit: 1
    t.boolean "vegan", limit: 1
  end

  add_foreign_key "ingredients", "food_items"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "instructions", "recipes"
end
