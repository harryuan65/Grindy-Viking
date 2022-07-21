# timestamp: 2022-07-21T16:56:00+08:00
# question: https:/leetcode.com/problems/binary-search

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  中間、頭跟尾各存一個 pointer，無限檢查中間是不是，比小->尾設為中間-1，比大->頭設為中間+1。如果不是我要的但頭尾碰到就-1。
DOC

# code goes here
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  front = 0
  back = nums.size - 1

  loop do
    mid = (front + back)/2

    if nums[mid] == target
      return mid
    else
      if front >= back
        break
      elsif target > nums[mid]
        front = mid+1
      else
        back = mid-1
      end
    end
  end

  return -1
end