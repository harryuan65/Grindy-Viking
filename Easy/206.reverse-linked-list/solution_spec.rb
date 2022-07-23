require_relative "./solution4_best"
require_relative "./test_cases"

RSpec.describe "#solution" do
  TEST_CASES.each do |tc|
    case tc
    in { input: input, output: output}
      it "#{input.nil? ? "nil" : input.val}  =>  #{output.nil? ? "nil" : output.val}" do
        # It doesn't require to be the same node
        # expect(reverse_list(input)).to eq(output)

        result = reverse_list(input)
        if result
          expect(result.val).to eq(output.val)
        else
          expect(result).to eq(output)
        end
      end
    end
  end
end
