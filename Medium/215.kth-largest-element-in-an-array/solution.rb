# timestamp: 2022-12-12T22:00:12+08:00
# question: https:/leetcode.com/problems/kth-largest-element-in-an-array

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  Use heapsort learned from 347 top-k-frequent-elements
DOC

# code goes here
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  heap_sort(nums)
  nums[nums.size - k]
end

def heap_sort(nums)
  length = nums.length
  (length/2-1).downto(0).each do |i|
    heapify(nums, length, i)
  end

  (length - 1).downto(0).each do |i|
    nums[0], nums[i] = nums[i], nums[0]
    heapify(nums, i, 0)
  end
end

def heapify(nums, n, i)
  largest = i
  left = 2 * i + 1
  right = 2 * i + 2

  largest = left if left < n && nums[left] > nums[largest]
  largest = right if right < n && nums[right] > nums[largest]

  if largest != i
    nums[i], nums[largest] = nums[largest], nums[i]
    heapify(nums, n, largest)
  end
end