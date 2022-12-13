FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: "Hello World",
    output: "dlroW olleH"
  },
  {
    input: "Hello World",
    output: "dlroW olleH"
  },
].freeze

RSpec.describe FILE_NAME do
  TEST_CASES.each do |tc|
    case tc
    in { input: input, output: output}
      it "#{input}  =>  #{output}" do
        expect { reverse_string(input) }
          .to change { input }.from(input).to(output)
      end
    end
  end
end
