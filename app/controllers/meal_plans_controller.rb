class MealPlansController < ApplicationController

  def index
    @meal_plans = MealPlan.all 
  end

  def show 
    @meal_plan = MealPlan.find(params[:id])
    @raw_recipes = @meal_plan.recipes
    @recipes = @raw_recipes.map { |recipe| RecipeViewModel.new(recipe.id) }
    @inventory = InventoryCalculatorService.new(@meal_plan).run
  end

  def new
    @meal_plan = MealPlan.new
    @raw_recipes = Recipe.all
    @recipes = @raw_recipes.map { |recipe| RecipeViewModel.new(recipe.id) }
  end

  def edit  
    raise "error"
  end

  def create 
    @meal_plan = MealPlan.new
    if meal_plan_update && meal_plan_recipes_update > 0
      redirect_to @meal_plan, notice: "Meal Plan added!"
    else
      render :new
    end
  end

  def update
    raise "error"
  end

  def destroy  
    @meal_plan = MealPlan.find(params[:id])
    @meal_plan.destroy
    redirect_to meal_plans_path
  end

  private

  def meal_plan_update
    @meal_plan.update!( name: name)
  end

  def meal_plan_recipes_update
    count = 0
    recipes.each do |recipe|
      if MealPlanRecipe.create( meal_plan_id: @meal_plan.id, recipe_id: recipe.id )
        count += 1
      end
    end
    count
  end

  def name
    meal_plan_params[:name]
  end

  def recipes
    Recipe.where(id: meal_plan_params[:recipe_ids])
  end

  def meal_plan_params
    params.require(:meal_plan).permit(:name, recipe_ids: [])
  end 

end