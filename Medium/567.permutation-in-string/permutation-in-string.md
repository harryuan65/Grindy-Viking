###### tags: `String`, `TwoPointers`, `HashTable`, `SlidingWindow`

# 思路

```ad-note
[題目](https://leetcode.com/problems/permutation-in-string/)
<iframe src="https://leetcode.com/problems/permutation-in-string/" width=600 height=400></iframe>
```

我知道只要每次 slide 1 格，window size 固定式 s1.size。但要怎麼紀錄相同？
想半天好像很接近但又想不到，先參考別人的就知道只要用 Hash 紀次數就好。

```ruby
# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
    map1 = Hash.new(0)
    map2 = Hash.new(0)
    k = s1.size
    s1.chars.each {|ch| map1[ch] += 1}
    #make sliding window
    (0...k).each {|i| map2[s2[i]] += 1 }
    return true if map1 == map2

    #update window
    (k...s2.size).each do |i|
        map2[s2[i]] += 1
        map2[s2[i-k]] -= 1
        map2.delete(s2[i-k]) if map2[s2[i-k]] == 0
        return true if map1 == map2
    end
    false
end
```
