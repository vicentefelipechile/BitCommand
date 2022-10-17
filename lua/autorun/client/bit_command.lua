-------------------------------------
--------- Core Bit Commands ---------
-------------------------------------

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

-------------------------------------
------------- Functions -------------
-------------------------------------

function BIT.command(p, cmd, args, argStr)

end

function BIT.autoComplete(cmd, args)
    
end

concommand.Add("bit", BIT.command, BIT.autoComplete, "Run bit commands")