module FoodMeasurements
  module Constants
  
    ALLOWED_FRACTIONS = {
      "0": 0,
      "1/32": 0.03125,
      "1/16": 0.0625,
      "1/8": 0.125,
      "1/4": 0.25,
      "1/3": 0.333333,
      "1/2": 0.5,
    }.freeze
  
    ALLOWED_UNITS = [
       "bunch",
       "can",
       "clove", 
       "cup", 
       "dash", 
       "fluid_ounce", 
       "gallon", 
       "liter", 
       "milliliter", 
       "ounce", 
       "pinch of",
       "pint", 
       "pound",
       "package",
       "quart", 
       "slice", 
       "tablespoon", 
       "teaspoon", 
       "whole",
    ].freeze

    ALLOWED_WHOLE_NUMBERS = (
      1..144
    ).to_a.freeze

    CATEGORIES = [
      "dairy_liquid", 
      "dairy_solid", 
      "fruit", 
      "grain", 
      "herb", 
      "liquid", 
      "meat", 
      "preserve", 
      "spice", 
      "sweetner", 
      "vegetable"
    ]
  
  end
end
