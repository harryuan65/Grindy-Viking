require_relative "../../../utils/array"

def quicksort(a, s=0, e=a.size-1)
  stack = [[s, e]]
  puts "\t init stack: #{highlighted_array(stack, {0 => 33})}"
  while stack.any?
    first, last = stack.pop
    if first < last
      p = partition(a, first, last)
      stack.push([first, p-1])
      stack.push([p+1, last])
    end
    puts "\t stack: #{highlighted_array(stack, {0 => 33})}"
  end
  a
end

def partition(a, first, last)
  if first == last
    return first
  end

  puts "==========partition(#{first}, #{last})=========="
  puts "\t #{highlighted_array(a, {first=>35,first+1=>31, last=>31})}"
  puts "\t #{highlight_pointers(a, first+1, last)}"

  pivot = a[first]
  i, j = first+1, last

  loop do
    while a[i] < a[first] && i < last
      i+=1
    end

    while a[j] >= a[first] && j > first
      j-=1
    end


    if i < j
      puts "\t #{highlighted_array(a, {first=>35,i=>33, j=>33})}"
      puts "\t #{highlight_pointers(a, i, j)}"
      puts "\t swap [#{i}], [#{j}] = swap #{a[i]} #{a[j]}"
      a[i], a[j] = a[j], a[i]
      puts "\t #{highlighted_array(a, {first=>35,i=>36, j=>36})}"
    else
      puts "\t #{highlighted_array(a, {first=>33, j =>33})}"
      puts "\t #{highlight_pointers(a, i, j)}"
      puts "\t swap pivot [#{first}] [#{j}] = swap pivot #{a[first]} #{a[j]}"
      a[first], a[j] = a[j], a[first] # swap pivot with a[i]
      puts "\t #{highlighted_array(a, {first=>92, j =>92})}"
      break
    end
  end

  j
end