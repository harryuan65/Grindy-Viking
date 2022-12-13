FILE_NAME = ENV["TESTEE"] || "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  begin
    input1 = %w[
      a aa ab ac ax bx cx de fg abc abd afe abcd abcde afcdg abfcde
    ]
    expected = [true, true, true, true, true, false, false, true, false, true, true, true, true, true, false, true]

    {
      input1: input1,
      input2: "axbefacdfe",
      output: input1.zip(expected).to_h
    }
  end
].freeze

RSpec.describe method(:batch_is_subsequence) do
  TEST_CASES.each_with_index do |tc, i|
    input1, input2, output = tc.values_at(:input1, :input2, :output)

    describe "test case ##{i}" do
      let(:return_values) { subject[input1, input2] }
      let(:call_count) { return_values[0] }
      let(:result) { return_values[1] }

      it "tests subsequence correctly" do
        input1.each_with_index do |test_substring, j|
          tested = result[test_substring]
          expected = output[test_substring]
          expect(tested).to eq(expected), "expected \"#{test_substring}\" to #{expected ? "be" : "not be"} a subsequence of \"#{input2}\""
        end
      end

      it "does not call is_subsequence more than input1.size" do
        puts "\tactual call_count=#{call_count}, input1.size=#{input1.size}"
        expect(call_count).to be < input1.size, "expected call_count(#{call_count}) to be less than #{input1.size}"
      end
    end
  end
end
