FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: [[2,7,11,15], 9],
    output: [1,2]
  },
  {
    input: [[2,3,4], 6],
    output: [1,3]
  },
  {
    input: [[-1,0], -1],
    output: [1,2]
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
