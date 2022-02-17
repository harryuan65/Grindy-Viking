#QuestionCategory??

# 思路

```ad-note
[題目](https://leetcode.com/problems/length-of-last-word/)
<iframe src="https://leetcode.com/problems/length-of-last-word/" width=600 height=400></iframe>
```
我不想要 split 完 、`[-1]`、 trim、size，覺得很內建 XD。想採用 pointer 的方式去抓整個字串的頭尾 index 相減。

我先初始化一個 pointer 叫做 e_i `ending_index`，把他設成 -1，作為「未設定」的意思。

然後從最後一個字開始 loop 回來，如果 `s[i]`是非空白 && e_i 尚未設定（-1），代表找到字尾了。那就將 e_i 設定成 i。



```ruby
# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  return 1 unless s.size > 1

  e_i = -1
  (s.size - 1).downto(0) do |i|
    if s[i] != ' ' && e_i.negative?
      e_i = i
    elsif s[i] == ' ' && e_i.positive?
      return e_i - i
    elsif i.zero? && e_i.positive?
      return e_i - i + 1
    end
  end
end
```


