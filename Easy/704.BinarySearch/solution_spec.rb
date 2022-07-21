FILE_NAME = "solution2.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: [-1,0,3,5,9,12],
    target: 9,
    output: 4
  },
  {
    input: [-1,0,3,5,9,12],
    target: -1,
    output: 0
  },
  {
    input: [-1,0,3,5,9,12],
    target: 4,
    output: -1
  },
  {
    input: [1],
    target: 1,
    output: 0
  },
  {
    input: [-1],
    target: 1,
    output: -1
  },
  {
    input: [2, 5],
    target: 2,
    output: 0
  },
  {
    input: [-1,0,3,5,9,12],
    target: 0,
    output: 1
  },
].freeze

RSpec.describe FILE_NAME do
  context TRAIN_OF_THOUGHT do
    TEST_CASES.each do |tc|
      case tc
      in { input: input, target: target, output: output}
        it "#{input}  =>  #{output}" do
          expect(search(input, target)).to eq(output)
        end
      end
    end
  end
end
