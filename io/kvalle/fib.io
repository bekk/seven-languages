fibs := method(n,
	nums := list()
	for(i, 0, 10, nums append(fib(i)))
)

fib := method(n,
	if(n < 2, 1, fib(n-1) + fib(n-2))
)

"using recursion:" println
fibs(10) println

fib := method(n,
	nums := list(1,1);
	for (i, 2, n, 
		nums append(nums at(i-1) + nums at(i-2)))
	return nums at(n)
)

"using iteration:" println
fibs(10) println

