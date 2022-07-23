# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  從 nil 開始維護另一個 list 尾部。每一次先 hold 著 next，直接反轉 head
DOC

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  prev = nil
  while head
    temp_next = head.next
    head.next = prev
    prev = head
    head = temp_next
  end

  prev
end