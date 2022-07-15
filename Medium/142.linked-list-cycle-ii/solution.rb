require_relative "../../Common/Ruby/DS/list_node/list_node"

# @param {ListNode} head
# @return {ListNode}
def detectCycle(head)
  slow = fast = head

  while fast.next&.next
    slow = slow.next
    fast = fast.next.next
    break if slow == fast
  end

  if slow == fast
    begin
      head = head.next
      fast = fast.next
    end while head != fast
    fast
  end
end
