class CreateFoodItems < ActiveRecord::Migration[6.0]
  def change
    create_table :food_items do |t|
      t.string :item
      t.string :type
      t.string :category
      t.string :measure

      t.timestamps
    end
  end
end
