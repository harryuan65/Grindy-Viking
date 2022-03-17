#QuestionCategory??

# 思路

```ad-note
#### DO?
#### Input
- a: Integer
#### Output
target 插入的 index
```

兩個主要的 pointer A, B，找要反轉的子段。
找到以後反轉。反轉完往下兩格。

```plaintext
abc def ghi
A
B


abc def ghi
A B

abc def ghi
A B

cba def ghi
    B
	A

cba def ghi
    A B

...直到 B > n-1
```

```ruby
# @param {String} s
# @return {String}
def reverse_words(s)
  p1 = 0
  p2 = 0
  while p1 <= s.size - 1 && p2 <= s.size - 1
    p2 += 1 while p2 + 1 < s.size && s[p2 + 1] != ' '
    pp1 = p1
    pp2 = p2
    while pp1 < pp2
      s[pp1], s[pp2] = s[pp2], s[pp1]
      pp1 += 1
      pp2 -= 1
    end
    p2 += 2
    p1 = p2
  end
  s
end
```

![[CS/Coding/Easy/557.Reverse_Words_in_a_String_III/images/submission.png]]

Attemp2
想說之前都被騙說要 two pointer，這次也看看邊 iterate，找到再去反轉。

```ruby
# @param {String} s
# @return {String}
def reverse_words(s)
  p = 0
  0.upto(s.size - 1) do |i|
      if s[i] == " "
          j = i-1
          while p < j
              s[p], s[j] = s[j], s[p]
              p+=1
              j-=1
          end
          p = i + 1
      elsif i == s.size - 1
          j = i
          while p < j
              s[p], s[j] = s[j], s[p]
              p+=1
              j-=1
          end
          p = i + 1
      end
  end
  s
end
```
![[submission2.png]]

換一個方法，也換成 Rust 試試看：
```plaintext
lets go
      ^ 從這邊開始，如果不是空白就開始 push 進去某個地方
      ^[o]
     ^ [og]
    ^  空白，換下一個 vector (word_index+=1)
   ^   [s] 
  ^    [st]
 ^     [ste]
^      [stel]

最後會得到
[["o", "g"], ["s", "t", "e", "l"]]
要反過來 iterate 並且 join 起來。
res = "".to_owned()
["s", "t", "e", "l"] => "stel", res.push_str("stel"), 不是最後 res.push_str(" ")
["o", "g"] => "og", res.push_str("og")
```

```rust
fn reverse_words(s: String) -> String {
    let sv: Vec<char> = s.chars().collect();
    let mut words: Vec<Vec<char>> = vec![];
    let mut word_index = 0usize;
    for i in (0..sv.len()).rev() {
        if sv[i] != ' ' {
            if words.len() <= word_index {
                words.push(vec![sv[i]]);
            } else {
                words[word_index].push(sv[i]);
            }
        } else if sv[i] == ' ' {
            word_index += 1;
        }
    }
    let mut res = "".to_string().to_owned();
    for index in (0..=word_index).rev() {
        let word = words[index].iter().collect::<String>();
        res.push_str(&word);
        if index > 0 {
            res.push_str(" ");
        }
    }
    res
}
```

![[557_Reverse_Words_in_a_String_III Rust.png]]

```rust
 let words: Vec<&str> = s.split(" ").collect();
    let mut fin = String::new();
    for (i, word) in words.iter().enumerate() {
        fin.push_str(&word.chars().rev().collect::<String>());
        if i < words.len() - 1 {
            fin.push_str(" ");
        }
    }
    fin
```

![[557_Reverse_Words_in_a_String_III Rust2.png]]