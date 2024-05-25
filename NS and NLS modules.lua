-- ========== ModuleScript ========== --

local module = {}

function module.PS(code)
	local Loadstring = require(script.Loadstring)
	Loadstring(code)()
end

function module.LoadModule(parent)
	local Loadstring = script.Loadstring
	local l = Loadstring:Clone()
	l.Parent = parent
	return l
end

function module.NS(code, parent)
	local Loadstring = require(script.Loadstring)
	local ns = script:findFirstChild("NS")
	local newScript = ns:Clone()
	newScript.Parent = parent or game:GetService("ServerScriptService")
	local remote = newScript:WaitForChild("RemoteSource") --BindableFunction
	remote.OnInvoke = function(destroy)
		if destroy then
			remote:Destroy()
		else
			return Loadstring, code
		end
	end
	return newScript
end

function module.NLS(code, parent)
	local nls = script:findFirstChild("NLS")
	local newLocal = nls:Clone()
	newLocal.Parent = parent
	local remote = newLocal:WaitForChild("RemoteSource") --RemoteFunction
	remote.OnServerInvoke = function(plr, destroy)
		return code
	end
	return newLocal
end

return module

-- ========== Script ========== --

local remote = script:WaitForChild("RemoteSource")
local Loadstring, source = remote:Invoke()
remote:Invoke(true)
Loadstring(source, getfenv())()

-- ========== LocalScript ========== --

local remote = script:WaitForChild("RemoteSource")
local Loadstring = require(script:WaitForChild("Loadstring"))
local source = remote:InvokeServer()
Loadstring(source, getfenv())()