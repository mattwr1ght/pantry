# == Schema Information
#
# Table name: meal_plans
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_meal_plans_on_name  (name)
#
class MealPlan < ApplicationRecord
  has_many :meal_plan_recipes, dependent: :destroy
  has_many :recipes, through: :meal_plan_recipes
  has_many :inventories 
end
