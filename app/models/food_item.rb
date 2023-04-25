# == Schema Information
#
# Table name: food_items
#
#  id         :integer          not null, primary key
#  category   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class FoodItem < ApplicationRecord
  has_many :ingredients
  has_many :inventories

  def self.find_by_name(name)
    FoodItem.find_by(name: name) || FoodItem.find_by(name: name.singularize)
  end

  def self.get_name
    name
  end

end
