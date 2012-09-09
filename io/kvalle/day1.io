# Execute the code in a slot given its name.

Fred := Object clone
Fred greet := method("Greetings!" println)

Fred greet
Fred getSlot("greet") call
Fred perform("greet")

