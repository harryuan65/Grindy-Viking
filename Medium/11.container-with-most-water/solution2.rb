# timestamp: 2022-12-22T17:54:07+08:00
# question: https:/leetcode.com/problems/container-with-most-water

# train of thought
TRAIN_OF_THOUGHT = <<~DOC.freeze
  因為只有寬度（Array長）是我可以控制的，我也希望他最長，可以像是 Sorted Two Sum 那樣用兩個 pointer 指向兩端
  一邊計算最大一邊看若那個邊比較短，就往內移動一步，直到相遇為止。
  過了而且挺快的 96.13% + 78%
DOC

# code goes here
# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  max = 0
  i = 0
  j = height.size - 1
  while i < j
    left = height[i]
    right = height[j]
    min = left < right ? left : right
    area = (j-i) * min
    if area > max
      max = area
    end
    if left < right
      i+=1
    else
      j-=1
    end
  end
  max
end