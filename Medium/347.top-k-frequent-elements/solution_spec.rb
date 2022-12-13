FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME

# input nums, k
TEST_CASES = [
  {
    input: [[1,1,1,2,2,3], 2],
    output: [1,2] # random sequence is ok
  },
  {
    input: [[1], 1],
    output: [1]
  },
  {
    input: [[1,1,1,2,2,6,1,7,3,1,8,1,3,9,2,7,1,5,3], 4],
    output: [1,2,3,7]
  },
].freeze

RSpec.describe FILE_NAME do
  context TRAIN_OF_THOUGHT do
    TEST_CASES.each do |tc|
      case tc
      in { input: [nums, k], output: output}
        it "[#{nums * ","}], k = #{k}  =>  #{output}" do
          expect(top_k_frequent(nums, k)).to match_array(output) # answer sequence doesn't matter
        end
      end
    end
  end
end
