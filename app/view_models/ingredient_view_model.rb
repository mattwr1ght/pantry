class IngredientViewModel
  attr_reader :ingredient

  def initialize(ingredient)
    @ingredient = ingredient
  end

  def description
    food = ingredient.food_item
    build_ingredient = ''

    build_ingredient << ingredient.quantity_str if ingredient.quantity_str

    if ingredient.measure
      build_ingredient << (ingredient.quantity_str ? " #{ingredient.measure}" : ingredient.measure.capitalize)
    end

    build_ingredient << (ingredient.quantity_str || ingredient.measure ? " #{food_name(food)}" : food_name(food).capitalize)

    build_ingredient << ", #{ingredient.description}" if ingredient.description
    build_ingredient
  end

  private

  def food_name(food)
    if ingredient.quantity_str && ingredient.quantity_str.to_i > 1 && !ingredient.measure&.end_with?('s')
      return food.item.pluralize
    end

    food.item
  end
end
