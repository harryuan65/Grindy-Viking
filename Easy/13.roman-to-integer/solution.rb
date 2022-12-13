# frozen_string_literal: true

# :reek:U
# rubocop:disable Style/MutableConstant(RuboCop)

MAPPING = {
  "I" => 1,
  "V" => 5,
  "X" => 10,
  "L" => 50,
  "C" => 100,
  "D" => 500,
  "M" => 1000
}
# @param {String} s
# @return {Integer}
def roman_to_int(s)
  sum = 0
  i = 0
  while i < s.length
    val = MAPPING[s[i]]
    sum += val
    if i.positive?
      prev_val = MAPPING[s[i - 1]]
      sum -= 2 * prev_val if prev_val < val
    end
    i += 1
  end
  sum
end

__END__

Runtime: 125 ms, faster than 70.19% of Ruby online submissions for Roman to Integer.
Memory Usage: 210.9 MB, less than 76.56% of Ruby online submissions for Roman to Integer.