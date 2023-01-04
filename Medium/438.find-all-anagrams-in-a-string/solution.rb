# timestamp: 2023-01-04T09:18:53+08:00
# question:

# [Find all anagrams in a string](https:/leetcode.com/problems/find-all-anagrams-in-a-string)

# code goes here
# V1
# NOTE: Time-limit exceeded
def find_anagrams(s, p)
  ans = []

  0.upto(s.size-1) do |i|
    set = Set.new(p.chars)

    i.upto(i+p.size-1) do |j|
      break if set.empty? || !set.include?(s[j])

      set.delete(s[j])
    end

    if set.empty?
      ans << i
    end
  end
  ans
end
# 可惡...

# V2
# 想到更精簡的方法：把 i..i往後p長度的子字串變成 set，看他跟 p 一不一樣
def find_anagrams(s, p)
  ans = []

  set_p = Set.new(p.chars)

  0.upto(s.size-1) do |i|
    set_s = Set.new(s[i..i+p.size-1].chars)
    ans << i if set_s == set_p
  end
  ans
end
# NOTE: Time-limit exceeded 可惡還是超過


# V3
# 那能不能不要一直建立新的 set?
# 用舊的但是把 s[i-1] 拿掉，放入 s[i+1]，像是 sliding window 那樣？
def find_anagrams(s, p)
  ans = []

  set_p = Set.new(p.chars)
  set_s = Set.new(s[0..p.size-1].chars)
  puts "  " + [*0..s.size-1].join
  puts "  " + s
  0.upto(s.size-p.size) do |i|
    if i > 0
      set_s.delete(s[i-1])
      set_s.add(s[i+p.size-1])
    end
    puts "+#{i+p.size-1}" + " " * i + set_s.join
    if set_s == set_p
      ans << i
    end
  end
  ans
end

# 有一個問題：[bab]ac 往後移動時會把 b 移除，把 a 加進來，set 會變成 a 而已。但是其實 b 應該還要在才對！
# p = abc
#   0123456789
#   cbaebabacd
# +2cba
# +3 bae
# +4  aeb
# +5   eba
# +6    ba
# +7     a
# +8      c
# +9       cd

# 看來 Set 行不通。因為除了順序不重要以外，字母個數也要一樣!!，若 p 有三個 a，那 s 也要有三個 a。
# 感覺這樣只能用 Hash 了
# V5
# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  ans = []

  p_counts = Hash.new(0)
  p.chars.each { |c| p_counts[c]+=1 } # 先做一個 p 的字母數量表
  0.upto(s.size - p.size) do |i|
    counts = Hash.new(0)
    i.upto(i+p.size-1) do |j| # i...i+p長度也做一個 p 的字母數量表
      counts[s[j]]+=1
    end
    ans << i if counts == p_counts # 這個是 Language Feature，我再想想有沒有更好的方法。
  end

  ans
end

# 還是沒辦法過，只要 s，p都很長且 p 又稍微小一點點就會失敗。
# 幹我知道了，搭配上面剛剛 set 一個移除一個新增的方法！
# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  ans = []

  p_counts = Hash.new(0)
  p.chars.each { |c| p_counts[c]+=1 }
  # 先從 0 做一個跟 p 等長的字數表

  s_counts = Hash.new(0)
  (0..p.size-1).each { |i|  s_counts[s[i]]+=1  }

  s.chars.each_with_index do |c, i|
    if i > 0
      prev_char = s[i-1]
      s_counts[prev_char] -= 1
      if s_counts[prev_char] <= 0
        s_counts.delete(prev_char)
      end
      new_char = s[i+p.size-1]
      s_counts[new_char]+=1
    end
    ans << i if s_counts == p_counts
  end

  ans
end

# 過了。

# 改進一下
# Runtime 265 ms Beats 88.9% Memory 212.4 MB Beats 47.62%
# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  ans = []

  p_counts = Hash.new(0)
  p.chars.each { |c| p_counts[c]+=1 }
  # 先從 0 做一個跟 p 等長的字數表

  s_counts = Hash.new(0)
  (0..p.size-1).each { |i|  s_counts[s[i]]+=1  }
  ans << 0 if s_counts == p_counts #  先檢查 0 的時候，因為後面要開始移除前一個、新增後一個

  1.upto(s.size - p.size) do |i|
    prev_char = s[i-1]
    s_counts[prev_char] -= 1

    if s_counts[prev_char] <= 0
      s_counts.delete(prev_char)
    end

    new_char = s[i+p.size-1]
    s_counts[new_char]+=1

    ans << i if s_counts == p_counts
  end

  ans
end