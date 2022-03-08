class AddIngredientsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :quantity
      t.integer :order, :limit => 1

      t.timestamps
    end

    add_reference :ingredients, :recipes

  end
end
