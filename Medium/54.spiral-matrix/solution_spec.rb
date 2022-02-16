require_relative './solution'

TEST_CASES = [
  {
    input: [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ],
    output: [1, 2, 3, 6, 9, 8, 7, 4, 5]
  },
  {
    input: [
      [1, 2, 3, 4, 5],
      [6, 7, 8, 9, 10],
      [11, 12, 13, 14, 15]
    ],
    output: [1, 2, 3, 4, 5, 10, 15, 14, 13, 12, 11, 6, 7, 8, 9]
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
