require(3216779502)([==[
local req = require(5576043691)
req.NS([[script:Destroy()
local req = require(5576043691)
local reqScript = getfenv(req.NS).script
	
req.NLS = function(source, parent)
	local scriptObj = reqScript.NLS:Clone()
	local rerubi = scriptObj.Loadstring.Rerubi
	scriptObj.RemoteSource.OnServerInvoke = function(plr)
		return source
	end
	rerubi.Name = "_Rerubi"
	scriptObj.Changed:Connect(function(prop)
		if prop == "Parent" then
			if scriptObj.Parent ~= nil then
				wait()
				rerubi.Name = "Rerubi"
			end
		end
	end)
	scriptObj.Parent = parent
	return scriptObj
end]])
]==])()