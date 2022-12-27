# timestamp: 2022-12-27T15:20:18+08:00
# question: https:/leetcode.com/problems/valid-parentheses

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  有點像演算法課學到的運算符號處理，看到左半部就先丟到 stack 內。stack 頂端代表「最該先關起來的括號」，遇到任何一個右半部就 pop 出來，檢查是否有對應。
DOC

# code goes here
# @param {String} s
# @return {Boolean}
def is_valid(s)
  return false if s.size == 1
  stack = []
  maps = {
    "(" => ")",
    "[" => "]",
    "{" => "}",
  }
  s.chars.each do |c|
    if c == "(" || c == "{" || c == "["
      stack.push(c)
    else # )]}
      # s consists of parentheses only '()[]{}'
      opening = stack.pop
      if maps[opening] != c
        return false
      end
    end
  end
  stack.empty?
end