Matrix := List clone

Matrix pprint := method(
	"#{self size} by #{self at(0) size} matrix:" interpolate println
	self foreach(i, row, row println)
	"----" println
)

Matrix dim := method(x, y, 
	self setSize(y)
	for(i, 0, y-1, 
		self atPut(i, list() setSize(x))
	)
)

Matrix set := method(x, y, value, 
	if (y > self size) then(Exception raise("y too large"))
	if (x > self at(0) size) then(Exception raise("x too large"))
	self at(y-1) atPut(x-1, value)
)

Matrix get := method(x, y, self at(y-1) at(x-1))

m := Matrix clone

m dim(3,4)
m pprint

m set(2,3, "omg")
m pprint

m get(2,3) println