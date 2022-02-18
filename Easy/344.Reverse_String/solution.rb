# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s)
  l = 0
  r = s.length - 1
  while l < r
    s[l], s[r] = s[r], s[l]
    l += 1
    r -= 1
  end
end
