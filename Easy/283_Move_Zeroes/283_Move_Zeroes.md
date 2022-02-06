#QuestionCategory??

# 思路

```ad-note
### DO?

把零移動到最右邊

#### Input

- a: Integer

#### Output

target 插入的 index
```

本來是想: L 從左找到最近的 0，**R 再從這邊**開始找最近的非零整數。

```plaintext
[0,0,0,1,2,3]
 L     R      swap(L, R)
[1,0,0,0,2,3]
   L     R      swap(L, R)
[1,2,0,0,0,3]
     L     R      swap(L, R)
[1,2,3,0,0,0]
       L   R  R reached n - 1 , break.

[0] len < 2, return.
[0,0] R reached n - 1 and is zero, break;
[1,0] R reached n - 1 and is zero, break;

[0,0,1,0,2,0,3]
 L   R  swap(L,R)
[1,0,0,0,2,0,3]
   L     R  swap(L,R)
[1,2,0,0,0,0,3]
   L     R  swap(L,R)
[1,2,0,0,0,0,3]
     L       R  swap(L,R)
[1,2,3,0,0,0,0]
       L     R  R reached n - 1 and is zero, break;

[0,0,1,0,0,3,0,4,0,0,6,0,0,7,0]
 L   R swap(L,R)
[1,0,0,0,0,3,0,4,0,0,6,0,0,7,0]
   L       R swap(L,R)
[1,3,0,0,0,0,0,4,0,0,6,0,0,7,0]
     L         R swap(L,R)
[1,3,4,0,0,0,0,0,0,0,6,0,0,7,0]
       L             R swap(L,R)
[1,3,4,6,0,0,0,0,0,0,0,0,0,7,0]
         L                 R swap(L,R)
[1,3,4,6,7,0,0,0,0,0,0,0,0,0,0]
           L                 R R reached n - 1 and is zero, break;
```

```ruby
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
```

幹這樣太慢了！！
![[Time Limit Exceeded.png]]


四次失敗之後終於去參考提示跟其他人的做法了。
所謂 Two pointers 是說：一個去 iterate array，另一個去找是 0 的元素。
所以一開始先假設沒有出現 0 ，`L` 設成 `-1`。
如果第一次遇到 0 ，就設定 L 為此位置
如果遇到非零項，且前面有出現 0（ L 已設定）就 swap。
其他就一直往下走直到結束
```ruby
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  return unless nums.size > 1

  l = -1
  nums.each_with_index do |e, i|
      if l.negative? 
          l = i if e.zero?
      else
          if e.nonzero?
              nums[l] = e
              nums[i] = 0
              l+=1
          end
      end 
  end
end

```
剛剛的 code:
![[Before.png]]

現在的 code:
![[After.png]]