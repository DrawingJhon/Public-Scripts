local module = {}
local rl = script
script = nil
local script = rl
local require = require

local function makeFunc(func)
	local userdata = newproxy(true)
	local meta = getmetatable(userdata)
	meta.__call = function(self, ...)
		return func(...)
	end
	meta.__tostring = function(self)
		return tostring("Safe function")
	end
	meta.__metatable = "NOPE"
	return userdata
end

module.GetModule = makeFunc(function(parent)
    local Loadstring = script.Loadstring
    local l = Loadstring:Clone()
    l.Parent = parent
    return l
end)

module.NS = makeFunc(function(code, parent)
    local Loadstring = require(script.Loadstring)
    local ns = script:findFirstChild("NS")
    local newScript = ns:Clone()
    local remote = newScript:WaitForChild("RemoteSource") --BindableFunction
    remote.OnInvoke = function(destroy)
        if destroy then
            remote:Destroy()
        else
            return Loadstring, code
        end
    end
	newScript.Parent = parent
    return newScript
end)

module.NLS = makeFunc(function(code, parent)
    local nls = script:findFirstChild("NLS")
    local newLocal = nls:Clone()
    newLocal.Parent = parent
    local remote = newLocal:WaitForChild("RemoteSource") --RemoteFunction
    remote.OnServerInvoke = function(plr)
        return code
    end
    return newLocal
end)

local userdata = newproxy(true)
local meta = getmetatable(userdata)
local defaultTab = {}
meta.__index = function(self, index)
	return module[index] or defaultTab[index]
end
meta.__newindex = function(self, index, newindex)
	defaultTab[index] = newindex
end
meta.__tostring = function(self)
	return "ScriptModule"
end
meta.__metatable = "The metatable is locked"
return userdata