# Print the string “This is sentence number 1” where the number 1 changes from 1 to 10.

def print_it
  1.upto(10) { |num| puts 'This is sentence number %d' % num}
end

#print_it

################################################################################



# Write a program that picks a random number. Let a player guess the number, 
# telling the player whether the guess is too low or too high.

def guess_it
  num = rand(10) + 1
  while true
    guess = Integer(gets.chomp) rescue 0
    if guess == 0
      puts "Pick a number between 1 and 10"
    elsif guess == num
      puts "Woohoo!"
      exit
    else
      puts "Too damn high!" if guess > num
      puts "Too low :c" if guess < num
    end
  end
end

guess_it