class RecipeViewModel
  delegate :instructions, :cuisine, to: :recipe

  attr_reader :recipe_id

  def initialize(recipe_id)
    @recipe_id = recipe_id
  end

  def cuisine
    if recipe.cuisine_id.present? 
      Cuisine.find(recipe.cuisine_id).name.titleize
    end
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

  def raw_recipe
    Recipe.find(recipe_id)
  end

  def servings
    if recipe.servings.present? and recipe.servings > 0
      "#{recipe.servings} #{'serving'.pluralize(recipe.servings)}"
    end
  end

  private

  def recipe
    @recipe ||= Recipe.includes(:instructions, ingredients: :food_item).find(@recipe_id)
  end
end
