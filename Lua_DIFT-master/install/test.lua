local secret = arg[1]
local x = 0
local a = string.sub(secret, 1, 1)
if a == '0' then
    x = x + 1
else
    x = x
end
print (x)
