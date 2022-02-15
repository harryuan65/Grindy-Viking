#BinarySearch

# 思路

```ad-note
### Input

- nums: Array[Integer]
- target: Integer

nums 是已排序好的 array，假設 target 要被插入，會在第幾個位置？

### Output

target 插入的 index
```

```plaintext
14
[1, 3, 5, 6, 8, 9, 10, 11, 13, 15, 16, 18, 19, 27]
 0                 6>                          13
[1, 3, 5, 6, 8, 9, 10, 11, 13, 15, 16, 18, 19, 27]
                        7         <10          13
[1, 3, 5, 6, 8, 9, 10, 11, 13, 15, 16, 18, 19, 27]
                        7   8>  9
[1, 3, 5, 6, 8, 9, 10, 11, 13, 15, 16, 18, 19, 27]
                                9
si == ei == 9 該檢查了。
```

```plaintext
2
[1, 3, 5, 6]
 0 <1     3
[1, 3, 5, 6]
 0

si == ei == 0

```

```plaintext
0
1,3,5,6,8,9,10,11,13,15,16,18,19,27
0          <6                   13
1,3,5,6,8,9,10,11,13,15,16,18,19,27
0  <2     5
1,3,5,6,8,9,10,11,13,15,16,18,19,27
0 1

   1,3,5,6,8,9,10,11,13,15,16,18,19,27
-1 0
ei < si 該檢查了

```

```plaintext
剩下奇數項的時候 si mid ei，最後會走到 si == ei
剩下偶數項的時候 si ei，最後會走到 si > ei
所以 binary search 的 base case 要寫 si >= ei
```

```ad-note
有一個 case 要另外處理：當 mid 的值跟 target 一樣時，不要再 search 了，直接回傳他的 index。

~~~plaintext
3
1,2,3,5,7
0   2   4
~~~
等於的情況就不拆了，直接回傳 2

```

其他照原規則，當剩下兩元素時 si == mid，再走下一步時。：

- 往左會使得 ei 交會，往前超過 si 一位，這時候就要檢查 si：
  - 如果 target 比 si 元素大，就排下一個也就是 si + 1。
  - 如果 target 這個 si 元素小或是相等，就是 si 的 index。

```ruby
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
```
