# timestamp: 2022-12-12T21:45:32+08:00
# question: https:/leetcode.com/problems/top-k-frequent-elements

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  <how I came up with this solution>
DOC

# code goes here
def heap_sort(nums)
  length = nums.length
  (length/2-1).downto(0) do |i|
    heapify(nums, length, i)
  end

  (length - 1).downto(0) do |i|
    nums[i], nums[0] = nums[0], nums[i]
    heapify(nums, i, 0)
  end
end

def heapify(nums, n, i)
  largest = i
  left = 2 * i + 1
  right = 2 * i + 2

  largest = left if left < n && nums[left][1] > nums[largest][1]
  largest = right if right < n && nums[right][1] > nums[largest][1]

  if largest != i
    nums[i], nums[largest] = nums[largest], nums[i]
    heapify(nums, n, largest)
  end
end

# Same as solution2 but:
# 1. removed too op language features
# 2. generalized writing
def top_k_frequent(nums, k)
  counts = {}
  nums.each do |e|
    counts[e] ||= 0
    counts[e] += 1
  end
  heap = []
  counts.keys.each do |key|
    heap.push([key, counts[key]])
  end
  heap_sort(heap)
  answer = []
  size = heap.size
  (size-1).downto(size-k) do |i|
    answer.push(heap[i][0])
  end
  answer
end

