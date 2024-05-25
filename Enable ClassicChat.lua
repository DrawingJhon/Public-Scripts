local player = game:GetService("Players").LocalPlayer
local playerScripts = player.PlayerScripts
local Chat = game:GetService("Chat")
local ChatSettings = require(Chat.ClientChatModules.ChatSettings)

ChatSettings.ClassicChatEnabled = true

if player.PlayerGui:FindFirstChild("Chat") then
    player.PlayerGui.Chat:Destroy()
end

if playerScripts:FindFirstChild("ChatScript") then
	playerScripts.ChatScript:Destroy()
end

local scr = game:GetObjects("rbxassetid://10221333356")[1]
scr.Parent = playerScripts

local function Load(Object)
	local Modules = {}
	local SavedModules = {}
	local Scripts = {}
	local EnvList = {}
	
	local function fakeRequire(Script)
		if typeof(Script) ~= "Instance" then warn("Unable to require: "..tostring(Script)) return end
		if SavedModules[Script] then
			return SavedModules[Script]
		elseif Modules[Script] then
			SavedModules[Script] = Modules[Script]()
			return SavedModules[Script]
		end
		warn("Real requiring: "..Script:GetFullName())
		return require(Script)
	end
	local function NewProxyEnv(Script, Func, Err)
		if not Func then
			warn("SYNTAX ERROR ("..Script:GetFullName().."): "..(Err or "Unknown"))
		end
		local fakeEnv = {script = Script}
		local meta = {}
		meta.__index = function(self, index)
			if index == "require" then
				return fakeRequire
			end
			if index == "getfenv" then
				return function(arg)
					local typ = type(arg)
					local env
					if typ == "number" then
						env = getfenv(arg == 0 and 2 or arg + 1)
					else
						env = getfenv(arg)
					end
					if env.script == nil then
						error("Tried to get main envirionment")
					end
					return env
				end
			end
			return getfenv()[index]
		end
		
		return setfenv(Func, setmetatable(fakeEnv, meta))
	end
	local function LoadScripts(Script)
		if Script:IsA("Script") or Script.ClassName == "ModuleScript" then
			local func = NewProxyEnv(Script, loadstring(Script.Source, "="..Script:GetFullName()))
			if Script.ClassName == "Script" or Script.ClassName == "LocalScript" then
				Scripts[Script] = func
			elseif Script.ClassName == "ModuleScript" then
				Modules[Script] = func
			end
		end
		
		for i, v in pairs(Script:GetChildren()) do
			LoadScripts(v)
		end
	end
	LoadScripts(Object)
	for i, v in pairs(Scripts) do
		task.spawn(v)
	end
end

Load(scr)