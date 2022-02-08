# @param {String} s
# @return {String}
def reverse_words(s)
  p1 = 0
  p2 = 0
  while p1 <= s.size - 1 && p2 <= s.size - 1
    p2 += 1 while p2 + 1 < s.size && s[p2 + 1] != ' '
    pp1 = p1
    pp2 = p2
    while pp1 < pp2
      s[pp1], s[pp2] = s[pp2], s[pp1]
      pp1 += 1
      pp2 -= 1
    end
    p2 += 2
    p1 = p2
  end
  s
end

puts reverse_words("Let's take LeetCode contest")
puts reverse_words('abc def ghi')
puts reverse_words('apple')
