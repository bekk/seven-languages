// Write a program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3. 
// As a bonus, solve the problem with recursion and with loops.

Object fibRecursion := method(
  Number rec := method(
    if(self<=2, 1, (self-1) rec + (self-2) rec)
  )
  self rec println
)

Object fibLoop := method(
  if(self<=2) then(1 println) else(
    fib1 := 1
    fib2 := 1
    for(i, 3, self,
      sum := fib1 + fib2
      fib1 = fib2
      fib2 = sum
    )
    sum println
  )
)

//10 fibRecursion
//15 fibLoop



/////////////////////////////////////////////////////////////////////////////////////


// How would you change / to return 0 if the denominator is zero?

Number / := method(num, if(num==0, 0, self * (num ** (-1)) ) )

//(15 / 3) println
//(15 / 0) println



/////////////////////////////////////////////////////////////////////////////////////


// Write a program to add up all of the numbers in a two-dimensional array.

List matrixAdd := method(self flatten sum)

//matrix := list( list(1,2,3), list(4,5,6), list(7,8,9) ) 
//matrix matrixAdd println



/////////////////////////////////////////////////////////////////////////////////////


// Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens 
// if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not a number.)

List myAverage := method(
  if(self size == 0) then(0 println) else( 
    self foreach(number,
      if(number type != "Number") then(Exception raise("'" .. number .. "' is not a number!"))
    )
    (self sum / self size) println
  )
)

//list() myAverage
//list(1,2,3.2,17.5) myAverage
//list(1,2,3.2,"monkey") myAverage



/////////////////////////////////////////////////////////////////////////////////////


// Write a prototype for a two-dimensional list. The dim(x, y) method should allocate a list of y lists 
// that are x elements long. set(x, y, value) should set a value, and get(x, y) should return that value.

TwoDimensionalList := List clone

TwoDimensionalList dim := method(x, y,
  twoDList := TwoDimensionalList clone
  for(i, 1, y,
    oneDList := list()
    for(j, 1, x,
      oneDList append(0)
    )
    twoDList append(oneDList)
  )
  return twoDList
)

TwoDimensionalList set := method(x, y, value,
  self at(y) atPut(x, value)
)

TwoDimensionalList get := method(x, y,
  return self at(y) at(x)
)

//matrix := TwoDimensionalList dim(3,4)
//matrix set(0,2,5.75)
//matrix get(0,2) println



/////////////////////////////////////////////////////////////////////////////////////


// Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list.

TwoDimensionalList transpose := method(
  selfHeight := self size
  selfWidth := self at(0) size
  transposed := self dim(selfHeight, selfWidth)
  for(i, 0, selfHeight - 1,
    for(j, 0, selfWidth - 1,
      transposed at(j) atPut(i, self at(i) at(j))
    )
  )
  return transposed
)

//matrix := TwoDimensionalList dim(3,5)
//matrix set(0,2,5); matrix set(1,4,10)
//newMatrix := matrix transpose
//(newMatrix get(2,0) == matrix get(0,2)) println
//(newMatrix get(4,1) == matrix get(1,4)) println



/////////////////////////////////////////////////////////////////////////////////////


// Write the matrix to a file, and read a matrix from a file.

matrix := TwoDimensionalList dim(2,2)
matrix set(0,1,5); matrix set(1,0,10)

path := "./day2.txt"
toFile := File open(path)
toFile write(matrix serialized())
toFile close()

fromFile := doFile(path)
//fromFile println



/////////////////////////////////////////////////////////////////////////////////////


// Write a program that gives you ten tries to guess a random number from 1–100. 
// If you would like, give a hint of “hotter” or “colder” after the first guess.

guessingGame := method(
  input := File standardInput()
  number := (Random value(99.9) + 1) floor()
  tries := 0
  lastGuess := nil
  while(tries != 10,
    guess := input readLine() asNumber()
    if(guess == number) then(
      "Correct!" println
      break
    ) else(
      if(lastGuess != nil) then(
        if(( (number - guess) abs()) < ((number - lastGuess) abs()), "hotter" println, "colder" println)
      ) else("nope" println)
      tries = tries + 1
      lastGuess = guess
    )
  )
)

//guessingGame