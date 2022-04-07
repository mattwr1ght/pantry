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
require 'test_helper'

class FoodItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
