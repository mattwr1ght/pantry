require 'test_helper'

class IngredientViewModelTest < ActiveSupport::TestCase

  test 'ingredient_formatting_1' do
    assert_equal('1 cup lemon, juiced', IngredientViewModel.new(ingredients(:lemon_juice)).description,
                 'All Fields, single word food item')
  end

  test 'ingredient_formatting_2' do
    assert_equal('1/3 cup all purpose flour', IngredientViewModel.new(ingredients(:flour)).description,
                 'No description, multi word food item')
  end

  test 'ingredient_formatting_3' do
    assert_equal('1 egg yolk', IngredientViewModel.new(ingredients(:egg_yolk)).description,
                 'Quantity and food_item only, singular')
  end

  test 'ingredient_formatting_4' do
    assert_equal('5 egg yolks', IngredientViewModel.new(ingredients(:egg_yolks)).description,
                 'Quantity and food_item only, singular')
  end

  test 'ingredient_formatting_5' do
    assert_equal('Pinch of salt', IngredientViewModel.new(ingredients(:salt)).description,
                 'Measure and food_item only')
  end

  test 'ingredient_formatting_6' do
    assert_equal('Salt, freshly ground', IngredientViewModel.new(ingredients(:salt_ground)).description,
                 'Description and food_item only')
  end

  test 'ingredient_formatting_7' do
    assert_equal('1 tablespoon all-purpose flour, sifted', IngredientViewModel.new(ingredients(:flour_sifted)).description,
                 'Hyphenated food_item')
  end

end

