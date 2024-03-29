FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: "abcabcbb",
    output: 3
  },
  {
    input: "",
    output: 0
  },
  {
    input: "a",
    output: 1
  },
  {
    input: "ababaasdertghda",
    output: 7
  },
].freeze

RSpec.describe FILE_NAME do
  TEST_CASES.each do |tc|
    case tc
    in { input:, output: }
      it "#{input}  =>  #{output}" do
        expect(solution(input)).to eq(output)
      end
    end
  end
end
