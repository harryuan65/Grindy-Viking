require_relative './solution'

TEST_CASES = [
  {
    input: 'Hello World',
    output: 5
  },
  {
    input: 'Hello World     ',
    output: 5
  },
  {
    input: ' He ll o W orld     ',
    output: 4
  },
  {
    input: 's',
    output: 1
  },
  {
    input: '12',
    output: 2
  },
  {
    input: ' 12',
    output: 2
  },
  {
    input: ' 12 ',
    output: 2
  },
  {
    input: '1234567',
    output: 7
  },
  {
    input: ' 1234567',
    output: 7
  },
].freeze

RSpec.describe '#solution' do
  TEST_CASES.each do |tc|
    case tc
    in { input: input, output: output}
      it "#{input}  =>  #{output}" do
        expect(length_of_last_word(input)).to eq(output)
      end
    end
  end
end
