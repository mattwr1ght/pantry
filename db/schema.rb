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

ActiveRecord::Schema.define(version: 2023_05_07_231717) do

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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "recipe_id", null: false
    t.integer "food_item_id", null: false
    t.string "description"
    t.string "quantity_str"
    t.string "unit"
    t.string "preparation"
  end

  create_table "instructions", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "recipe_id", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "food_item_id", null: false
    t.decimal "quantity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unit"
    t.integer "meal_plan_id"
    t.datetime "deleted_at"
    t.index ["food_item_id"], name: "index_inventories_on_food_item_id"
    t.index ["meal_plan_id"], name: "index_inventories_on_meal_plan_id"
  end

  create_table "meal_plan_recipes", force: :cascade do |t|
    t.integer "meal_plan_id", null: false
    t.integer "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meal_plan_id"], name: "index_meal_plan_recipes_on_meal_plan_id"
    t.index ["recipe_id"], name: "index_meal_plan_recipes_on_recipe_id"
  end

  create_table "meal_plans", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_meal_plans_on_name"
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
  add_foreign_key "inventories", "meal_plans"
  add_foreign_key "meal_plan_recipes", "meal_plans"
  add_foreign_key "meal_plan_recipes", "recipes"
  add_foreign_key "recipes", "cuisines"
end
