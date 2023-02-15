class AddIndexToNameInRecipes < ActiveRecord::Migration[6.0]
  def change
    add_index :recipes, [:name, :cuisine, :vegan, :vegetarian]
  end
end
