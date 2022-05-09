# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  return head if head.nil?

  stack = []
  while head
    stack << head
    head = head.next
  end

  new_head = stack.last

  while stack.any?
    front = stack.pop
    front.next = stack.last
  end
  new_head
end
