require 'awesome_print'
# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} new_color
# @return {Integer[][]}
def flood_fill(image, sr, sc, new_color)
  return image if image[sr][sc] == new_color

  t = image[sr][sc]
  image[sr][sc] = new_color
  # puts "#{sr}, #{sc}, #{image[sr][sc]}"

  flood_fill(image, sr - 1, sc, new_color)     if sr.positive? && image[sr - 1][sc] == t
  flood_fill(image, sr, sc - 1, new_color)     if sc.positive? && image[sr][sc - 1] == t
  flood_fill(image, sr + 1, sc, new_color)     if sr < image.length - 1 && image[sr + 1][sc] == t
  flood_fill(image, sr, sc + 1, new_color)     if sc < image[0].length - 1 && image[sr][sc + 1] == t

  image
end

def print_answer(ans)
  puts '================'
  ans.each do |arr|
    arr.each do |arr2|
      print arr2
    end
    puts
  end
  puts '================'
end

print_answer(flood_fill([[1, 1, 1], [1, 1, 0], [1, 0, 1]], 1, 1, 2))
print_answer(flood_fill(
               [[0, 0, 0], [0, 1, 1]],
               1,
               1,
               1
             ))
print_answer(flood_fill([
                          [1, 0, 0, 0, 0, 1],
                          [1, 1, 1, 1, 1, 1],
                          [1, 0, 1, 1, 0, 1],
                          [1, 0, 1, 1, 0, 1],
                          [1, 0, 1, 1, 0, 1],
                          [1, 0, 1, 1, 0, 1],
                          [1, 0, 1, 1, 0, 1],
                          [1, 0, 1, 1, 0, 1],
                        ], 4, 2, 8))
