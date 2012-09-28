# Change / to return 0 when denominator is zero
Number div := Number getSlot("/")
Number / := method(denominator,
  if(denominator == 0,
    0,
    self div(denominator)))

"5 / 0: " print
(5 / 0) println
