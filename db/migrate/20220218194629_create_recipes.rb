class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :cuisine
      t.integer :vegeterian
      t.integer :vegan

      t.timestamps
    end
  end
end
