require 'test_helper'

class RecipeViewModelTest < ActiveSupport::TestCase

  test 'cuisine_1' do
    assert_equal('North Indian', RecipeViewModel.new(recipes(:saag_paneer).id).cuisine,
                 'cuisine, is titleized')
  end

  test 'dietary_preference_1' do
    assert_not(RecipeViewModel.new(recipes(:burgers).id).dietary_preference,
               'dietary_preference, neither Vegetarian nor Vegan.')
  end

  test 'dietary_preference_2' do
    assert_equal('Vegan', RecipeViewModel.new(recipes(:dutch_baby_pancake).id).dietary_preference,
                 'dietary_preference, Vegetarian and Vegan returns only Vegan.')
  end

  test 'dietary_preference_3' do
    assert_equal('Vegetarian', RecipeViewModel.new(recipes(:creamed_braising_greens).id).dietary_preference,
                 'dietary_preference, Vegetarian but not Vegan.')
  end

  test 'name_1' do
    assert_equal('Saag Paneer', RecipeViewModel.new(recipes(:saag_paneer).id).name,
                 'name, is titleized')
  end

end
