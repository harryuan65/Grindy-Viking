##### tags: `TwoPointers`

# 思路

```ad-note
[題目](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)
<iframe src="https://leetcode.com/problems/remove-nth-node-from-end-of-list/" width=600 height=400></iframe>
```

```plaintext
[ 1,  2,  3,  4,  5,  6]
 head

因為一開始就在 1 了，所以我用 walk_steps 紀錄要走幾步

count = 6
 n  remove-target walk_steps  walk_to(因為要移除下一個)
 1        6           5          4
 2        5           4          3
 3        4           3          2
 4        3           2          1
 5        2           1          0
 6        1           0          -1
```

```ruby
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  node = head
  count = 1
  while (node = node.next) # 先算有幾個
    count+=1
  end

  if count == n # 如果 1~3 然後要倒數第3個就是直接拔掉第一個點
      head = head.next
      return head
  end

  node = head
  walk_to = count - n - 1
  1.upto(walk_to) do
      node = node.next
  end
  node.next = node.next.next
  head
end
```
