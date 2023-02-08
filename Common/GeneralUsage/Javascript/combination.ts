function dfs(
  i: number,
  temp: number[],
  k: number,
  answer: number[][],
  elements: number[]
) {
  if (temp.length === k) {
    answer.push(temp.slice()); // 這邊要複製 value，因為參考同一個記憶體位置，不然等等被 pop 也會影響到。
    return;
  }

  if (i === elements.length) {
    return;
  }
  temp.push(elements[i]);
  dfs(i + 1, temp, k, answer, elements);
  temp.pop();
  dfs(i + 1, temp, k, answer, elements);
}

function c(n: number, k: number) {
  const elements: number[] = Array(n)
    .fill(0)
    .map((_, i) => i + 1);
  const answer: number[][] = [];
  const temp: number[] = [];
  dfs(0, temp, k, answer, elements);
  return answer;
}

console.log(c(5, 3));
