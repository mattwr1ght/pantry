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

ActiveRecord::Schema.define(version: 2022_03_08_015843) do

  create_table "food_items", force: :cascade do |t|
    t.string "item"
    t.string "food_type"
    t.string "category"
    t.string "measure"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "quantity"
    t.integer "order", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "recipes_id"
    t.integer "food_items_id"
    t.index ["food_items_id"], name: "index_ingredients_on_food_items_id"
    t.index ["recipes_id"], name: "index_ingredients_on_recipes_id"
  end

  create_table "instructions", force: :cascade do |t|
    t.text "description"
    t.integer "order", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "recipes_id"
    t.index ["recipes_id"], name: "index_instructions_on_recipes_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "cuisine"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vegetarian", limit: 1
    t.integer "vegan", limit: 1
  end

end
