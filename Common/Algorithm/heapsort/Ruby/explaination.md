# Heap sort

Heap sort is an in-place sorting algorithm that uses a binary heap data structure to sort elements in ascending or descending order. The basic idea is to convert the array into a binary heap, which is a complete binary tree with the property that the value of every parent node is greater than or equal to the values of its children. This allows us to easily remove the largest element from the heap and insert new elements in the appropriate position. Here is an example of how to implement heap sort in Ruby:

This implementation of heap sort is an example of the "top-down" approach, where the array is first converted into a max heap and then the elements are removed one by one to produce the sorted array. There is also a "bottom-up" approach, where the array is initially sorted as a min heap and then the elements are added to the heap one by one to produce the sorted array.

```ruby
def heap_sort(arr)
  # first, convert the array into a max heap
  n = arr.length
  (n/2 - 1).downto(0) do |i|
    heapify(arr, n, i)
  end

  # sort the array by repeatedly removing the largest element from the heap
  (n - 1).downto(0) do |i|
    arr[i], arr[0] = arr[0], arr[i]  # swap the largest element with the last element in the heap
    heapify(arr, i, 0)  # restore the max heap property
  end

  arr
end

def heapify(arr, n, i)
  # ensure that the given index, i, has the max heap property
  largest = i
  left = 2 * i + 1
  right = 2 * i + 2

  # check if the left child is larger than the parent
  largest = left if left < n && arr[left] > arr[largest]

  # check if the right child is larger than the largest so far
  largest = right if right < n && arr[right] > arr[largest]

  # if the largest element is not the parent, swap them and continue heapifying
  if largest != i
    arr[i], arr[largest] = arr[largest], arr[i]
    heapify(arr, n, largest)
  end
end
```
