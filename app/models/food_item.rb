# == Schema Information
#
# Table name: food_items
#
#  id         :integer          not null, primary key
#  category   :string
#  food_type  :string
#  item       :string
#  measure    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class FoodItem < ApplicationRecord
  has_many :ingredients

  def self.food(name)
    FoodItem.find_by(item: name) || FoodItem.find_by(item: name.singularize)
  end
end
