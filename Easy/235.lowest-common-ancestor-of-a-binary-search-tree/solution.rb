# timestamp: 2022-07-28T21:11:53+08:00
# question: https:/leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree
# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  因為 BST 的關係，只要目前看的 node 值 ∈ [p,q] 就可以結束了，如果比 p、q 都大，或是都小，就繼續找。
DOC

# code goes here
# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  while root
    val = root.val
    if val > p.val && val > q.val
      root = root.left
    elsif val < p.val && val < q.val
      root = root.right
    else
      return root
    end
  end
end
