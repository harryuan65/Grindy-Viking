require "set"
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  lookup = {}
  dict = Set.new
  s.size.times do |i|
    c = lookup[s[i]]
    if c.nil?
      if dict.include?(t[i]) # s[i] not seen, but t[i] already seen
        return false
      else
        lookup[s[i]] = t[i]
        dict.add(t[i])
      end
    elsif c != t[i]
      return false
    end
  end
  true
end
