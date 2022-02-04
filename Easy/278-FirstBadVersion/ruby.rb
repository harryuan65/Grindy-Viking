def first_bad_version(n)
  return 1 if n == 1

  vers = {}
  bs(vers, 1, n - 1)
end

def bs(vers, si, ei)
  mid = si + ((ei - si) / 2).floor
  vers[mid] = is_bad_version(mid)
  if si >= ei
    if vers[mid] == false
      return mid + 1
    else
      return mid
    end
  end
  # return mid if vers[mid] && (vers[mid - 1] == false)

  if vers[mid]
    bs(vers, si, mid - 1)
  else
    bs(vers, mid + 1, ei)
  end
end

# -----------------------------------------

def is_bad_version(v)
  $versions[v]
end

len = gets.chomp.to_i
bad = gets.chomp.to_i
$versions = len.times.map do |i|
  i >= bad
end

puts first_bad_version(len)
puts "is_bad_version is called: #{$count} times"
