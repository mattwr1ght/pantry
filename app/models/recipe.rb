# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  cuisine    :string
#  name       :string
#  servings   :integer
#  vegan      :boolean
#  vegetarian :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_recipes_on_name_and_cuisine_and_vegan_and_vegetarian  (name,cuisine,vegan,vegetarian)
#
class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy

  searchable do
    text  :name
    boolean :vegan
    boolean :vegetarian
    time :updated_at
  end

end
