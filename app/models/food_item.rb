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

  def self.get_name(name)
    FoodItem.find_by(name: name) || FoodItem.find_by(name: name.singularize)
  end
end
