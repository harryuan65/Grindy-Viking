#BinarySearch

n 是總共有幾個版本，但沒講個版本哪些是 good or bad，只能透過題目提供的 `is_bad_version(n)` 查詢。
並要求要呼叫最少次的 `is_bad_version(n)`。
當有一個版本是 bad，之後的所有版本都是壞掉的。要找第一個壞掉的版本。

```ruby
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
```

![[01Submission.png]]

