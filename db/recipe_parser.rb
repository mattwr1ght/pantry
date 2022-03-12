def seed_recipes
  file_path = "#{__dir__}/data/recipes.txt"
  raw_recipes = File.readlines(file_path).map(&:chomp)
  breaks = raw_recipes.each_index.select { |i| raw_recipes[i] == '$'}
  extract_recipes(raw_recipes, breaks)
end

def extract_recipes(raw_recipes, breaks)
  recipe_list = []
  recipe_start = 0
  breaks.each do |recipe_end|
    recipe_temp = raw_recipes[recipe_start, recipe_end].delete_if { |i| i == "$" }
    white_breaks = recipe_temp.each_index.select { |i| recipe_temp[i] == ''}
    recipe = { "name" => recipe_temp[0], "cuisine" => recipe_temp[1], "servings" => recipe_temp[2],
               "vegetarian" => recipe_temp[3], "vegan" => recipe_temp[4],
               "instructions" => recipe_temp[white_breaks[0]..white_breaks[1]].delete_if { |i| i == '' },
               "ingredients" => recipe_temp[white_breaks[1]..recipe_temp.length].delete_if { |i| i == '' } }
    recipe_start = recipe_end
    recipe_list << recipe
  end
  recipe_list
end

seed_recipes



# Create a new Recipe
#
# Add the title, cuisine etc
#
# When we hit line with no text, skip and store ingredients
#
# When we hit line with no text skip and store instructions IF there is no $
#
# Add the recipe to the database
#
# IF there is another row, clean the variables and repeat the above process



# def seed_users
#   csv_file_path = '/[project_path]/db/data/users.csv'
#   puts 'Seeding users from #{csv_file_path}...'
#   f = File.new(csv_file_path, 'r')
#   csv = CSV.new(f)
#   headers = csv.shift
#
#   csv.each do |row|
#     user_information = {
#       name: row[0],
#       age: row[1]
#     }
#     inv = User.create(user_information)
#   end
#   puts 'Seeding users from #{csv_file_path} done.'
# end