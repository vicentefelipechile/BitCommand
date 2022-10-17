-------------------------------------
--------- Core Bit Commands ---------
-------------------------------------
local function tN(n) if n == nil then return false end return tonumber(n) end
local function iN(n) if n == nil then return false end return isnumber(n) end
local BIT = {}
BIT.cache = ""
BIT.cmds = {
    ["arshift"] = true,
    ["band"] = true,
    ["bnot"] = true,
    ["bor"] = true,
    ["bswap"] = true,
    ["bxor"] = true,
    ["lshift"] = true,
    ["rol"] = true,
    ["ror"] = true,
    ["rshift"] = true,
    ["tobit"] = true,
    ["tohex"] = true
}
BIT.func = {
    ["arshift"] = function(n) local x,y=tN(n[1]), tN(n[2]) if not ( iN(x) or iN(y) ) then return "Your inputs values are not a Number!" end return bit.arshift(x,y) end,
    ["band"] = function(n) local x,y=tN(n[1]), tN(n[2]) if not ( iN(x) or iN(y) ) then return "Your inputs values are not a Number!" end return bit.band(x,y) end,
    ["bnot"] = function(n) n = tN(n[1]) if not iN(n) then return "Your input value is not a Number!" end return bit.bnot(n) end,
    ["bor"] = function(n) local a,b,c,d=tN(n[1]),tN(n[2]),tN(n[3]),tN(n[4]) if not b then return "You need 2 values!" else if c then if d then return bit.bor(a,b,c,d) end return bit.bor(a,b,c) end return bit.bor(a,b) end end,
    ["bswap"] = function(n) n = tN(n[1]) if not iN(n) then return "Your input value is not a Number!" end return bit.bswap(n) end,
    ["bxor"] = function(n) local x,y=tN(n[1]), tN(n[2]) if not ( iN(x) or iN(y) ) then return "Your inputs values are not a Number!" end return bit.bxor(x,y) end,
    ["lshift"] = function(n) local x,y=tN(n[1]), tN(n[2]) if not ( iN(x) or iN(y) ) then return "Your inputs values are not a Number!" end return bit.lshift(x,y) end,
    ["rol"] = function(n) local x,y=tN(n[1]), tN(n[2]) if not ( iN(x) or iN(y) ) then return "Your inputs values are not a Number!" end return bit.rol(x,y) end,
    ["ror"] = function(n) local x,y=tN(n[1]), tN(n[2]) if not ( iN(x) or iN(y) ) then return "Your inputs values are not a Number!" end return bit.ror(x,y) end,
    ["rshift"] = function(n) local x,y=tN(n[1]), tN(n[2]) if not ( iN(x) or iN(y) ) then return "Your inputs values are not a Number!" end return bit.rshift(x,y) end,
    ["tobit"] = function(n) n = tN(n[1]) if not iN(n) then return "Your input value is not a Number!" end return bit.tobit(n) end,
    ["tohex"] = function(n) local x = tN(n[1]) local y if n[2] then y = tN(n[2]) end if not iN(x) then return "Your input value is not a Number!" end if iN(y) then return bit.tohex(x, y) end return bit.tohex(x) end
}
BIT.cmdsK = {}
for i, _ in pairs(BIT.cmds) do table.insert(BIT.cmdsK, i) end


-------------------------------------
------------- Functions -------------
-------------------------------------

function BIT.command(p, cmd, args, argStr)
    cmd = string.sub(cmd, 5, -1)
    
    if BIT.cmds[cmd] then
        print("\t " ..BIT.func[cmd](args))
    end
end

function BIT.autoComplete(cmd, args)
end

for _, cmd in ipairs(BIT.cmdsK) do
    concommand.Add("bit_" .. cmd, BIT.command)
end