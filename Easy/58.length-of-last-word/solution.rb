# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  return 1 unless s.size > 1

  e_i = -1
  (s.size - 1).downto(0) do |i|
    if s[i] != ' ' && e_i.negative?
      e_i = i
    elsif s[i] == ' ' && e_i.positive?
      return e_i - i
    elsif i.zero? && e_i.positive?
      return e_i - i + 1
    end
  end
end
