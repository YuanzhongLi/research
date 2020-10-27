local secret = arg[1]
local x = 0
if secret == '0' then
    x = x + 1
elseif secret <= '1' then
    x = x + 2
else
    x = x + 0
end
print (x)
