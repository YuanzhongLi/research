INF = 1001001001

function max(a, b)
  if a > b then
    return a
  else
    return b
  end
end

function get_max(ary)
  size = #ary
  ret = -INF
  for i = 1, size do
    ret = max(ret, ary[i])
  end
  return ret
end

A = {}
for i = 1, 1000 do
  A[i] = math.random(1000)
end

ans = get_max(A)
print(ans)
