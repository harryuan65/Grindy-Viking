# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  max = current_max = nums.first
  nums[1..].each do |e|
    if current_max.negative?
      current_max = e
    else
      current_max += e
    end
    max = [max, current_max].max
  end

  max
end
