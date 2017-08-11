
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
    child = ary.shift
    attach_child_to_node(current_node, child)
    puts "tis node #{current_node.value} with tis child #{current_node.right_child}"
    current_node = Node.new(child)
  end
end

def build_tree(ary)
  #currently working here
  #function is called on unsorted below
end

def attach_child_to_node(node, child)
  if child < node.value
    node.left_child = child
  else
    node.right_child = child
  end
end


sorted = [1, 3, 4, 4, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345]
unsorted = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

build_tree_from_sorted(sorted)
build_tree(unsorted)
