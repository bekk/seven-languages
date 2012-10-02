# Two-dimensional list
List2d := List clone

dim := method(x, y,
  list := List2d clone
  Range 1 to(y) foreach(i, list append(Range 1 to(x) map(j, 0)))
  list)

List2d set := method(x, y, value,
  self at(y) atPut(x, value))

List2d get := method(x, y, self at(y) at(x))

list := dim(2, 3)
list set(1, 1, 5)

"Two-dimensional list: " print
list println

"Element at 1, 1: " print
list get(1, 1) println

List2d transpose := method(
  ys := self size
  xs := self first size
  list := dim(ys, xs)
  for (y, 0, ys - 1,
    for(x, 0, xs - 1, list set(y, x, self get(x, y))))
  list)

"Transposed list: " print
list transpose println

File with("matrix") open write(list serialized) close

f := File with("matrix") open 
matrix := doString(f readToEnd)
f close

"Read from file: " print
matrix println
