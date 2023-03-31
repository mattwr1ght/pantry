class RecipesController < ApplicationController
  def index
    if params[:search].presence
      @raw_recipes = search_recipes
    else
      @raw_recipes = Recipe.all
    end 
    @recipes = @raw_recipes.map { |recipe| RecipeViewModel.new(recipe.id) }
  end

  def show
    @recipe = RecipeViewModel.new(params[:id])
  end

  private

  def search_recipes
    search = Recipe.search do 
      fulltext (params[:search])
      with(:updated_at).less_than(Time.zone.now)
    end
    puts "there are #{search.total} results"
    search.results 
  end

  def recipe_params
    params.require(:recipe).permit(:recipe_id, :name, :search, :servings)
  end 
end
