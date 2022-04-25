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
# :reek:U
def merge_two_lists(list1, list2)
  return list1 if list2.nil?
  return list2 if list1.nil?

  min, max = list1.val > list2.val ? [list2, list1] : [list1, list2]
  ListNode.new(min.val, merge_two_lists(min.next, max))
end
