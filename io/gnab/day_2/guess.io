guess := method(n, tries,
  if(tries == 0, 
    "You didn't make it!" println,
    x := File standardInput readLine("Make a guess: ")
    if(x == nil, "\nBye, bye!" println ; exit,
      if(x asNumber isNan, "Not a number!" println ; guess(n, tries),
        if(x asNumber == n, 
          "Correct!" println, 
          "Wrong!" println ; guess(n, tries - 1)
        )
      )
    )
  )
)

guess(50, 10)
