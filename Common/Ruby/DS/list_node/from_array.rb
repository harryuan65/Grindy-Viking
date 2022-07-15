# frozen_string_literal: true

require_relative "./list_node"

class Array
  def to_linked_list
    first, *rest = self
    input_list = ListNode.new(first)
    input_list_head = input_list
    rest.each do
      input_list.next = ListNode.new(_1)
      input_list = input_list.next
    end

    input_list_head
  end
end
