# timestamp: 2022-07-20T18:45:03+08:00
# question: https:/leetcode.com/problems/consecutive-available-seats

require_relative "tree_node"

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  Iterative attempt
  感覺樹的遍歷根據順序應該用 stack 或是 queue 就可以解決。
  用第一個 testcase 畫個圖，發現說 1 先拿出來，把 children 反著放到 stack裡面，每次 pop stack 出來重複一樣動作。
DOC

# code goes here
# @param {Node} root
# @return {List[int]}
def preorder(root)
  stack = [root]
  values = []
  while stack.any?
    node = stack.pop
    values << node.val
    stack.concat(node.children.reverse)
  end
  values
end