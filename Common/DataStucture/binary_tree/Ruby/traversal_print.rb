class Node
  attr_accessor :val, :left, :right
  def initialize(val, left=nil, right=nil)
    @val = val
    @left = left
    @right = right
  end
end

root = Node.new(1)
root.left = Node.new(2, Node.new(4), Node.new(5))
root.right = Node.new(3, Node.new(6), Node.new(7))

#       1
#     /   \
#    2     3
#   / \   / \
#  4  5   6  7

# Root -> L -> R
def pre_order(node)
  if node.left.nil? && node.right.nil?
    print node.val, " "
    return
  end

  print node.val, " "
  pre_order(node.left)
  pre_order(node.right)
end

# L -> Root -> R
# 對 BST 做 inorder 就是由小到大依序遍歷。
def in_order(node)
  if node.left.nil? && node.right.nil?
    print node.val, " "
    return
  end

  in_order(node.left)
  print node.val, " "
  in_order(node.right)
end

# L -> R -> Root
def post_order(node)
  if node.left.nil? && node.right.nil?
    print node.val, " "
    return
  end

  post_order(node.left)
  post_order(node.right)
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

  values
end
