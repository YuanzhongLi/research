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

add(10, 5)
