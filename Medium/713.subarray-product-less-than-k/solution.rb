# timestamp: 2023-01-04T09:18:58+08:00
# question:

# train of thought
# [Subarray product less than k](https:/leetcode.com/problems/subarray-product-less-than-k)
TRAIN_OF_THOUGHT = <<DOC.freeze
  第一時間想到的解會 n^3，還是參考別人的了。
  做法是 sliding window 控制兩個 pointer，盡量外推讓乘到的算最多
  因為 [10,2,5,6] k=101 假設
            r
       l
  這樣可以過的話代表 [5] [2,5] [10,2,5] 都可以，也就是 right-left+1 個解，這樣就不需要每個都算過了。
DOC

# code goes here
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def num_subarray_product_less_than_k(nums, k)
  product = 1
  left = 0
  count=0
  0.upto(nums.size - 1) do |right|
    product*=nums[right]
    while product >=k && left <= right
      product /= nums[left]
      left+=1
    end
    count+=right-left+1
  end
  count
end