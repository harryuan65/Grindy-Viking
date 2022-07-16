#
# <Description>
#
# @param [Array<String>] strs: patterns to check
# @param [String] t target
#
# @return [Array(Integer, Hash{String=>TrueClass,FalseClass})]
#
def batch_is_subsequence(strs, t)
  # Space: O(n)
  seen = {}
  call_count = 0

  is_subsequence = lambda do |s, t|
    return true if s == ""

    p_s = 0
    p_t = 0

    while p_t < t.size && p_s <= s.size - 1
      if s[p_s] == t[p_t]
        p_s += 1
        seen[s[0..p_s]] = true # s=abc, if c matched, save "abc" as seen
      end
      p_t += 1
    end

    p_s > s.size - 1
  end

  # Time: O(n*Log(n))
  strs.sort! do |a, b|
    b.size <=> a.size
  end

  # Time: O(n)
  strs.each do |s|
    has_seen = seen[s]
    if has_seen.nil?
      call_count += 1
      seen[s] = is_subsequence[s, t]
    end
  end
  [call_count, seen]
end

# Time: O(n*Log(n))
# Q: 能不能不排序？
