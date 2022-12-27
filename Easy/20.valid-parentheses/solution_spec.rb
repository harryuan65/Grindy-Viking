FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: "()",
    output: true
  },
  {
    input: "(){}[]",
    output: true
  },
  {
    input: "(){",
    output: false
  },
  {
    input: "{",
    output: false
  },
  {
    input: "((",
    output: false
  },
].freeze

RSpec.describe "#{File.basename(__dir__)}/#{FILE_NAME}" do
  context TRAIN_OF_THOUGHT do
    TEST_CASES.each do |tc|
      case tc
      in { input: input, output: output}
        it "#{input}  =>  #{output}" do
          expect(is_valid(input)).to eq(output)
        end
      end
    end
  end
end
