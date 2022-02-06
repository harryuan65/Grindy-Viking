#TwoPointers

# 思路

```ad-note
#### Input

- nums: Integer，已經由小到大排序

#### Output

array of the squared numbers, **sorted**
```

```ad-example
**Input:** nums = [-4,-1,0,3,10]
**Output:** [0,1,9,16,100]
**Explanation:** After squaring, the array becomes [16,1,0,9,100].
After sorting, it becomes [0,1,9,16,100].
```

太趕著送，那時候直接 `map{|e| e.pow(2)}.sort`XD

```ad-warning
Follow up: Squaring each element and sorting the new array is very trivial, could you find an **O(n)** solution using a different approach?
```
