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
  p1 = list1
  p2 = list2
  head = ListNode.new
  p_ans = head

  while p1 || p2
    if p1.nil? || p2.nil?
      head.next = p1 || p2
      break
    end

    if p1.val <= p2.val
      chosen = p1
      p1 = p1.next
    else
      chosen = p2
      p2 = p2.next
    end

    head.next = ListNode.new(chosen.val)
    head = head.next
  end

  p_ans.next
end

# Runtime: 118 ms, faster than 61.72% of Ruby online submissions for Merge Two Sorted Lists.
# Memory Usage: 211.1 MB, less than 52.09% of Ruby online submissions for Merge Two Sorted Lists.
