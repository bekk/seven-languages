Matrix := List clone

Matrix pprint := method(
	"#{self size} by #{self at(0) size} matrix:" interpolate println
	self foreach(i, row, row println)
	"----" println
)

Matrix dim := method(x, y, 
	self setSize(y)
	for(i, 0, y-1, 
		self atPut(i, list() setSize(x)))
)

Matrix set := method(x, y, value, 
	if (y > self size) then(Exception raise("y too large"))
	if (x > self at(0) size) then(Exception raise("x too large"))

	self at(y-1) atPut(x-1, value)
)

Matrix get := method(x, y, self at(y-1) at(x-1))

Matrix transposed := method(
	res := Matrix clone dim(self size, self at(0) size)
	self foreach(y, row,
		row foreach(x, item,
			res set(y+1, x+1, item)))
	res
)

Matrix toFile := method(path,
	File open(path) write(self serialized) close
)

Matrix fromFile := method(path,
	file := File open(path) 
	lines := file readToEnd() 
	file close
	self copy(doString(lines))
)




m := Matrix clone

m dim(2,3)
# m pprint

m set(1,2, "omg")
# m pprint

# m transposed pprint

file := "matrix.tmp"
m toFile(file)
Matrix fromFile(file) pprint