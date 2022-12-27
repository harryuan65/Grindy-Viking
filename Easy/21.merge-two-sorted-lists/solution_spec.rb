FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME
require_relative "../../Common/DataStucture/list_node/Ruby/from_array.rb"

TEST_CASES = [
  {
    input: { list1: [1,2,4], list2: [1,3,4] },
    output: [1,1,2,3,4,4]
  },
  {
    input: { list1: [], list2: [] },
    output: []
  },
  {
    input: { list1: [], list2: [0] },
    output: [0]
  },
].freeze

RSpec::Matchers.define :match_list do |expected|
  match do |actual|
    if actual.nil?
      actual == expected
    else
      actual.same_list?(expected)
    end
  end

  failure_message do |actual|
    "expected that \"#{actual.inspect}\" would be the same linked list as \"#{expected.inspect}\""
  end
end

RSpec.describe FILE_NAME do
  TEST_CASES.each do |tc|
    case tc
    in { input: { list1: list1, list2: list2 }, output: output}
      it "#{list1}  =>  #{output}" do
        real_list1 = list1.to_linked_list
        real_list2 = list2.to_linked_list
        result_list = merge_two_lists(real_list1, real_list2)
        expected_list = output.to_linked_list
        expect(result_list).to match_list(expected_list)
      end
    end
  end
end
