require 'test_helper'
require './app/services/converters/fraction_converter'

class FractionConverterTest < ActiveSupport::TestCase

  test 'fraction_no_whole_number' do
    assert_equal(1.to_d / 30, Converters::FractionConverter.str_to_dec('1/30'))
  end

  test 'fraction_with_whole_number' do
    assert_equal(31.to_d / 30, Converters::FractionConverter.str_to_dec('1 1/30'))
  end

  test 'whole_number' do
    assert_equal(1, Converters::FractionConverter.str_to_dec('1'))
  end

  test 'nil_case' do
    assert_nil(Converters::FractionConverter.str_to_dec(''))
  end
end