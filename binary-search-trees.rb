
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
#now with the better build tree it is not needed
def build_tree_from_sorted(ary)
  root = Node.new(ary.shift)
  current_node = root

  while ary.size > 0
    child = Node.new(ary.shift)
    attach_child_to_node(current_node, child)
    puts "node #{current_node.value} with child #{current_node.right_child.value}"
    current_node = child
  end
end

#wheter it is child or child value is kind of a mess, double-check everything later

def build_tree(ary)
  #root is a random ary element (deleted after declaration)
  root = Node.new(ary.delete_at(rand(ary.length)))
  while ary.size > 0
    child = Node.new(ary.shift)
    attach_child_to_node(root, child)
  end

  print_tree(root)
  puts breadth_first_search(root, 7)
  puts dfs_rec(root, 7)
  puts depth_first_search(root, 7)
end

def attach_child_to_node(node, child)
  if child.value < node.value
    if node.left_child.nil?
      node.left_child = child
      child.parent = node
    else
      attach_child_to_node(node.left_child, child)
    end
  else
    if node.right_child.nil?
      node.right_child = child
      child.parent = node
    else
      attach_child_to_node(node.right_child, child)
    end
  end
end

def print_tree(node)
  print "#{node.value} parent "
  print node.parent.value unless node.parent.nil?
  puts

  if node.left_child# != nil #these weren't needed lol
    print_tree(node.left_child)
  end
  if node.right_child# != nil
    print_tree(node.right_child)
  end
end

#breadth_first_search-es the tree, called in build_tree
def breadth_first_search(root, searched_value, queue=[])
  queue << root
  while queue.size > 0
    #line below needed just for debugging
    #puts print queue.map {|node| node.value}
    potential = queue.shift
    if potential.value == searched_value
      return potential
    else
      queue << potential.left_child unless potential.left_child.nil?
      queue << potential.right_child unless potential.right_child.nil?
    end
  end
  return nil if queue.size == 0
end

#non-recursive depth first search
def depth_first_search(root, searched_value, stack=[])
  stack << root
  while stack.size > 0
    return root if root.value == searched_value
    stack << root if root.right_child
    if root.left_child
      root = root.left_child
    elsif root.right_child
      root = root.right_child
    else
      root = stack.pop.right_child
    end
  end

end

#depth first search recursive
#doesn't work everytime if for example there are two 7's in the array?
def dfs_rec(root, searched_value)
  if root.nil?
    return
  else
    return root if root.value == searched_value
    dfs_rec(root.left_child, searched_value)
    dfs_rec(root.right_child, searched_value)
  end
end


sorted = [1, 3, 4, 4, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345]
unsorted = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

build_tree_from_sorted(sorted)
build_tree(unsorted)
