# Print the contents of an array of sixteen numbers, four numbers at a time, using just each.
tempArray = Array.new
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16].each do |n|
  tempArray << n
  if(tempArray.length == 4)
    puts tempArray.join(' ')
    tempArray = Array.new
  end
end

# Now, do the same with each_slice in Enumerable.
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16].each_slice(4) { |a| puts a.join(' ') }

# The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface.
# Let the initializer accept a nested structure of hashes.
# You should be able to specify a tree like this:
# {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }.
