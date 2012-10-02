List myAverage := method(
  self reduce(sum, x, if(not(x isKindOf(Number)),
    Exception raise("Non-number element in list"), sum + x)) / self size
)
"Average of 1, 2, 3, 4, 5: " print
list(1,2,3,4,5) myAverage println
