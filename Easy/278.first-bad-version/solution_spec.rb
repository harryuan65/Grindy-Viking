FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: [],
    output: 0
  },
  {
    input: [],
    output: 0
  }
].freeze

RSpec.describe FILE_NAME do
  context TRAIN_OF_THOUGHT do
    TEST_CASES.each do |tc|
      case tc
      in { input: input, output: output}
        pending "TODO: assert solution output with expected"
        # it "#{input}  =>  #{output}" do
        #   expect(___).to eq(output)
        # end
      end
    end
  end
end
