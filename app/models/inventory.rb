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
  include FoodMeasurements::Constants
  belongs_to :food_item

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
