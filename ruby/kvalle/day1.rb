# Print the string "Hello, world"

puts "Hello, world."

# For the string "Hello, Ruby", find the index of the word "Ruby".

hello_string = "Hello, Ruby"
index = hello_string.index("Ruby")
puts "'Ruby' is found on index #{index} of the string '#{hello_string}'"

# Print your name ten times.

10.times do
    puts "Kjetil"
end

# Print the string "This is sentence 1", where the number 1 changes from 1 to 10.

(1..10).each do |i|
    puts "This is sentence number #{i}"
end

