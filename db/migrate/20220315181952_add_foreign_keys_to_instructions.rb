class AddForeignKeysToInstructions < ActiveRecord::Migration[6.0]
  def change
    add_column :instructions, :recipe_id, :BigInt, null: false
    add_foreign_key :instructions, :recipes
  end
end
