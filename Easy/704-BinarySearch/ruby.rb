def binary_search(nums, si, ei, target)
  mid = si + ((ei - si) / 2).floor
  return mid if nums[mid] == target
  return -1 if si >= ei

  if target < nums[mid]
    # puts "#{si} -> #{ei} | nums[#{mid}]=#{nums[mid]} => L [#{si} ~ #{mid - 1}]"
    binary_search(nums, si, mid - 1, target)
  else
    # puts "#{si} -> #{ei} | nums[#{mid}]=#{nums[mid]} => R [#{mid - 1} ~ #{ei}]"
    binary_search(nums, mid + 1, ei, target)
  end
end

def search(nums, target)
  binary_search(nums, 0, nums.length - 1, target)
end

nums = gets.chomp.split(',').map(&:to_i)
target = gets.chomp.to_i
puts search(nums, target)
# -1, 0, 3, 5, 6, 7, 8, 9, 12

__END__
Runtime: 176 ms, faster than 5.31% of Ruby online submissions for Binary Search.
Memory Usage: 213.7 MB, less than 6.79% of Ruby online submissions for Binary Search.
