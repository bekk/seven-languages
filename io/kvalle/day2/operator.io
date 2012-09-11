# How would you change / to return 0 if the denominator is zero?

Number div := Number getSlot("/")
Number / := method(val, if(val == 0, 0, self div(val)))

"1 / 0 gives " print
(1 / 0) println

"1 / 2 gives " print
(1 / 2) println

