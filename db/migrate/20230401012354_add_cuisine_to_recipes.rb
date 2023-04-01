class AddCuisineToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :cuisine, null: true, foreign_key: true, index: true
  end
end
