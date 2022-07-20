# timestamp: 2022-07-20T17:13:09+08:00
# question: https:/leetcode.com/problems/consecutive-available-seats

require_relative "tree_node"

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  #preorder 有點像 DFS，就是先取 self 再左邊走到底。
  他希望我們回傳 Array<Node#val>，所以我想做一個遞迴：回傳 [node.val, node.children 每個按順序呼叫 #preorder]
DOC

# code goes here

# class Node
#   attr_accessor :val, :children

#   def initialize(val)
#     @val = val
#     @children = []
#   end
# end

# @param {Node} root
# @return {List[int]}
def preorder(root)
  return [] unless root

  if root.children.any?
    [root.val, *root.children.flat_map(&method(:preorder))]
  else
    [root.val]
  end
end
