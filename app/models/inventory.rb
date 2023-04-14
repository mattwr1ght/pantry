# == Schema Information
#
# Table name: inventories
#
#  id           :integer          not null, primary key
#  quantity     :decimal(, )      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  food_item_id :integer          not null
#
# Indexes
#
#  index_inventories_on_food_item_id  (food_item_id)
#
# Foreign Keys
#
#  food_item_id  (food_item_id => food_items.id)
#
class Inventory < ApplicationRecord
  has_many :food_items
end
