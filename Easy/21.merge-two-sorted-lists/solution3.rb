# timestamp: 2022-12-27T15:37:50+08:00
# question: https:/leetcode.com/problems/merge-two-sorted-lists

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  想到 1->1->3 跟 4->5->6 的例子，如果有一邊一直都很小就要先選擇。

  所以不是兩個一起往前走，而是每步挑選最小的以後，該 list 往下走一個。
  需要 merge 代表 list1 && list2 是真，如果有一個空了就直接結束。當結束以後發現還有就直接塞到後面，表示他們的值都很大。
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
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  answer = answer_head = ListNode.new
  while list1 && list2
    if list1.val < list2.val
      val = list1.val
      list1 = list1.next
    else
      val = list2.val
      list2 = list2.next
    end
    answer.next = ListNode.new(val)
    answer = answer.next
  end

  answer.next = list1 if list1
  answer.next = list2 if list2
  answer_head.next
end