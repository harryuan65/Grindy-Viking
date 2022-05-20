require_relative './solution'

TEST_CASES = [
  {
    input: 'II',
    output: 2
  },
  {
    input: 'III',
    output: 3
  },
  {
    input: 'IV',
    output: 4
  },
  {
    input: 'XL',
    output: 40
  },
  {
    input: 'CMX',
    output: 910
  },
  {
    input: 'CMXLIX',
    output: 949
  },
].freeze

RSpec.describe '#solution' do
  TEST_CASES.each do |tc|
    case tc
    in { input: input, output: output}
      it "#{input}  =>  #{output}" do
        expect(roman_to_int(input)).to eq(output)
      end
    end
  end
end
