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

ActiveRecord::Schema.define(version: 2023_04_15_033512) do

  create_table "cuisines", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cuisines_on_name", unique: true
  end

  create_table "food_items", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
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

  create_table "inventories", force: :cascade do |t|
    t.integer "food_item_id", null: false
    t.decimal "quantity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_item_id"], name: "index_inventories_on_food_item_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "vegetarian", limit: 1
    t.boolean "vegan", limit: 1
    t.integer "servings"
    t.integer "cuisine_id"
    t.index ["cuisine_id"], name: "index_recipes_on_cuisine_id"
    t.index ["name", "vegan", "vegetarian"], name: "index_recipes_on_name_and_cuisine_and_vegan_and_vegetarian"
  end

  add_foreign_key "ingredients", "food_items"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "instructions", "recipes"
  add_foreign_key "inventories", "food_items"
  add_foreign_key "recipes", "cuisines"
end
