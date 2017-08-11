
class Node
  attr_accessor :value, :parent, :left_child, :right_child

  def initialize(value=nil)
    @value = value

    @parent = nil
    @left_child = nil
    @right_child = nil
  end
end

#makes a binary tree from a sorted ary > only right children
def build_tree_from_sorted(ary)
  root = Node.new(ary.shift)
  current_node = root

  while ary.size > 0
    child = Node.new(ary.shift)#ary.shift #problem alert #just switch both back to commented variants if something is off, i can't think atm
    attach_child_to_node(current_node, child)
    puts "node #{current_node.value} with child #{current_node.right_child.value}"
    current_node = child #Node.new(child) #problem alert
  end
end

=begin
def attach_child_to_node(node, child)
  if child < node.value
    node.left_child = child
  else
    node.right_child = child
  end
end
=end

#wheter it is child or child value is kind of a mess, double-check everything later

def build_tree(ary)
  #root is a random ary element (deleted after declaration)
  root = Node.new(ary.delete_at(rand(ary.length)))
  while ary.size > 0
    child = Node.new(ary.shift)
    attach_child_to_node(root, child)
  end

  print_tree(root)
  #define the above function better later/tomorrow
end

def attach_child_to_node(node, child)
  if child.value < node.value
    if node.left_child.nil?
      node.left_child = child
    else
      attach_child_to_node(node.left_child, child)
    end
  else
    if node.right_child.nil?
      node.right_child = child
    else
      attach_child_to_node(node.right_child, child)
    end
  end
end

def print_tree(node)
  puts node.value
  if node.left_child != nil
    print_tree(node.left_child)
  end
  if node.right_child != nil
    print_tree(node.right_child)
  end
end



sorted = [1, 3, 4, 4, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345]
unsorted = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

build_tree_from_sorted(sorted)
build_tree(unsorted)
