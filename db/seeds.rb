# frozen_string_literal: true

# FOOD ITEMS

food_items = YAML.load_file('./db/data/seed_data/food_items.yml')

food_items.each_pair do |food_groups, foods|
  foods.each do |food|
    FoodItem.create(name: food&.downcase, category: food_groups)
  end
end

# RECIPES
recipes = YAML.load_file('./db/data/seed_data/recipes.yml')

recipes.each do |recipe|
  cuisine = Cuisine.find_by(name: recipe['cuisine']) || Cuisine.create(name: recipe['cuisine'])                   
  @recipe_record = Recipe.new(name: recipe['name'],
                                 vegetarian: recipe['vegetarian'],
                                 vegan: recipe['vegan'],
                                 servings: recipe['servings'],
                                 cuisine_id: cuisine.id)
  unless @recipe_record.save
    puts("ERROR: #{recipe['name']},  #{@recipe_record.errors.full_messages.join(", ")}")
  end 
  
  recipe['instructions'].each do |instruction|
    Instruction.create(description: instruction,
                       recipe_id: @recipe_record.id)
  end

  recipe['ingredients'].each do |ingredient|
    @food_item = FoodItem.find_by_name(ingredient['food_item']&.downcase)
    unless @food_item
      raise("#{ingredient['food_item']} in the recipe #{@recipe_record.name} is not present in the food_items table!")
    end

    # puts "#{ingredient['quantity']} , #{translator.str_to_dec(ingredient['quantity'])}     of #{ingredient['food_item']}"

    ingredient = Ingredient.new(quantity_str: ingredient['quantity'],
                      quantity: ingredient['quantity'], 
                      # quantity: ingredient['quantity'].is_a?(String)? 
                      #                                 Converters::FractionConverter.str_to_dec(ingredient['quantity']) : ingredient['quantity'],
                      recipe_id: @recipe_record.id,
                      food_item_id: @food_item.id,
                      unit: ingredient['unit'],
                      preparation: ingredient['preparation'])

    unless ingredient.save
      puts("ERROR: #{ingredient.errors.full_messages.join(", ")} for #{@recipe_record.name}")
      puts "quantity #{ingredient.quantity}"
      puts "unit #{ingredient.unit}" 
      puts "preparation #{ingredient.preparation}"
    end
  end
end
