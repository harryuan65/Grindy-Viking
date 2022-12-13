import frequencySort from "./solution";

const TESTCASES = [
  {
    input: "tttree",
    output: "ttteer"
  },
  {
    input: "dddcccca",
    output: "ccccddda"
  },
  {
    input: "afffgggg",
    output: "ggggfffa"
  }
]

TESTCASES.forEach(tc => {
  it("sorts correctly", () => {
    let { input, output } = tc;
    expect(frequencySort(input)).toEqual(output)
  })
})