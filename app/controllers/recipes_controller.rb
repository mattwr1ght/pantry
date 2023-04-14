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

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new
    # @recipe.update(cuisine_id: cuisine.id) if cuisine.presence
    if @recipe.update(name: recipe_params[:name],
                      vegetarian: recipe_params[:vegetarian],
                      vegan: recipe_params[:vegan],
                      servings: recipe_params[:servings],
                      cuisine_id: cuisine&.id)
      redirect_to @recipe, notice: "Recipe added!"
    else
      render :new
    end
  end    

  private

  def cuisine
    if recipe_params[:cuisine].presence
      Cuisine.find_by(name: recipe_params[:cuisine].downcase) || Cuisine.create(name: recipe_params[:cuisine].downcase)
    end
  end

  def search_recipes
    search = Recipe.search do 
      fulltext (params[:search])
      with(:updated_at).less_than(Time.zone.now)
    end
    puts "there are #{search.total} results"
    search.results 
  end

  def recipe_params
    params.require(:recipe).permit(:recipe_id, :name, :search, :servings, :vegetarian, :vegan, :cuisine)
  end 
end
