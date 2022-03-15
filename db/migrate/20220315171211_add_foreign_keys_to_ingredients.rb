class AddForeignKeysToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :recipe_id, :BigInt, null: false
    add_column :ingredients, :food_item_id, :BigInt, null: false
    add_foreign_key :ingredients, :recipes
    add_foreign_key :ingredients, :food_items
  end
end
