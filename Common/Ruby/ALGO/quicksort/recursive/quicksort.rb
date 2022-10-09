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
    while a[i] < pivot && i < last
      i+=1
    end

    while a[j] >= pivot && j > first
      j-=1
    end

    if i < j
      a[i], a[j] = a[j], a[i]
    else
      a[first], a[j] = a[j], a[first] # swap pivot with a[j]
      break
    end
  end

  j
end
