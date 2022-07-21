FILE_NAME = "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: begin
      root, nine, twenty, fifteen, seven = [3,9,20,15,7].map(&TreeNode.method(:new))
      twenty.left = fifteen
      twenty.right = seven

      root.left = nine
      root.right = twenty

      root
    end,
    output: [[3],[9,20],[15,7]]
  },
  {
    input: begin
      [3,9,20,nil,8,11,15,7]
      root, nine, twenty, eight, eleven,fifteen, seven = [3,9,20,8,11,15,7].map(&TreeNode.method(:new))
      eight.left = seven
      nine.right = eight

      twenty.left = eleven
      twenty.right = fifteen
      root.left = nine
      root.right = twenty
      root
    end,
    output: [[3],[9,20],[8,11,15],[7]]
  },
  {
    input: TreeNode.new(3),
    output: [[3]]
  },
  {
    input: nil,
    output: []
  }
].freeze

RSpec.describe FILE_NAME do
  context TRAIN_OF_THOUGHT do
    TEST_CASES.each do |tc|
      case tc
      in { input: input, output: output}
        it "#{input}  =>  #{output}" do
          expect(level_order(input)).to eq(output)
        end
      end
    end
  end
end
