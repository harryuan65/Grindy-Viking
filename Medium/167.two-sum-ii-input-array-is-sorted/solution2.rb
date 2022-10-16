# timestamp: 2022-10-16T09:27:04+08:00
# question: https:/leetcode.com/problems/two-sum-ii-input-array-is-sorted

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  two pointers 一頭一尾，相加看是否相等。太小就把頭往後一格；太大就把尾往前一格，直到剛好答案為止。
DOC

# @param {Array<Integer>} nums
# @param {Integer} target
# @return {Array<Integer>}
def two_sum(nums, target)
  i, j = 0, nums.size-1
  while i < j
    sum = nums[i] + nums[j]
    if sum == target
      return [i+1,j+1]
    elsif sum < target
      i+=1
    else
      j-=1
    end
  end
end
