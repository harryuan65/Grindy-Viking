require_relative '../fib_recursive'
require_relative '../sequence_data'

RSpec.describe method(:fib) do
  ANS.each_with_index do |e, i|
    it "fib(#{i}) is #{e}" do
      expect(subject[i]).to eq(e)
    end
  end
end
