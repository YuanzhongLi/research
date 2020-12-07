ary = {}
for i = 1, 10 do
  ary[string.format("a %d", i)] = i
end

print(#ary)
