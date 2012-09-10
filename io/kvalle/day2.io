task := method(str, "\n\n - #{str} \n" interpolate println)


task("Implementation of Fibonacci sequence. Both iterative and recursive solutions.")

doFile("fib.io")


task("How would you change / to return 0 if the denominator is zero?") 

Number div := Number getSlot("/")
Number / := method(val, if(val == 0, 0, self div(val)))

("1 / 0 gives " .. (1 / 0)) println
("1 / 2 gives " .. (1 / 2)) println