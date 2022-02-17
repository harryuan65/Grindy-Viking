# # @param {Integer[]} nums
# # @return {Boolean}
# def can_jump(nums)
#   return true if nums.size == 1

#   jump_from(nums, 0)
# end

# def jump_from(nums, current_pos)
#   available_steps = nums[current_pos]
#   if current_pos == nums.size - 1
#     true
#   elsif current_pos > nums.size - 1 || available_steps.zero?
#     false
#   else
#     (1..available_steps).to_a.any? { |step| jump_from(nums, current_pos + step) }
#   end
# end

# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  return true if nums.size == 1

  reachable_i = -1
  reachable_from = nums.map { false }
  (nums.size - 2).downto(0) do |i|
    if (nums[i] >= nums.size - 1 - i) || (reachable_i.positive? && (i + nums[i]) >= reachable_i)
      reachable_i = i
      reachable_from[i] = true
    end
  end
  reachable_from[0]
end
