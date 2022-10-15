# timestamp: 2022-10-15T14:19:08+08:00
# question: https:/leetcode.com/problems/two-sum

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  用 hash 記得差值跟元素 index，當某一個元素剛好等於差值的時候，就可以取得前一個元素的 index
DOC

# @param {Array<Integer>} nums
# @param {Integer} target
# @return {Array<Integer>}
def two_sum(nums, target)
  seen = {}
  (0..nums.size-1).each do |i|
    num = nums[i]
    index = seen[num]
    if index
      return [index, i]
    else
      seen[target - num] = i
    end
  end
end