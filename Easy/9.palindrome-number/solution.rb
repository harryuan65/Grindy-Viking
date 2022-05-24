# frozen_string_literal: true

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x.negative?

  max_digit = 0
  x2 = x

  while x2 >= 10
    max_digit += 1
    x2 /= 10
  end

  while max_digit > 0
    most_significant_position = (10**max_digit)
    high_digit = (x / most_significant_position).floor
    low_digit = x % 10

    puts "#{x} | #{high_digit} | #{low_digit} | #{high_digit * most_significant_position}"

    return false if high_digit != low_digit

    max_digit -= 2
    x -= high_digit * most_significant_position
    x /= 10
  end

  true
end
