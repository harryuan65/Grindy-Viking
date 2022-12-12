# timestamp: 2022-12-12T09:22:02+08:00
# question: https:/leetcode.com/problems/top-k-frequent-elements

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  1. use a hash to store the frequency of each element
  2. hash -> array -> sort by "each count"
  3. get the last k elements
  Note: Language feature used here.
DOC

# code goes here
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  dict = Hash.new(0)
  (0..nums.size-1).each do |i|
    dict[nums[i]]+=1
  end
  dict.to_a
      .sort_by{|a| a[1]}
      .last(k)
      .map(&:first)
end