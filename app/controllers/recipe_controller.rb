class RecipeController < ApplicationController
  def index
    @raw_recipes = Recipe.all
    @recipes = @raw_recipes.map { |recipe| RecipeViewModel.new(recipe.id) }
  end

  def show
    @recipe = RecipeViewModel.new(params[:id])
  end
end
