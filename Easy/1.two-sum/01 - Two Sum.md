# Two Sum

## Question

```ad-note
### Input

- nums: Array[Integer]
- target: Integer

找到 nums 裡面相加起來是 target 的兩個數字。

### Output

兩數字的 index
```

---

# 思路 1

```text
nums = [2,3,7,11,15]
target = 9
```

最直接暴力笨一點的方法就是從第一個數字開始看

- 2 + 3
- 2 + 7
- 2 + 11
- 2 + 15

第二個數字 3 時，發現說就不用回去算 3 + 2 ，所以往後算就好了。

![[Two Sum.svg]]

```ruby
def two_sum(nums, target)
    0.upto(nums.size - 1) do |i|
        (i + 1).upto(nums.size - 1) do |j|
            if nums[i] + nums[j] == target
                return [i, j]
            end
        end
    end
end
```

## Complexity

space: none
time:
$(n-1) + (n-2) + ... + 1= \dfrac{(1 + (n - 1)) * (n - 1)}{2} = \dfrac{n^{2} - n}{2}\equiv O(n^{2})$

去年過了，但今年他們換 test case 就 gg 了。

我 TM 改成 Rust 就過了

```rust
impl Solution {
    pub fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
        for i in 0..nums.len() {
            for j in (i+1)..nums.len(){
                if nums[i] + nums[j] == target {
                    let ans: Vec<i32> = vec![i as i32, j as i32];
                    return ans;
                }
            }
        }
        return vec![0,0];
    }
}
```

因為一定有一個解，外面去不了但是 rust 堅持要解釋清楚，那時候不確定怎麼做就亂回傳一個東西 XD。看人家是這樣寫：

```rust
fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
    for i in 0..nums.len() {
        for j in i + 1..nums.len() {
            if nums[i] + nums[j] == target {
                return vec![i as i32, j as i32];
            }
        }
    }

    unreachable!()
}
```

# 思路 2

題目有提到說「是否能用少於 $O(n^2)$ 時間完成？」
想不太到就有去看人家的解法，使用 Hash 紀錄已經算過的值。大致如下：

1. 減掉 `nums[i]` 取得剩餘值
2. 去 hash 檢查，有沒有 `h[剩餘值]`？
   1. 有 -> `hash[剩餘值]` 就是剩餘值 index，代表這個值之前看過，所以這個 index 跟現在的 i 就是答案。
   2. 沒有 -> 把 `nums[i]` 放到 hash 裏面，值為 `i`

![[Two Sum Hash.svg]]
```ruby
def two_sum(nums, target)
    look_up = {}
    0.upto(nums.size - 1) do |i|
        rest = target - nums[i]
        if (prev_index = look_up[rest])
            return [i, prev_index]
        else
            look_up[nums[i]] = i
        end
    end
end
```


順便學習了一下 Rust 的 HashMap 怎麼用 XD。
```rust
use std::collections::HashMap;

impl Solution {
    pub fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
        let mut look_up = HashMap::new();
        for i in 0..nums.len() {
            let rest = target - nums[i];
            match look_up.get(&rest) {
                Some(prev_index) => { return vec![*prev_index, i] },
                _=>{
                    look_up.insert(nums[i], i as i32);
                }
            }
        }
        unreachable!();
    }
}
```
