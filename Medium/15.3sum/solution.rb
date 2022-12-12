# timestamp: 2022-10-16T10:01:26+08:00
# question: https:/leetcode.com/problems/3sum

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  針對每個元素，使用 two_sum 來找到相加是 「-元素」的兩個值。
DOC


# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  nums.sort!
  result = []
  (0..nums.size-1).each do |i|
    two_sum(nums, i, result)
    puts result.map(&:to_s)
  end
  result
end


def two_sum(nums, target_i, result)
  i, j = 0, nums.size-1
  target = nums[target_i]
  while i < j
    i+=1 if target_i == i
    j-=1 if target_i == j

    sum = nums[i] + nums[j]
    if sum == -target
      result << [[target, nums[i], nums[j]]]
      i += 1
      j -= 1
    elsif sum > target
      j -= 1
    else
      i += 1
    end
  end
end

# res = []
# arr = [-1,0,5, 1,-3,6,-4,-2].sort
# two_sum(arr, 2, res)
# puts res.map(&:to_s)