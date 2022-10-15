FILE_NAME = "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: [[2,7,11,15], 9],
    output: [0, 1]
  },
  {
    input: [[3,2,4], 6],
    output: [1, 2]
  },
  {
    input: [[3,3], 6],
    output: [0, 1]
  },
].freeze

RSpec.describe FILE_NAME do
  context TRAIN_OF_THOUGHT do
    TEST_CASES.each do |tc|
      case tc
      in { input: input, output: output}
        it "#{input}  =>  #{output}" do
          expect(two_sum(*input)).to eq(output)
        end
      end
    end
  end
end
