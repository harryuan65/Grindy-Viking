require_relative "quicksort_detailed"

test_cases = [
  [6, 2, 1, 4, 8, 7, 3, 5],
  [7, 6, 3, 5, 10, 1, 4, 2, 8, 9],
  [3, 4, 2, 5, 6, 7, 1, 8],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 8],
  [8, 7, 6, 5, 4, 3, 2, 1],
]

RSpec.describe method(:quicksort) do
  test_cases.each do |tc|
    it "sorts correctly" do
      expect(quicksort[tc, 0, tc.size-1]).to eq(tc.dup.sort)
    end
  end
end