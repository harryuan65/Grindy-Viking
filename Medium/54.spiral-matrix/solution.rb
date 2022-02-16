# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  n = matrix.size
  m = matrix[0].size
  return matrix[0][0] if n == m && m == 1

  visited = n.times.map { m.times.map { false } }

  i = j = 0
  visited[0][0] = true
  c = 1
  r = [matrix[0][0]]
  while c < n * m
    while j < m - 1 && !visited[i][j + 1]
      visited[i][j + 1] = true; r.push(matrix[i][j + 1]); j += 1; c += 1;
    end
    while i < n - 1 && !visited[i + 1][j]
      visited[i + 1][j] = true; r.push(matrix[i + 1][j]); i += 1; c += 1;
    end
    while j.positive? && !visited[i][j - 1]
      visited[i][j - 1] = true; r.push(matrix[i][j - 1]); j -= 1; c += 1;
    end
    while i.positive? && !visited[i - 1][j]
      visited[i - 1][j] = true; r.push(matrix[i - 1][j]); i -= 1; c += 1;
    end
  end
  r
end
