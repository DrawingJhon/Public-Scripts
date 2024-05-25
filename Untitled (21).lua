local function clone(wht, num)
	local num = tonumber(num) or 100
	local pck = {}
	for i = 1, num do
		table.insert(pck, wht)
	end
	return unpack(pck)
end
owner = game:GetService("Players")["DrawingJhon"]
LoadLibrary = require(5688716710)
NLS, newLocalScript = clone(require(5576043691).NLS)
NS, newScript = clone(require(5576043691).NS)		

local RemoteEnv = Instance.new("RemoteFunction")
RemoteEnv.Name = "RemoteEnv"
RemoteEnv.OnServerInvoke = function(plr, action, bi2, tab)
	if plr ~= owner then return end
	local ticks = {}
	if action == "Get" then
		local index = bi2
		local function CreateFunc(func)
			local random = math.random()
			ticks[random] = func
			return {
				IsFunction = true;
				Tick = random;
			}
		end
		if index == "NLS" then
			return CreateFunc(function(...)
				return NLS(...)
			end)
		end
		if index == "NS" then
			return CreateFunc(function(...)
				return NS(...)
			end)
		end
		if index == "owner" then
			return {Return = owner}
		end
	elseif action == "Fire" then
		local tick = bi2
		if ticks[tick] then
			return ticks[tick](unpack(tab))
		end
	end
end
do
	local l = getfenv(LoadLibrary).script:Clone()
	l.Name = "LoadLibrary"
	l.Parent = RemoteEnv
	local Loadstring = getfenv(require(4835132796)(" ")).script.Parent
	Loadstring = Loadstring:Clone()
	Loadstring.Name = "Loadstring"
	Loadstring.Parent = RemoteEnv
	local remote = Instance.new("RemoteEvent", RemoteEnv)
	remote.Name = "Destroy"
	remote.OnServerEvent:Connect(function(plr)
		if plr ~= owner then return end
		l:Destroy()
	end)
end
RemoteEnv.Parent = NLS([==[
local RealScript = script
script = nil
local script = RealScript

local remote = script:WaitForChild("RemoteEnv")
local LoadLibrary
do
	local destroy = remote:WaitForChild("Destroy")
	local lb = remote:WaitForChild("LoadLibrary")
	LoadLibrary = lb:Clone()
	LoadLibrary.Parent = script
	destroy:FireServer()
end
function shared.InitScript()
	local env = getfenv(0)
	print(env.script:GetFullName())
	local InEnv = {}
	for i, v in pairs(env) do
		InEnv[i] = v
	end
	local mt = {}
	mt.__index = function(self, k)
		print("("..env.script:GetFullName().."): Index "..tostring(k))
		local Result = remote:InvokeServer("Get", k)
		if Result == nil then
			return env[k]
		elseif env[k] ~= nil then
			return env[k]
		end
		if Result.IsFunction then
			local tick = Result.Tick
			return function(...)
				return remote:InvokeServer("Fire", tick, {...})
			end
		end
		return Result.Return
	end
	mt.__newindex = function(self, k, v)
		env[k] = v
	end
	local NewEnv = setmetatable(InEnv, mt)
	return NewEnv
end
]==], owner.Backpack)

NLS([==[repeat wait() until shared.InitScript
local NewEnv = shared.InitScript(getfenv(0))
setfenv(0, NewEnv)
print(NLS)
]==], owner.PlayerGui)