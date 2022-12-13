FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME

FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME
require_relative "../../Common/Ruby/DS/list_node/from_array"

TEST_CASES = [
  begin
    nodes = [3, 2, 0, -4].map(&ListNode.method(:new))
    cycle_start_index = 1
    cycle_start_node = nodes[cycle_start_index]

    0.upto(nodes.size - 1 - 1) do |i|
      nodes[i].next = nodes[i + 1]
    end

    nodes.last.next = cycle_start_node

    {
      input: nodes.first,
      output: cycle_start_node
    }
  end,
  begin
    head = [3, 2, 0, -4].to_linked_list
    {
      input: head,
      output: nil
    }
  end
].freeze

RSpec.describe FILE_NAME do
  TEST_CASES.each do |tc|
    case tc
    in { input: input, output: output}
      it (output ? "found cycle node with value #{output.val}" : "no cycle found").to_s do
        expect(detectCycle(input)).to eq(output)
      end
    end
  end
end
