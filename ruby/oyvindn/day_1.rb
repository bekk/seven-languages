# Print the string "Hello, world."
puts "Hello, world."

# For the string “Hello, Ruby.” find the index of the word “Ruby”
puts "Hello, Ruby.".index('Ruby')

# Print your name ten times.
10.times { puts "Øyvind Nerbråten" }

#Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.
10.times { |t| puts "This is sentence number #{t+1}" }

# Bonus problem: If you’re feeling the need for a little more, write a pro- gram that picks a random number.
# Let a player guess the number, telling the player whether the guess is too low or too high.
actual_number = rand(10)
puts "Guess a number [1-10]"
number = Integer(gets.chomp)
puts "Correct" if number == actual_number
puts "Too low, the actual number was #{actual_number}" if number < actual_number
puts "Too high, the actual number was #{actual_number}" if number > actual_number