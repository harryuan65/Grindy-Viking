# timestamp: 2022-07-21T18:32:36+08:00
# question: https:/leetcode.com/problems/first-bad-version

# train of thought
TRAIN_OF_THOUGHT = <<DOC.freeze
  <how I came up with this solution>
DOC

# code goes here
def first_bad_version(n)
  front = 1
  back = n
  versions = {}

  loop do
    mid = (front + back)/2
    bad = is_bad_version(mid)
    versions[mid] = bad
    if front >= back
      if versions[mid] == false
        return mid+1
      else
        return mid
      end
    end

    if bad
      if versions[mid-1] == false
        return mid
      else
        back = mid-1
      end
    else
      front = mid+1
    end
  end
end

def is_bad_version(v)
  v >=1702766719
end

n = 2126753390

puts first_bad_version(n)