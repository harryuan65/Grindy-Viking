# @param {Integer[]} nums
# @return {Integer[]}
def sorted_squares(nums)
  nums.map { |e| e.pow(2) }.sort
end

__END__

Success
Details
Runtime: 214 ms, faster than 36.73% of Ruby online submissions for Squares of a Sorted Array.
Memory Usage: 214 MB, less than 8.33% of Ruby online submissions for Squares of a Sorted Array.