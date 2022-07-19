FILE_NAME = "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: [7, 1, 5, 3, 6, 4],
    output: 5
  },
  {
    input: [7, 6, 4, 3, 1],
    output: 0
  }
].freeze

RSpec.describe FILE_NAME do
  TEST_CASES.each do |tc|
    case tc
    in { input: input, output: output}
      it "#{input}  =>  #{output}" do
        expect(max_profit(input)).to eq(output)
      end
    end
  end
end
