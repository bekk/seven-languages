Fib := Object clone

Fib recur := method(n, 
  if(n < 3, 1, recur(n-1) + recur(n-2)))

Fib loop := method(n, 
    nums := list(1,1)
    while (nums size < n, nums append(nums slice(nums size - 2) sum))
    nums last)

"Recursive: " print
Range 1 to(8) map(i, Fib recur(i)) join(", ") println

"Iterative: " print
Range 1 to(8) map(i, Fib loop(i)) join(", ") println
