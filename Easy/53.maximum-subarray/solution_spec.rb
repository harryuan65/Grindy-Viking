FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: [10, 9, 8, 7, 6, 5, 4, 1, 4, 5, 16, 17, 1, 8],
    output: 101
  },
  {
    input: [-1, 1, 2, 1],
    output: 4
  },
  {
    input: [-2, 1, -3, 4, -1, 2, 1, -5, 3],
    output: 6
  },
  {
    input: [-2, -3, -4, -5, -6, -1, -5],
    output: -1
  },
  {
    input: [-2],
    output: -2
  },
  {
    input: [0],
    output: 0
  },
].freeze

RSpec.describe FILE_NAME do
  TEST_CASES.each do |tc|
    case tc
    in { input: input, output: output}
      it "#{input}  =>  #{output}" do
        expect(max_sub_array(input)).to eq(output)
      end
    end
  end
end
