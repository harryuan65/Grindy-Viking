FILE_NAME = "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: "abccccdd",
    output: 7 # dccaccd
  },
  {
    input: "a",
    output: 1
  },
  {
    input: "abcccasdqerevxcvxcvcdd",
    output: 17
  },
  {
    input: "ccc",
    output: 3
  },
  {
    input: "cc",
    output: 2
  },
  {
    input: "ababababa",
    output: 9
  },
  {
    input: "gllpgkqpvgqkwmqrpkmkgqmlkkxxgxqwppmvggqpgrwvvqmlrpkp",
    output: 47
  },
  {
    input: "ffaalrbraxarfifybbxarvbaaffixvavvwarlwfayavfafibayyfffabyvavbaabflalffafvbllwaaalxlxbvrfaafviiyfilaxlrirrava",
    output: 103
  }
].freeze

RSpec.describe FILE_NAME do
  context TRAIN_OF_THOUGHT do
    TEST_CASES.each do |tc|
      case tc
      in { input: input, output: output}
        it "#{input}  =>  #{output}" do
          expect(longest_palindrome(input)).to eq(output)
        end
      end
    end
  end
end
