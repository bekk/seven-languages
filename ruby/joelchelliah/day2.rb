# Print the contents of an array of sixteen numbers, four numbers at a time, using just each.
# Now, do the same with each_slice in Enumerable.

ARRAY = (1..16).to_a

def split_with_each
  ARRAY.each do |num|
    print num, "\t" 
    puts if num % 4 == 0
  end
end

def split_with_each_slice
  ARRAY.each_slice(4) do |num|
    puts num.join("\t")
  end
end

#split_with_each
#split_with_each_slice

################################################################################



# The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. 
# Let the initializer accept a nested structure of hashes. You should be able to specify a tree like this: 
# {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }.

class Tree
  attr_accessor :children, :node_name
  
  def initialize(name, children=[])
    @node_name = name
    @children = children
    if Hash===name and !name.empty?
      @node_name = name.keys.first
      name.values.first.each_pair { |key, value| @children << Tree.new({key => value}) }
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

#nested_tree = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })
#nested_tree.visit_all {|node| puts node.node_name}

################################################################################



# Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line.

PHRASE = ARGV.join(" ")

def simple_grep
  puts "greping for: '#{PHRASE}':"
  File.open("day2.txt", "r") do |file|
    file.each do |line|
      puts ' line %d : %s' % [file.lineno, line] if line =~ Regexp.new(PHRASE)
    end
  end
end

simple_grep