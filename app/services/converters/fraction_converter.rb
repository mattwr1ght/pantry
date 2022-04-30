require 'bigdecimal'

module Converters
  class FractionConverter

    def self.str_to_dec(num)
      # is there a fraction in this string?
      if num.include? '/'
        # is there a whole number in addition to the fraction?
        if num.include? ' '
          if num.scan(/ /).length > 1
            raise("#{num} has more than one space, not valid input for FractionHelper.str_to_dec")
          else
            num_array = num.split(/\s* \s*/)
            fraction = num_array[1].to_r
            return fraction.numerator.to_d / fraction.denominator + num_array[0].to_d
          end
        end
        # the case of a stand-alone fraction
        fraction = num.to_r
        return fraction.numerator.to_d / fraction.denominator
      end

      # The case that num is not a fraction, but a whole number
      return num.to_d
    end

  end
end