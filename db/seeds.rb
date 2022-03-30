# frozen_string_literal: true
require_relative 'services/recipe_parser'

# FOOD ITEMS

food_items = YAML.load_file('./db/data/seed_data/food_items.yml')

food_items.each_pair do |food_groups, foods|
  foods.each do |food|
    FoodItem.create(item: food&.downcase, category: food_groups)
  end
end

# RECIPES

recipes = RecipeParser.new.seed_recipes('./db/data/seed_data/recipes.txt')

recipes.each do |recipe|
  @recipe_record = Recipe.create(name: recipe['name'],
                                 cuisine: recipe['cuisine'],
                                 vegetarian: recipe['vegetarian'],
                                 vegan: recipe['vegan'])

  order = 0
  recipe['instructions'].each do |instruction|
    Instruction.create(description: instruction,
                       order: order += 1,
                       recipe_id: @recipe_record.id)
  end

  recipe['ingredients'].each_pair do |index, ingredient|
    @food_item = FoodItem.food(ingredient['food_item'])
    unless @food_item
      raise("#{ingredient['food_item']} in the recipe #{@recipe_record.name} is not present in the food_items table!")
    end

    Ingredient.create(quantity: ingredient['quantity'],
                      order: index,
                      recipe_id: @recipe_record.id,
                      food_item_id: @food_item.id,
                      measure: ingredient['measure'],
                      description: ingredient['descriptor'])
  end
end
