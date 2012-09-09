require "pp"

# Print the contents of an array of sixteen numbers, four numbers at a time, using just 'each'. 

numbers = (0..15).to_a

numbers.each do |n|
    p numbers[(n)..(n+3)] if n % 4 == 0
end

puts

# Now, do the same with 'each_slice' in 'Enumerable'

numbers.each_slice(4) {|ns| p ns }

puts

# The Tree class was interesting, but it did not allow you to specify
# a new tree with a clean user interface. Let the initializer accept a
# nested structure with hashes and arrays. You should be able to
# specify a tree like this: {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child
# 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.

class Tree
    attr_accessor :children, :node_name
    
    def initialize(tree)
        @node_name = tree.keys[0]
        @children = tree[@node_name].map do |sub| 
            subtree = Hash[*sub]
            Tree.new(subtree)
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

ruby_tree = Tree.new({"grandpa"=>
                        {"dad"=>{"child 2"=>{}, "child 1"=>{}},
                         "uncle"=>{"child 4"=>{}, "child 3"=>{}}}})

puts "visiting root"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
puts

# Write a simple grep that will print the lines of a file having any
# occurrences of a phrase anywhere in that line. You will need to do
# a simple regular expression match and read lines from a file. (This
# is surprisingly simple in Ruby.) If you want, include line numbers.

def ruby_grep(filename, pattern)
    regexp = Regexp.new(pattern)
    File.open(filename, 'r') do |file|
        file.each_line {|line| puts line if regexp =~line}
    end
end

ruby_grep('day2.txt', 'red')
