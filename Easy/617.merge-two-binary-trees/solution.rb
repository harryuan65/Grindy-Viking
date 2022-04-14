# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {TreeNode}
def merge_trees(root1, root2)
  return nil if !root1 && !root2

  node = TreeNode.new((root1&.val || 0) + (root2&.val || 0))

  if root1&.left || root2&.left
    node.left = merge_trees(root1&.left, root2&.left)
  end

  if root1&.right || root2&.right
    node.right = merge_trees(root1&.right, root2&.right)
  end

  node
end

# version2 20 %
def merge_trees(root1, root2)
  return root2 if root1.nil?
  return root1 if root2.nil?

  node = TreeNode.new((root1.val || 0) + (root2.val || 0))
  node.left = merge_trees(root1.left, root2.left)
  node.right = merge_trees(root1.right, root2.right)

  node
end