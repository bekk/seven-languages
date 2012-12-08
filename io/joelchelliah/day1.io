// Run an Io program from a file.

// Execute the code in a slot given its name.
Object greetingSlot := "Hello world!" println
Object greetingSlot



// Spend a little time playing with slots and prototypes. Make sure you understand how prototypes work.
Person := Object clone
Person speak := "I can speak io" println

joel := Person clone

bruceTate := Person clone
bruceTate cheer := "Yay!" println

People := list(joel, bruceTate)

People at(0) speak
People at(1) cheer

People at(0) cheer := "Woohoo!" println
joel cheer