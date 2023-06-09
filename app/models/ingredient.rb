# == Schema Information
#
# Table name: ingredients
#
#  id           :integer          not null, primary key
#  description  :string
#  preparation  :string
#  quantity     :decimal(, )
#  quantity_str :string
#  unit         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  food_item_id :integer          not null
#  recipe_id    :integer          not null
#
# Foreign Keys
#
#  food_item_id  (food_item_id => food_items.id)
#  recipe_id     (recipe_id => recipes.id)
#
class Ingredient < ApplicationRecord
  include FoodMeasurements::Constants

  belongs_to :recipe
  belongs_to :food_item

  validates :unit, inclusion: { in: ALLOWED_UNITS }, allow_nil: true
  validates :quantity, inclusion: { in: ALLOWED_FRACTIONS.keys + ALLOWED_WHOLE_NUMBERS }

  attribute :quantity, :decimal

end
