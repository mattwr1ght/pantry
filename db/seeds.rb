# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#     t.string "item"
#     t.string "food_type"
#     t.string "category"
#     t.string "measure"
#
#
FoodItem.create(
  [{item: "tomato", food_type: "solid", category: "vegetable", measure: "whole"},
   {item: "onion", food_type: "solid", category: "vegetable", measure: "whole"},
   {item: "garlic", food_type: "solid", category: "vegetable", measure: "clove"},
   {item: "leek", food_type: "solid", category: "vegetable", measure: "whole"},
   {item: "celery", food_type: "solid", category: "vegetable", measure: "stalk"},
   {item: "leek", food_type: "solid", category: "vegetable", measure: "whole"},
   {item: "Lettuce", food_type: "solid", category: "vegetable", measure: "head"},
   {item: "spinich", food_type: "solid", category: "vegetable", measure: "piece"},
   {item: "carrot", food_type: "solid", category: "vegetable", measure: "whole"},
   {item: "green bean", food_type: "solid", category: "vegetable", measure: "whole"},
   {item: "pea", food_type: "solid", category: "vegetable", measure: "pod"},
   {item: "banana", food_type: "solid", category: "fruit", measure: "whole"},
   {item: "strawberry", food_type: "solid", category: "fruit", measure: "whole"},
   {item: "blueberry", food_type: "solid", category: "fruit", measure: "whole"},
   {item: "raspberry", food_type: "solid", category: "fruit", measure: "whole"},
   {item: "cantalope", food_type: "solid", category: "fruit", measure: "whole"},
   {item: "apple", food_type: "solid", category: "fruit", measure: "whole"},
   {item: "banana", food_type: "solid", category: "fruit", measure: "whole"},
   {item: "flour", food_type: "solid", category: "cereal", measure: "weight"},
   {item: "lentil", food_type: "solid", category: "dry-legume", measure: "volume"},
   {item: "bean", food_type: "solid", category: "dry-legume", measure: "volume"},
   {item: "chicken thighs", food_type: "solid", category: "meat", measure: "piece"},
   {item: "chicken breast", food_type: "solid", category: "meat", measure: "piece"},
   {item: "chicken wings", food_type: "solid", category: "meat", measure: "piece"},
   {item: "chicken legs", food_type: "solid", category: "meat", measure: "piece"},
   {item: "chicken whole", food_type: "solid", category: "meat", measure: "piece"},
   {item: "chicken ground", food_type: "solid", category: "meat", measure: "weight"},
   {item: "beef ground", food_type: "solid", category: "meat", measure: "weight"},
   {item: "veal ground", food_type: "solid", category: "meat", measure: "weight"},
   {item: "turkey ground", food_type: "solid", category: "meat", measure: "weight"},
  ]
)