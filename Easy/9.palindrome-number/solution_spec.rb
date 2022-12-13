FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: 121,
    output: true
  },
  {
    input: 1,
    output: true
  },
  {
    input: -121,
    output: false
  },
  {
    input: 10,
    output: false
  },
  {
    input: 123,
    output: false
  },
  {
    input: 987_656_789,
    output: true
  },
  {
    input: 9889,
    output: true
  },
  {
    input: 9871,
    output: false
  },
].freeze

RSpec.describe FILE_NAME do
  TEST_CASES.each do |tc|
    case tc
    in { input: input, output: output}
      it "#{input}  =>  #{output}" do
        expect(is_palindrome(input)).to eq(output)
      end
    end
  end
end
