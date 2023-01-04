# timestamp: 2023-01-04T09:19:02+08:00

# question: [Number of Islands](https:/leetcode.com/problems/number-of-islands)
# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  改成 DFS 就過了
  Run time 150 ms Beats 100%
  Memory 219.5 MB Beats 69.23%
  酷
DOC

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  count = 0
  # puts "======================"
  0.upto(grid.size-1) do |i|
    0.upto(grid[0].size-1) do |j|
      if grid[i][j] == "1"
        find_connected(grid, i, j)
        count += 1
      end
    end
  end
  count
end

def find_connected(grid, i, j)
  grid[i][j] = "2"
  if j < grid[i].size - 1 && grid[i][j+1]=="1"
    find_connected(grid, i, j+1)
  end
  # >
  if i < grid.size - 1 && grid[i+1][j]=="1"
    find_connected(grid, i+1, j)
  end
  # V
  if i < grid.size - 1 && grid[i+1][j]=="1"
    find_connected(grid, i+1, j)
  end
  # <
  if j > 0 && grid[i][j-1]=="1"
    find_connected(grid, i, j-1)
  end
  # ^
  if i > 0 && grid[i-1][j]=="1"
    find_connected(grid, i-1, j)
  end
end