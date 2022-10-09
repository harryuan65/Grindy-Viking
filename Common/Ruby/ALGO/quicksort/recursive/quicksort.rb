def quicksort(a, first, last)
  if first < last
    p = partition(a, first, last)
    quicksort(a, first, p-1)
    quicksort(a, p+1, last)
  end
  a
end

def partition(a, first, last)
  if first == last
    return first
  end

  pivot = a[first]
  i, j = first+1, last

  loop do
    while i < last
      break if a[i] >= pivot
      i+=1
    end

    while j > first
      break if a[j] < pivot
      j-=1
    end

    break if i >= j

    a[i], a[j] = a[j], a[i]
  end

  a[first], a[j] = a[j], a[first] # swap pivot with a[i]

  j
end
