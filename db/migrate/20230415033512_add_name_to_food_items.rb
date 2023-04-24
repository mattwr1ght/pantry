class AddNameToFoodItems < ActiveRecord::Migration[6.1]
  def change
    add_column :food_items, :name, :string, index: true

    remove_column :food_items, :measure, :string
    remove_column :food_items, :food_type, :string
    remove_column :food_items, :item, :string
  end
end
