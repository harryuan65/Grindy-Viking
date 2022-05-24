#QuestionCategory??

# 思路

[題目](https://leetcode.com/problems/palindrome-number/)
<iframe src="https://leetcode.com/problems/palindrome-number/" width=600 height=400></iframe>

想試試看 integer 的解法:

`x=12321`

為了取得第一位，我必須知道這個數字是位於 10 的多少次方，以此例就是 10^4。
所以我必須做一次 while /=10 >0 取得這個 most_sig = 4。

第一位的 1 就是由 (x / most_sig).floor 取得。
最後一位就是由 x % 10 取得。
