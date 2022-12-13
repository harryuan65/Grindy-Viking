FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: [0],
    output: [0]
  },
  {
    input: [0, 0],
    output: [0, 0]
  },
  {
    input: [1, 0, 0],
    output: [1, 0, 0]
  },
  {
    input: [1, 0, 2, 3],
    output: [1, 2, 3, 0]
  },
  {
    input: [1, 0, 2, 0, 3, 0],
    output: [1, 2, 3, 4, 0, 0, 0]
  },
].freeze

RSpec.describe FILE_NAME do
  TEST_CASES.each do |tc|
    case tc
    in { input: input, output: output }
      it "#{input}  =>  #{output}" do
        expect { move_zeroes(input) }.to change { input }.from(input).to(output)
      end
    end
  end
end
