# A Fibonacci sequence starts with two 1s. Each subsequent number is the sum of the two numbers that came 
# before: 1, 1, 2, 3, 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci number. fib(1) is 1,
# and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.

fib := method(n, 
	iter(n, 0, 0, 1)
)

iter := method(n, i, a, b, 
	if(i == n, a, iter(n, i+1, b, a+b))
)

fib(1) println
fib(4) println
fib(8) println