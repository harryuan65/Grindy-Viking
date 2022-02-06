# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  return unless nums.size > 1

  l = 0
  r = 0
  while r < nums.size - 1
    l += 1 while !nums[l].zero? && l < nums.size - 1

    r = l
    loop do
      return if r == nums.size - 1 && nums[r].zero?

      if nums[r].zero?
        r += 1
      else
        break
      end
    end

    nums[l], nums[r] = nums[r], nums[l]
  end
end
