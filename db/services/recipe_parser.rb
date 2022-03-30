# frozen_string_literal: true

class RecipeParser
  def seed_recipes(file_path)
    raw_recipes = File.readlines(file_path).map(&:chomp)
    breaks = raw_recipes.each_index.select { |i| raw_recipes[i] == '$' }
    extract_recipes(raw_recipes, breaks)
  end

  private

  def extract_recipes(raw_recipes, breaks)
    recipe_list = []
    recipe_start = 0
    breaks.each do |recipe_end|
      recipe_temp = raw_recipes[recipe_start, recipe_end].delete_if { |i| i == '$' }
      white_breaks = recipe_temp.each_index.select { |i| recipe_temp[i] == '' }
      recipe = recipe_hash(recipe_temp, white_breaks)
      recipe_start = recipe_end
      recipe_list << recipe
    end
    recipe_list
  end

  def recipe_hash(recipe_temp, white_breaks)
    { 'name' => recipe_temp[0].downcase,
      'cuisine' => recipe_temp[1].downcase,
      'servings' => recipe_temp[2],
      'vegetarian' => recipe_temp[3],
      'vegan' => recipe_temp[4],
      'ingredients' => ingredients_hash(recipe_temp[white_breaks[0]..white_breaks[1]].delete_if { |i| i == '' }.to_a),
      'instructions' => recipe_temp[white_breaks[1]..recipe_temp.length].delete_if { |i| i == '' } }
  end

  def ingredients_hash(raw_ingredients)
    ingredients = {}
    i = 0
    raw_ingredients.each do |line|
      line_array = line.split(/\s*,\s*/)
      ingredients[i += 1] = { 'quantity' => line_array[0],
                              'measure' => line_array[1]&.downcase,
                              'food_item' => line_array[2]&.downcase,
                              'descriptor' => line_array[3]&.downcase }
    end
    ingredients
  end
end
