#QuestionCategory??

# 思路

```ad-note
[題目](https://leetcode.com/problems/flood-fill/)
<iframe src="https://leetcode.com/problems/flood-fill/" width=600 height=400></iframe>
```

有個很機車的地方，就是他會塗一樣的顏色XD 害我 time out
`return image if image[sr][sc] == new_color` 一定要 handle。

```ruby
# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} new_color
# @return {Integer[][]}
def flood_fill(image, sr, sc, new_color)
  return image if image[sr][sc] == new_color

  t = image[sr][sc]
  image[sr][sc] = new_color

  flood_fill(image, sr - 1, sc, new_color)     if sr.positive? && image[sr - 1][sc] == t
  flood_fill(image, sr, sc - 1, new_color)     if sc.positive? && image[sr][sc - 1] == t
  flood_fill(image, sr + 1, sc, new_color)     if sr < image.length - 1 && image[sr + 1][sc] == t
  flood_fill(image, sr, sc + 1, new_color)     if sc < image[0].length - 1 && image[sr][sc + 1] == t

  image
end
```


![[Coding/Easy/733.flood-fill/images/submission.png]]