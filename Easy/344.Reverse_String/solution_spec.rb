require_relative './solution'

TEST_CASES = [
  {
    input: 'Hello World',
    output: 'dlroW olleH'
  },
  {
    input: 'Hello World',
    output: 'dlroW olleH'
  },
].freeze

RSpec.describe '#solution' do
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
