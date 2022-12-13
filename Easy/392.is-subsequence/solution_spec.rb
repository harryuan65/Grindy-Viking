FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input1: "aa",
    input2: "",
    output: false
  },
  {
    input1: "",
    input2: "",
    output: true
  },
  {
    input1: "",
    input2: "abc",
    output: true
  },
  {
    input1: "abc",
    input2: "axbefac",
    output: true
  },
  {
    input1: "axc",
    input2: "acbefac",
    output: false
  },
  {
    input1: "aaaaa",
    input2: "bbaaa",
    output: false
  },
  {
    input1: "bb",
    input2: "ahbgdc",
    output: false
  }
].freeze

RSpec.describe FILE_NAME do
  TEST_CASES.each_with_index do |tc, i|
    case tc
    in { input1: input1, input2: input2, output: output}
      it "test case ##{i}" do
        expect(is_subsequence(input1, input2)).to eq(output), "expected \"#{input1}\" to #{output ? "be" : "not be"} a substring of \"#{input2}\""
      end
    end
  end
end
