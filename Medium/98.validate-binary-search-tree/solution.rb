# timestamp: 2022-07-21T19:37:12+08:00
# question: https:/leetcode.com/problems/validate-binary-search-tree

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  看單顆樹 [2,1,3] 條件：左邊 < root、右邊 > root。
  看左子樹除上述規則，還要所有值都 < parent.left
  看右子樹除上述規則，還要所有值都 > parent.right
DOC

# code goes here
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  validate(root, -Float::INFINITY, Float::INFINITY)
end

def validate(node, min, max)
  val = node.val
  left = node.left
  right = node.right
  puts "======================="
  puts "left=#{left&.val} root=#{val} right=#{right&.val}, min=#{min} max=#{max}"

  self_valid = val.between?(min, max)
  puts "val #{val} between?(min #{min}, max #{max}) ? #{self_valid}"
  return self_valid if left.nil? && right.nil?


  self_valid &&= left.val < val if left
  self_valid &&= right.val > val if right
  puts "self_valid=#{self_valid}"

  min_valid = val > min
  min_valid &&= left.val > min if left
  min_valid &&= right.val > min if right
  puts "min_valid=#{min_valid}"

  max_valid = val < max
  max_valid &&= left.val < max  if left
  max_valid &&= right.val < max if right
  puts "max_valid=#{min_valid}"
  return false unless min_valid && max_valid

  children_valid = true
  children_valid &&= validate(left,  min, val) if left
  children_valid &&= validate(right, val, max) if right
  puts "children_valid=#{children_valid}"
  min_valid && max_valid && self_valid && children_valid
end

# [5,4,6,null,null,3,7] f
# [8,5,12,3,6,9,14] t
# [8,5,12,3,8,9,14] f
# [8,5,12,3,6,13,14] f
# [8,5,13,3,8,13,14] f
# [2,1,3]