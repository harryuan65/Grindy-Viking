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

  pt = ListNode.new(0, head)
  stack = []

  stack.push(pt) while (pt = pt.next)
  ans = node = stack.pop
  node = node.next while (node.next = stack.pop)

  ans
end
