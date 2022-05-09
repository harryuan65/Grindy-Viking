require_relative './solution'
require_relative './list_node'

TEST_CASES = [
  [1, 2, 3, 4],
  []
].map do |arr|
  first, *rest = arr
  input_list = ListNode.new(first)
  input_list_head = input_list
  rest.each do
    input_list.next = ListNode.new(_1)
    input_list = input_list.next
  end

  output_list = ListNode.new(first)
  output_list_head = output_list
  rest.reverse_each do
    output_list.next = ListNode.new(_1)
    output_list = output_list.next
  end

  {
    input: input_list_head,
    output: output_list_head
  }
end

# RSpec.describe '#solution' do
#   TEST_CASES.each do |tc|
#     case tc
#     in { input: input, output: output}
#       it "#{input}  =>  #{output}" do
#         expect(reverse_list(input)).to eq(output)
#       end
#     end
#   end
# end

require 'pry'
binding.pry
