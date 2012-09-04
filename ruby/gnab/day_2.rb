require 'pp'

# Print the contents of an array of sixteen numbers, four numbers at a
# time, using just each. Now, do the same with each_slice in Enumerable.
nums = (1..16).to_a
bucket = []
nums.each do |n|
  bucket.push n
  if bucket.size == 4
    puts bucket.join(', ')
    bucket = []
  end
end

# Now, do the same with each_slice in Enumerable.
nums.each_slice(4) do |slice|
  puts slice.join(', ')
end

# Let the initializer accept a nested structure of hashes. You should be able 
# to specify a tree like this:
# {'grandpa'  => { 
#     'dad'   => {'child 1' => {}, 'child 2' => {} }, 
#     'uncle' => {'child 3' => {}, 'child 4' => {} } 
#   } 
# }
class Tree
  attr_accessor :children, :node_name
  def initialize(tree = {})
    @node_name = tree.keys.first
    @children = []
    tree.values.first.each_pair do |key, val|
      @children << Tree.new(key => val)
    end
  end
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  def visit(&block)
    block.call self
  end
end

tree = {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }

pp Tree.new(tree)

# Write a simple grep that will print the lines of a file having any occur-
# rences of a phrase anywhere in that line. You will need to do a simple
# regular expression match and read lines from a file. (This is surprisingly
# simple in Ruby.) If you want, include line numbers.
grep_word = 'cake'

File.open('day_2.txt') do |file|
  file.lines.each_with_index do |line, i|
    puts "#{i+1} #{line}" if line =~ Regexp.new(grep_word)
  end
end
