class Node
  attr_accessor :val, :left, :right
  def initialize(val, left=nil, right=nil)
    @val = val
    @left = left
    @right = right
  end
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3, Node.new(4), Node.new(5))

#     1
#   2  3
#      4  5

# @param [Node] node
def pre_order(node)
  if node.left.nil? && node.right.nil?
    print node.val, " "
    return
  end

  print node.val, " "
  pre_order(node.left)
  pre_order(node.right)
end

def in_order(node)
  if node.left.nil? && node.right.nil?
    print node.val, " "
    return
  end

  pre_order(node.left)
  print node.val, " "
  pre_order(node.right)
end

def post_order(node)
  if node.left.nil? && node.right.nil?
    print node.val, " "
    return
  end

  pre_order(node.left)
  pre_order(node.right)
  print node.val, " "
end

def level_order(root)
  queue = [root]
  values = []
  while queue.any?
    node = queue.shift
    values << node.val
    queue << node.left if node.left
    queue << node.right if node.right
  end
  print values.join(", ")
end

print "pre_order:"
pre_order(root)
puts

print "in_order:"
in_order(root)
puts

print "post_order:"
post_order(root)
puts

print "level_order:"
level_order(root)
puts
