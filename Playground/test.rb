require "forwardable"

class Board
  extend Forwardable
  def initialize(m, n)
    @board = 0.upto(m-1).map do |i|
      0.upto(n-1).map do |j|
        i * m + j
      end
    end
  end
  def [](x, y)
    @board[x][y]
  end
end
binding.irb