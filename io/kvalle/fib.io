fib_recursive := method(n,
	if(n < 2, 1, fib_recursive(n-1) + fib_recursive(n-2))
)

fib_iterative := method(n,
	nums := list(1,1);
	for (i, 2, n, 
		nums append(nums at(i-1) + nums at(i-2)))
	return nums at(n)
)


"using recursion:" println
nums := list()
for(i, 0, 10, nums append(fib_recursive(i)))
nums println

"using iteration:" println
nums := list()
for(i, 0, 10, nums append(fib_iterative(i)))
nums println
