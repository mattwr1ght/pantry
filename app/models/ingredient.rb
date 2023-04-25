# == Schema Information
#
# Table name: ingredients
#
#  id           :integer          not null, primary key
#  description  :string
#  measure      :string
#  order        :integer
#  quantity     :decimal(, )
#  quantity_str :string
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
  belongs_to :recipe
  belongs_to :food_item

  attribute :quantity, :decimal

end
