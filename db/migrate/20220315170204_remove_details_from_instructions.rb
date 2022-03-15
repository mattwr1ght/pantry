class RemoveDetailsFromInstructions < ActiveRecord::Migration[6.0]
  def change
    remove_column :instructions, :recipes_id, :integer
  end
end
