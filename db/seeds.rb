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

#create default unit conversions for each food_item.category
# "dairy_liquid", "dairy_solid", "fruit", "grain", "herb", "liquid", "meat", "preserve", "spice", "sweetner", "vegetable"

UnitConversion.create(
  category: "dairy_liquid",
  default_unit: "fluid_ounce",
  can: 12.0,
  cup: 8.0,
  fluid_ounce: 1.0,
  gallon: 128.0,
  liter: 33.81,
  milliliter: 0.004,
  pint: 16.0,
  pound: 1.0,
  quart: 32.0,
  tablespoon: 0.5,
  teaspoon: 0.167,
)

UnitConversion.create!(
  category: 'dairy_solid',
  default_unit: 'ounce',
  teaspoon: 0.208333,
  tablespoon: 0.625,
  cup: 8,
  ounce: 1,
  pound: 16,
)

UnitConversion.create(
  category: "fruit",
  default_unit: "pound",
  bunch: 0.5,
  can: 1.25,
  clove: 0.01,
  cup: 0.5,
  dash: 0.01,
  ounce: 16,
  pinch_of: 0.01,
  pound: 1.0,
  slice_of: 0.1,
  tablespoon: 0.3,
  teaspoon: 0.1,
  whole: 0.25
)

UnitConversion.create!(
  category: 'grain',
  default_unit: 'pound',
  cup: 0.5,
  dash: 0.00347222,
  ounce: 0.0625,
  pint: 0.95,
  pound: 1,
  quart: 1.9,
  teaspoon: 0.0208333,
  tablespoon: 0.0625,
  whole: 0.00347222
)

UnitConversion.create!(
  category: 'herb',
  default_unit: 'ounce',
  bunch: 3,
  can: 0.0104167,
  clove: 0.0104167,
  cup: 8,
  dash: 0.00520833,
  gallon: 128,
  liter: 33.814,
  milliliter: 0.033814,
  package: 0.0208333,
  pint: 16,
  pinch_of: 0.00260417,
  pound: 16,
  quart: 32,
  slice_of: 0.0104167,
  tablespoon: 0.0625,
  teaspoon: 0.0208333,
  whole: 0.0208333
)

UnitConversion.create(
  category: "liquid",
  default_unit: "fluid_ounce",
  can: 12.0,
  cup: 8.0,
  fluid_ounce: 1.0,
  gallon: 128.0,
  liter: 33.81,
  milliliter: 0.004,
  pint: 16.0,
  pound: 1.0,
  quart: 32.0,
  tablespoon: 0.5,
  teaspoon: 0.167,
)

UnitConversion.create!(
  category: 'meat',
  default_unit: 'pound',
  bunch: 0.0625,
  can: 0.0625,
  clove: 0.0104167,
  cup: 0.5,
  dash: 0.00260417,
  fluid_ounce: 0.0625,
  gallon: 8,
  liter: 2.11338,
  milliliter: 0.00211338,
  ounce: 0.0625,
  package: 1,
  pinch_of: 0.00260417,
  pint: 0.95,
  pound: 1,
  quart: 1.9,
  slice_of: 0.0104167,
  tablespoon: 0.03125,
  teaspoon: 0.0104167,
  whole: 0.00260417
)

UnitConversion.create!(
  category: 'preserve',
  default_unit: 'ounce',
  can: 0.05,
  clove: 0.05,
  cup: 8,
  dash: 0.02,
  gallon: 128,
  liter: 33.814,
  milliliter: 0.033814,
  package: 0.75,
  pint: 16,
  pinch_of: 0.01,
  pound: 16,
  quart: 32,
  slice_of: 0.05,
  tablespoon: 0.75,
  teaspoon: 0.25,
  whole: 0.75
)

UnitConversion.create!(
  category: 'spice',
  default_unit: 'ounce',
  clove: 0.1,
  cup: 2.28,
  dash: 0.002,
  package: 4.0,
  pinch_of: 0.003,
  pound: 16.0,
  tablespoon: 0.056,
  teaspoon: 0.019,
  whole: 0.2,
  ounce: 1.0
)

UnitConversion.create!(
  category: 'sweetner',
  default_unit: 'pound',
  cup: 0.453592,
  dash: 0.00390625,
  pinch_of: 0.00130208,
  pound: 1.0,
  tablespoon: 0.0283495,
  teaspoon: 0.009449,
  ounce: 0.0625
)

UnitConversion.create(
  category: "vegetable",
  default_unit: "pound",
  bunch: 0.5,
  can: 1.25,
  clove: 0.01,
  cup: 0.5,
  dash: 0.01,
  ounce: 16,
  pinch_of: 0.01,
  pound: 1.0,
  slice_of: 0.1,
  tablespoon: 0.3,
  teaspoon: 0.1,
  whole: 0.25
)
