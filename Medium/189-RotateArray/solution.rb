def rotate(nums, k)
  n = nums.size
  m = k % n
  return if m.zero?

  p1 = 0
  p2 = n - 1
  while p1 < p2
    nums[p1], nums[p2] = nums[p2], nums[p1]
    p1 += 1
    p2 -= 1
  end

  p1 = 0
  p2 = m - 1
  while p1 < p2
    nums[p1], nums[p2] = nums[p2], nums[p1]
    p1 += 1
    p2 -= 1
  end

  p1 = m
  p2 = n - 1
  while p1 < p2
    nums[p1], nums[p2] = nums[p2], nums[p1]
    p1 += 1
    p2 -= 1
  end
end

if __FILE__ == $PROGRAM_NAME
  nums = [1, 2, 3, 4, 5, 6, 7, 8]
  rotate(nums, 3)
  puts nums.join(' ')
end
