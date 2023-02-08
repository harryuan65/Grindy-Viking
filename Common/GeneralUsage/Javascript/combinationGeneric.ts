function dfsGeneric<T>(
  i: number,
  temp: T[],
  k: number,
  answer: T[][],
  elements: T[]
) {
  if (temp.length === k) {
    answer.push(temp.slice()); // 這邊要複製 value，因為參考同一個記憶體位置，不然等等被 pop 也會影響到。
    return;
  }

  if (i === elements.length) {
    return;
  }
  temp.push(elements[i]);
  dfsGeneric(i + 1, temp, k, answer, elements);
  temp.pop();
  dfsGeneric(i + 1, temp, k, answer, elements);
}

function cGeneric<T>(elements: T[], k: number) {
  const answer: T[][] = [];
  const temp: T[] = [];
  dfsGeneric<T>(0, temp, k, answer, elements);
  return answer;
}

// let numbers = Array(5)
//   .fill(0)
//   .map((_, i) => i + 1);
// console.log(c(numbers, 3));

let characters = ['a', 'b', 'c', 'd', 'e', 'f'];
let result = cGeneric(characters, 3);
console.log(result);
console.log(result.length);
