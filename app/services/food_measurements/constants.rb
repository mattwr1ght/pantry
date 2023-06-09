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
      "fluid ounce", 
      "gallon", 
      "liter", 
      "milliliter", 
      "ounce", 
      "pinch of",
      "pound", 
      "tablespoon", 
      "teaspoon", 
      "whole"
    ].freeze

    ALLOWED_WHOLE_NUMBERS = (
      1..144
    ).to_a.freeze

  end
end
