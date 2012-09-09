# Bonus problem: If you're feeling the need for alittle more, write a program 
# that picks a random number. Let a player guess the number, telling the 
# player whether the guess was too low or too high.

number = rand(10)
puts "Guess a number:"
guess = gets.chomp.to_i
while guess != number
    puts guess > number ? "Too high!" : "Too low!"
    guess = gets.chomp.to_i
end
puts "Correct!"
