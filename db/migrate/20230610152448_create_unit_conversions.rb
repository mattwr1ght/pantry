class CreateUnitConversions < ActiveRecord::Migration[6.1]
  def change
    create_table :unit_conversions do |t|
      t.references :food_item, foreign_key: true 
      t.string :category
      t.string :default_unit
      t.decimal :bunch
      t.decimal :can
      t.decimal :clove 
      t.decimal :cup 
      t.decimal :dash 
      t.decimal :fluid_ounce 
      t.decimal :gallon 
      t.decimal :liter 
      t.decimal :milliliter 
      t.decimal :ounce 
      t.decimal :pinch_of
      t.decimal :pint 
      t.decimal :pound
      t.decimal :package
      t.decimal :quart 
      t.decimal :slice 
      t.decimal :tablespoon 
      t.decimal :teaspoon 
      t.decimal :whole
      t.timestamps
    end
  end
end
