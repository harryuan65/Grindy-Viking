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

![[Coding/Easy/557_Reverse_Words_in_a_String_III/images/submission.png]]

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