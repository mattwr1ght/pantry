class ChangeToTinyInts < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :vegeterian
    remove_column :recipes, :vegan

    add_column :recipes, :vegetarian, :integer, :limit => 1
    add_column :recipes, :vegan, :integer, :limit => 1
  end
end
