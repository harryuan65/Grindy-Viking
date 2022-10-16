# timestamp: 2022-10-16T09:27:04+08:00
# question: https:/leetcode.com/problems/two-sum-ii-input-array-is-sorted

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  第一次不會寫，參考後發現因為 Array 已經被 sorted，而且必有一解，所以從最小的跟最大的開始湊湊看。
DOC

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  l = 0
  r = numbers.size - 1
  while l < r do
    if numbers[l] + numbers[r] < target
      l +=1
    elsif numbers[l] + numbers[r] > target
      r -=1
    else
      return [l+1, r+1]
    end
  end
end