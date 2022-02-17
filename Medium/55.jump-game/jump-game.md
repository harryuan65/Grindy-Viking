#QuestionCategory??

# 思路

```ad-note
[題目](https://leetcode.com/problems/jump-game/)
<iframe src="https://leetcode.com/problems/jump-game/" width=600 height=400></iframe>
```

```plaintext
reachable_i = -1
checks if 可以從這邊跳到終點
        可以跳多遠     >= last_index - current_index
          nums[i]    >=   (n-1)    -   i
```

```plaintext
	 2  3  0  0  4
i=3           0 >= 4 - 3 No => can't reach end;
			  and no one is reachable; => false
		
i=2        0 >= 4 - 2 No; => can't reach end;
		   and no one is reachable;    => false
		
i=1     3 >= 4 - 1 Yes => can reach; reachable_from[1] is true;
		this index is reachable; reachable_i=1
	 
i=0  2 >= 4 - 0 No => can't reach end;
	 someone is reachable, because reachable_i is 1
	 我可以走到 reachable index 嗎？
	 current_index + 可以跳多遠 >= reachable_i ?
	 0 + 2                    >= 1
	 true
```

```plaintext
3 2 1 4
	3-2-1==0 t, reachable_from[2]=true; reachable_i=2
  3-1-2==0 t, reachable_from[1]=true;, reachable_i=1
3-0-3==0 t, reachable_from[0]=true;, reachable_i=0
reachable_from[0]
```

```plaintext
reachable_i= -1
reachable_from = nums.map { false }

0 1 2 3 4 5 6
3 0 0 3 0 0 4
	      6-5-0=1 f
        6-4-0=2 f
	  6-
reachable_from[0]
```

```ruby
# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  return true if nums.size == 1

  reachable_i = -1
  reachable_from = nums.map { false }
  (nums.size - 2).downto(0) do |i|
    if (nums[i] >= nums.size - 1 - i) || (reachable_i.positive? && (i + nums[i]) >= reachable_i)
      reachable_i = i
      reachable_from[i] = true
    end
  end
  reachable_from[0]
end
```

乾，怎麼這麼慢？不是已經 O(n) ?

![[Coding/Medium/55.jump-game/images/submission.png]]



```rust
fn can_jump(nums: Vec<i32>) -> bool {
    if nums.len() == 1 {
        return true;
    }

    let mut reachable_i: i32 = -1;
    let mut reachable_from: Vec<bool> = vec![false; nums.len()];
    let mut i = (nums.len() - 2) as i32;
    while i >= 0 {
        print!("{}", i);
        if nums[i as usize] >= (nums.len() as i32) - i
            || (reachable_i > 0 || i + nums[i as usize] >= reachable_i)
        {
            reachable_from[i as usize] = true;
            reachable_i = i as i32;
        }
        i -= 1;
    }
    reachable_from[0]
}
```