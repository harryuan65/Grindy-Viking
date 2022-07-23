# timestamp: 2022-07-23T13:42:49+08:00
# question: https:/leetcode.com/problems/validate-binary-search-tree

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  寫完 solution.rb 重新畫圖，發現可以優化（看 solution2.png)
DOC

# code goes here
def is_valid_bst(root)
  validate(root, -Float::INFINITY, Float::INFINITY)
end

def validate(node, min, max)
  val = node.val
  valid = val > min && val < max

  valid &&= validate(node.left, min, node.val) if node.left
  valid &&= validate(node.right, node.val, max) if node.right
  valid
end


# [5,4,6,null,null,3,7] f
# [8,5,12,3,6,9,14] t
# [8,5,12,3,8,9,14] f
# [8,5,12,3,6,13,14] f
# [8,5,13,3,8,13,14] f
# [2,1,3] t

# Runtime: 140 ms, faster than 43.51% of Ruby online submissions for Validate Binary Search Tree.
# Memory Usage: 211.6 MB, less than 97.40% of Ruby online submissions for Validate Binary Search Tree.