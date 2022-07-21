# timestamp: 2022-07-21T12:13:27+08:00
# question: https:/leetcode.com/problems/binary-tree-level-order-traversal

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  <how I came up with this solution>
DOC

# code goes here
require_relative "tree_node"

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  return [] if root.nil?
  return [[root.val]] if root.left.nil? && root.right.nil?

  if root.left && root.right
    [[root.val], *merge_array(level_order(root.left), level_order(root.right))]
  elsif root.left
    [[root.val], *level_order(root.left)]
  else # root.right
    [[root.val], *level_order(root.right)]
  end
end


def merge_array(left, right)
  size = left.size > right.size ? left.size : right.size
  0.upto(size-1) do |i|
    break if !right[i]

    if left[i]
      left[i].concat(right[i])
    else
      left[i] = right[i]
    end
  end

  left
end