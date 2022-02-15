class FixColumnName < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :food_items, :type, :food_type
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
