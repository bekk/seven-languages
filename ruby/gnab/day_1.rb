# Print the string "Hello, world."
puts 'Hello, world.'

# For the string "Hello, Ruby" find the index of the word "Ruby."
puts 'Hello, Ruby.'.index('Ruby.')

# Print your name ten times
10.times do puts 'Ole Petter' end

# Print the string 'This is sentence number 1.' where the number 1 changes 
# from 1 to 10.
10.times do |n| puts "This is sentence number #{n+1}." end

# Run a Ruby program from a file
# ruby day_1.rb

# Bonus problem: If you’re feeling the need for a little more, write a pro-
# gram that picks a random number. Let a player guess the number,
# telling the player whether the guess is too low or too high.
puts 'Guess number between 1 and 10 (enter "quit" to end):'
number = rand(10) + 1
while true
  guess = gets.strip

  if guess == number.to_s
    puts 'Correct!'
    break
  end

  break if guess == 'quit'

  puts 'Too low' if guess.to_i < number
  puts 'Too high' if guess.to_i > number
end
puts 'Bye, bye.'
