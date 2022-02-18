#QuestionCategory??

# 思路

```ad-note
#### DO?
in-place 反轉 char array
#### Input
- s: Char[]
#### Output
reversed s
```

做過 [[189-RotateArray]] 就知道反轉 array，是用兩個 pointer L, R 從 `0` 跟 `n - 1` 開始 swap 直到相遇。
這個更簡單反轉完就結束。

```ruby
# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s)
    l = 0
    r = s.length - 1
    while l < r
        s[l], s[r] = s[r], s[l]
        l+=1
        r-=1
    end
end
```

![[Coding/Easy/344.Reverse_String/images/submission ruby.png]]

```cpp
class Solution {
   public:
    void solution(vector<char>& s) {
        int ei = s.size() - 1;
        int si = 0;

        while (si < ei) {
            char tmp = s[si];
            s[si] = s[ei];
            s[ei] = tmp;
            si++;
            ei--;
        }
    }
};
```

![[cpp.png]]

```rust
impl Solution {
    pub fn reverse_string(s: &mut Vec<char>) {
        let mut e_i: usize = s.len() - 1;
        let mut s_i = 0usize;
        while s_i < e_i {
            let tmp: char = s[s_i];
            s[s_i] = s[e_i];
            s[e_i] = tmp;
            s_i+=1;
            e_i-=1;
        }
    }
}
```

![[rust.png]]
