class AddBooleansForVeganRecipe < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :vegan, :boolean
    change_column :recipes, :vegetarian, :boolean
  end
end
