FILE_NAME = "solution2.rb".freeze
require_relative FILE_NAME

TEST_CASES = [
  {
    input: begin
      # [1,nil,3,2,4,nil,5,6]
      root = Node.new(1)
      three = Node.new(3)
      three.children = [5,6].map(&Node.method(:new))
      root.children = [three, Node.new(2), Node.new(4)]
      root
    end,
    output: [1,3,5,6,2,4]
  },
  {
    input: begin
      # [1,nil,2,3,4,5,nil,nil,6,7,nil,8,nil,9,10,nil,nil,11,nil,12,nil,13,nil,nil,14]
      root, two, three, four, five,
      six, seven, eight, nine, ten,
      eleven, twelve, thirteen, fourteen = (1..14).map(&Node.method(:new))
      eleven.children = [fourteen]

      seven.children = [eleven]
      eight.children = [twelve]
      nine.children = [thirteen]

      three.children = [six, seven]
      four.children = [eight]
      five.children = [nine, ten]

      root.children = [two, three, four, five]
      root
    end,
    output: [1,2,3,6,7,11,14,4,8,12,5,9,13,10]
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
          expect(preorder(input)).to eq(output)
        end
      end
    end
  end
end
