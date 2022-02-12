# frozen_string_literal: true

# Finding duplicate element in an array.
# @param [Integer[]] nums
# @return [Integer|NilClass] returns the duplicate element, or nil if none
def find_dup(nums)
  counts = Hash.new(0)
  nums.each do |num|
    return num if counts[num].positive?

    counts[num] += 1
  end
  nil
end

puts find_dup([1, 2, 3, 2, 4, 5])
puts find_dup([1, 2, 3, 4, 5])

__END__

RSpec.describe method(:find_dup) do
  it 'returns duplicate num if exists' do
    expect(subject[[1, 2, 3, 2, 4, 5]]).to eq(2)
    expect(subject[[1, 2, 3, 3, 4, 5]]).to eq(3)
    expect(subject[[*1..1000, 1]]).to eq(1)
  end

  it 'returns nil if no dups' do
    expect(subject[[*1..3000]]).to be_nil
    expect(subject[10_000.times.to_a]).to be_nil
    expect(subject[[1, 2, 3, 4, 5, 6, 7]]).to be_nil
  end
end
