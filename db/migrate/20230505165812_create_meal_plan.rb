class CreateMealPlan < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_plans do |t|
      t.string  :name, index: true
      t.timestamps
    end
  end
end
