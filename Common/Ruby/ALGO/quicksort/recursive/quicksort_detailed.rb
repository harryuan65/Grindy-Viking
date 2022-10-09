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

  puts "partition(#{first}, #{last})"
  puts "\t #{highlighted_array(a, {first=>35,first+1=>31, last=>31})}"
  puts "\t #{highlight_pointers(a, first, last)}"
  puts "\t pivot is a[#{first}]=#{a[first]}"
  i, j = first+1, last

  loop do
    while i < last
      break if a[i] > a[first]
      i+=1
    end

    while j > first
      break if a[j] < a[first]
      j-=1
    end

    puts "\t #{highlight_pointers(a, i, j)}"

    break if i >= j

    puts "\t #{highlighted_array(a, {first=>35,i=>33, j=>33})}"
    puts "\t swap [#{i}], [#{j}] = swap #{a[i]} #{a[j]}"
    a[i], a[j] = a[j], a[i]
    puts "\t #{highlighted_array(a, {first=>35,i=>36, j=>36})}"
  end

  puts "\t swap pivot [#{first}] [#{j}] = swap pivot #{a[first]} #{a[j]}"
  a[first], a[j] = a[j], a[first] # swap pivot with a[i]
  puts "\t #{highlighted_array(a, {first=>92, j =>92})}"

  j
end

def highlighted_array(a, mapping)
  highlighted = a.map.with_index do |e, i|
    if (color = mapping[i])
      "\e[#{color}m#{e}\e[0m"
    else
      e
    end
  end
  highlighted * " "
end

def highlight_pointers(a, i, j)
  pointers = a.map.with_index do |e, ii|
    if ii == i
      "\e[1mi\e[0m"
    elsif ii == j
      "\e[1mj\e[0m"
    else
      " "
    end
  end
  pointers * " "
end