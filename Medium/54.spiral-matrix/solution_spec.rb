require_relative './solution'

TEST_CASES = [
  {
    input: [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ],
    output: [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]
  },
].freeze

RSpec.describe '#solution' do
  TEST_CASES.each do |tc|
    case tc
    in { input: input, output: output}
      it "#{input}  =>  #{output}" do
        expect(spiral_order(input)).to eq(output)
      end
    end
  end
end
