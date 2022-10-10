import {quickSort} from "./quicksort"

const TESTCASES = [
  [6, 2, 1, 4, 8, 7, 3, 5],
  [7, 6, 3, 5, 10, 1, 4, 2, 8, 9],
  [3, 4, 2, 5, 6, 7, 1, 8],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 8],
  [8, 7, 6, 5, 4, 3, 2, 1],
]

TESTCASES.forEach(tc => {
  test('sorts correctly', () => {
    const testcase = tc
    const result = quickSort(testcase, 0, testcase.length - 1);
    const expected = testcase.slice().sort((a, b) => a - b);
    expect(result).toEqual(expected)
  })
})