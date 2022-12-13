# frozen_string_literal: true

# frozen_string_literal: true

# Linked List Node
# :reek:U
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def same_list?(other)
    return false if other.nil?
    return false unless other.is_a?(ListNode)
    return @val == other.val if @next.nil?

    node = self
    while node && other
      return false if node.val != other.val

      node = node.next
      other = other.next
      return false if !node.nil? && other.nil? || node.nil? && !other.nil?
    end
    true
  end
end
