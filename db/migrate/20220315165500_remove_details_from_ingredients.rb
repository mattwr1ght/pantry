class RemoveDetailsFromIngredients < ActiveRecord::Migration[6.0]
  def change
    remove_column :ingredients, :recipes_id, :integer
    remove_column :ingredients, :food_items_id, :integer
  end
end
