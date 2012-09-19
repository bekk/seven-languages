# Run an Io program from a file
# io day_1.io

# Execute the code in a slot given its name
obj := Object clone
obj someSlotName := method("executing code in slot" println)
obj someSlotName

Calc := Object clone
Calc fizzbuzz := method(n, 
  if(n % 15 == 0, "FizzBuzz", 
    if(n % 3 == 0, "Fizz",
      if(n % 5 == 0, "Buzz", n))))

for(i, 1, 20, Calc fizzbuzz(i) println)
