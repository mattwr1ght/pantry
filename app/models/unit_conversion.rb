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
#  slice        :decimal(, )
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
  belongs_to :food_item

  validates :category, inclusion: { in: CATEGORIES }
  validates :default_unit, inclusion: { in: ALLOWED_UNITS }


end
