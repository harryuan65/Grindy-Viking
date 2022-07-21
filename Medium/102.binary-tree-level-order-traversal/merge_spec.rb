def merge_array(left, right)
  size = left.size > right.size ? left.size : right.size
  0.upto(size-1) do |i|
    break if !right[i]

    if left[i]
      left[i].concat(right[i])
    else
      left[i] = right[i]
    end
  end

  left
end

TEST_CASES = [
  {
    left: [[3,10], [8]],
    right: [[15, 7]],
    output: [[3,10,15,7], [8]]
  },
  {
    left: [[3,10], [8]],
    right: [[15, 7], [9], [21]],
    output: [[3,10,15,7], [8, 9], [21]]
  },
  {
    left: [[1]],
    right: [[2]],
    output: [[1,2]]
  },
  {
    left: [[1]],
    right: [],
    output: [[1]]
  },
  {
    left: [],
    right: [[2]],
    output: [[2]]
  },
]

RSpec.describe method(:merge_array) do
  TEST_CASES.each do |tc|
    it "#{tc[:left]} + #{tc[:right]} => #{tc[:output]}" do
      expect(subject[tc[:left], tc[:right]]). to eq(tc[:output])
    end
  end
end