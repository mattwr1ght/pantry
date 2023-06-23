module FoodMeasurements
  class UnitConversionService

    def combine_ingredient_quantities(ingredients)
      unit_conversion = UnitConversion.conversion_for_food_item(ingredients[0].food_item_id)
      sum_ingredient_quantities(unit_conversion, ingredients)    
    end

    def sum_ingredient_quantities(uc, ingredients)
      shared_quantity = 0
      ingredients.each do |ingredient|
        if ingredient.unit == uc.default_unit 
          shared_quantity += ingredient.quantity 
        else 
          shared_quantity += ingredient.quantity * uc[ingredient.unit]
        end
      end
      shared_quantity
    end

  end
end