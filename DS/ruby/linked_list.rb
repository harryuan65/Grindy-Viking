# frozen_string_literal: true

# Linked List Node
class ListNode
  attr_accessor :val, :next

  def initialize(val, next_ptr = nil)
    @val = val
    @next = next_ptr
  end
end

# LinkedList in ruby
class LinkedList
  attr_accessor :head

  def initialize(head)
    @head = head
  end

  def insert(val)
    if @head
      node = head
      node = node.next while node.next
      node.next = ListNode.new(val)
    else
      @head = ListNode.new(val)
    end
  end

  def display
    node = head
    while node
      print "#{node.val} "
      node = node.next
    end
    puts
  end

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
end
