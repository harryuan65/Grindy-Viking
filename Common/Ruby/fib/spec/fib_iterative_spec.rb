require_relative '../fib_iterative'
require_relative '../sequence_data'

RSpec.describe method(:fib2) do
  ANS.each_with_index do |e, i|
    it "fib2(#{i}) is #{e}" do
      expect(subject[i]).to eq(e)
    end
  end
end
