class RecipeViewModel
  delegate :instructions, to: :recipe

  attr_reader :recipe_id

  def initialize(recipe_id)
    @recipe_id = recipe_id
  end

  def cuisine
    recipe.cuisine.titleize
  end

  def dietary_preference
    return 'Vegan' if recipe.vegan
    return 'Vegetarian' if recipe.vegetarian
  end

  def ingredients
    recipe.ingredients.map do |ingredient|
      IngredientViewModel.new(ingredient)
    end
  end

  def name
    recipe.name.titleize
  end

  private

  def recipe
    @recipe ||= Recipe.includes(:instructions, ingredients: :food_item).find(@recipe_id)
  end
end
