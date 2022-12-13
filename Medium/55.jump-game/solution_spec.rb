FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME
require_relative "./testcase"

TEST_CASES = [
  {
    input: [2, 3, 1, 1, 4],
    output: true
  },
  {
    input: [3, 2, 1, 0, 4],
    output: false
  },
  {
    input: BIG_TEST_CASE,
    output: true
  },
  {
    input: [0],
    output: true
  },
  {
    input: [0, 2, 1, 3, 0, 0, 2],
    output: false
  },
  {
    input: [1, 2, 3, 0, 0, 3, 0, 0, 3, 0, 0, 4], # last_idx=11
    output: true
  }
].freeze

RSpec.describe FILE_NAME do
  TEST_CASES.each do |tc|
    case tc
    in { input: input, output: output}
      it "#{input}  =>  #{output}" do
        expect(can_jump(input)).to eq(output)
      end
    end
  end
end
