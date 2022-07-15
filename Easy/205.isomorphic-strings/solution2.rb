require "set"
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  s_chars = s.chars
  t_chars = t.chars
  a = Set.new(s_chars).size
  b = Set.new(t_chars).size
  c = Set.new(s_chars.zip(t_chars)).size
  a == b && b == c
end
