def rotten_orange(mat)
  update_matrix(mat)
end

def update_matrix(mat)
  queue = []

  0.upto(mat.size - 1) do |i|
    0.upto(mat[i].size - 1) do |j|
      case mat[i][j]
      when 2
        queue << [i, j]
      when 1
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

pp rotten_orange([
                   [2, 1, 1],
                   [0, 1, 0],
                   [1, 1, 1]
                 ])
