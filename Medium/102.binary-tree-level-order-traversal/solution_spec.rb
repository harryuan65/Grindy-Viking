FILE_NAME = "solution.rb"
require_relative FILE_NAME

TEST_CASES = [
  {
    input: [3,9,20,nil,nil,15,7],
    output: [[3],[9,20],[15,7]]
  },
  {
    input: [3,9,20,null,8,11,15,7],
    output: [[3],[9,20],[8,11,15],[7]]
  }
].freeze

RSpec.describe FILE_NAME do
  context TRAIN_OF_THOUGHT do
    TEST_CASES.each do |tc|
      case tc
      in { input: input, output: output}
        pending "TODO: assert solution output with expected"
        # it "#{input}  =>  #{output}" do
        #   expect(___).to eq(output)
        # end
      end
    end
  end
end
