def fib2(n)
  return n if n < 2

  arr = [0, 1, 2]
  (3..n).each do |i|
    arr.push(arr[i - 1] + arr[i - 2])
  end

  arr[n]
end
