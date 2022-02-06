require_relative '../solution'

TEST_CASES = [
  {
    input: [[1, 2, 3, 4, 5, 6, 7], 3],
    output: [5, 6, 7, 1, 2, 3, 4]
  },
  {
    input: [[1, 2, 3, 4], 3],
    output: [2, 3, 4, 1]
  },
  {
    input: [[1, 2, 3, 4], 7],
    output: [2, 3, 4, 1]
  },
  {
    input: [[*1..9980], 10_000],
    output: [*9961..9980, *1..9960]
  },
].freeze

RSpec.describe '#solution' do
  TEST_CASES.each do |tc|
    case tc
    in { input: [nums, k], output: output }
      it "#{nums}, #{k} => #{output}" do
        expect { rotate(nums, k) }.to change { nums }.from(nums).to(output)
      end
    end
  end
end
