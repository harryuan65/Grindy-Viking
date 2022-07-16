require_relative "../../Common/Ruby/DS/list_node/from_array"

TEST_CASES = [
  {
    input: [1, 2, 3, 4, 5].to_linked_list,
    output: [5, 4, 3, 2, 1].to_linked_list
  },
  {
    input: [1].to_linked_list,
    output: [1].to_linked_list
  },
  {
    input: nil,
    output: nil
  }
]
