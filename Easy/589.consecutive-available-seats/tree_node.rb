# Definition for a Node.
class Node
  attr_accessor :val, :children

  def initialize(val)
    @val = val
    @children = []
  end
end
