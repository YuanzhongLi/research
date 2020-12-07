ary = {}
for i = 1, 1000 do
  ary[string.format("a%d", i)] = i
end

print(#ary)
