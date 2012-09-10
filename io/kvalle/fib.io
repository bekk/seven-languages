fibs := method(n,
	nums := list()
	for(i, 0, 10, nums append(fib(i)))
)

fib := method(n,
	if(n==0 or n==1, 1, fib(n-1, acc) + fib(n-2))
)

"using recursion:" println
fibs(10) println
