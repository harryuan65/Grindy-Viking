#QuestionCategory??

# 思路

```ad-note
#### DO?
in-place 反轉 char array
#### Input
- s: Char[]
#### Output
reversed s
```

做過 [[189-RotateArray]] 就知道反轉 array，是用兩個 pointer L, R 從 `0` 跟 `n - 1` 開始 swap 直到相遇。
這個更簡單反轉完就結束。

```ruby
# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s)
    l = 0
    r = s.length - 1
    while l < r
        s[l], s[r] = s[r], s[l]
        l+=1
        r-=1
    end
end
```

![[submission ruby.png]]
