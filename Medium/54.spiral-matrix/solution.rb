# 1 0
# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  i = j = 0
  c = 0
  n = matrix.size
  m = matrix[0].size
  visited = n.times.map { m.times.map { false } }
  r = []
  while c < n * m
    while !visited[i][j] && j < m - 1
      puts "right #{matrix[i][j]}"
      visited[i][j] = true
      r.push(matrix[i][j])
      c += 1
      j += 1
    end
    while !visited[i][j] && i < n - 1
      puts "down #{matrix[i][j]}"
      visited[i][j] = true
      r.push(matrix[i][j])
      c += 1
      i += 1
    end
    while !visited[i][j] && j.positive?
      puts "left #{matrix[i][j]}"
      visited[i][j] = true
      r.push(matrix[i][j])
      c += 1
      j -= 1
    end
    while !visited[i][j] && i.positive?
      puts "up #{matrix[i][j]}"
      visited[i][j] = true
      r.push(matrix[i][j])
      c += 1
      i -= 1
    end
  end
  r
end
