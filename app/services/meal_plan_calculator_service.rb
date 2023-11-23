class MealPlanCalculatorService
  attr_accessor :meal_plan, :ingredient_list, :inventories

  def initialize(meal_plan)
    @meal_plan = meal_plan
    @ingredient_list = []
    @inventories = []
  end

  def run
    @ingredient_list = @meal_plan.recipes.map { |recipe| recipe.ingredients }.flatten
    combine_ingredients
    @inventories
  end

  private

  def combine_ingredients
    existing_inventories = Inventory.where(meal_plan_id: @meal_plan_id)
    @ingredient_list.sort_by! { |ingredient| ingredient.food_item_id }

    j = 1
    i = 1    
    while i < @ingredient_list.length
      j = i 
      first_ingredient = @ingredient_list[i-1]
      
      while @ingredient_list[i].food_item_id == first_ingredient.food_item_id
        i += 1
      end

      if i != j
        quantity = FoodMeasurements::UnitConversionService.new.combine_ingredient_quantities(@ingredient_list[j-1..i-1]) 
        Inventory.where(meal_plan_id: @meal_plan_id, food_item_id: first_ingredient.food_item_id).delete_all
        @inventories << create_inventory(first_ingredient.food_item_id, quantity)
        i += 1
      else
        @inventories << create_inventory(first_ingredient.food_item_id, first_ingredient.quantity)
        i += 1
      end
    end
  end

  def create_inventory(food_item_id, quantity)
    inventory = Inventory.create(quantity: quantity, 
                              unit: UnitConversion.food_item_conversion(food_item_id).default_unit, 
                              food_item_id: food_item_id,
                              meal_plan_id: @meal_plan.id
                            )
  end  
end