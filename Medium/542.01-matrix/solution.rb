def update_matrix(mat)
  queue = []

  0.upto(mat.size - 1) do |i|
    0.upto(mat[i].size - 1) do |j|
      if mat[i][j].zero?
        queue << [i, j]
      else
        mat[i][j] = '#'
      end
    end
  end

  directions = [[0, -1], [-1, 0], [0, 1], [1, 0]]
  queue.each do |src_i, src_j|
    directions.each do |dir_i, dir_j|
      check_i = src_i + dir_i
      check_j = src_j + dir_j

      next unless valid?(check_i, check_j, mat) && mat[check_i][check_j] == '#'

      mat[check_i][check_j] = mat[src_i][src_j] + 1
      queue << [check_i, check_j]
    end
  end
  mat
end

def valid?(i, j, mat)
  i < mat.size && i >= 0 && j < mat[i].size && j >= 0
end

pp update_matrix([
                   [0, 0, 0],
                   [0, 1, 0],
                   [1, 1, 1]
                 ])

pp update_matrix([
                   [1, 1, 1],
                   [1, 1, 0],
                   [1, 1, 1]
                 ])
