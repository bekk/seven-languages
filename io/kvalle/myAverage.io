# Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not a number.)

# Trivial solution:

List myAverage := List getSlot("average")

# Serious solution:

List myAverage := method(
	sum := 0
	self foreach(i, val, 
		if(val type == "Number",
			sum = sum + val,
			Exception raise("Hey! #{val} is not a number, stupid!" interpolate)
		)
	)
	sum / self size
)

# Test

"Normal list: " print
list(1,2,3,4,5,6,7) myAverage println

"Empty list: " print
list() myAverage println

"List with non-numeric item: " print
list(1,2,"foobar") myAverage println