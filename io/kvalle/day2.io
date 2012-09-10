task := method(str, "\n\n - #{str} \n" interpolate println)


task("Implementation of Fibonacci sequence. Both iterative and recursive solutions.")

doFile("fib.io")


task("How would you change / to return 0 if the denominator is zero?") 

Number div := Number getSlot("/")
Number / := method(val, if(val == 0, 0, self div(val)))

"1 / 0 gives " print
(1 / 0) println

"1 / 2 gives " print
(1 / 2) println


task("Add up all the numbers in a two-dimensional array.")

sum2d := method(array, array flatten sum)

arr := list(
	list(1,2,3,4,5), 
	list(100,50), 
	list(4,24,145))

"liste: " print
arr println

"sum:   " print
sum2d(arr) println
