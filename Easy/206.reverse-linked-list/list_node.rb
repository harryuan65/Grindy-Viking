# frozen_string_literal: true

# Linked List Node
# :reek:U
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, next_ptr = nil)
    @val = val
    @next = next_ptr
  end

  def ==(other)
    if @next.nil?
      @val == other.val
    else
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
end
