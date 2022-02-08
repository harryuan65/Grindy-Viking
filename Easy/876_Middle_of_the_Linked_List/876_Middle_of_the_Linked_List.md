#TwoPointers 

# 思路

```ad-note
#### DO?

回傳 LinkedList 正中間的 node，若有兩個就回傳右邊的。

#### Input
- head: ListNode

#### Output

中間的 node
```

比較土炮一點，直接走到底看有幾個，再重走一半。
`我沒用到 TwoPointers，沒想法。`

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
# @return {ListNode}
def middle_node(head)
    return head if head.next.nil?

    node = head
    s = 1
    s+=1 while node = node.next

    mid = (s/2).ceil
    node = head
    0.upto(mid-1) do
      node = node.next
    end
    node
end
```

有點慢，有空來看其他人怎做的。

![[Coding/Easy/876_Middle_of_the_Linked_List/images/submission.png]]


## 思路 2
看了一下[這個](https://leetcode.com/problems/middle-of-the-linked-list/discuss/348749/Simple-Ruby-solution)
```ruby
def middle_node(head)
    slow = fast = head
    while(fast != nil && fast.next != nil)
        slow = slow.next
        fast = fast.next.next
    end
    slow
end
```

![[黑人問號.png]]
<iframe src="https://iq.opengenus.org/fast-and-slow-pointer-technique/" width=800 height=600/>
## Floyd’s Cycle Detection Algorithm
又稱為 `tortoise and hare algorithm`。

使用 slow, fast 兩個 pointer 來決定「有向」資料結構的一些特性，例如：
- 檢查 graph、linked list 中是否含有循環
- 找到 linked list 正中間的點（更有效率）

## 問題1: Middle of the linked list
也剛好是本題。我上面的解法就是 brute force，因為我先 run N 一遍去找總共多少個 node ，再從頭走 N/2 去找中間點。

```plaintext
(1) -> (2) -> (3) -> (4) -> (5) -> (6) -> (7)
SF
(1) -> (2) -> (3) -> (4) -> (5) -> (6) -> (7)
        S      F
(1) -> (2) -> (3) -> (4) -> (5) -> (6) -> (7)
               S             F
(1) -> (2) -> (3) -> (4) -> (5) -> (6) -> (7)
                      S                    F reached end

S is at the middle point
```

## 問題2:   Detect Cycle in Linked List

```plaintext
SF
(1) -> (2) -> (3) -> (4) -> (5) -> (6)
               ↑____________________⌟
        S      F
(1) -> (2) -> (3) -> (4) -> (5) -> (6)
               ↑____________________⌟
               S             F
(1) -> (2) -> (3) -> (4) -> (5) -> (6)
               ↑____________________⌟
               F      S             
(1) -> (2) -> (3) -> (4) -> (5) -> (6)
               ↑____________________⌟
                            SF
(1) -> (2) -> (3) -> (4) -> (5) -> (6)
               ↑____________________⌟
```