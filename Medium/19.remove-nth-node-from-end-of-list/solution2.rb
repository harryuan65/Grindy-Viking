# timestamp: 2022-12-23T20:07:44+08:00
# question: https:/leetcode.com/problems/remove-nth-node-from-end-of-list

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  參考一下 one pass 解決的方法，提示是用兩個 pointer。第一個想到 fast slow 但好像不太對。
  兩個 pointer 一個叫先鋒一個叫小跟班，先鋒一開始先走 n 步，接著兩者一起開始往前。
  當先鋒走到最後一個的時候，小跟班會剛好走到 last n-1th 的位置，這時候把小跟班直接指向先鋒就可以移除 nth node。
  有一個 edge case 是如果 n 跟鏈長一樣的時候，先鋒走 n 步會移動到 nil，如果是這樣就直接用頭往下走一個就好。
DOC

# code goes here
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  return nil if head.next.nil?

  ans = sidekick = pioneer = head
  1.upto(n) do # pioneer will become nil if n == length of nodes
    pioneer = pioneer.next
  end

  if pioneer
    while pioneer && pioneer.next != nil
      sidekick = sidekick.next
      pioneer = pioneer.next
    end
    sidekick.next = sidekick.next.next
    ans
  else
    ans.next
  end
end