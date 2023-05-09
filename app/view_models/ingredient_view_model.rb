class IngredientViewModel
  attr_reader :ingredient

  def initialize(ingredient)
    @ingredient = ingredient
  end

  def description
    food = ingredient.food_item
    build_ingredient = ''

    build_ingredient << ingredient.quantity_str if ingredient.quantity_str.present?

    if ingredient.unit.present?
      unit = FoodMeasurements::Constants::ALLOWED_UNITS[ingredient.unit]
      build_ingredient << (ingredient&.quantity > 1 ? " #{unit.pluralize}" : " #{unit}")
    end

    build_ingredient << " #{ingredient.description}" if ingredient.description.present?

    build_ingredient << (ingredient.quantity_str.present? || ingredient.quantity.present? ? " #{food.name}" : food.name.capitalize)

    build_ingredient << ", #{ingredient.preparation}" if ingredient.preparation.present?
    build_ingredient
  end
end
