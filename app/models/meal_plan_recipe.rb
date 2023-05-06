# == Schema Information
#
# Table name: meal_plan_recipes
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  meal_plan_id :integer          not null
#  recipe_id    :integer          not null
#
# Indexes
#
#  index_meal_plan_recipes_on_meal_plan_id  (meal_plan_id)
#  index_meal_plan_recipes_on_recipe_id     (recipe_id)
#
# Foreign Keys
#
#  meal_plan_id  (meal_plan_id => meal_plans.id)
#  recipe_id     (recipe_id => recipes.id)
#
class MealPlanRecipe < ApplicationRecord
  belongs_to :meal_plan
  belongs_to :recipe
end
