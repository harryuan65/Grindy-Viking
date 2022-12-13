FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input1: File.read(File.join(__dir__, "test_cases/true/input1.txt")),
    input2: File.read(File.join(__dir__, "test_cases/true/input2.txt")),
    output: true
  },
  {
    input1: File.read(File.join(__dir__, "test_cases/false/input1.txt")),
    input2: File.read(File.join(__dir__, "test_cases/false/input2.txt")),
    output: false
  },
  {
    input1: "badc",
    input2: "baba",
    output: false
  }
].freeze

RSpec.describe FILE_NAME do
  TEST_CASES.each_with_index do |tc, i|
    case tc
    in { input1: input1, input2: input2, output: output}
      it "test case ##{i}" do
        expect(is_isomorphic(input1, input2)).to eq(output)
      end
    end
  end
end
