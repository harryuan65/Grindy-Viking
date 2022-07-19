require_relative "../../Common/Ruby/DS/list_node/list_node"

# 就用 slow fast 龜兔法找到循環以後，head 跟 fast 一起走一步直到相遇。相遇點就是循環起點。

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
