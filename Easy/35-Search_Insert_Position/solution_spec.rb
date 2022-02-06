require_relative '../solution'

TEST_CASES = [
  {
    input: [[1, 3, 5, 6, 7], 0],
    output: 0
  },
  {
    input: [[1, 3, 5, 6], 1],
    output: 0
  },
  {
    input: [[1, 3, 5, 6], 2],
    output: 1
  },
  {
    input: [[1, 2, 3, 5, 6, 7], 3],
    output: 2
  },
  {
    input: [[1, 3, 5, 6, 8, 9, 10, 11, 13, 15, 16, 18, 19, 27], 14],
    output: 9
  },
  {
    input: [[1, 3, 5, 6, 8, 9, 10, 11, 13, 15, 16, 18, 19, 27], 13],
    output: 8
  },
  {
    input: [[1, 3, 5, 6, 8, 9, 10, 11, 13, 15, 16, 18, 19, 27], 0],
    output: 0
  },
  {
    input: [[1, 3, 5, 6, 8, 9, 10, 11, 13, 15, 16, 18, 19, 27], 29],
    output: 14
  },
].freeze

RSpec.describe '#solution' do
  TEST_CASES.each do |tc|
    case tc
    in { input: input, output: output }
      it "#{input}  =>  #{output}" do
        expect(search_insert(*input)).to eq(output)
      end
    end
  end
end
