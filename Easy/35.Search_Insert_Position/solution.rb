# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}

def bs(nums, si, ei, target)
  if si >= ei
    if target > nums[si]
      return si + 1
    else # less and equal are the same position
      return si
    end
  end

  mid = si + ((ei - si) / 2).floor

  if target < nums[mid]
    bs(nums, si, mid - 1, target)
  elsif target == nums[mid]
    mid
  else
    bs(nums, mid + 1, ei, target)
  end
end

def search_insert(nums, target)
  bs(nums, 0, nums.length - 1, target)
end

# --------------------------
nums = gets.chomp.split(',').map(&:to_i)
target = gets.chomp.to_i

puts search_insert(nums, target)


__END__

1,3,5,6,8,9,10,11,13,15,16,18,19,27
14