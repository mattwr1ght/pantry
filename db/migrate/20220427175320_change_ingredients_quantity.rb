class ChangeIngredientsQuantity < ActiveRecord::Migration[6.0]
  def change
    change_column :ingredients, :quantity, :decimal
    add_column :ingredients, :quantity_str, :string
  end
end
