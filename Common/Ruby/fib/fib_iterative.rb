def fib2(n)
  arr = [0, 1, 2]
  return arr[n] if n < 2

  (3..n).each do |i|
    arr[i] = arr[i - 1] + arr[i - 2]
  end
  arr[n]
end
