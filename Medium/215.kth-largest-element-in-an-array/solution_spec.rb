FILE_NAME = "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: [[3,2,1,5,6,4], 2],
    output: 5
  },
  {
    input: [[3,2,3,1,2,4,5,5,6], 4],
    output: 4
  }
].freeze

RSpec.describe FILE_NAME do
  context TRAIN_OF_THOUGHT do
    TEST_CASES.each do |tc|
      case tc
        in { input: [nums, k], output: output}
          it "[#{nums * ","}], k = #{k}  =>  #{output}" do
            expect(find_kth_largest(nums, k)).to eq(output)
          end
        end
    end
  end
end
