FILE_NAME = "solution.rb"
require_relative FILE_NAME
require_relative "../../Common/Ruby/DS/binary_tree/to_binary_search_tree.rb"

TEST_CASES = [
  {
    input: begin
      root = [6,2,8,0,4,7,9,nil,nil,3,5].to_binary_search_tree

      [root, root.left, root.left.right] # 2 4
    end,
    output: root.left # 2
  },
  {
    input: begin
      root = [6,2,8,0,4,7,9,nil,nil,3,5].to_binary_search_tree

      [root, root.left, root.right] # 2 8
    end,
    output: root # 6
  },
  {
    input: begin
      root = [2,1].to_binary_search_tree

      [root, root, root.left] # 2 1
    end,
    output: root # 2
  },
  {
    input: begin
      root = [2,1,3].to_binary_search_tree

      [root, root.right, root.left] # 3 1
    end,
    output: root # 2
  },
  {
    input: begin
      root = [5,3,6,2,4,nil,nil,1].to_binary_search_tree

      [root, root.left.left.left, root.left.right] # 2 4
    end,
    output: root.left # 3
  },
].freeze

RSpec.describe FILE_NAME do
  context TRAIN_OF_THOUGHT do
    TEST_CASES.each_with_index do |tc, i|
      case tc
      in { input: input, output: output}
        it "testcase #{i}  =>  #{output.val}" do
          expect(lowest_common_ancestor(*input)).to eq(output)
        end
      end
    end
  end
end
