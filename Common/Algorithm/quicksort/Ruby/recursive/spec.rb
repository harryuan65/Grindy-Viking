require_relative "quicksort"

test_cases = [
  [6, 2, 1, 4, 8, 7, 3, 5],
  [7, 6, 3, 5, 10, 1, 4, 2, 8, 9],
  [3, 10, 9, 4, 2, 5, 6, 7, 1, 8],
  [12, 23, 5, 22, 27, 15, 17, 19, 4, 20, 30, 26, 16, 13, 11, 24, 1, 6, 9, 18, 7, 21, 25, 28, 10, 14, 3, 29, 8, 2],
  [13, 22, 21, 9, 17, 2, 3, 23, 2, 1, 2, 14, 27, 25, 8, 24, 11, 20, 14, 25, 11, 17, 11, 12, 3, 25, 8, 13, 19, 13],
  (1..1000).map{ (rand* 1000).to_i },
  (1..10000).map{ (rand* 20000).to_i },
  (1..100000).map{ (rand* 100000).to_i }
]

RSpec.describe method(:quicksort) do
  test_cases.each do |tc|
    it "sorts correctly" do
      expect(subject[tc, 0, tc.size-1]).to eq(tc.dup.sort)
    end
  end
end