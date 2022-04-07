# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  cuisine    :string
#  name       :string
#  vegan      :boolean
#  vegetarian :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy

end
