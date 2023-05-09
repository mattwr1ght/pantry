class RemoveOrderFromInstructions < ActiveRecord::Migration[6.1]
  def change
    remove_column :instructions, :order, :integer
  end
end
