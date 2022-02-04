# 思路

針對同一個 Array ，給起始 si 終點 ei。比較 target 跟 si, ei 的中間點 `nums[middle]`，

如果中間點 == target， 就回傳 index
如果比 nums[middle] 小，就往 0..middle-1 去找
如果比 nums[middle] 大，就往 middle..-1 去找
![[BinarySearch-Found.svg]]

```ruby
def binary_search(nums, si, ei, target)
  mid = si + ((ei - si) / 2).floor
  return mid if nums[mid] == target
  return -1 if si >= ei

  if target < nums[mid]
    binary_search(nums, si, mid - 1, target)
  else
    binary_search(nums, mid + 1, ei, target)
  end
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  binary_search(nums, 0, nums.length - 1, target)
end
```

![[01submission ruby.png]]