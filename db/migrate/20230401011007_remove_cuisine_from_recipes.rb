class RemoveCuisineFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :cuisine, :string
  end
end
