# == Schema Information
#
# Table name: inventories
#
#  id           :integer          not null, primary key
#  deleted_at   :datetime
#  quantity     :decimal(, )      not null
#  unit         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  food_item_id :integer          not null
#  meal_plan_id :integer
#
# Indexes
#
#  index_inventories_on_food_item_id  (food_item_id)
#  index_inventories_on_meal_plan_id  (meal_plan_id)
#
# Foreign Keys
#
#  food_item_id  (food_item_id => food_items.id)
#  meal_plan_id  (meal_plan_id => meal_plans.id)
#
class Inventory < ApplicationRecord
  belongs_to :food_item

  ALLOWED_UNITS = {
    'cup': 'Cup',
    'tbsp': 'Tablespoon',
    'tsp': 'Teaspoon',
    'whole': 'Whole',
    'gal': 'Gallon',
    'oz': 'Ounce',
    'lb': 'Pound'
  }.freeze

  ALLOWED_FRACTIONS = {
    "0": 0,
    "1/32": 0.03125,
    "1/16": 0.0625,
    "1/8": 0.125,
    "1/4": 0.25,
    "1/3": 0.333333,
    "1/2": 0.5,
  }.freeze

  ALLOWED_WHOLE_NUMBERS = (
    1..144
  ).to_a.freeze

  validates :unit, inclusion: { in: ALLOWED_UNITS.keys.map(&:to_s) }
  validates :quantity, inclusion: { in: ALLOWED_FRACTIONS.keys + ALLOWED_WHOLE_NUMBERS }

  searchable do
    text  :food_item_name
    time :updated_at
  end

  def food_item_name
    food_item.name if food_item
  end
end
