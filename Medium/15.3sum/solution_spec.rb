FILE_NAME = "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: [-1,0,1,2,-1,-4],
    output: [[-1,-1,2],[-1,0,1]]
  },
  {
    input: [0,1,1],
    output: []
  }, {
    input: [0,0,0],
    output: [[0,0,0]]
  }
].freeze

RSpec.describe FILE_NAME do
  context TRAIN_OF_THOUGHT do
    TEST_CASES.each do |tc|
      case tc
      in { input: input, output: output}
        it "#{input}  =>  #{output}" do
          expect(three_sum(input)).to eq(output)
        end
      end
    end
  end
end
