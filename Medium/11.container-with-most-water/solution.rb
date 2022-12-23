# timestamp: 2022-12-22T17:52:30+08:00
# question: https:/leetcode.com/problems/container-with-most-water

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  直覺是每一個邊去跟其他邊配對看最大面積，很像 n^2 的 Two Sum 的感覺
  （TestCase 有過，但正式 Time-limit Exceeded）
DOC

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  max = 0
  last = height.size - 1
  0.upto(last) do |i|
    (i+1).upto(last) do |j|
      min_edge = height[i] < height[j] ? height[i] : height[j]
      area = (j-i) * min_edge
      max = area if area > max
    end
  end
  max
end