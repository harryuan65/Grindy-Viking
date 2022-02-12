def print_grid(grid)
  puts '================'
  grid.each do |arr|
    arr.each do |arr2|
      print arr2
    end
    puts
  end
  puts '================'
end

# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(grid)
  max = 0
  visited = grid.size.times.map do
    grid[0].size.times.map { false }
  end
  grid.each_with_index do |row, r|
    row.each_with_index do |column, c|
      next unless column == 1 && !visited[r][c]

      area = area_of_island(visited, grid, r, c)
      max = area if area > max
    end
  end
  max
end

def area_of_island(visited, grid, r, c)
  visited[r][c] = true
  left = if c.positive? && visited[r][c - 1] == false && grid[r][c - 1] == 1
           area_of_island(visited, grid, r,
                          c - 1)
         else
           0
         end
  top = if r.positive? && visited[r - 1][c] == false && grid[r - 1][c] == 1
          area_of_island(visited, grid, r - 1, c)
        else
          0
        end
  right = if c < grid[0].length - 1 && visited[r][c + 1] == false && grid[r][c + 1] == 1
            area_of_island(visited, grid, r,
                           c + 1)
          else
            0
          end
  down = if r < grid.length - 1 && visited[r + 1][c] == false && grid[r + 1][c] == 1
           area_of_island(visited, grid,
                          r + 1, c)
         else
           0
         end
  1 + left + top + right + down
end

grid = [[0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
        [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
        [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]]

puts max_area_of_island(grid)
