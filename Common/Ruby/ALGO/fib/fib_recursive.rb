def fib(n)
  if n <= 2
    n
  else
    fib(n - 1) + fib(n - 2)
  end
end

#                                 fib(5)
# ->             fib(4)              +              fib(3)
# ->        fib(3)          + fib(2)            fib(2)  +  fib(1)
# -> fib(2) + fib(1)
# ->  2     +   1           +    2   +            2    +    1    =  8

