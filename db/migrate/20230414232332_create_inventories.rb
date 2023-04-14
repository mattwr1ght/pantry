class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.references :food_item, null: false, foreign_key: true, index: true
      t.decimal :quantity, null: false

      t.timestamps
    end
  end
end
