# # @param {String} s
# # @return {Integer}
def length_of_last_word(s)
  return 1 unless s.size > 1

  s.split(" ")[-1].strip.size
end
