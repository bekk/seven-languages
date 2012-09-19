# A Fibonacci sequence starts with two 1s. Each subsequent number is the sum of the two numbers that came 
# before: 1, 1, 2, 3, 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci number. fib(1) is 1,
# and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.

fib := method(num,
	prev := 0
	cur := 1
	for(i, 1, num - 1, 1, 
		next := (prev + cur)
		prev := cur
		cur = next
	)
	cur
)

fib(1) println
fib(4) println
fib(8) println



