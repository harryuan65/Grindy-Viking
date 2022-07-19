##### tags: `SlidingWindow`,`HashTable`, `String`

# 思路

```plaintext
p=-1  
max=0

a b c a b c a b b c
0  -> (p < 0) -> (set p = 0 and max = 1)

a b c a b c a b b c
p 1    
no dups and (i - p + 1) = 2 > max, set max to that

a b c a b c a b b c
p   2 
not dups and longer, set max to i - p + 1

a b c a b c a b b c
p     3 
dup! because s[p...i][s[p]]. move p forward until no matches.
  p   

a b c a b c a b b c
  p     4 
dup! because s[p...i][s[p]]. move p forward until no matches.
    p   

a b c a b c a b b c
    p     5 
dup! because s[p...i][s[p]]. move p forward until no matches.
      p

a b c a b c a b b c
      p     6 
dup! because s[p...i][s[p]]. move p forward until no matches.
        p

a b c a b c a b b c
        p     7
dup! because s[p...i][s[p]]. move p forward until no matches.
          p

a b c a b c a b b c
          p     8 
dup! because s[p...i][s[p]]. move p forward until no matches.
                p

a b c a b c a b b c
                p 9
no dup and Not longer, do nothing

return max which is 2 - 1 + 1 = 3
```

```ruby
# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    max = 0
    p = -1
    
    0.upto(s.size - 1) do |i|
        if p.negative?
            p = i
            max = 1
        elsif s[p...i][s[i]]
            p+=1 while s[p...i][s[i]]
        else
            if max < i - p + 1
                max = i -p + 1
            end
        end
    end 
    max
end
```