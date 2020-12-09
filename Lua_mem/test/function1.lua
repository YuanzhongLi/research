function void()
  print("call void")
end

function add(a, b)
  return a+b
end

function sub(a, b)
  return a-b
end

function max(a, b)
  if a > b then
    return a
  else
    return b
  end
end

function min(a, b)
  if a < b then
    return a
  else
    return b
  end
end

function get_array_max(ary)
  INF = 1e9+7
  ret = -INF
  for i = 1, #ary do
    ret = max(ret, ary[i])
  end
end

print(add(10, 5))
print(get_array_max({3, 4, 19, 91, -1, 3, 101, 6}))
