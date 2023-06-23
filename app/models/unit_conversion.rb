# == Schema Information
#
# Table name: unit_conversions
#
#  id           :integer          not null, primary key
#  bunch        :decimal(, )
#  can          :decimal(, )
#  category     :string
#  clove        :decimal(, )
#  cup          :decimal(, )
#  dash         :decimal(, )
#  default_unit :string
#  fluid_ounce  :decimal(, )
#  gallon       :decimal(, )
#  liter        :decimal(, )
#  milliliter   :decimal(, )
#  ounce        :decimal(, )
#  package      :decimal(, )
#  pinch_of     :decimal(, )
#  pint         :decimal(, )
#  pound        :decimal(, )
#  quart        :decimal(, )
#  slice_of     :decimal(, )
#  tablespoon   :decimal(, )
#  teaspoon     :decimal(, )
#  whole        :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  food_item_id :integer
#
# Indexes
#
#  index_unit_conversions_on_food_item_id  (food_item_id)
#
# Foreign Keys
#
#  food_item_id  (food_item_id => food_items.id)
#
class UnitConversion < ApplicationRecord
  include FoodMeasurements::Constants

  validates :category, inclusion: { in: CATEGORIES }
  validates :default_unit, inclusion: { in: ALLOWED_UNITS }, allow_nil: false

  def self.conversion_for_food_item(food_item_id)
    food_unit = UnitConversion.find_by(food_item_id: food_item_id)
    if food_unit.presence
      return food_unit
    else
      return UnitConversion.find_by(category: FoodItem.find(food_item_id).category)
    end
  end


end
