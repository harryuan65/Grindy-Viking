// 改成 DFS 就行了，也試試看 Typescript
function numIslands(grid: string[][]): number {
  let count = 0;
  for(let i = 0; i < grid.length; i++) {
    for (let j = 0; j < grid[0].length; j++){
      if (grid[i][j] === '1') {
        findConnected(grid, i, j);
        count += 1
      }
    }
  }
  return count;
};

function findConnected(grid: string[][], i: number, j: number): void{
  grid[i][j] = '2';
  if (j < grid[0].length - 1 && grid[i][j+1] === '1') {
    findConnected(grid, i,j+1);
  }
  if (i < grid.length - 1 && grid[i+1][j] === '1') {
    findConnected(grid, i+1,j);
  }
  if (j > 0 && grid[i][j-1] === '1') {
    findConnected(grid, i,j-1)
  }
  if (i > 0 && grid[i-1][j] === '1') {
    findConnected(grid, i-1,j)
  }
}