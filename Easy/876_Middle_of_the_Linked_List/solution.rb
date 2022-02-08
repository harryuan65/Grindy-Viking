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
def middle_node(head)
  return head if head.next.nil?

  node = head
  s = 1
  s += 1 while node = node.next

  mid = (s / 2).ceil
  node = head
  0.upto(mid - 1) do
    node = node.next
  end
  node
end
