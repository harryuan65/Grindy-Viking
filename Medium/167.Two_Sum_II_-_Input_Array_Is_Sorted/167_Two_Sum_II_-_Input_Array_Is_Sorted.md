#QuestionCategory??

# 思路

```ad-note
#### DO?

#### Input

- numbers: Integer，已經由小到大排序
- target: Integer

#### Output
兩數字的 index

index1 < index2
```

這題我還真沒頭緒，參考了下 python 的答案，發現其實很簡單：
因為 Array 已經被 sorted，而且必有一解，所以從最小的跟最大的開始湊湊看
如果太小就把小的換下一個
如果太大就把大的換前一個
一定會湊出一解。
像這樣：

```plaintext
target = 13
[0,1,2,6,8,10,11,14,20]
 L                   R  ,0+20 > 13 => move R backward
[0,1,2,6,8,10,11,14,20]
 L                R     ,0+14 > 13 => move R backward
[0,1,2,6,8,10,11,14,20]
 L             R        ,0+11 < 13 => move L forward
[0,1,2,6,8,10,11,14,20]
   L          R         ,1+11 < 13 => move L forward
[0,1,2,6,8,10,11,14,20]
     L         R        ,2+11 == 13 => return [l+1, r+1] #
```

```ruby
# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
    l = 0
    r = numbers.size - 1
    while l < r do
        if numbers[l] + numbers[r] < target
            l +=1
        elsif numbers[l] + numbers[r] > target
            r -=1
        else
            return [l+1, r+1]
        end
    end
end
```

![[Coding/Medium/167_Two_Sum_II_-_Input_Array_Is_Sorted/images/submission.png]]
