class InventoryConsolidator
  
  def run
    inventories_without_meal_plans = Inventory.where(meal_plan_id: nil)
    grouped_inventories = inventories_without_meal_plans.group_by(&:food_item_id)

    grouped_inventories.each do |food_item_id, inventories|
      total_quantity = FoodMeasurements::UnitConversionService.new.combine_inventory_quantities(inventories) 
      default_unit = UnitConversion.food_item_conversion(food_item_id).default_unit
    
      consolidated_inventory = Inventory.create(
        food_item_id: food_item_id,
        quantity: total_quantity,
        unit: default_unit
      )
    
      inventories.each(&:destroy)
    end
  end 
end 