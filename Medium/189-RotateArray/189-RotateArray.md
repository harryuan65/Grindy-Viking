#TwoPointers

# 思路

因為題目要求 in-place O(1)，所以不能另外製作一個 array 再塞給 nums。

加上題目分類有提示是「Two Pointers」有嘗試了一下但是失敗。
參考[這個影片](https://www.youtube.com/watch?v=BHr381Guz3Y&ab_channel=NeetCode)

```ruby
[1,2,3,4,5]
k = 3

# 1. 利用 Two pointer，直接把整個 Array 顛倒變成
[5,4,3,2,1]
# 2. 針對前面 k 項目 （0 ~ k-1 項）去反轉
[4,5,3,2,1]
# 3. 針對後面 n - k 項目 （k ~ n-1 項）去反轉
[4,5,1,2,3]
# 4. Done.
```

```ruby
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
```
