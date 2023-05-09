module FoodMeasurements
  module Constants

    ALLOWED_UNITS = {
      "can": "can",
      "clove": "clove",
      "cup": "cup",
      "gal": "gallon",
      "lb": "pound",
      "oz": "ounce",
      "pinch": "pinch of",
      "tbsp": "tablespoon",
      "tsp": "teaspoon",
      "whole": "whole"
    }.transform_keys(&:to_s).freeze
  
    ALLOWED_FRACTIONS = {
      "0": 0,
      "1/32": 0.03125,
      "1/16": 0.0625,
      "1/8": 0.125,
      "1/4": 0.25,
      "1/3": 0.333333,
      "1/2": 0.5,
    }.freeze
  
    ALLOWED_WHOLE_NUMBERS = (
      1..144
    ).to_a.freeze

  end
end
