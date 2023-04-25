# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  name       :string
#  servings   :integer
#  vegan      :boolean
#  vegetarian :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cuisine_id :integer
#
# Indexes
#
#  index_recipes_on_cuisine_id                                 (cuisine_id)
#  index_recipes_on_name_and_cuisine_and_vegan_and_vegetarian  (name,vegan,vegetarian)
#
# Foreign Keys
#
#  cuisine_id  (cuisine_id => cuisines.id)
#
class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy
  has_one :cuisine

  searchable do
    text  :name
    boolean :vegan
    boolean :vegetarian
    time :updated_at
  end

  def subtract_from_inventory
    self.ingredients.each do |ingredient|
      inventory_item = Inventory.find_by(food_item: ingredient.food_item)
      # Check if there is enough inventory to subtract from
      if inventory_item.quantity >= ingredient.quantity
        inventory_item.quantity -= ingredient.quantity
        inventory_item.save!
      else
        raise "Insufficient inventory for #{ingredient.food_item.name}"
      end
    end
  end
  
end
