require_relative './solution'

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

RSpec.describe '#solution' do
  TEST_CASES.each do |tc|
    case tc
    in { input: input, output: output}
      it "#{input}  =>  #{output}" do
        # expect(___).to eq(output)
      end
    end
  end
end
