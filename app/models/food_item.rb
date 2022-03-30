class FoodItem < ApplicationRecord
  has_many :ingredients

  def self.food(name)
    FoodItem.find_by(item: name) || FoodItem.find_by(item: name.singularize)
  end
end
