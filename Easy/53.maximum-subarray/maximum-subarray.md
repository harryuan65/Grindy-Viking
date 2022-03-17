#QuestionCategory??

# 思路

```ad-note
[題目](https://leetcode.com/problems/maximum-subarray/)
<iframe src="https://leetcode.com/problems/maximum-subarray/" width=600 height=400></iframe>
```

看了一下提示發現說 $O(n)$ 可以解決。

```plaintext
m is max 全域最大值
  
c is current_max
會一直往下一項累加，加完以後會比較 [單獨看該元素, 加完以後的目前總值，目前最大值].max。
為了避免設成 0 超過負值元素，所以直接拿第一項當作 m, c 的初始值。


m = -1
c = -1
	-1 1 2 1
       ^ loop starts from 1 to n-1

i=1
  m = -1
  c = -1
	-1 1 2 1
       因為現在的 c < 0 ，我乾脆直接單獨看該元素還有可能更大，所以 c 設成該元素 1
	   m = [m, c].max = 1

i=2
     m = 1
     c = 1
	-1 1 2 1
       因為現在的 c > 0 ，我往下面一項去加看看。c+=2 => 3
	   m = [m, c].max = 3

i=3
       m = 3
       c = 3
	-1 1 2 1
       因為現在的 c > 0 ，我往下面一項去加看看。c+=1 => 4
	   m = [m, c].max = 4

m = 4
c = 4
結束
```

```ruby
# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  max = current_max = nums.first
  nums[1..].each do |e|
    if current_max.negative?
      current_max = e
    else
      current_max += e
    end
    max = [e, max, current_max].max
  end

  max
end
```


![[CS/Coding/Easy/53.maximum-subarray/images/submission1.png]]


後來發現我不需要放 e 到 max 檢查的 array 裏面，因為我已經把 current_max 設成 e 了。
```ruby
# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  max = current_max = nums.first
  nums[1..].each do |e|
    if current_max.negative?
      current_max = e
    else
      current_max += e
    end
    max = [max, current_max].max
  end

  max
end
```

![[Pasted image 20220214230207.png]]





```plaintext
m is global max 
c is current_max

current local max，continues to add the next value 

max = [local，max].max
since values can be negative, we cannot set intial value on our own. Instead, we directly use the first element as the initial value of max and current_max.

And since we've already looked at the first element, our loop index starts from 1 to n-1.

initial state
m = -1
c = -1
	-1 1 2 1
       ^ loop starts from 1 to n-1

i=1
  m = -1
  c = -1
	-1 1 2 1
       c < 0
	   well, maybe the current element is bigger than c by itself! 
	   we then set c = element = 1
	   m = [m, c].max = 1

i=2
     m = 1
     c = 1
	-1 1 2 1
       c > 0, we can try add the next value onto it. c+=2 => 3
	   m = [m, c].max = 3

i=3
       m = 3
       c = 3
	-1 1 2 1
       c > 0, same as above.
	   m = [m, c].max = 4

m = 4
c = 4
Done
```


```plaintext
initial state
m = -2
c = -2
	-2 1 -3 4
       ^ loop starts from 1 to n-1

i=1
  m = -2
  c = -2
	-2 1 -3 4
       c < 0
	   well, maybe the current element is bigger than c by itself! 
	   we then set c = element = 1
	   m = [m, c].max = 1

i=2
      m = 1
      c = 1
	-2 1 -3 4
	   c > 0, we can try add the next value onto it. c += -3 => -2
	   m = [m, c].max = 1

i=3
       m  = 1
       c = -2
	-2 1 -3 4
       c < 0
	   well, maybe the current element is bigger than c by itself! 
	   we then set c = element = 4
	   m = [m, c].max = 4

m = 4
c = 4
Done
```


稍微看了下，其實這個好像叫做「kadane-algorithm」。
https://shubo.io/maximum-subarray-problem-kadane-algorithm/