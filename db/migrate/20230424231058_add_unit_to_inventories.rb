class AddUnitToInventories < ActiveRecord::Migration[6.1]
  def change
    add_column :inventories, :unit, :string
  end
end
