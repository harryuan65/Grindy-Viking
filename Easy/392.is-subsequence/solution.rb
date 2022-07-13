# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  checker = 0
  s.each_char do |c|
    while c != t[checker]
      return false if checker >= t.size - 1
      checker += 1
    end
    checker += 1
  end

  true
end
# failed 1: s is not unique
# failed 2: bb vs ahbgdc outputs true
