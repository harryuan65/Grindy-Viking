# 那人家怎麼寫？
# 看到[這個](https://leetcode.com/problems/find-all-anagrams-in-a-string/solutions/1738052/a-very-deep-explanation-solved-without-using-hashtable/)
# 提到因為都是英文，可以直接用 Array(26) 就好。
# 我一看到就想馬上試試。

def find_anagrams(s, p)
  return [] if p.size > s.size

  ans = []

  p_counts = Array.new(26, 0)
  p.chars.each { |c| p_counts[c.ord-97]+=1 }

  s_counts = Array.new(26, 0)
  (0..p.size-1).each { |i|  s_counts[s[i].ord-97]+=1  } # 發現這邊也會跑 0..p.size

  ans << 0 if s_counts == p_counts #  先檢查 0 的時候，因為後面要開始移除前一個、新增後一個

  1.upto(s.size - p.size) do |i|
    prev_char = s[i-1]
    s_counts[prev_char.ord-97] -= 1

    new_char = s[i+p.size-1]
    s_counts[new_char.ord-97]+=1

    ans << i if s_counts == p_counts
  end

  ans
end


# 整理一下
def find_anagrams(s, p)
  return [] if p.size > s.size

  ans = []

  p_counts = Array.new(26, 0)
  s_counts = Array.new(26, 0)

  (0..p.size-1).each do |i|
    p_counts[p[i].ord-97]+=1
    s_counts[s[i].ord-97]+=1
  end

  ans << 0 if s_counts == p_counts # 先檢查 0 的時候，因為後面要開始移除前一個、新增後一個

  1.upto(s.size - p.size) do |i|
    s_counts[s[i-1].ord-97] -= 1
    s_counts[s[i+p.size-1].ord-97]+=1

    ans << i if s_counts == p_counts
  end

  ans
end