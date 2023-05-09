# == Schema Information
#
# Table name: instructions
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  recipe_id   :integer          not null
#
# Foreign Keys
#
#  recipe_id  (recipe_id => recipes.id)
#
class Instruction < ApplicationRecord
  belongs_to :recipe
end
