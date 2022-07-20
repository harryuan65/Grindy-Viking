#!/usr/bin/env ruby
# timestamp: 2022-07-20T13:25:42+08:00
# title: easy/409.longest-palindrome

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  想先看看每個字出現幾次，偶數次可以直接累計。
  但如果出現奇數次，必須 -1 拿掉多出來的那一個再累計。
  這樣加完表示兩兩配對完了
  如果還有剩下次數沒用掉的，可以取一個字放在正中間以達到最長回文。
DOC

# code goes here
# @param {String} s
# @return {Integer}
def longest_palindrome(s)
  occurences = s.chars.tally.values
  count = 0
  return occurences.first if occurences.size == 1

  sum = 0
  occurences.each do |occur|
    count += if occur.even?
               occur
             else
               occur - 1
             end
    sum += occur
  end

  count += 1 if sum > count
  count
end
