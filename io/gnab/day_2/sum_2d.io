# Sum two-dimensional array
array := list(list(1,2,3), list(4,5,6), list(7,8,9))
sumArray := method(array,
  if(array isEmpty, 0, array first sum + sumArray(array slice(1, array size))))

sumArrayWithFlatten := method(array, array flatten sum)

"Sum of ((1,2,3), (4,5,6), (7,8,9)): " print
sumArray(array) print
" (" print; sumArrayWithFlatten(array) print; ")" println
