class AddMealPlanToInventories < ActiveRecord::Migration[6.1]
  def change
    add_reference :inventories, :meal_plan, foreign_key: true, index: true
    add_column :inventories, :deleted_at, :datetime 
  end
end
