class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Array
  def to_binary_search_tree
    root_val, *rest = self
    root = TreeNode.new(root_val)
    queue = [root]
    while queue.any?
      # @type [TreeNode]
      current_root = queue.shift
      left_val, right_val = rest.shift(2)

      if left_val
        left = TreeNode.new(left_val)
        current_root.left = left
        queue << left
      end

      if right_val
        right = TreeNode.new(right_val)
        current_root.right = right
        queue << right
      end
    end
    root
  end
end

# root = [6,2,8,0,4,7,9,nil,nil,3,5].to_binary_search_tree
# require_relative "traversal"
# pre_order(root)