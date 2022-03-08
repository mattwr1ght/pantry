class CreateInstructionsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :instructions do |t|

      t.text :description
      t.integer :order, :limit => 1

      t.timestamps
    end

    add_reference :instructions, :recipes

    add_reference :ingredients, :food_items

  end
end
