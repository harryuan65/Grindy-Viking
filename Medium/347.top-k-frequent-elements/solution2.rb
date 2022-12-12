# timestamp: 2022-12-12T20:20:22+08:00
# question: https:/leetcode.com/problems/top-k-frequent-elements

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  Use max heap to get the first k elements
DOC

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

# code goes here
def top_k_frequent(nums, k)
  counts = Hash.new(0)
  nums.each { |e| counts[e]+=1 }
  heap = counts.to_a
  heap_sort(heap)
  heap.last(k).map(&:first)
end

