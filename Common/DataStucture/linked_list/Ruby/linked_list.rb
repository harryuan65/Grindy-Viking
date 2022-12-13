# frozen_string_literal: true

# LinkedList in ruby
class LinkedList
  attr_accessor :head

  def initialize(head)
    @head = head
  end

  # Time: O(n)
  # Space: O(1)
  def insert(val)
    if @head
      node = head
      node = node.next until node.next.nil?
      node.next = ListNode.new(val)
    else
      @head = ListNode.new(val)
    end
  end

  # Time: O(n)
  # Space: O(1)
  def display
    node = head
    while node
      print "#{node.val} "
      node = node.next
    end
    puts
  end

  # Time: O(n)
  # Space: O(1)
  def delete(val)
    if @head.val == val
      @head = @head.next
      return
    end

    node = head
    node = node.next until node.next.nil? || node.next.val == val
    if node.next # found
      node.next = (node.next.next)
    else
      puts "#{val} Not found!"
    end
  end

  # Time: O(n)
  # Space: O(1)
  # If n.even?, returns the n/2th node
  def middle_node
    slow = fast = @head

    while fast.next&.next
      slow = slow.next
      fast = fast.next.next
    end
    slow
  end
end
