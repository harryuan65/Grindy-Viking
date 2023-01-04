// 懷疑是 Ruby 跑太慢的問題，結果不是 XD。
function numIslands(grid: string[][]): number {
  let count = 0;
  for(let i = 0; i < grid.length - 1; i++) {
    for (let j = 0; j < grid[0].length - 1; j++){
      if (grid[i][j] === '1') {
        count += findAllConnected(grid, i, j);
      }
    }
  }
  return count;
};

function findAllConnected(grid: string[][], startI: number, startJ: number) : 1 {
  let queue: number[][] = [[startI,startJ]];
  while(queue.length > 0) {
    let [i, j] = queue.shift()!;
    grid[i][j] = '2';
    if (j < grid[0].length - 1 && grid[i][j+1] === '1') {
      queue.push([i,j+1])
    }
    if (i < grid.length - 1 && grid[i+1][j] === '1') {
      queue.push([i+1,j])
    }
    if (j > 0 && grid[i][j-1] === '1') {
      queue.push([i,j-1])
    }
    if (i > 0 && grid[i-1][j] === '1') {
      queue.push([i-1,j])
    }
  }
  return 1;
}