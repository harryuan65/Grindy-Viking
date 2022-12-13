# frozen_string_literal: true

require "set"

def solution(s = "")
  m = 0
  si = 0
  set = Set.new
  0.upto(s.size - 1) do |i|
    if !set.include?(s[i])
      set << s[i]
    else
      si += 1 while set.include?(si)
    end

    m = i - si if i - si > m
  end
  m
end
