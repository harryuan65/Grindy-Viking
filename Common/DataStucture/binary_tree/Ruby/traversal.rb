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

#       6
#     4    8
#   2  5  7  9
# 1  3

# Root -> L -> R
# 642135879
def pre_order(node)
  values = []
  if node.left.nil? && node.right.nil?
    values << node.val
    return values
  end

  values << node.val
  values << pre_order(node.left)
  values << pre_order(node.right)

  values
end

# L -> Root -> R
# 對 BST 做 inorder 就是由小到大依序遍歷。
def in_order(node)
  values = []
  if node.left.nil? && node.right.nil?
    values << node.val
    return values
  end

  values << in_order(node.left)
  values << node.val
  values << in_order(node.right)

  values
end

# L -> R -> Root
def post_order(node)
  values = []
  if node.left.nil? && node.right.nil?
    values << node.val
    return values
  end

  values << post_order(node.left)
  values << post_order(node.right)
  values << node.val

  values
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
