module FoodMeasurements
  class UnitConversionService

    def combine_ingredient_quantities(ingredients)
      unit_conversion = UnitConversion.food_item_conversion(ingredients.first.food_item_id)
      units_and_quantities = ingredients.map { |ingredient| [ingredient.unit, ingredient.quantity] }.group_by(&:first)
      sum_quantities(unit_conversion, units_and_quantities)    
    end

    def combine_inventory_quantities(inventories)
      unit_conversion = UnitConversion.food_item_conversion(inventories.first.food_item_id)
      units_and_quantities = inventories.map { |inventory| [inventory.unit, inventory.quantity] }.group_by(&:first)
      sum_quantities(unit_conversion, units_and_quantities)
    end

    def sum_quantities(uc, units_and_quantities)
      shared_quantity = 0
      combined_units_and_quantities = units_and_quantities.transform_values { |values| values.sum(&:last) }
      combined_units_and_quantities.each do |unit, quantity|
        if unit == uc.default_unit 
          shared_quantity += quantity 
        else 
          shared_quantity += quantity * uc[unit]
        end
      end
      shared_quantity
    end

  end
end