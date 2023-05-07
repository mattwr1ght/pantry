class DeleteOrderAndMeasureFormIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :order, :integer
    remove_column :ingredients, :measure, :string
    add_column :ingredients, :unit, :string
    add_column :ingredients, :preparation, :string
  end
end
