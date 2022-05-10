class IngredientViewModel
  attr_reader :ingredient

  def initialize(ingredient)
    @ingredient = ingredient
  end

  def description
    food = ingredient.food_item
    build_ingredient = ''

    build_ingredient << ingredient.quantity_str if ingredient.quantity_str.present?

    if ingredient.measure
      build_ingredient << (ingredient.quantity_str.present? ? " #{ingredient.measure}" : ingredient.measure.capitalize)
    end

    build_ingredient << (ingredient.quantity_str.present? || ingredient.measure.present? ? " #{food_name(food)}" : food_name(food).capitalize)

    build_ingredient << ", #{ingredient.description}" if ingredient.description.present?
    build_ingredient
  end

  private

  def food_name(food)
    if ingredient.quantity_str.present? && ingredient.quantity_str.to_i > 1 && !ingredient.measure&.end_with?('s')
      return food.item.pluralize
    end

    food.item
  end
end
