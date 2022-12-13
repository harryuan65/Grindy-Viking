def highlighted_array(a, mapping)
  highlighted = a.map.with_index do |e, i|
    if (color = mapping[i])
      "\e[#{color}m#{e}\e[0m"
    else
      "#{e}"
    end
  end
  highlighted * " "
end

def highlight_pointers(a, i, j)
  pointers = a.map.with_index do |e, ii|
    if ii == i && ii == j
      "\e[1mij\e[0m"
    elsif ii == i
      "\e[1mi\e[0m"
    elsif ii == j
      "\e[1mj\e[0m"
    else
      " "
    end
  end
  pointers * " "
end