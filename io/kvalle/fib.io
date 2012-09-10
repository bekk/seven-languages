fibonacci := Object clone
recursive := fibonacci clone
iterative := fibonacci clone

fibonacci first := method(n,
	nums := list();
	for(i, 0, n, nums append(self fib(i)))
)

recursive fib := method(n,
	if(n < 2, 1, 
		self fib(n-1) + self fib(n-2))
)

iterative fib := method(n,
	nums := list(1,1);
	for (i, 2, n, 
		nums append(nums at(i-1) + nums at(i-2)))
	return nums at(n)
)

"using recursion:" println
recursive first(10) println

"using iteration:" println
iterative first(10) println
