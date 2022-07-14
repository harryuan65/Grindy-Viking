# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  return true if s == ""

  p_s = 0
  p_t = 0

  while p_t < t.size && p_s <= s.size - 1
    p_s += 1 if s[p_s] == t[p_t]
    p_t += 1
  end

  p_s > s.size - 1
end
# failed 1: s is not unique
