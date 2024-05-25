----------------------------------------------------------------------
--// VOIDACITY'S SCRIPT BUILDER PORTABLE \\--
-- Script compatible by DrawingJhon | Original made by tusKOr661 --
----------------------------------------------------------------------

wait()
script.Name = "oxSB"
script.Parent = nil

local Version = "Alpha v2.2.11"

local DS_Key = "6F05FAED-6EA6-4E95-9204-123"
local psKey = "PrivServsrRand0m7qe8"
local saveKey = "ScIi1221Tfq1bOiLdr"
local banKey = "ScRiPp0tB0I1derbln2"
local loadstringEnabled = pcall(loadstring, "local hello = 'hi'")
local Loadstring = require(5343495217)
local LoadLibrary = require(4960288388)
local req = require(6505718551)
local EAenabled = false
local CreateScript = req.NS
local CreateLocal = req.NLS

local players = game:GetService("Players")
local network = game:GetService("NetworkServer")
local insert = game:GetService("InsertService")
local teleport = game:GetService("TeleportService")
local http = game:GetService("HttpService")
local terrain = workspace.Terrain
local context = game:GetService("ScriptContext")
local replicated = game:GetService("ReplicatedStorage")
local lighting = game:GetService("Lighting")
local dataStore = game:GetService("DataStoreService")
local startergui = game:GetService("StarterGui")
local tweenService = game:GetService("TweenService")
local mainData = dataStore:GetDataStore(DS_Key, "dy3BrMu2ieAHZgz@kIXcG&t&q9ru")
local btools = (function()
	local success, result = pcall(function()
		return getfenv(require(6877105817)).script["Building Tools"]:Clone()
	end)
	if not success then
		warn(":SB_Error (Unable to get f3x from module): "..tostring(result))
	else
		return result
	end
end)()

if req.Initialized then
	warn("Voidacity's Script Builder is already running! Aborting...")
	script:Destroy()
	return
end

req.Initialized = true

local Moderators = {
	[652513366] = "JhonXD2006",
	[1308042355] = "DrawingJhon",
	[760209609] = "Artem1237894",
	[1693560309] = "PotatoPruebas",
	[442923944] = "hacker57934"
}
local Members = {
	[907012872] = "ignasi29",
	[428609829] = "Axelle63",
	[688322357] = "tacomexicano_ROBLOX",
	[1521766652] = "FernandoPlayerYT",
	[308254638] = "Robloxmastermanyay"
}

local DefDummy = insert:LoadAsset(124120704):GetChildren()[1]
DefDummy.Name = "Default Dummy"
DefDummy.WalkAndTalk:Destroy()
local scriptBase = getfenv(require(4889063407).load).script:GetChildren()[1]:Clone()
scriptBase.Name = "Script"
scriptBase.Disabled = false
local CrossManager

local dataBase = {}
local serverScripts = {}
local clientScripts = {}
local scriptEnvs = {}
local infoEnvs = {}
local scripts = {}
local connections = {}
local serverList = {}

local banList = {}
local gBanList = mainData:GetAsync(banKey) or {}
local PrivateServers = mainData:GetAsync(psKey) or {}
local mainParts = {}

local reals = setmetatable({}, {__mode = "k"})
local proxies = setmetatable({}, {__mode = "v"})
local sandboxEnabled = loadstringEnabled and true or false -- this cause lag if loadstring is not enabled
local alertIY = true
local mainEnv = getfenv(0)
mainEnv.script = nil
local mainEnvFunc = setfenv(1, mainEnv)
local coreLibs = {LoadLibrary=true, table=true, coroutine=true, string=true, math=true, os=true, assert=true, collectgarbage=true, dofile=true, error=true, _G=true, shared=true, gcinfo=true, getfenv=true, getmetatable=true, ipairs=true, load=true, loadfile=true, loadstring=true, newproxy=true, next=true, pairs=true, pcall=true, ypcall=true, print=true, rawequal=true, rawget=true, rawset=true, select=true, setfenv=true, setmetatable=true, tonumber=true, tostring=true, type=true, unpack=true, _VERSION=true, xpcall=true, require=true}
local isA = game.IsA
local proxyObj, newProxyEnv, hookClient;

local _G, game, script, getfenv, setfenv, workspace,
getmetatable, setmetatable, loadstring, coroutine,
rawequal, typeof, print, math, warn, error,  pcall,
xpcall, select, rawset, rawget, ipairs, pairs,
next, Rect, Axes, os, tick, Faces, unpack, string, Color3,
newproxy, tostring, tonumber, Instance, TweenInfo, BrickColor,
NumberRange, ColorSequence, NumberSequence, ColorSequenceKeypoint,
NumberSequenceKeypoint, PhysicalProperties, Region3int16,
Vector3int16, elapsedTime, require, table, type, wait,
Enum, UDim, UDim2, Vector2, Vector3, Region3, CFrame, Ray, spawn =
	_G, game, script, getfenv, setfenv, workspace,
	getmetatable, setmetatable, loadstring, coroutine,
	rawequal, typeof, print, math, warn, error,  pcall,
	xpcall, select, rawset, rawget, ipairs, pairs,
	next, Rect, Axes, os, tick, Faces, unpack, string, Color3,
	newproxy, tostring, tonumber, Instance, TweenInfo, BrickColor,
	NumberRange, ColorSequence, NumberSequence, ColorSequenceKeypoint,
	NumberSequenceKeypoint, PhysicalProperties, Region3int16,
	Vector3int16, elapsedTime, require, table, type, wait,
	Enum, UDim, UDim2, Vector2, Vector3, Region3, CFrame, Ray, spawn

local secretEnv;

------------------------------------------------------

local encode, decode
do
	local Key53 = 8186484168865098
	local Key14 = 4887
	local inv256
	function encode(str)
		if not inv256 then
			inv256 = {}
     		for M = 0, 127 do
				local inv = -1
				repeat inv = inv + 2
				until inv * (2*M + 1) % 256 == 1
				inv256[M] = inv
			end
		end
		local K, F = Key53, 16384 + Key14
		return (str:gsub('.', function(m)
			local L = K % 274877906944  -- 2^38
			local H = (K - L) / 274877906944
			local M = H % 128
			m = m:byte()
			local c = (m * inv256[M] - (H - M) / 128) % 256
			K = L * F + H + c + m
			return ('%02x'):format(c)
		end))
	end
	function decode(str)
		local K, F = Key53, 16384 + Key14
		return (str:gsub('%x%x', function(c)
			local L = K % 274877906944  -- 2^38
			local H = (K - L) / 274877906944
			local M = H % 128
			c = tonumber(c, 16)
			local m = (c + (H - M) / 128) * (2*M + 1) % 256
			K = L * F + H + c + m
			return string.char(m)
		end))
	end
end

local function Routine(f, ...)
	return coroutine.resume(coroutine.create(f), ...)
end

local function emptyFunction()
	-- There's nothing to see...
end

local function isInstance(obj)
	return pcall(isA, obj, "Instance")
end

local function toboolean(value)
	return not not value;
end

local function WaitForChildOfClass(obj, class)
	local find = game.findFirstChildOfClass
	local object = find(obj, class)
	if not object then
		repeat game:GetService("RunService").Stepped:wait()
			object = find(obj, class)
		until object
	end
	return object
end

local function splitStr(str, key)
	local tab = {};
	for part in string.gmatch(str..key, "(.-)"..key) do
		table.insert(tab, part);
	end
	return tab;
end

local function repackToFunc(func, ...)	
	local tab = {num = select("#", ...), ...}
	for i = 1, tab.num do
		tab[i] = func(tab[i])
	end
	return unpack(tab, 1, tab.num)
end

local function isDestroyed(obj)
	if obj.Parent then return false end
	local success, err = pcall(function()
		obj.Parent = obj
	end)
	if err:lower():match("locked") then
		return true
	end
	return false
end

local function Pcall(func, ...)
	local args = {pcall(func, ...)}
	if not args[1] then
		warn("SB_ERROR: "..tostring(args[2]))
	end
	return unpack(args)
end

local function getFormattedTime(sec)
	sec = tonumber(sec) or tick()
	return ("%.2d:%.2d:%.2d"):format(sec/3600%24, sec/60%60, sec%60)
end

local function SetGlobalBan(userId, value)
	rawset(gBanList, tostring(userId), value)
	mainData:UpdateAsync(banKey, function(tab)
		local newTab = type(tab) == "table" and tab or {}
		newTab[tostring(userId)] = value
		return newTab
	end)
end

local function RemoveGlobalBan(userId)
	SetGlobalBan(userId, nil)
end

local function getServerType()
	if game.PrivateServerId ~= "" then
		if game.PrivateServerOwnerId ~= 0 then
			return "VIP Server"
		else
			return "Private Server"
		end
	else
		return "Public Server"
	end
end

local function sendData(player, dtype, data)
	local player = (type(player) == "userdata") and player or players:findFirstChild(player);
	if player and player:IsA("Player") then
		local playerData = dataBase[player.UserId]
		if playerData and playerData.SB then
			local dataEntry = Instance.new("StringValue")
			dataEntry.Name = "SB_Output:"..dtype
			dataEntry.Value = http:JSONEncode(data)
			dataEntry.Parent = player
		end
	end
end

local function SaveString(player, strKey, str)
	mainData:UpdateAsync(strKey, function(tab)
		local saves = type(tab) == "table" and tab or {}
		saves[tostring(player.UserId)] = str
		return saves
	end)
end

local function LoadString(player, strKey)
	local key = saveKey
	local saves = mainData:GetAsync(key)
	if type(saves) == "table" then
		local result = saves[tostring(player.UserId)]
		return type(result) == "string" and result or ""
	end
	return ""
end

local function OnPlayerAdded(func)
	for i, plyr in pairs(players:GetPlayers()) do
		coroutine.wrap(func)(plyr)
	end
	return players.PlayerAdded:Connect(func)
end

local function getSource(player, source)
	local url = string.match(source, "^http:(.+)");
	if (url) then
		local success, response = pcall(http.GetAsync, http, url);
		if (success) then
			source = response;
		else
			source = nil;
			sendData(player, "Output", {"Error", "Unable to get url '" .. url .. "'"});
		end
	end
	return source;
end

local function saveScript(player, saves, name, scriptData, newSave)
	if (newSave or saves[name]) then
		if (scriptData) then
			saves[name] = {Name = name, Source = scriptData.Source};
			sendData(player, "Output", {"Note", (newSave and "Saved" or "Updated") .. " ("..name..")"});
		else
			saves[name] = nil;
			sendData(player, "Output", {"Note", "Unsaved ("..name..")"});
		end
		coroutine.wrap(SaveString)(player, saveKey, http:JSONEncode(saves));
	end
end

local function getPlayers(player, plyrs)
	local result = {};
	if (plyrs == "all") then
		result = players:GetPlayers();
	elseif (plyrs == "others") then
		for i, plyr in ipairs(players:GetPlayers()) do
			if (plyr ~= player) then
				table.insert(result, plyr);
			end
		end
	else
		for i, plyr in ipairs(players:GetPlayers()) do
			local dupl = false;
			for i, input in ipairs(splitStr(string.lower(plyrs), ", ")) do
				if (not dupl and string.find(string.lower(plyr.Name), input, 1, true) == 1) then
					table.insert(result, plyr);
					dupl = true;
				end
			end
		end
	end
	return result
end

local function newScript(type, owner, name, source)
	local scriptObj
	if type == "Script" then
		if not loadstringEnabled then
			scriptObj = CreateScript([==[local error = error
			local Loadstring, source = require(6505718551).Inject(script)
			local func, err = Loadstring(source, pcall(loadstring, "") and "SB_Script" or getfenv(0))
			if func then
				setfenv(func, getfenv(0))
				spawn(func)
			else
				error(err)
			end]==])
			serverScripts[scriptObj] = {owner, name, source}
			scriptObj.Name = "Script"
		else
			local runner = Instance.new("BindableFunction")
			runner.OnInvoke = function()
				return function(db)
					if db then return end
					local scr = scriptObj
					if serverScripts[scr] and not serverScripts[scr][4] then
						local y, err = loadstring(source, "SB_Script")
						if y then 
							err = nil
						end
						local owner, name, source = unpack(serverScripts[scr])
						local env = newProxyEnv(scr, owner)
						serverScripts[scr][4] = env
						serverScripts[scr][5] = scr:GetFullName()
						scriptEnvs[env] = owner
						connections[env] = {}
						infoEnvs[env] = {Script = scr, Proxy = sandboxEnabled}
						table.insert(scripts, scr)
						setfenv(0, env)
						setfenv(2, env)
						local v2 = getfenv(2)
						v2.getfenv = function(lvl)
							if err then return 0 end
							return (function()
								v2.getfenv = nil
								return "SB_Script"
							end)()
						end
						sendData(owner, "Output", {"Run", "Running ("..name..")"})
						return err and error or loadstring, err or source
					else
						return coroutine.yield
					end
				end
			end
			runner.Name = "Runner"
			scriptObj = scriptBase:Clone()
			serverScripts[scriptObj] = {owner, name, source}
			spawn(function()
				runner.Parent = scriptObj
			end)
		end
	elseif type == "Local" then
		local errInSource
		local source = Loadstring(source) and source or (function()
			local a, b = Loadstring(source)
			errInSource = b
			return ""
		end)()
		scriptObj = CreateLocal(([[
		owner = game:GetService("Players").LocalPlayer
		local print, warn, LoadLibrary = print, warn, nil
		do
			local game, Instance, tostring, select, owner = game, Instance, tostring, select, owner
			local realPrint, realWarn = print, warn
			local info = script:WaitForChild("Info")
			local name, err = unpack(game:GetService("HttpService"):JSONDecode(info.Value))
			local haz = false
			if getmetatable(shared) == "Full locked" then
				shared(script, name)
				haz = true
			elseif shared.Init then
				shared.Init(script, name)
				haz = true
			end
			local function sendData(dtype, data)
				if haz then
					local dataEntry = Instance.new("StringValue")
					dataEntry.Name = "SB_Output:"..dtype
					dataEntry.Value = game:GetService("HttpService"):JSONEncode(data)
					dataEntry.Parent = owner
				else
					if data[1] == "Print" then
						realPrint(data[2])
					elseif data[1] == "Warn" then
						realWarn(data[2])
					end
				end
			end
			function LoadLibrary(idk)
				return {Create = function(object)
					local ob = Instance.new(object)
					return function(properties)
						if typeof(properties) == "table" then
							for pr, val in pairs(properties) do
								ob[pr] = val
							end
						end
						return ob
					end
				end}
			end
			print = function(...)
				local args = {...}
				local md = {}
				for i = 1, select("#", ...) do
					md[i] = tostring(args[i]);
				end
				sendData("Output", {"Print", table.concat(md, "    ")});
			end
			warn = function(...)
				local args = {...}
				local md = {}
				for i = 1, select("#", ...) do
					md[i] = tostring(args[i]);
				end
				sendData("Output", {"Warn", table.concat(md, "    ")});
			end
			sendData("Output", {"Run", "Running ("..name..")"})
			if err then
				error(err)
			end
		end ]]):gsub("\n", " ")..source)
		clientScripts[scriptObj] = {owner, name}
		local Info = Instance.new("StringValue")
		Info.Value = http:JSONEncode({name, errInSource})
		Info.Name = "Info"
		Info.Parent = scriptObj
	end
	return scriptObj
end

local function disableScript(script)
	if script then
		if serverScripts[script] then
			if serverScripts[script][4] then
				local env = serverScripts[script][4]
				if connections[env] then
					for i, conn in pairs(connections[env]) do
						if typeof(conn) == "RBXScriptConnection" then
							if conn.Connected then
								conn:Disconnect()
							end
						end
					end
				end
				scriptEnvs[env] = nil
			end
			serverScripts[script] = nil
		elseif clientScripts[script] then
			clientScripts[script] = nil
		end
		script:Destroy()
	end
end

----------------------------------------------------

local customLibrary = {
	print = function(...)
		local owner = scriptEnvs[getfenv(0)]
		local args = {...}
		for i = 1, select("#", ...) do
			args[i] = tostring(args[i]);
		end
		sendData(owner.Name, "Output", {"Print", table.concat(args, "\t")});
	end,
	warn = function(...)
		local owner = scriptEnvs[getfenv(0)];
		local args = {...};
		for i = 1, select("#", ...) do
			args[i] = tostring(args[i]);
		end
		sendData(owner.Name, "Output", {"Warn", table.concat(args, "\t")})
	end,
	["newScript,NS"] = function(...)
		local source, parent = select(1, ...), select(2, ...)
		assert(select("#", ...) ~= 0, "NS: missing argument #1 to 'NS' (string expected)")
		assert(type(source) == "string", "NS: invalid argument #1 to 'NS' (string expected, got "..typeof(source)..")")
		assert(select("#", ...) ~= 1, "NS: missing argument #2 to 'NS' (Instance expected)")
		assert(typeof(parent) == "Instance", "NS: invalid argument #2 to 'NS' (Instance expected, got "..typeof(parent)..")")
		local owner = scriptEnvs[getfenv(0)]
		local scriptObj = newScript("Script", owner, "NS - "..parent:GetFullName(), source)
		scriptObj.Parent = parent
		table.insert(dataBase[owner.userId].Quicks, scriptObj)
		return scriptObj
	end,
	["newLocalScript,NLS"] = function(...)
		local source, parent = select(1, ...), select(2, ...)
		assert(select("#", ...) ~= 0, "NLS: missing argument #1 to 'NLS' (string expected)")
		assert(type(source) == "string", "NLS: invalid argument #1 to 'NLS' (string expected, got "..typeof(source)..")")
		assert(select("#", ...) ~= 1, "NLS: missing argument #2 to 'NLS' (Instance expected)")
		assert(typeof(parent) == "Instance", "NLS: invalid argument #2 to 'NLS' (Instance expected, got "..typeof(parent)..")")
		local owner = scriptEnvs[getfenv(0)]
		local scriptObj = newScript("Local", owner, "NLS - "..parent:GetFullName(), source)
		scriptObj.Parent = parent
		table.insert(dataBase[owner.userId].Quicks, scriptObj)
		return scriptObj
	end,
	["getfenv"] = function(arg)
		local typ = type(arg);
		local env;
		if (typ == "number" and arg >= 0) then
			local lvl = (arg == 0 and 0 or arg+1);
			env = getfenv(lvl);
		elseif (typ == "nil") then
			env = getfenv(2);
		elseif (typ == "function") then
			if (reals[arg]) then
				env = getfenv(0);
			else
				env = getfenv(arg);
			end
		else
			getfenv(arg);
		end
		if (env == secretEnv) then
			return {"nawp"};
		elseif (env == mainEnv) then
			return getfenv(0);
		else
			return env;
		end
	end,
	["setfenv"] = function(...)
		local arg, tbl = select(1, ...), select(2, ...)
		assert(select("#", ...) > 1, "missing argument #2 to 'setfenv' (table expected)")
		local typ = type(arg);
		local func;
		if (typ == "number" and arg >= 0) then
			local lvl = (arg == 0 and 0 or arg+1);
			func = setfenv(lvl, tbl);
		elseif (typ == "function") then
			if (reals[arg]) then
				error("'setfenv' cannot change environment of given object");
			else
				func = setfenv(arg, tbl);
			end
		else
			setfenv(arg, tbl);
		end
		if (func == mainEnvFunc) then
			setfenv(mainEnvFunc, mainEnv);
			error("Error occured setfenv");
		else
			return func;
		end
	end,
	["LoadLibrary"] = function(library)
		local library = type(library) == "string" and library:gsub("^.", string.upper) or error("Bad argument")
		if not infoEnvs[getfenv(0)].Proxy then
			return LoadLibrary(library)
		end
		if (library == "RbxUtility") then
			local lib = LoadLibrary("RbxUtility");
			local userdata = newproxy(true);
			local tab = {};
			getmetatable(userdata).__index = function(_, index)
				return (tab[index]);
			end
			getmetatable(userdata).__tostring = function()
				return "RbxUtility"
			end
			getmetatable(userdata).__metatable = "The metatable is locked"
			function tab.CreateSignal()
				local ud = newproxy(true)
				local this = {};
				local mBindableEvent = proxyObj(Instance.new("BindableEvent"));
				local mAllCns = {};
				function this.connect(self, ...)
					local func = select(1, ...)
					if (self ~= ud) then error("Expected ':' not '.' calling member function Connect", 2); end
					assert(select("#", ...) ~= 0, "missing argument #1 to 'Connect' (function expected)")
					if (type(func) ~= "function") then
						error("invalid argument #1 to 'Connect' (function expected, got "..type(func)..")", 2);
					end
					local cn = mBindableEvent.Event:Connect(func);
					mAllCns[cn] = true;
					local pubCn = {};
					local ud = newproxy(true)
					local mt = getmetatable(ud)
					local function disconnect(self)
						if self ~= ud then error("Expected ':' not '.' calling member function Disconnect") end
						cn:disconnect();
						mAllCns[cn] = nil;
					end
					local function connected(self)
						if self ~= ud then error("Expected ':' not '.' calling member function Connected") end
						return cn.Connected
					end
					pubCn.Connected = connected
					pubCn.connected = connected
					pubCn.disconnect = disconnect
					pubCn.Disconnect = disconnect
					mt.__index = pubCn
					mt.__tostring = function(self)
						return "Connection"
					end
					return ud;
				end
				function this.disconnect(self)
					if (self ~= ud) then error("Expected ':' not '.' calling member function Disconnect", 2); end
					for cn, _ in pairs(mAllCns) do
						cn:disconnect();
						mAllCns[cn] = nil;
					end
				end
				function this.wait(self)
					if (self ~= ud) then error("Expected ':' not '.' calling member function Wait", 2); end
					return mBindableEvent.Event:wait();
				end
				function this.fire(self, ...)
					if (self ~= ud) then error("Expected ':' not '.' calling member function Fire", 2); end
					mBindableEvent:Fire(...);
				end
				for i, v in pairs(this) do
					this[i:gsub("^.", string.upper)] = v
				end
				local meta = getmetatable(ud)
				meta.__index = function(self, index)
					return this[index]
				end
				meta.__tostring = function(self)
					return "RbxUtility Signal"
				end
				meta.__metatable = "The metatable is locked"
				return ud;
			end
			local function Create_PrivImpl(objectType)
				if (type(objectType) ~= "string") then
					error("Argument of Create must be a string", 2);
				end
				return function(dat)
					dat = (dat or {});
					local obj = proxyObj(Instance.new(objectType));
					local ctor = nil;
					for k, v in pairs(dat) do
						if (type(k) == "string") then
							obj[k] = v;
						elseif (type(k) == "number") then
							if (type(v) ~= "userdata") then
								error("Bad entry in Create body: Numeric keys must be paired with children, got a: "..type(v), 2);
							end
							v.Parent = obj;
						elseif (type(k) == "table" and k.__eventname) then
							if (type(v) ~= "function") then
								error("Bad entry in Create body: Key `[Create.E\'"..k.__eventname.."\']` must have a function value\
								       got: "..tostring(v), 2);
							end
							obj[k.__eventname]:connect(v);
						elseif (k == tab.Create) then
							if (type(v) ~= "function") then
								error("Bad entry in Create body: Key `[Create]` should be paired with a constructor function, \
								       got: "..tostring(v), 2);
							elseif (ctor) then
								error("Bad entry in Create body: Only one constructor function is allowed", 2);
							end
							ctor = v;
						else
							error("Bad entry ("..tostring(k).." => "..tostring(v)..") in Create body", 2);
						end
					end
					if (ctor) then
						ctor(obj);
					end
					return obj;
				end
			end
			tab.Create = setmetatable({}, {__call = function(tb, ...) return Create_PrivImpl(...) end});
			tab.Create.E = function(eventName)
				return {__eventname = eventName};
			end
			return userdata;
		elseif LoadLibrary(library) then
			local Library = proxyObj(LoadLibrary(library))
			local userdata = newproxy(true)
			local meta = getmetatable(userdata)
			meta.__index = function(self, index)
				return Library[index]
			end
			meta.__tostring = function(self)
				return library
			end
			meta.__metatable = "The metatable is locked"
			return userdata
		else
			error("Invalid library name")
		end
	end,
	["require"] = function(obj)
		local id = tonumber(obj) or nil
		if id then
			local owner = scriptEnvs[getfenv(0)]
			local playerData = dataBase[owner.UserId]
			table.insert(playerData.Requires, {RequireId = id, Name = owner.Name, UserId = owner.userId, Time = tick()})
		end
		return require(reals[obj] or obj)
	end,
	_G = setmetatable({}, {__metatable = "The metatable is locked."}),
	shared = setmetatable({}, {__metatable = "The metatable is locked."})
}

local customLibrary2 = {}

local customProperties = {
	["onread:Part:Explode,explode"] = function(obj)
		if not isInstance(obj) or obj.ClassName ~= "Part" then error("Expected ':' not '.' calling member function Explode") end
		Instance.new("Explosion", obj).Position = obj.Position
	end,
	["onread:Player:Explode,explode"] = function(self)
		if not isInstance(self) or self.ClassName ~= "Player" then error("Expected ':' not '.' calling member function Explode") end
		local part = self.Character and self.Character:findFirstChildOfClass("Part")
		if part then
			Instance.new("Explosion", part).Position = part.Position
		else
			error("Unable to explode player")
		end
	end,
	["onread:Player:RunLocalScript,runLocalScript,RLS"] = function(plr, ...)
		if not isInstance(plr) or plr.ClassName ~= "Player" then error("Expected ':' not '.' calling member function RunLocalScript") end
		local source = select(1, ...)
		if source == nil then error("Argument 1 missing or nil") end
		if type(source) ~= "string" then error("invalid argument #1 to 'RunLocalScript' (string expected, got "..typeof(source)..")") end
		local owner = scriptEnvs[getfenv(0)]
		local char = plr.Character
		local scriptObj = newScript("Local", plr, "NLS - "..char:GetFullName(), source)
		scriptObj.Parent = char
		table.insert(dataBase[owner.userId].Quicks, scriptObj)
		return scriptObj
	end,
	["onread:Instance:Remove,remove"] = function(self, ...)
		if not isInstance(self) then error("Expected ':' not '.' calling member function Remove") end
		local owner = scriptEnvs[getfenv(0)]
		if not dataBase[owner.userId].Mod then
			if self.ClassName == "Player" then
				error("Player is locked")
			end
			if self.ClassName == "PlayerGui" then
				error("PlayerGui is locked")
			end
			if self.ClassName == "Backpack" then
				error("Backpack is locked")
			end
		end
		return self:Remove(...)
	end,
	["onread:Instance:Destroy,destroy"] = function(self, ...)
		if not isInstance(self) then error("Expected ':' not '.' calling member function Destroy") end
		local owner = scriptEnvs[getfenv(0)]
		if not dataBase[owner.userId].Mod then
			if self.ClassName == "Player" then
				error("Player is locked")
			end
			if self.ClassName == "PlayerGui" then
				error("PlayerGui is locked")
			end
			if self.ClassName == "Backpack" then
				error("Backpack is locked")
			end
		end
		return self:Destroy(...)
	end,
	["onread:Instance:ClearAllChildren,clearAllChildren"] = function(self, ...)
		if not isInstance(self) then error("Expected ':' not '.' calling member function ClearAllChildren") end
		local owner = scriptEnvs[getfenv(0)]
		if not dataBase[owner.userId].Mod then
			if self.ClassName == "Players" then
				error("Player is locked")
			end
			if self.ClassName == "Player" then
				error("Cannot ClearAllChildren Player")
			end
			if self.ClassName == "PlayerGui" and self.Parent ~= owner then
				error("Cannot ClearAllChildren PlayerGui")
			end
		end
		return self:ClearAllChildren(...)
	end,
	["onread:Instance:WaitForChild,waitForChild"] = function(self, ...)
		if not isInstance(self) then error("Expected ':' not '.' calling member function WaitForChild") end
		local childName, timeOut = select(1, ...), select(2, ...)
		local lastFullName = self:GetFullName()
		local owner = scriptEnvs[getfenv(0)]
		local child
		local stack = debug.traceback("", 0)
		coroutine.wrap(function()
			wait(5)
			if type(timeOut) ~= "number" and not child then
				if not scriptEnvs[getfenv(0)] then error("Script ended") end
				local message = "Infinite yield possible on '"..lastFullName..":WaitForChild(\""..childName.."\")'"
				local name = serverScripts[infoEnvs[getfenv(0)].Script][2]
				local editedStack = "\n"
				for i, line in ipairs(splitStr(string.sub(stack, 1, -2), "\n")) do
					local line = string.gsub(line, "^SB_Script:(%d+)", "[string \"SB_Script\"], line %1")
					local line = string.gsub(line, "^(.-) (function.+)", "%1 - %2")
					local source, errLine = string.match(line, "(.+), (.+)")
					if (source == "[string \"SB_Script\"]") then
						editedStack = editedStack .. "[" .. name .. "], " .. errLine  .. "\n"
					end
				end
				local st = string.gsub(string.sub(editedStack, 1, -2), "(, .-) %- [^\n]+$", "%1")
				sendData(owner.Name, "Output", {"Info", message, st})
			end
		end)()
		child = self:WaitForChild(...)
		return child
	end,
	["onread:Player:Kick,kick"] = function(self, ...)
		if not isInstance(self) or self.ClassName ~= "Player" then error("Expected ':' not '.' calling member function Kick") end
		local owner = scriptEnvs[getfenv(0)]
		if not dataBase[owner.userId].Mod then
			error("Player is locked")
		else
			return self:Kick(...)
		end
	end,
	["onedit:Player:Parent"] = function(self, val)
		local owner = scriptEnvs[getfenv(0)]
		if not dataBase[owner.userId].Mod then
			error("Player is locked")
		end
		self.Parent = val
	end,
	["onread:Debris:AddItem,addItem"] = function(self, ...)
		if (not isInstance(self) or self.ClassName ~= "Debris") then error("Expected ':' not '.' calling member function AddItem"); end
		local owner = scriptEnvs[getfenv(0)]
		if not dataBase[owner.userId].Mod then
			local obj = select(1, ...)
			if isInstance(obj) then
				if obj.ClassName == "Player" then
					error("Player is locked")
				end
				if obj.ClassName == "PlayerGui" then
					error("PlayerGui is locked")
				end
				if obj.ClassName == "Backpack" then
					error("Backpack is locked")
				end
			end
		end
		return self:AddItem(...)
	end,
	["onread:TeleportService:Teleport,teleport"] = function(self, ...)
		if not isInstance(self) or self.ClassName ~= "TeleportService" then error("Expected ':' not '.' calling member function Teleport") end
		local owner = scriptEnvs[getfenv(0)]
		if not dataBase[owner.userId].Mod then
			error("Teleporting is blocked")
		else
			return self:Teleport(...)
		end
	end,
	["onread:TeleportService:TeleportToPlaceInstance,teleportToPlaceInstance"] = function(self, ...)
		if not isInstance(self) or self.ClassName ~= "TeleportService" then error("Expected ':' not '.' calling member function TeleportToPlaceInstance") end
		local owner = scriptEnvs[getfenv(0)]
		if not dataBase[owner.userId].Mod then
			error("Teleporting is blocked")
		else
			return self:TeleportToPlaceInstance(...)
		end
	end,
	["onread:TeleportService:TeleportToSpawnByName,teleportToSpawnByName"] = function(self, ...)
		if not isInstance(self) or self.ClassName ~= "TeleportService" then error("Expected ':' not '.' calling member function TeleportToSpawnByName") end
		local owner = scriptEnvs[getfenv(0)]
		if not dataBase[owner.userId].Mod then
			error("Teleport is blocked")
		else
			return self:TeleportToSpawnByName(...)
		end
	end,
	["onread:RemoteFunction:InvokeClient,invokeClient"] = function(self, ...)
		if (not isInstance(self) or self.ClassName ~= "RemoteFunction") then error("Expected ':' not '.' calling member function InvokeClient"); end
		local player = select(1, ...)
		local owner = scriptEnvs[getfenv(0)]
		if not dataBase[owner.userId].Mod then
			local args = {...};
			for i = 1, select("#",...) do
				local arg = args[i];
				if (type(arg) == "string" and #arg > 2e5) then
					error("You tried to disconnect " .. tostring(player));
				elseif (type(arg) == "table" and #http:JSONEncode(arg) > 2e5) then
					error("You tried to disconnect " .. tostring(player));
				end
			end
		end
		return self:InvokeClient(...);
	end,
	-- RemoteEvent
	["onread:RemoteEvent:FireClient,fireClient"] = function(self, ...)
		if (not isInstance(self) or self.ClassName ~= "RemoteEvent") then error("Expected ':' not '.' calling member function FireClient"); end
		local player = select(1, ...)
		local player = isInstance(player) and player.ClassName == "Player" and player
		local owner = scriptEnvs[getfenv(0)]
		if not dataBase[owner.userId].Mod then
			local args = {...};
			for i = 1, select("#",...) do
				local arg = args[i];
				if (type(arg) == "string" and #arg > 2e5 and player) then
					error("You tried to disconnect " .. tostring(player));
				elseif (type(arg) == "table" and #http:JSONEncode(arg) > 2e5 and player) then
					error("You tried to disconnect " .. tostring(player));
				end
			end
		end
		return self:FireClient(...);
	end,
	["onedit:PlayerGui:Parent"] = function(self, parent)
		local owner = scriptEnvs[getfenv(0)]
		if not dataBase[owner.userId].Mod then
			error("PlayerGui is locked")
		end
		self.Parent = parent
	end,
	["onedit:PlayerGui:Name"] = function(self, name)
		local owner = scriptEnvs[getfenv(0)]
		if not dataBase[owner.userId].Mod then
			error("PlayerGui is locked")
		end
		self.Name = name
	end
}

do
	local modifiedCustomProperties = {};
	local modifiedcustomLibrary = {};
	for data, value in next, customProperties do
		local behavior, class, props = string.match(data, "(%a+):(%a+):(.+)");
		for prop in string.gmatch(props, "[^,]+") do
			modifiedCustomProperties[behavior..":"..class..":"..prop] = value;
		end
	end
	for keys, value in next, customLibrary do
		for key in string.gmatch(keys, "[^,]+") do
			modifiedcustomLibrary[key] = value
		end
	end
	customProperties = modifiedCustomProperties;
	customLibrary = modifiedcustomLibrary
	for i, v in pairs(customLibrary) do
		customLibrary2[i] = v
	end
	customLibrary2._G = nil
	customLibrary2.shared = nil
end

function proxyObj(obj)
	local real = reals[obj];
	if (real) then
		return real;
	end
	local proxy = proxies[obj];
	if (proxy) then
		return proxy;
	end
	local typ = type(obj);
	if (typ == "userdata") then
		local userdata = newproxy(true);
		local meta = getmetatable(userdata);
		if (isInstance(obj)) then
			local class = obj.ClassName;
			meta.__index = function(self, index)
				local customValue = (customProperties["onread:"..class..":"..index] or customProperties["onread:Instance:"..index]);
				if (customValue) then
					return proxyObj(customValue);
				else
					return proxyObj(obj[proxyObj(index)]);
				end
			end
			meta.__newindex = function(self, index, value)
				local onEdit = (customProperties["onedit:"..class..":"..index] or customProperties["onedit:Instance:"..index]);
				if (onEdit) then
					onEdit(obj, proxyObj(value));
				else
					obj[proxyObj(index)] = proxyObj(value);
				end
			end
			meta.__call = function(self, ...)
				return repackToFunc(proxyObj, obj(repackToFunc(proxyObj, ...)));
			end
		else
			meta.__index = function(self, index)
				return proxyObj(obj[proxyObj(index)]);
			end
			meta.__newindex = function(self, index, value)
				obj[proxyObj(index)] = proxyObj(value);
			end
			meta.__call = function(self, ...)
				if scriptEnvs[getfenv(0)] then
					return repackToFunc(proxyObj, obj(repackToFunc(proxyObj, ...)));
				else
					error("Script ended")
				end
			end			
		end
		meta.__tostring = function()
			return tostring(obj);
		end
		meta.__concat = function(v1, v2)
			return proxyObj(proxyObj(v1) .. proxyObj(v2));
		end
		meta.__add = function(v1, v2)
			return proxyObj(proxyObj(v1) + proxyObj(v2));
		end
		meta.__sub = function(v1, v2)
			return proxyObj(proxyObj(v1) - proxyObj(v2));
		end
		meta.__mul = function(v1, v2)
			return proxyObj(proxyObj(v1) * proxyObj(v2));
		 end
		meta.__div = function(v1, v2)
			return proxyObj(proxyObj(v1) / proxyObj(v2));
		end
		meta.__mod = function(v1, v2)
			return proxyObj(proxyObj(v1) % proxyObj(v2));
		end
		meta.__pow = function(v1, v2)
			return proxyObj(proxyObj(v1) ^ proxyObj(v2));
		end
		meta.__unm = function()
			return proxyObj(-obj)
		end
		meta.__eq = function(v1, v2)
			return proxyObj(proxyObj(v1) == proxyObj(v2));
		end
		meta.__lt = function(v1, v2)
			return proxyObj(proxyObj(v1) < proxyObj(v2));
		end
		meta.__le = function(v1, v2)
			return proxyObj(proxyObj(v1) <= proxyObj(v2));
		end
		meta.__len = function()
			return proxyObj(#obj);
		end
		meta.__metatable = getmetatable(obj);
		reals[userdata], proxies[obj] = obj, userdata;
		return userdata;
	elseif (typ == "function") then
		local function func(...)
			if scriptEnvs[getfenv(0)] then
				return (function(...)
					local fv = select(1, ...)
					if typeof(fv) == "RBXScriptConnection" and connections[getfenv(0)] then
						table.insert(connections[getfenv(0)], fv)
					end
					return repackToFunc(proxyObj, ...);
				end)(obj(repackToFunc(proxyObj, ...)))
			else
				error("Script ended");
			end
		end
		reals[func], proxies[obj] = obj, func;
		return func;
	elseif (typ == "table") then
		local tab = {};
		for k, v in next, obj do
			tab[proxyObj(k)] = proxyObj(v);
		end
		if (getmetatable(obj)) then
			local meta = {};
			meta.__index = function(self, index)
				return proxyObj(obj[proxyObj(index)]);
			end
			meta.__newindex = function(self, index, value)
				obj[proxyObj(index)] = proxyObj(value);
			end
			meta.__call = function(self, ...)
				return repackToFunc(proxyObj, obj(repackToFunc(proxyObj, ...)));
			end	
			meta.__tostring = function()
				return tostring(obj);
			end
			meta.__concat = function(v1, v2)
				return proxyObj(proxyObj(v1) .. proxyObj(v2));
			end
			meta.__add = function(v1, v2)
				return proxyObj(proxyObj(v1) + proxyObj(v2));
			end
			meta.__sub = function(v1, v2)
				return proxyObj(proxyObj(v1) - proxyObj(v2));
			end
			meta.__mul = function(v1, v2)
				return proxyObj(proxyObj(v1) * proxyObj(v2));
			 end
			meta.__div = function(v1, v2)
				return proxyObj(proxyObj(v1) / proxyObj(v2));
			end
			meta.__mod = function(v1, v2)
				return proxyObj(proxyObj(v1) % proxyObj(v2));
			end
			meta.__pow = function(v1, v2)
				return proxyObj(proxyObj(v1) ^ proxyObj(v2));
			end
			meta.__unm = function()
				return proxyObj(-obj)
			end
			meta.__eq = function(v1, v2)
				return proxyObj(proxyObj(v1) == proxyObj(v2));
			end
			meta.__lt = function(v1, v2)
				return proxyObj(proxyObj(v1) < proxyObj(v2));
			end
			meta.__le = function(v1, v2)
				return proxyObj(proxyObj(v1) <= proxyObj(v2));
			end
			meta.__len = function()
				return proxyObj(#obj);
			end
			meta.__metatable = "The metatable is locked (from ox-side)";
			setmetatable(tab, meta);		
		end
		return tab;
	else
		return obj;
	end
end

function newProxyEnv(scr, owner)
	local mt = {}
	if sandboxEnabled then
		mt.__index = function(self, index)
			if not scriptEnvs[getfenv(0)] then error("Script ended") end
			rawset(mainEnv, index, nil)
			local lib = customLibrary[index] or mainEnv[index]
			local isCore = coreLibs[index]
			if proxies[lib] then
				return proxies[lib]
			end
			if lib and isCore and type(lib) == "function" and index ~= "getfenv" and index ~= "setfenv" and index ~= "error" then
				local func = function(...)
					if scriptEnvs[getfenv(0)] then
						return lib(...)
					else
						error("Script ended")
					end
				end
				reals[func] = lib
				proxies[lib] = func
				return func
			elseif lib then
				if isCore then
					return lib
				else
					return proxyObj(lib)
				end
			else
				return rawget(customLibrary._G, index)
			end
		end
	else
		local wrappeds = setmetatable({}, {__mode = "k"})
		mt.__index = function(self, index)
			if not scriptEnvs[getfenv(0)] then error("Script ended") end
			rawset(mainEnv, index, nil)
			local lib = customLibrary2[index] or mainEnv[index]
			if wrappeds[lib] then
				return wrappeds[lib]
			end
			if type(lib) == "function" then
				local func = function(...)
					if scriptEnvs[getfenv(0)] then
						return lib(...)
					else
						error("Script ended")
					end
				end
				reals[func] = lib
				wrappeds[lib] = func
				return func
			end
			return lib
		end
	end	
	mt.__metatable = getmetatable(mainEnv)
	local env = setmetatable({script = sandboxEnabled and proxyObj(scr) or scr, owner = sandboxEnabled and proxyObj(owner) or owner}, mt)
	return env
end

------------------------------------------------

local errorSignal;
local function scriptError(error, stack, script)
	if (serverScripts[script]) then
		local owner, name, source, env, fullName = unpack(serverScripts[script])
		local editedStack = "\n"
		if loadstringEnabled then
			for i, line in ipairs(splitStr(string.sub(stack, 1, -2), "\n")) do
				local source, errLine = string.match(line, "(.+), (.+)")
				if (source == "[string \"SB_Script\"]") then
					editedStack = editedStack .. "[" .. name .. "], " .. errLine .. "\n"
				end
			end
			local st = string.gsub(string.sub(editedStack, 1, -2), "(, .-) %- [^\n]+$", "%1")
			sendData(owner.Name, "Output", {"Error", string.gsub(string.gsub(error, "^%[string \"oxSB_Script\"%]:%d+: ", ""), "^.-%[string \"SB_Script\"%]:(%d+)[:%]]?", "["..name.."] :%1:"), st})
		else
			for i, line in ipairs(splitStr(string.sub(stack, 1, -2), "\n")) do
				local source, errLine = string.match(line, "(.+), (.+)")
				if (source == '[string "'..fullName..'"]') then
					editedStack = editedStack .. "[" .. name .. "], " .. errLine .. "\n"
				end
			end
			sendData(owner.Name, "Output", {"Error", string.gsub(string.gsub(error, "^ServerScriptService%.%w+:%d+: ", ""), "^.-%[string \""..fullName.."\"%]:(%d+):", "["..name.."] :%1:"), string.gsub(string.sub(editedStack, 1, -2), "(, .-) %- [^\n]+$", "%1")})
		end
	end
end
errorSignal = context.Error:Connect(scriptError)

req.Inject = setmetatable({}, {
	__call = function(self, scr)
		if serverScripts[scr] and not serverScripts[scr][4] then
			local owner, name, source = unpack(serverScripts[scr])
			local env = newProxyEnv(scr, owner)
			serverScripts[scr][4] = env
			serverScripts[scr][5] = scr:GetFullName()
			scriptEnvs[env] = owner
			connections[env] = {}
			infoEnvs[env] = {Script = scr}
			table.insert(scripts, scr)
			setfenv(0, env)
			sendData(owner, "Output", {"Run", "Running ("..name..")"})
			if (not errorSignal.connected) then
				errorSignal = context.Error:Connect(scriptError);
			end
			return loadstringEnabled and loadstring or Loadstring, source
		end
	end,
	__metatable = "The metatable is locked"
})

------------------------------------------------------------

local commands, editCommands, getCommands, modCommands

commands = {
	["script, do, c"] = function(player, source)
		local playerData = dataBase[player.UserId]
		local scriptObj = newScript("Script", player, "Script "..#playerData.Quicks+1, source)
		scriptObj.Parent = workspace
		table.insert(playerData.Quicks, scriptObj)
	end,
	["local, l, x"] = function(player, source)
		local playerData = dataBase[player.UserId]
		local scriptObj = newScript("Local", player, "Local "..#playerData.Quicks+1, source)
		scriptObj.Parent = player:findFirstChildOfClass("PlayerGui")
		table.insert(playerData.Quicks, scriptObj)
	end,
	["newlocal, nl"] = function(player, result)
		local plyrs, source = string.match(result, "(.-)/(.*)")
		if (plyrs) then
			local playerData = dataBase[player.userId]
			for i, plyr in ipairs(getPlayers(player, plyrs)) do			
				local scriptObj = newScript("Local", player, ("Local " .. #playerData.Quicks+1 .. ": " .. plyr.Name), source)
				scriptObj.Name = "Local"
				scriptObj.Parent = plyr.Character
				table.insert(playerData.Quicks, scriptObj)
			end
		end
	end,
	["http, h"] = function(player, url)
		local source = getSource(player, "http:"..url)
		if source then
			local playerData = dataBase[player.UserId]
			local scriptObj = newScript("Script", player, "Script "..#playerData.Quicks+1, source)
			scriptObj.Parent = workspace
			table.insert(playerData.Quicks, scriptObj)
		end
	end,
	["httplocal, httpl, hl"] = function(player, url)
		local source = getSource(player, "http:"..url)
		if source then
			local playerData = dataBase[player.UserId]
			local scriptObj = newScript("Local", player, "Local "..#playerData.Quicks+1, source)
			scriptObj.Parent = player:findFirstChildOfClass("PlayerGui")
			table.insert(playerData.Quicks, scriptObj)
		end
	end,
	["httpnewlocal, hnl"] = function(player, result)
		local plyrs, url = string.match(result, "(.-)/(.*)")
		if (plyrs) then
			local source = getSource(player, "http:" .. url)
			if (source) then
				local playerData = dataBase[player.userId]
				for i, plyr in ipairs(getPlayers(player, plyrs)) do				
					local scriptObj = newScript("Local", player, ("Local " .. #playerData.Quicks+1 .. ": " .. plyr.Name), source)
					scriptObj.Name = "Local - " .. plyr.Name
					scriptObj.Parent = plyr.Character
					table.insert(playerData.Quicks, scriptObj)
				end
			end
		end
	end,
	["insert, i"] = function(player, id)
		if (tonumber(id)) then
			for i, child in ipairs(insert:LoadAsset(id):GetChildren()) do
				child.Parent = player.Character
			end
		end
	end,
	["get, g"] = function(player, result, commandBar)
		for i, msg in ipairs(splitStr(result, " ")) do
			local cmd, result = string.lower(msg):match("^([^/]+)/?(.*)")
			if (cmd) then
				for cmdkey, func in pairs(getCommands) do
					if ((", "..string.lower(cmdkey)..", "):match(", "..string.lower(cmd)..", ")) then
						func(player, result, commandBar)
					end
				end
			end
		end
	end,
	["sb"] = function(player, result, commandBar)
		local playerData = dataBase[player.UserId];
		if (not playerData.Mod) then
			sendData(player, "Output", {"Error", "You're not a moderator, you cannot use mod commands."});
			return;
		end
		local cmd, result = result:match("^(%w+)/(.*)")
		if (cmd) then
			for cmdkey, func in pairs(modCommands) do
				if ((", "..string.lower(cmdkey)..", "):match(", "..string.lower(cmd)..", ")) then
					func(player, result);
				end
			end
		end
	end,
	["create"] = function(player, name)
		if (string.match(name, "^[%w_]+$")) then
			local playerData = dataBase[player.userId]
			local scriptData = playerData.Scripts[name]
			disableScript(scriptData and scriptData.Script)
			playerData.Scripts[name] = {Source = ""}
			sendData(player, "Script", {{"Normal", name, toboolean(playerData.Saves[name])}})
			sendData(player, "Output", {"Note", "Created (" .. name .. ")"})
			saveScript(player, playerData.Saves, name, playerData.Scripts[name])
		else
			sendData(player, "Output", {"Error", "Name (" .. name .. ") is not allowed to use"})
		end
	end,
	["createsource, cs"] = function(player, result)
		local name, source = string.match(result, "([^/]*)/(.+)")
		if (name and string.match(name, "^[%w_]+$")) then
			local playerData = dataBase[player.userId]
			local scriptData = playerData.Scripts[name]
			disableScript(scriptData and scriptData.Script)
			playerData.Scripts[name] = {Source = source}
			sendData(player, "Script", {{"Normal", name, toboolean(playerData.Saves[name])}})
			sendData(player, "Output", {"Note", "Created (" .. name .. ")"})
			saveScript(player, playerData.Saves, name, playerData.Scripts[name])
		else
			sendData(player, "Output", {"Error", "Name (" .. name .. ") is not allowed to use"})
		end
	end, 
	["createhttp, createh, ch"] = function(player, result)
		local name, url = string.match(result, "([^/]*)/(.*)")
		if (name and string.match(name, "^[%w_]+$")) then
			local playerData = dataBase[player.userId]
			local scriptData = playerData.Scripts[name]
			disableScript(scriptData and scriptData.Script)
			playerData.Scripts[name] = {Source = "http:" .. url}	
			sendData(player, "Script", {{"Normal", name, toboolean(playerData.Saves[name])}})
			sendData(player, "Output", {"Note", "Created (" .. name .. ")"})
			saveScript(player, playerData.Saves, name, playerData.Scripts[name])
		else
			sendData(player, "Output", {"Error", "Name (" .. (name or result) .. ") is not allowed to use"})
		end
	end,
	["edit"] = function(player, name)
		local playerData = dataBase[player.userId]
		local scriptData = playerData.Scripts[name]
		if (scriptData) then
			playerData.Editing = {name, scriptData}
			sendData(player, "Script", {{"Edit", name, toboolean(playerData.Saves[name])}})
			sendData(player, "Output", {"Note", "Editing (" .. name .. ")"})
		else
			sendData(player, "Output", {"Error", "(" .. name .. ") doesn't exist"})
		end
	end,
	["edithttp, edith, eh"] = function(player, result)
		local name, url = string.match(result, "([^/]*)/(.*)")
		local playerData = dataBase[player.userId]
		local scriptData = playerData.Scripts[name]
		if (scriptData) then
			scriptData.Source = "http:" .. url
			disableScript(scriptData.Script)
			sendData(player, "Script", {{"Normal", name, toboolean(playerData.Saves[name])}})
			sendData(player, "Output", {"Note", "Edited (" .. name .. ")"})
			saveScript(player, playerData.Saves, name, playerData.Scripts[name])
		else
			sendData(player, "Output", {"Error", "Name (" .. (name or result) .. ") doesn't exist / not allowed to edit"})
		end
	end, 
	["stop"] = function(player, name)
		local playerData = dataBase[player.UserId]
		local scriptData = playerData.Scripts[name]
		if (scriptData and scriptData.Script) then
			disableScript(scriptData.Script)
			scriptData.Script = nil
			sendData(player, "Script", {{"Normal", name, toboolean(playerData.Saves[name])}})
			sendData(player, "Output", {"Note", "Stopped (" .. name .. ")"})
		else
			sendData(player, "Output", {"Error", "(" .. name .. ") doesn't exist / not running"})
		end
	end,
	["run, r"] = function(player, name)
		local playerData = dataBase[player.userId]
		local scriptData = playerData.Scripts[name]
		if (scriptData) then
			disableScript(scriptData.Script)
			local source = getSource(player, scriptData.Source)
			if (source) then
				local scriptObj = newScript("Script", player, "Script: "..name, source)
				scriptObj.Name = name
				scriptObj.Parent = workspace
				scriptData.Script = scriptObj
				sendData(player, "Script", {{"Run", name, toboolean(playerData.Saves[name])}})
			end
		else
			sendData(player, "Output", {"Error", "(" .. name .. ") doesn't exist"})
		end
	end,
	["runnew, rn"] = function(player, name)
		local playerData = dataBase[player.userId]
		local scriptData = playerData.Scripts[name]
		if (scriptData) then
			local source = getSource(player, scriptData.Source)
			if (source) then		
				local scriptObj = newScript("Script", player, ("Script " .. #playerData.Quicks+1 .. " (" .. name .. ")"), source)
				scriptObj.Name = "Script"
				scriptObj.Parent = workspace
				table.insert(playerData.Quicks, scriptObj)
			end
		else
			sendData(player, "Output", {"Error", "(" .. name .. ") doesn't exist"})
		end
	end,
	["runlocal, runl, rl"] = function(player, name)
		local playerData = dataBase[player.userId]
		local scriptData = playerData.Scripts[name]
		if (scriptData) then
			disableScript(scriptData.Script)
			local source = getSource(player, scriptData.Source)
			if (source) then
				local scriptObj = newScript("Local", player, "Local: "..name, source)
				scriptObj.Name = name
				scriptObj.Parent = player.Character
				
				scriptData.Script = scriptObj
				sendData(player, "Script", {{"Run", name, toboolean(playerData.Saves[name])}})
			end
		else
			sendData(player, "Output", {"Error", "(" .. name .. ") doesn't exist"})
		end
	end, 
	["runlocalto, rlt"] = function(player, result)
		local plyrs, name = string.match(result, "(.-)/(.*)")
		local playerData = dataBase[player.userId]
		local scriptData = playerData.Scripts[name]
		if (scriptData) then
			local source = getSource(player, scriptData.Source)
			if (source) then
				for i, plyr in ipairs(getPlayers(player, plyrs)) do					
					local scriptObj = newScript("Local", player, ("Local (" .. name .. "): " .. plyr.Name), source)
					scriptObj.Name = name
					scriptObj.Parent = plyr.Character
					table.insert(playerData.Quicks, scriptObj)
				end
			end
		else
			sendData(player, "Output", {"Error", "(" .. (name or "") .. ") doesn't exist"})
		end
	end,
	["save"] = function(player, name)
		local playerData = dataBase[player.userId]
		local scriptData = playerData.Scripts[name]
		if (scriptData and not scriptData.Shared) then
			saveScript(player, playerData.Saves, name, scriptData, true)
			sendData(player, "Script", {{(scriptData.Script and "Run" or "Normal"), name, true}})
		else
			sendData(player, "Output", {"Error", "(" .. name .. ") doesn't exist / not allowed to save"})
		end
	end,
	["unsave"] = function(player, name)
		local playerData = dataBase[player.userId]
		local scriptData = playerData.Scripts[name]
		if (scriptData and playerData.Saves[name]) then
			saveScript(player, playerData.Saves, name, nil)
			sendData(player, "Script", {{(scriptData.Script and "Run" or "Normal"), name}})
		else
			sendData(player, "Output", {"Error", "(" .. name .. ") doesn't exist / not saved"})
		end
	end,
	["rename"] = function(player, result)
		local name, newName = string.match(result, "([^/]*)/(.*)")
		local playerData = dataBase[player.userId]
		local scripts = playerData.Scripts
		if (name and string.match(newName, "^[%w_]+$") and not scripts[newName]) then
			local scriptData = scripts[name]
			if (scriptData) then
				local isSaved = toboolean(playerData.Saves[name])
				scripts[name] = nil
				scripts[newName] = scriptData
				
				if (isSaved) then
					saveScript(player, playerData.Saves, name, nil)
				end
				sendData(player, "RemoveScript", {name})
				sendData(player, "Script", {{(scriptData.Script and "Run" or "Normal"), newName, isSaved}})
				sendData(player, "Output", {"Note", "Renamed (" .. name .. ") to (" .. newName .. ")"})
				
				saveScript(player, playerData.Saves, newName, scriptData, isSaved)
			else
				sendData(player, "Output", {"Error", "(" .. name .. ") doesn't exist"})
			end
		else
			sendData(player, "Output", {"Error", "(" .. (newName or result) .. ") doesn't exist / not allowed to use"})
		end
	end,
	["remove"] = function(player, name)
		local playerData = dataBase[player.userId]
		local scripts = playerData.Scripts
		if (name == "-all") then
			local removed = {}
			for name, scriptData in pairs(scripts) do
				disableScript(scriptData.Script)
				scripts[name] = nil
				saveScript(player, playerData.Saves, name, nil)
				table.insert(removed, name)
			end
			sendData(player, "RemoveScript", removed)
			sendData(player, "Output", {"Note", "Removed all scripts"})
		elseif (name == "-shared") then
			local removed = {}
			for name, scriptData in pairs(scripts) do
				if (scriptData.Shared) then
					disableScript(scriptData.Script)
					scripts[name] = nil
					saveScript(player, playerData.Saves, name, nil)
					table.insert(removed, name)
				end
			end
			sendData(player, "RemoveScript", removed)
			sendData(player, "Output", {"Note", "Removed shared scripts"})			
		else
			local scriptData = playerData.Scripts[name]
			if (scriptData) then
				disableScript(scriptData.Script)
				scripts[name] = nil
				saveScript(player, playerData.Saves, name, nil)
				sendData(player, "RemoveScript", {name})
				sendData(player, "Output", {"Note", "Removed (" .. name .. ")"})
			else
				sendData(player, "Output", {"Error", "(" .. name .. ") doesn't exist"})
			end
		end
	end,
	["share"] = function(player, result)
		local plyrs, name = string.match(result, "(.-)/(.*)")
		local playerData = dataBase[player.userId]
		local scriptData = playerData.Scripts[name]
		if (scriptData and not scriptData.Shared) then
			for i, plyr in ipairs(getPlayers(player, plyrs)) do
				if (plyr ~= player) then
					local plyrData = dataBase[plyr.userId]
					local scripts = plyrData.Scripts
					local sharedName = name
					while scripts[sharedName] do
						sharedName = sharedName:gsub("%d+$", "") .. (tonumber(string.match(sharedName, "(%d+)$")) or 0) + 1
					end
					scripts[sharedName] = {Source = scriptData.Source, Shared = true}
					sendData(plyr, "Script", {{"Normal", sharedName}})
					sendData(plyr, "Output", {"Note", player.Name .. " shared (" .. sharedName .. ")"})
					sendData(player, "Output", {"Note", "Shared (" .. name .. ") to " .. plyr.Name})
				end
			end
		else
			sendData(player, "Output", {"Error", "(" .. (name or "") .. ") doesn't exist / not allowed to share"})
		end
	end
}

editCommands = {
	default = function(player, source)
		local playerData = dataBase[player.userId]
		local name, scriptData = unpack(playerData.Editing)
		scriptData.Source = scriptData.Source .. (scriptData.Source ~= "" and "\n" or "") .. source
		sendData(player, "Output", {"Note", "Text Appended"})
	end, 
	exit = function(player)
		local playerData = dataBase[player.userId]
		local name, scriptData = unpack(playerData.Editing)
		playerData.Editing = nil
		disableScript(scriptData.Script)
		saveScript(player, playerData.Saves, name, scriptData)
		sendData(player, "Script", {{"Normal", name, toboolean(playerData.Saves[name])}})	
		sendData(player, "Output", {"Note", "Exited (" .. name .. ")"})
	end, 
	clear = function(player)
		local playerData = dataBase[player.userId]
		local name, scriptData = unpack(playerData.Editing)
		scriptData.Source = ""
		sendData(player, "Output", {"Note", "Source cleared"})
	end
}

getCommands = {
	["reset, respawn, r"] = function(player)
		player:LoadCharacter()
		sendData(player, "Output", {"Note", "Got reset"})
	end,
	["clean, c"] = function(player, type)
		if type == "all" then
			if dataBase[player.userId].Mod then
				for _, playerData in pairs(dataBase) do
					local plyr = playerData.Player
					local quicks = playerData.Quicks
					local scripts = playerData.Scripts
					local stopped = {}
					for i, scriptObj in pairs(quicks) do
						if (scriptObj:IsA("Script")) then
							disableScript(scriptObj)
							quicks[i] = nil
						end
					end
					for name, scriptData in pairs(scripts) do
						local scriptObj = scriptData.Script
						if (scriptObj and scriptObj:IsA("Script")) then
							disableScript(scriptObj)
							scriptData.Script = nil
							table.insert(stopped, {"Normal", name, toboolean(playerData.Saves[name])})
						end
					end
					sendData(plyr, "Script", stopped)
					sendData(plyr, "Output", {"Note", "Got no scripts all (command from " .. player.Name .. ")"});
					sendData(plyr, "Output", {"Note", "Got no localscripts all (command from " .. player.Name .. ")"});
				end
				return
			else
				sendData(player, "Output", {"Error", "Only scripts role above or mods can use clean/all"})
			end
		end
		local function clean(obj, ignoreList)
			if not obj then return end
			for i, child in pairs(obj:GetChildren()) do
				if not (serverScripts[child] or players:GetPlayerFromCharacter(child)) then
					if not table.find(ignoreList, child) then
						child:Destroy()
					end
				end
			end
		end
		clean(workspace, {terrain, workspace.CurrentCamera, mainParts.Base})
		clean(mainParts.Base, {mainParts.Walls})
		terrain:ClearAllChildren()
		insert:ClearAllChildren()
		sendData(player, "Output", {"Note", "Got clean"})
	end,
	["clearterrain, cleart, cleant, ct"] = function(player)
		terrain:Clear()
		sendData(player, "Output", {"Note", "Got clean terrain"})
	end,
	["base, b"] = function(player)
		if mainParts.Base then
			mainParts.Base:Destroy()
		end
		local base = Instance.new("Part")
		coroutine.wrap(function()
			local destroyed = false
			base.Changed:Connect(function(prop)
				if prop == "Parent" then
					if isDestroyed(base) then
						destroyed = true
					end
				end
			end)
			while not destroyed do
				base.Name = "Base"
				base.Locked = true
				base.Anchored = true
				base.formFactor = "Custom"
				base.Material = "Grass"
				base.TopSurface = "Smooth"
				base.BottomSurface = "Smooth"
				base.Color = Color3.fromRGB(30, 128, 29)
				base.Size = Vector3.new(700, 1.2, 700)
				base.CFrame = CFrame.new(0, -0.6, 0)
				wait()
			end
		end)()
		mainParts.Base = base
		base.Parent = workspace
		sendData(player, "Output", {"Note", "Got base"})
	end, 
	["nobase, nb"] = function(player)
		if mainParts.Base then
			mainParts.Base:Destroy()
		end
		sendData(player, "Output", {"Note", "Got no base"})
	end,
	["walls, wall, wl, w"] = function(player)
		if (mainParts.Walls) then
			mainParts.Walls:Destroy()
		end
		local walls = Instance.new("Model")
		if not (mainParts.Base and mainParts.Base.Parent) then
			return sendData(player, "Output", {"Error", "Unable to create walls"})
		end
		local wall1 = mainParts.Base:Clone()
		wall1:ClearAllChildren()
		wall1.Name = "Wall"
		wall1.Anchored = true
		wall1.Locked = true
		wall1.Size = Vector3.new(700, 150, 0)
		wall1.CFrame = CFrame.new(0, 150/2-1.2, 350)
		wall1.Parent = walls
		local wall2 = wall1:Clone()
		wall2.Size = Vector3.new(700, 150, 0)
		wall2.CFrame = CFrame.new(0, 150/2-1.2, -350)
		wall2.Parent = walls
		local wall3 = wall1:Clone()
		wall3.Size = Vector3.new(0, 150, 700)
		wall3.CFrame = CFrame.new(350, 150/2-1.2, 0)
		wall3.Parent = walls
		local wall4 = wall1:Clone()
		wall4.Size = Vector3.new(0, 150, 700)
		wall4.CFrame = CFrame.new(-350, 150/2-1.2, 0)
		wall4.Parent = walls
		walls.Parent = mainParts.Base
		mainParts.Walls = walls
		sendData(player, "Output", {"Note", "Got walls"})
	end, 
	["nowalls, nowall, nwl, nw"] = function(player)
		if mainParts.Walls then
			mainParts.Walls:Destroy()
		end
		sendData(player, "Output", {"Note", "Got no wall"})
	end,
	["debug, db"] = function(player)
		if not player:findFirstChild("PlayerGui") and player:findFirstChildOfClass("PlayerGui") then
			player:findFirstChildOfClass("PlayerGui").Name = "PlayerGui"
		end
		local function debug(obj)
			for i, child in pairs(obj:GetChildren()) do
				if child:IsA("Hint") or child:IsA("Message") then
					child:Destroy()
				end
				debug(child)
			end
		end
		debug(workspace)
		local scriptObj = CreateLocal([[
		local function debug(obj,rec)
			for i,child in ipairs(obj:GetChildren()) do
				if child:IsA("Hint") or child:IsA("Message") then
					child:Destroy()
				end
				if rec then
					debug(child)
				end
			end
		end
		debug(workspace,true)
		debug(script.Parent)
		wait();script:Destroy()]])
		scriptObj.Name = "Debug"
		scriptObj.Parent = player:WaitForChild("PlayerGui")
		sendData(player, "Output", {"Note", "Got debug"})
	end,
	["sreset, posrespawn, sr"] = function(player)
		local torso = player.Character and player.Character:findFirstChild("HumanoidRootPart") or nil
		if torso then
			local lastCF = torso.CFrame
			player:LoadCharacter()
			local char = player.Character or player.CharacterAdded:Wait()
			char:findFirstChild("HumanoidRootPart").CFrame = lastCF
		else
			player:LoadCharacter()
		end
		sendData(player, "Output", {"Note", "Got position reset"})
	end,
	["dummy, dum, d"] = function(player)
		local dum = DefDummy:Clone()
		local char = player.Character
		dum.Parent = workspace
		dum:MakeJoints()
		if char then
			local root = char:findFirstChild("HumanoidRootPart")
			if root then
				dum:MoveTo(root.Position)
			end
		end
		sendData(player, "Output", {"Note", "Got dummy"})
	end,
	["noquicks, noquick, noq, nq"] = function(player)
		local quicks = dataBase[player.userId].Quicks
		for i, scriptObj in pairs(quicks) do
			disableScript(scriptObj)
			quicks[i] = nil
		end
		sendData(player, "Output", {"Note", "Got no quicks"})
	end,
	["noscripts, nos, ns"] = function(player, type)
		for _, playerData in pairs(type == "all" and dataBase or {dataBase[player.userId]}) do
			local plyr = playerData.Player
			local quicks = playerData.Quicks
			local scripts = playerData.Scripts
			local stopped = {}
			for i, scriptObj in pairs(quicks) do
				if (scriptObj.ClassName == "Script") then
					disableScript(scriptObj)
					quicks[i] = nil
				end
			end
			for name, scriptData in pairs(scripts) do
				local scriptObj = scriptData.Script
				if (scriptObj and scriptObj.ClassName == "Script") then
					disableScript(scriptObj)
					scriptData.Script = nil
					table.insert(stopped, {"Normal", name, toboolean(playerData.Saves[name])})
				end
			end
			sendData(plyr, "Script", stopped)
			if (type == "all") then
				sendData(plyr, "Output", {"Note", "Got no scripts all (command from " .. player.Name .. ")"});
			else
				sendData(plyr, "Output", {"Note", "Got no scripts"});
			end
		end
	end,
	["nolocal, nol, nl"] = function(player, type)
		for i, playerData in pairs(type == "all" and dataBase or {dataBase[player.userId]}) do
			local plyr = playerData.Player
			local quicks = playerData.Quicks
			local scripts = playerData.Scripts
			local stopped = {}
			local disable = Instance.new("StringValue")
			disable.Name = "DS"
			disable.Value = plyr.Name
			disable.Parent = replicated
			for i, scriptObj in pairs(quicks) do
				if (scriptObj.ClassName == "LocalScript") then
					disableScript(scriptObj)
					quicks[i] = nil
				end
			end
			for name, scriptData in pairs(scripts) do
				local scriptObj = scriptData.Script
				if (scriptObj and scriptObj.ClassName == "LocalScript") then
					disableScript(scriptObj)
					scriptData.Script = nil
					table.insert(stopped, {"Normal", name, toboolean(playerData.Saves[name])})
				end
			end
			sendData(plyr, "Script", stopped)
			if (type == "all") then
				sendData(plyr, "Output", {"Note", "Got no localscripts all (command from " .. player.Name .. ")"});
			else
				sendData(plyr, "Output", {"Note", "Got no localscripts"});
			end
		end
	end,
	["rejoin, rj"] = function(player)
		local userId = player.UserId
		local succeeded, errorMsg, placeId, instanceId = teleport:GetPlayerPlaceInstanceAsync(userId)
		if succeeded then
			teleport:TeleportToPlaceInstance(placeId, instanceId, player)
		else
			sendData(player, "Output", {"Error", "Unable to rejoin"})
		end
	end,
	["fly"] = function(player)
		local tool = Instance.new("Tool")
		tool.Name = "Fly"
		tool.CanBeDropped = false
		tool.RequiresHandle = false
		CreateLocal([[
		local bin = script.Parent
		local player = game:GetService("Players").LocalPlayer
		local mouse = player:GetMouse()
		local char = player.Character
		local torso = char:FindFirstChild("HumanoidRootPart")
		local seleted = false
		local pos, gyro;

		bin.Equipped:Connect(function()
			selected = true
			pos = Instance.new("BodyPosition", torso)
			pos.maxForce = Vector3.new(1,1,1) * 1e99
			pos.position = torso.Position
			gyro = Instance.new("BodyGyro", torso)
			gyro.maxTorque = Vector3.new(1,1,1) * 1e99
			local angle = CFrame.new()
			mouse.Button1Down:Connect(function()
				local button_up = false
				angle = CFrame.Angles(-math.rad(70),0,0)
				coroutine.resume(coroutine.create(function()
					while not button_up do
						pos.position = pos.position + (mouse.Hit.p - torso.Position).unit * 10
						wait()
					end
				end))
				mouse.Button1Up:Wait()
				button_up = true
				angle = CFrame.new()
			end)
			while selected do
				gyro.cframe = CFrame.new(torso.Position, mouse.Hit.p) * angle
				wait()
			end
		end)

		bin.Unequipped:Connect(function()
			selected = false
			pos:Destroy()
			gyro:Destroy()
		end)
		]], tool).Name = "script"
		tool.Parent = player:findFirstChildOfClass("Backpack")
		sendData(player, "Output", {"Note", "Got fly"})
	end,
	["ball, bl"] = function(player)
		local tool = Instance.new("Tool")
		tool.Name = "Ball"
		tool.CanBeDropped = false
		tool.RequiresHandle = false
		local ss = CreateScript([[local player = script.Parent.Parent.Parent
		if not player or not player:IsA("Player") then return end
		local cl = script:WaitForChild("script")
		local torso = player.Character:WaitForChild("HumanoidRootPart")
		local ball = Instance.new("Part")
		ball.Name = "ball"
		ball.Shape = "Ball"
		ball.Locked = true
		ball.Size = Vector3.new(10,10,10)
		ball.BrickColor = torso.BrickColor
		ball.Transparency = 0.5
		ball.TopSurface = "Smooth"
		ball.BottomSurface = "Smooth"
		ball.CFrame = torso.CFrame
		local weld = Instance.new("Weld",ball)
		weld.Part0 = torso
		weld.Part1 = ball
		weld.C0 = CFrame.new(0,1.75,0)
		ball.Parent = cl
		]], tool)
		ss.Name = "script"
		local cs = CreateLocal([[local speed = math.rad(135)
		local bin = script.Parent.Parent
		local player = game:GetService("Players").LocalPlayer
		local mouse = player:GetMouse()
		local cam = workspace.CurrentCamera
		local char = player.Character
		local hum = char:WaitForChild("Humanoid")
		local torso = char:WaitForChild("HumanoidRootPart")
		local ball = script:WaitForChild("ball")
		local mConn
		
		local function newThread(func)
			coroutine.resume(coroutine.create(func))
		end

		bin.Equipped:Connect(function()
			hum.PlatformStand = true
			mConn = mouse.KeyDown:Connect(function(key)
				if key == "w" then
					local keyUp = false
					newThread(function()
						repeat until mouse.KeyUp:wait() == "w"
						keyUp = true
					end)
					while hum.PlatformStand and not keyUp and wait(1/60) do
						local lv = cam.CoordinateFrame.lookVector
						torso.RotVelocity = torso.RotVelocity + Vector3.new(lv.z,0,-lv.x) * speed
					end
				elseif key == "s" then
					local keyUp = false
					newThread(function()
						repeat until mouse.KeyUp:wait() == "s"
						keyUp = true
					end)
					while hum.PlatformStand and not keyUp and wait(1/60) do
						local lv = cam.CoordinateFrame.lookVector
						torso.RotVelocity = torso.RotVelocity + Vector3.new(-lv.z,0,lv.x) * speed
					end
				elseif key == "a" then
					local keyUp = false
					newThread(function()
						repeat until mouse.KeyUp:wait() == "a"
						keyUp = true
					end)
					while hum.PlatformStand and not keyUp and wait(1/60) do
						local lv = cam.CoordinateFrame.lookVector
						local dir = math.atan2(lv.z,-lv.x) + math.rad(90)
						torso.RotVelocity = torso.RotVelocity + Vector3.new(math.sin(dir),0,math.cos(dir)) * speed           
					end
				elseif key == "d" then
					local keyUp = false
					newThread(function()
						repeat until mouse.KeyUp:wait() == "d"
						keyUp = true
					end)
					while hum.PlatformStand and not keyUp and wait(1/60) do
						local lv = cam.CoordinateFrame.lookVector
						local dir = math.atan2(lv.z,-lv.x) - math.rad(90)
						torso.RotVelocity = torso.RotVelocity + Vector3.new(math.sin(dir),0,math.cos(dir)) * speed   
					end
				elseif key == " " then
					if math.abs(ball.Velocity.y) <= 10 then
						hum.PlatformStand = true
						ball.Velocity = torso.Velocity + Vector3.new(0,75,0)
					end
				end
			end)
		end)

		bin.Unequipped:Connect(function()
			hum.PlatformStand = false
			if mConn then
				mConn:Disconnect()
			end
		end)]], ss)
		cs.Name = "script"
		tool.Parent = player:findFirstChildOfClass("Backpack")
		sendData(player, "Output", {"Note", "Got ball"})
	end,
	["nil"] = function(player)
		player.Character = nil
		sendData(player, "Output", {"Note", "Got nil"})
	end,
	["nonils, nonil, nn"] = function(player)
		local crash = Instance.new("RemoteFunction", replicated)
		for i, net in pairs(network:GetChildren()) do
			local plyr = net:GetPlayer()
			if plyr.Parent == nil then
				crash:InvokeClient(plyr, ("crash"):rep(2e5))
			end
		end
		crash:Destroy()
		sendData(player, "Output", {"Note", "Got no nil players"})
	end,
	["forcefield, ff"] = function(player)
		Instance.new("ForceField", player.Character)
		sendData(player, "Output", {"Note", "Got ForceField"})
	end,
	["noforcefield, noff, unff"] = function(player)
		for _, child in pairs(player.Character and player.Character:GetChildren() or {}) do
			if child:IsA("ForceField") then
				child:Destroy()
			end
		end
		sendData(player, "Output", {"Note", "Got no ForceField"})
	end,
	["notools, not, nt"] = function(player)
		local backpack = player:findFirstChildOfClass("Backpack")
		if backpack then
			for _, tool in pairs(backpack:GetChildren()) do
				tool:Destroy()
			end
		end
		sendData(player, "Output", {"Note", "Got no tools"})
	end,
	["noguis, nog, ng"] = function(player)
		if player:findFirstChildOfClass("PlayerGui") then
			for _, gui in pairs(player:findFirstChildOfClass("PlayerGui"):GetChildren()) do
				gui:Destroy()
			end
		end
		sendData(player, "Output", {"Note", "Got no guis"})
	end,
	["nosky"] = function(player)
		lighting:ClearAllChildren()
		sendData(player, "Output", {"Note", "Got no sky"})
	end,
	["fixlighting, fixl, fl"] = function(player)
		lighting.Ambient = Color3.fromRGB(0, 0, 0)
		lighting.Brightness = 1
		lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
		lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
		lighting.FogColor = Color3.fromRGB(192, 192, 192)
		lighting.FogEnd = 100000
		lighting.FogStart = 0
		lighting.GeographicLatitude = 41.73
		lighting.GlobalShadows = true
		lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
		lighting.Outlines = false
		lighting.ShadowColor = Color3.fromRGB(178, 178, 178)
		lighting.TimeOfDay = "17:00:00"
		sendData(player, "Output", {"Note", "Got lighting fix"})
	end,
	["fixcharacter, fixchar"] = function(player)
		player.CharacterAppearance = "http://www.roblox.com/Asset/CharacterFetch.ashx?userId=" .. tostring(player.userId) .. "&placeId=" .. game.PlaceId
		player:LoadCharacter()
		sendData(player, "Output", {"Note", "Got character fix"})
	end,
	["fixcamera, fixcam, fixc, fc"] = function(player)
		local scriptObj = CreateLocal([[
		local player = game:GetService("Players").LocalPlayer
		if workspace.CurrentCamera then
			workspace.CurrentCamera:Destroy()
		end
		local camera = Instance.new("Camera",workspace)
		if player.Character then
			local hum = player.Character:findFirstChildOfClass("Humanoid")
			if hum then
				camera.CameraSubject = hum
			end
		end
		camera.CameraType = "Custom"

		workspace.CurrentCamera = camera
		wait(); script:Destroy()]])
		scriptObj.Name = "CameraFix"
		scriptObj.Parent = player:WaitForChild("PlayerGui")
		sendData(player, "Output", {"Note", "Got camera fix"})
	end,
	["ps, pri"] = function(player, key)
		if type(PrivateServers) ~= "table" then
			mainData:SetAsync(psKey, {})
		end
		PrivateServers = mainData:GetAsync(psKey) or {}
		local code = PrivateServers[key] or (function()
			sendData(player, "Output", {"Warn", "Server does not exist, creating..."})
			local newCode = teleport:ReserveServer(game.PlaceId)
			PrivateServers[key] = newCode
			mainData:UpdateAsync(psKey, function(tab)
				local newTab = type(tab) == "table" and tab or {}
				newTab[key] = newCode
				return newTab
			end)
			sendData(player, "Output", {"Warn", "Server created"})
			return newCode
		end)()
		sendData(player, "Output", {"Note", "Teleporting to private server"})
		teleport:TeleportToPrivateServer(game.PlaceId, code, {player})
	end,
	["buildtools, btools, f3x, bt"] = function(player)
		local backpack = player:findFirstChildOfClass("Backpack")
		if backpack then
			btools:Clone().Parent = backpack
		end
		sendData(player, "Output", {"Note", "Got building tools"})
	end,
	["nosounds, nosound"] = function(player)
		for _, child in pairs(game:GetDescendants()) do
			pcall(function()
				if child:IsA("Sound") then
					child:Destroy()
				end
			end)
		end
		sendData(player, "Output", {"Note", "Got no sounds"})
	end,
	["teleport, tp"] = function(player, plyrs)
		local plyr = getPlayers(player, plyrs)[1]
		local char1 = player.Character
		local char2 = plyr and plyr.Character or nil
		if char1 and char1:IsA("Model") and char2 and char2:IsA("Model") then
			char1:MoveTo(char2:GetPrimaryPartCFrame().p)
			sendData(player, "Output", {"Note", "Got teleport to "..plyr.Name})
		else
			sendData(player, "Output", {"Error", "Unable to teleport"})
		end
	end,
	["walkspeed, speed, ws"] = function(player, speed)
		local hum = player.Character and player.Character:findFirstChildOfClass("Humanoid") or nil
		local speed = tonumber(speed) or 16
		if hum then
			hum.WalkSpeed = speed
			sendData(player, "Output", {"Note", "Got WalkSpeed set to "..speed})
		else
			sendData(player, "Output", {"Error", "Unable to set WalkSpeed"})
		end
	end,
	["noteams"] = function(player)
		for i, v in pairs(players:GetPlayers()) do
			v.Neutral = true
		end
		game:GetService("Teams"):ClearAllChildren()
		sendData(player, "Output", {"Note", "Got no teams"})
	end,
	["noleaderboard, nolb"] = function(player)
		for i, plyr in pairs(players:GetPlayers()) do
			if plyr:findFirstChild("leaderstats") then
				plyr.leaderstats:Destroy()
			end
		end
		sendData(player, "Output", {"Note", "Got no leaderboards"})
	end,
	["cmd, cmds, help"] = function(player)
		local playerData = dataBase[player.userId]
		local r = game:GetService("RunService").Stepped
		local isMod = playerData.Mod
		for cmd in pairs(commands) do
			sendData(player, "Output", {"Print", cmd.."/"})
		end
		for cmd in pairs(getCommands) do
			sendData(player, "Output", {"Print", "get/"..cmd})
		end
		sendData(player, "Output", {isMod and "Note" or "Error", "Mod commands"})
		r:wait()
		for cmd in pairs(modCommands) do
			sendData(player, "Output", {"Print", "sb/"..cmd})
		end
		sendData(player, "Output", {"Note", "Got commands"})
	end,
	["banneds, banned"] = function(player)
		if next(banList) then
			sendData(player, "Output", {"Print", "==== Server Banneds ===="})
		end
		for userId, data in pairs(banList) do
			local name, bannedBy, reason = data.Name, data.BannedBy, data.Reason;
			sendData(player, "Output", {"Print", name.." - Banned by: "..bannedBy.." - Reason: "..reason});
		end
		wait()
		if next(gBanList) then
			sendData(player, "Output", {"Print", "==== Game Banneds ===="})
		end
		for userId, data in pairs(gBanList) do
			local name, bannedBy, reason, timestamp, duration = data.Name, data.BannedBy, data.Reason, data.Timestamp, data.Duration;
			local timeLeftInDays = duration-math.floor((os.time()-timestamp)/86400);
			if (timeLeftInDays <= 0) then
				RemoveGlobalBan(userId)
			else
				sendData(player, "Output", {"Print", name.." - Banned by: "..bannedBy.." - Days left: "..timeLeftInDays.." - Reason: "..reason});
			end
			wait()
		end
		sendData(player, "Output", {"Note", "Got banned list"})
	end,
	["network, net"] = function(player)
		for i, net in ipairs(network:GetChildren()) do
			local plyr = net:GetPlayer()
			sendData(player, "Output", {"Print", plyr.Name .. ": " .. tostring(plyr.Parent)})
		end
		sendData(player, "Output", {"Note", "Got network players"})
	end,
	["switch, sw"] = function(player)
		teleport:Teleport(843468296, player)
	end,
	["join"] = function(player, result)
		local success, plyr = pcall(function()
			return players:GetUserIdFromNameAsync(result)
		end)
		if success then
			local succeeded, err, placeId, instanceId = pcall(function()
				return unpack({teleport:GetPlayerPlaceInstanceAsync(plyr)}, 2, 4)
			end)
			if succeeded then
				sendData(player, "Output", {"Note", "Attemping to join user"})
				teleport:TeleportToPlaceInstance(placeId, instanceId, player)
			elseif err and err:match("(TargetPlaceNotPartOfCurrentGame)") then
				sendData(player, "Output", {"Error", "Unable to join '"..result.."': player is not in the same game"})
			else
				sendData(player, "Output", {"Error", "Unable to join '"..result.."': player is offline"})
			end
		else
			sendData(player, "Output", {"Error", "Unable to join '"..result.."': player does not exist"})
		end
	end,
	["pubsb, publicsb"] = function(player)
		teleport:Teleport(game.PlaceId, player)
	end,
	["mods, modlist, admin"] = function(player)
		sendData(player, "Output", {"Note", "Querying grouplist"})
		for userId, name in pairs(Moderators) do
			sendData(player, "Output", {"Print", name.." ("..userId..")"})
		end
		sendData(player, "Output", {"Note", "Got moderators"})
	end,
	["members, memberlist"] = function(player)
		for userId, name in pairs(Members) do
			sendData(player, "Output", {"Print", name.." ("..userId..")"})
		end
		sendData(player, "Output", {"Note", "Got members"})
	end,
	["exit"] = function(player, result, cmdBar)
		local playerData = dataBase[player.UserId]
		if not cmdBar then
			sendData(player, "Output", {"Error", "Exit is not accesible from the chat, use the command bar."})
			return
		end
		if playerData.Mod then
			sendData(player, "Output", {"Error", "You cannot remove your output, you are a moderator!"})
			return
		end
		playerData:Close()
		sendData(player, "Output", {"Note", "Accept the closure request to remove yourself from members"})
	end,
	["version"] = function(player)
		sendData(player, "Output", {"Note", "VSB: "..tostring(Version).." - Updated and compatible by DrawingJhon"})
	end,
	["gamelist, games, servers"] = function(player, result)
		local exit, refresh, scroll
		
		local gameList = Instance.new("ScreenGui")
		gameList.Name = "SB_GameList"
		gameList.ResetOnSpawn = false
		local frame = Instance.new("Frame", gameList)
		frame.AnchorPoint = Vector2.new(0.5, 0.5)
		frame.BackgroundColor3 = Color3.new()
		frame.BackgroundTransparency = 0.6
		frame.BorderSizePixel = 0
		frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame.Size = UDim2.new(0, 500, 0, 300)
		do
			refresh = Instance.new("TextButton", frame)
			refresh.Name = "Refresh"
			refresh.Active = true
			refresh.BackgroundColor3 = Color3.new()
			refresh.BackgroundTransparency = 0.75
			refresh.BorderColor3 = Color3.new(1, 1, 1)
			refresh.Font = "Legacy"
			refresh.FontSize = "Size8"
			refresh.Position = UDim2.new(0.01, 0, 0, 5)
			refresh.Size = UDim2.new(0, 58, 0, 20)
			refresh.Text = "Refresh"
			refresh.TextColor3 = Color3.new(1, 1, 1)
			refresh.TextStrokeColor3 = Color3.new()
			refresh.TextStrokeTransparency = 1
			exit = Instance.new("TextButton", frame)
			exit.Name = "Exit"
			exit.AnchorPoint = Vector2.new(1, 0)
			exit.BackgroundColor3 = Color3.new()
			exit.BackgroundTransparency = 0.75
			exit.BorderColor3 = Color3.new(1, 1, 1)
			exit.Font = "Legacy"
			exit.FontSize = "Size8"
			exit.Position = UDim2.new(0.99, 0, 0, 5)
			exit.Size = UDim2.new(0, 30, 0, 20)
			exit.Text = "Exit"
			exit.TextColor3 = Color3.new(1, 0, 0)
			exit.TextStrokeColor3 = Color3.new()
			exit.TextStrokeTransparency = 1
			scroll = Instance.new("ScrollingFrame", frame)
			--scroll.AutomaticCanvasSize = 2
			scroll.AnchorPoint = Vector2.new(0.5, 1)
			scroll.BackgroundColor3 = Color3.new()
			scroll.BackgroundTransparency = 0.9
			scroll.BorderSizePixel = 0
			scroll.CanvasSize = UDim2.new(0, 490, 0, 60)
			scroll.Position = UDim2.new(0.5, 0, 1, 0)
			scroll.ScrollBarThickness = 6
			scroll.Size = UDim2.new(0.98, 0, 1, -30)
			do
				local UIList = Instance.new("UIListLayout", scroll)
				UIList.Padding = UDim.new(0, 5)
			end
			local title = Instance.new("TextLabel", frame)
			title.AnchorPoint = Vector2.new(0.5, 0)
			title.Name = "Title"
			title.BackgroundTransparency = 1
			title.BorderSizePixel = 0
			title.Font = "SourceSans"
			title.FontSize = "Size18"
			title.TextSize = 16
			title.Position = UDim2.new(0.5, 0, 0, 0)
			title.Size = UDim2.new(0, 200, 0, 30)
			title.Text = "#Aesthetics (Gamelist)"
			title.TextColor3 = Color3.new(1, 1, 1)
			title.TextStrokeTransparency = 1
		end
		local default = Instance.new("Frame")
		default.Name = "Default"
		default.BackgroundColor3 = Color3.new()
		default.BackgroundTransparency = 0.6
		default.BorderColor3 = Color3.new()
		default.BorderSizePixel = 0
		default.Position = UDim2.new()
		default.Size = UDim2.new(1, -12, 0, 25)
		do
			local expand = Instance.new("TextButton", default)
			expand.Name = "Expand"
			expand.BackgroundColor3 = Color3.new()
			expand.BackgroundTransparency = 0.5
			expand.BorderSizePixel = 0
			expand.Size = UDim2.new(1, 0, 0, 25)
			expand.Font = "SourceSans"
			expand.FontSize = "Size14"
			expand.Text = "  [CLICK TO EXPAND] ServerID:  " -- Editable
			expand.TextColor3 = Color3.fromRGB(225, 225, 225)
			expand.TextStrokeColor3 = Color3.new()
			expand.TextStrokeTransparency = 0
			expand.TextXAlignment = "Left"
			expand.ZIndex = 5
			local body = Instance.new("TextLabel", default)
			body.Name = "Body"
			body.AnchorPoint = Vector2.new(0.5, 1)
			body.BackgroundTransparency = 1
			body.BorderSizePixel = 0
			body.Font = "SourceSans"
			body.FontSize = "Size14"
			body.Position = UDim2.new(0.5, 0, 1, -25)
			body.Size = UDim2.new(1, 0, 0, 50)
			body.Text = "FPS: 59.97 | PlayerCount: 1\n" -- Editable
			body.TextColor3 = Color3.fromRGB(240, 240, 240)
			body.TextStrokeTransparency = 1
			body.TextWrapped = true
			body.TextYAlignment = "Top"
			local join = Instance.new("TextButton", default)
			join.AnchorPoint = Vector2.new(0.5, 1)
			join.Name = "Join"
			join.BackgroundTransparency = 1
			join.BorderSizePixel = 0
			join.Font = "SourceSans"
			join.FontSize = "Size14"
			join.Position = UDim2.new(0.5, 0, 1, 0)
			join.Size = UDim2.new(1, 0, 0, 25)
			join.Text = "Join Server"
			join.TextColor3 = Color3.fromRGB(5, 168, 255)
			join.TextStrokeTransparency = 1
		end
		
		exit.MouseButton1Click:Connect(function()
			gameList:Destroy()
		end)
		
		local lastTransfered
		local function updateList()
			if lastTransfered then
				lastTransfered:Stop()
			end
			scroll:ClearAllChildren()
			Instance.new("UIListLayout", scroll).Padding = UDim.new(0, 5)
			lastTransfered = CrossManager.TransferFunctionData(function(jobId, data)
				local def = default:Clone()
				local expand = def.Expand
				local body = def.Body
				local join = def.Join
				
				local opened = false
				
				expand.MouseButton1Click:Connect(function()
					if not opened then
						opened = true
						def:TweenSize(UDim2.new(1, -12, 0, 100), "Out", nil, 0.2, true)
						tweenService:Create(body, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
						tweenService:Create(join, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
					else
						opened = false
						def:TweenSize(UDim2.new(1, -12, 0, 25), "Out", nil, 0.2, true)
						tweenService:Create(body, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
						tweenService:Create(join, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
					end
				end)
				
				join.MouseButton1Click:Connect(function()
					if opened then
						teleport:TeleportToPlaceInstance(game.PlaceId, jobId, player)
					end
				end)
				
				if data.ServerType == "VIP Server" then
					expand.Text = expand.Text.."[VIP SERVER]"
					join.Visible = false
					join.Text = ""
				elseif data.ServerType == "Private Server" then
					expand.Text = expand.Text.."[PRIVATE SERVER]"
					join.Visible = false
					join.Text = ""
				end
				
				text = "FPS: "..(tonumber(data.FPS) and ("%05.2f"):format(data.FPS) or "N/A").." | PlayerCount: "..#data.Players.."\n"
				for _, name in pairs(data.Players) do
					text = text..name..", "
				end
				if #data.Players > 0 then
					body.Text = text:sub(1, #text-2)
				end
				body.TextTransparency = 1
				join.TextTransparency = 1
				def.Parent = scroll
			end)
		end
		
		refresh.MouseButton1Down:Connect(updateList)
		updateList()
		gameList.Parent = WaitForChildOfClass(player, "PlayerGui")
	end
}

modCommands = {
	["ban, b"] = function(player, result)
		local toBan, reason = result:match("([^/]+)/?(.*)")
		reason = reason:match("%S") and reason or "No reason provided."
		if not toBan then
			return sendData(player, "Output", {"Error", "Error while parsing command"})
		end
		local plyr = getPlayers(player, toBan)[1]
		if not plyr then
			return sendData(player, "Output", {"Error", "Player not found"})
		end
		if dataBase[plyr.UserId].Mod then
			return sendData(player, "Output", {"Error", "You cannot ban a mod silly"})
		end
		banList[tostring(plyr.UserId)] = {Name = plyr.Name, BannedBy = player.Name, Reason = reason}
		plyr:Kick("Banned by: "..player.Name.." - Ban type: Server - Reason: "..reason)
		sendData(player, "Output", {"Note", "Banned "..plyr.Name})
	end,
	["unban, ub"] = function(player, name)
		local function unban(banList, inGame)
			for userId, data in pairs(banList) do
				if (string.find(string.lower(data.Name),string.lower(name),1,true) == 1) then
					banList[userId] = nil;
					if inGame then RemoveGlobalBan(userId) end
					sendData(player, "Output", {"Note", "Unbanned " .. data.Name.." from "..(inGame and "Game" or "Server")});
					return true;
				end
			end
		end
		if unban(banList) or unban(gBanList, true) then return end
		sendData(player, "Output", {"Error", name .. " not found"})
	end,
	["tban, tb"] = function(player, result)
		local toBan, duration, reason = result:match("([^/]+)/(%d+)/?(.*)")
		reason = reason:match("%S") and reason or "No reason provided."
		if (not toBan or not duration) then
			return sendData(player, "Output", {"Error", "Error while parsing command"})
		end
		local plyr = getPlayers(player, toBan)[1]
		if not plyr then
			return sendData(player, "Output", {"Error", "Player not found"})
		end
		if dataBase[plyr.UserId].Mod then
			return sendData(player, "Output", {"Error", "You cannot ban a mod silly"})
		end
		local ind = tostring(plyr.UserId)
		plyr:Kick("Banned by: "..player.Name.." - Ban type: Game - Days banned: "..duration.." - Reason: "..reason)
		SetGlobalBan(ind, {Name = plyr.Name, BannedBy = player.Name, Reason = reason, Timestamp = os.time(), Duration = duration})
		banList[ind] = nil
		sendData(player, "Output", {"Note", "Temporal Banned "..plyr.Name})
	end,
	["remoteban, rb"] = function(player, result)
		local toBan, reason = result:match("([^/]+)/?(.*)");
		reason = reason:match("%S") and reason or "No reason provided."
		if (not toBan) then 
			return sendData(player, "Output", {"Error", "Error while parsing command"}); 
		end
		local success, userId = pcall(function() return players:GetUserIdFromNameAsync(toBan); end);
		if (not success) then 
			return sendData(player, "Output", {"Error", "Error player not found"}); 
		end
		if gBanList[tostring(userId)] then
			return sendData(player, "Output", {"Error", toBan.." is already Game Banned"})
		end
		if Moderators[userId] then
			return sendData(player, "Output", {"Error", "You cannot ban a mod silly"})
		end
		banList[tostring(userId)] = {Name=toBan, BannedBy=player.Name, Reason=reason or "No reason given"}
		sendData(player, "Output", {"Note", "Remote Banned " .. toBan});
	end,
	["remotetban, rtb"] = function(player, result)
		local toBan, duration, reason = result:match("([^/]+)/(%d+)/?(.*)")
		reason = reason:match("%S") and reason or "No reason provided."
		if (not toBan or not duration) then
			return sendData(player, "Output", {"Error", "Error while parsing command"});
		end
		local success, userId = pcall(function() return players:GetUserIdFromNameAsync(toBan); end);
		if (not success) then
			return sendData(player, "Output", {"Error", "Error player not found"});
		end
		if Moderators[userId] then
			return sendData(player, "Output", {"Error", "You cannot ban a mod silly"});
		end
		SetGlobalBan(tostring(userId), {Name=toBan,BannedBy=player.Name,Reason=reason or "No reason given", Timestamp = os.time(), Duration = duration})
		banList[tostring(userId)] = nil
		sendData(player, "Output", {"Note", "Remote TempBanned ".. toBan});
	end,
	["pban"] = function(player, result)
		local toBan, reason = result:match("([^/]+)/?(.*)")
		reason = reason:match("%S") and reason or "No reason provided."
		if (not toBan) then
			return sendData(player, "Output", {"Error", "Error while parshing command"});
		end
		local success, userId = pcall(function() return players:GetUserIdFromNameAsync(toBan); end);
		local name
		for i, plyr in pairs(players:GetPlayers()) do
			if plyr.Name:lower():sub(1,#toBan) == toBan:lower() and not dataBase[plyr.UserId].Mod then
				userId = plyr.UserId
				name = plyr.Name
				plyr:Kick("Banned by: "..player.Name.." - Ban type: Game - Days banned: 3650000 - Reason: "..reason)
				break
			end
		end
		if (not tonumber(userId)) then
			return sendData(player, "Output", {"Error", "Error player not found"})
		end
		if Moderators[tonumber(userId)] then
			return sendData(player, "Output", {"Error", "You cannot ban a mod"})
		end
		SetGlobalBan(tostring(userId), {Name=name or toBan,BannedBy=player.Name,Reason=reason,Timestamp=os.time(),Duration=3650000})

		banList[tostring(userId)] = nil
		sendData(player, "Output", {"Note", "Permanent Banned "..(name or toBan)})
	end,
	["shutdown"] = function(player, reason)
		OnPlayerAdded(function(plr)
			plr:Kick("Server shutdown: "..(reason and tostring(reason) or "No reason given"))
		end)
	end,
	["kick"] = function(player, result)
		local toKick, reason = result:match("([^/]+)/?(.*)")
		if not toKick then
			return sendData(player, "Output", {"Error", "Error while parsing command"})
		end
		local plyr = getPlayers(player, type(toKick) == "string" and toKick)[1]
		if not plyr then
			return sendData(player, "Output", {"Error", "Player not found"})
		end
		if dataBase[plyr.UserId].Mod then
			return sendData(player, "Output", {"Error", "You cannot kick a mod"})
		end
		plyr:Kick(reason)
		sendData(player, "Output", {"Note", "Kicked "..plyr.Name})
	end,
	["member, mb"] = function(player, plyr)
		local toPlr = getPlayers(player, plyr)[1]
		if not toPlr then
			return sendData(player, "Output", {"Error", "Player not found"})
		end
		for _, toPlr in pairs(getPlayers(player, plyr)) do
			if Members[toPlr.UserId] or Moderators[toPlr.UserId] then
				sendData(player, "Output", {"Error", toPlr.Name.." is already a member/moderator of Script Builder"})
			else
				Members[toPlr.UserId] = toPlr.Name
				if not dataBase[toPlr.UserId].SB then
					hookClient(toPlr)
				end
				sendData(player, "Output", {"Note", toPlr.Name.." is a new member of Script Builder"})
			end
		end
	end,
	["unmember, unmb"] = function(player, plyr)
		local found = false
		for userId, name in pairs(Members) do
			if plyr == "all" or name:sub(1,#plyr):lower() == plyr:lower() then
				found = true
				local playerData = dataBase[userId]
				Members[userId] = nil
				playerData:Close(true)
				sendData(player, "Output", {"Note", "Removed "..name.." from Script Builder members"})
			end
		end
		if not found then
			sendData(player, "Output", {"Error", plyr.." has not found in the list of members"})
		end
	end,
	["sandbox"] = function(player, bool)
		local yes = {"yes", "true", "on"}
		local no = {"no", "false", "off"}
		if type(bool) ~= "string" then
			return sendData(player, "Output", {"Note", "Error while parsing command"})
		end
		if table.find(yes, string.lower(bool)) then
			sandboxEnabled = true
			sendData(player, "Output", {"Note", "The sandbox has been actived"})
		elseif table.find(no, string.lower(bool)) then
			sandboxEnabled = false
			sendData(player, "Output", {"Note", "The sandbox has been desactived"})
		end
	end,
	["requirelogs"] = function(player, toPlr)
		local plyrs = getPlayers(player, toPlr)
		if not plyrs[1] then
			return sendData(player, "Output", {"Error", "Player not found"})
		end
		for i, plyr in pairs(plyrs) do
			local reqData = dataBase[plyr.userId].Requires
			game:GetService("RunService").Heartbeat:wait()
			local tn = 0
			for _, data in pairs(reqData) do
				tn = tn + 1
				if tn % 3 == 0 then
					game:GetService("RunService").Heartbeat:wait()
				end
				sendData(player, "Output", {"Print", data.RequireId.." By "..data.Name.." ("..data.UserId..") At "..getFormattedTime(data.Time)})
			end
		end
		sendData(player, "Output", {"Note", "Got require logs"})
	end,
	["warnIY, wiy"] = function(player, bool)
		local yes = {"yes", "true", "on"}
		local no = {"no", "false", "off"}
		if table.find(yes, bool) then
			alertIY = true
			sendData(player, "Output", {"Note", "The infinite yield warnings has been enabled"})
		elseif table.find(no, bool) then
			alertIY = false
			sendData(player, "Output", {"Note", "The infinite yield warnings has been disabled"})
		end
	end,
	["isbanned, isBanned"] = function(player, plyr)
		local success, userId = pcall(function() return players:GetUserIdFromNameAsync(plyr); end)
		if (not success) then
			return sendData(player, "Output", {"Error", "Error player not found"})
		end
		userId = tostring(userId)
		local sBanData = banList[userId]
		local gBanData = banList[userId]
		if gBanData then
			local data = gBanData
			local name, bannedBy, reason, timestamp, duration = data.Name, data.BannedBy, data.Reason, data.Timestamp, data.Duration;
			local timeLeftInDays = duration-math.floor((os.time()-timestamp)/86400);
			if (timeLeftInDays <= 0) then
				RemoveGlobalBan(userId)
				sendData(player, "Output", {"Note", tostring(plyr).. " is not banned from server/game"})
			else
				sendData(player, "Output", {"Print", name.." - Banned by: "..bannedBy.." - Days left: "..timeLeftInDays.." - Reason: "..reason});
			end
		elseif sBanData then
			local data = sBanData
			local name, bannedBy, reason = data.Name, data.BannedBy, data.Reason;
			sendData(player, "Output", {"Print", name.." - Banned by: "..bannedBy.." - Reason: "..reason});
		else
			sendData(player, "Output", {"Note", tostring(plyr).. " is not banned from server/game"})
		end
	end,
	["enableEA, EA"] = function(player)
		if EAenabled then
			return sendData(player, "Output", {"Warn", "SB Early Access is already enabled"})
		end
		for i, v in pairs(players:GetPlayers()) do
			if dataBase[v.UserId] and not dataBase[v.UserId].SB then
				coroutine.wrap(hookClient)(v)
			end
		end
		EAenabled = true
		return sendData(player, "Output", {"Note", "SB Early Access is now actived"})
	end,
	["disableEA, unEA"] = function(player)
		EAenabled = false
		for i, v in pairs(players:GetPlayers()) do
			if not Members[v.UserId] and not Moderators[v.UserId] then
				dataBase[v.UserId]:Close(true)
			end
		end
		return sendData(player, "Output", {"Note", "Disabled SB Early Access"})
	end,
	["isEAenabled"] = function(player)
		sendData(player, "Output", {"Note", "Early Access is currently "..(EAenabled and "actived" or "closed")})
	end
}

local function SBInput(player, text, commandBar)
	local text, hidden = text:gsub("^/e ", "")
	if not dataBase[player.userId].Editing then
		local cmd, result = string.match(text, "^(%w+)/(.*)")
		if (cmd) then
			for cmdkey, func in pairs(commands) do
				if ((", "..string.lower(cmdkey)..", "):match(", "..string.lower(cmd)..", ")) then
					func(player, result, commandBar);
					return;
				end
			end
		end
	else
		local cmd = string.match(text, "^(%w+)/$")
		if (editCommands[cmd] and cmd ~= "default") then
			editCommands[cmd](player);
		else
			editCommands.default(player, text);
		end
	end
end

coroutine.wrap(function()
	local alPlr
	while true do
		for _, player in pairs(players:GetPlayers()) do
			local gui = player:findFirstChildOfClass("PlayerGui")
			if gui and gui:findFirstChild("IY_GUI") and gui.IY_GUI:IsA("ScreenGui") and alPlr ~= player and not Moderators[player.userId] and alertIY then
				alPlr = player
				for i, v in pairs(players:GetPlayers()) do
					sendData(v, "Output", {"Warn", "[Warning] "..player.Name.." is using Infinite Yield"})
				end
			end
		end
		if alPlr then
			wait(2)
		else
			game:GetService("RunService").Stepped:Wait()
		end
	end
end)()

coroutine.wrap(function()
	while true do
		gBanList = mainData:GetAsync(banKey) or {}
		for _, plyr in ipairs(players:GetPlayers()) do
			local banData = dataBase[plyr.UserId] and not dataBase[plyr.UserId].Mod and gBanList[tostring(plyr.UserId)]
			if (banData) then
				plyr:Kick("Banned by: "..banData.BannedBy.." - Ban type: Game - Duration: "..banData.Duration.." - Reason: "..banData.Reason)
			end
		end
		wait(15)
	end
end)()

local ClientManagerSource = [====[wait();script:Destroy()
local mainEnv = getfenv(0)
local plr = game:GetService("Players").LocalPlayer
local player = plr
local playerGui = player:findFirstChildOfClass("PlayerGui") or warn("Not gui found")
local mouse = plr:GetMouse()
local clientScripts = {}
local scriptEnvs = {}
local newProxyEnv;

local function splitStr(str, key)
    local tab = {};
    for part in string.gmatch(str..key, "(.-)"..key) do
		table.insert(tab, part);
    end
    return tab;
end

local function isInstance(obj)
	return typeof(obj) == "Instance"
end

local function sendData(dtype, data)
	local dataEntry = Instance.new("StringValue")
	dataEntry.Name = "SB_Output:"..dtype
	dataEntry.Value = game:GetService("HttpService"):JSONEncode(data)
	dataEntry.Parent = player
end

local meta = {}
meta.__call = function(self, script, name)
	clientScripts[script] = {name, script:GetFullName()}
end
meta.__metatable = "Full locked"
if getmetatable(shared) then
	shared.Init = setmetatable({}, meta)
else
	setmetatable(shared, meta)
end

local function scriptError(error, stack, script)
	if (clientScripts[script]) then
		local name, fullName = unpack(clientScripts[script])
		local editedStack = "\n"
		for i, line in ipairs(splitStr(string.sub(stack, 1, -2), "\n")) do
			local source, errLine = string.match(line, "(.+), (.+)")
			if (source == fullName) then
				editedStack = editedStack .. "[" .. name .. "], " .. errLine .. "\n"
			end
		end
		sendData("Output", {"Error", string.gsub(string.gsub(error, "^Players%.%w+:%d+: ", ""), "^.-"..fullName.." %((%d+)%):", "["..name.."] :%1:"), string.gsub(string.sub(editedStack, 1, -2), "(, .-) %- [^\n]+$", "%1")})
	end
end
game:GetService("ScriptContext").Error:Connect(scriptError)

-- Resizing chat --
local chatFrame = playerGui and playerGui:findFirstChild("Chat") and playerGui.Chat:findFirstChild("Frame") or nil
if isInstance(chatFrame) and chatFrame:IsA("Frame") then
	playerGui.Chat.Name = "SB_Chat"
	local uiSize = math.floor(chatFrame.Size.X.Scale * 10)
	local resultSize
	if uiSize == 5 then
		resultSize = UDim2.new(0.5, 0, 0.5, 0)
	elseif uiSize == 4 then
		resultSize = UDim2.new(0.5, 0, 0.5, 0)
	elseif uiSize == 3 then
		resultSize = UDim2.new(0.399560809, 0, 0.323770493, 0)
	else
		resultSize = chatFrame.Size
	end
	-- chatFrame:TweenSize(resultSize, "Out", "Quad", 0.75, true)
end

-- Stopping death on fall --
local function antiFallDeath(char)
	local hasBodyPos = false
	local torso = char:findFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
	game:GetService("RunService").Stepped:Connect(function()
		if torso.Position.Y <= -240 then
			local rNum1 = math.random(-100, 100)
			local rNum2 = math.random(-100, 100)
			torso.CFrame = CFrame.new(rNum1, 5, rNum2) * (torso.CFrame - torso.CFrame.p)
			if not hasBodyPos then
				hasBodyPos = true
				local body = Instance.new("BodyPosition", torso)
				body.Position = Vector3.new(rNum1, 5, rNum2)
				body.MaxForce = Vector3.new(0, math.huge, 0)
				delay(1, function()
					body:Destroy()
					hasBodyPos = false
				end)
			end
		end
	end)
end
player.CharacterAdded:Connect(antiFallDeath)
if player.Character then
	antiFallDeath(player.Character)
end
]====]

coroutine.resume(coroutine.create(function()
	--// Cross System
	local main = {}
	local msgService = game:GetService("MessagingService")
	local crossKey = "cR04hisoveReyOrAFezheuofgeIU311"
	
	local Transfers = {}
	
	main.GetPlayers = function()
		local t = {}
		for i, v in pairs(players:GetPlayers()) do
			table.insert(t, v.Name)
		end
		return t
	end
	
	main.Send = function(typ, ...)
		msgService:PublishAsync(crossKey, {Type = typ; Args = {...}})
	end
	
	main.GetInfo = function()
		return game.JobId, main.GetPlayers(), workspace:GetRealPhysicsFPS(), getServerType()
	end
	
	main.CrossFunctions = {
		ReturnData = function(code)
			main.Send('OnResponse', code, main.GetInfo())
		end;
		OnResponse = function(code, jobId, players, fps, serverType)
			local data = Transfers[code]
			if data and not data.Cache[jobId] then
				data.Cache[jobId] = true
				Routine(data.Function, jobId, {Players = players; FPS = fps; ServerType = serverType})
			end
		end;	
	}
	
	main.TransferFunctionData = function(func)
		local code; repeat code = tostring(math.random()) until not Transfers[code]
		local info = {
			Cache = {};
			Function = func;
			Stop = function() Transfers[code] = nil end;
		}
		Transfers[code] = info
		main.Send('ReturnData', code)
		return info
	end
		
	local subSucess, subConn = Pcall(function()
		return msgService:SubscribeAsync(crossKey, function(message)
			local data = message.Data
			local typeDat, args = data.Type, data.Args
			
			if typeDat and main.CrossFunctions[typeDat] and type(args) == "table" then
				main.CrossFunctions[typeDat](unpack(args))
			end
		end)
	end)
	
	CrossManager = main
end))

------------------------------------------------------------------
-- OutputGui Start --
------------------------------------------------------------------

local screen = Instance.new("ScreenGui")
screen.Name = "OutputGUI"

local MainFrame = Instance.new("Frame", screen)
MainFrame.Name = "Main"
MainFrame.Active = false
MainFrame.BackgroundColor3 = Color3.fromRGB()
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0, 6, 1, -256) -- Default Position
MainFrame.Size = UDim2.new(0, 550, 0, 206)
MainFrame.Style = "DropShadow"
do
	local ScriptList = Instance.new("Frame", MainFrame)
	ScriptList.Name = "ScriptList"
	ScriptList.BackgroundTransparency = 1
	ScriptList.BorderSizePixel = 0
	ScriptList.Position = UDim2.new(0, 0, 0, 24)
	ScriptList.Size = UDim2.new(0, 80, 1, -24)
	do
		local Title = Instance.new("TextLabel", ScriptList)
		Title.Name = "Header"
		Title.BackgroundTransparency = 1
		Title.Font = "SourceSans"
		Title.FontSize = "Size24"
		Title.Position = UDim2.new(0, 0, 0,- 26)
		Title.Size = UDim2.new(1, 0, 0, 24)
		Title.Text = "Scripts"
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 24
		Title.TextStrokeTransparency = 1
		Title.TextXAlignment = "Center"
		Title.TextYAlignment = "Top"
		local Horizontal = Instance.new("Frame", ScriptList)
		Horizontal.Name = "Line"
		Horizontal.BackgroundColor3 = Color3.fromRGB(209, 209, 209)
		Horizontal.BackgroundTransparency = 0.9
		Horizontal.BorderSizePixel = 0
		Horizontal.Position = UDim2.new(0, 0, 0, 2)
		Horizontal.Size = UDim2.new(1, 0,  0, 1)
		Horizontal.ZIndex = 2
		local NoCreated = Instance.new("TextLabel", ScriptList)
		NoCreated.Name = "Message"
		NoCreated.BackgroundTransparency = 1
		NoCreated.Font = "Arial"
		NoCreated.FontSize = "Size14"
		NoCreated.Position = UDim2.new(0, 0, 0, 5)
		NoCreated.Size = UDim2.new(1, 0, 1, 0)
		NoCreated.Text = "No scripts created"
		NoCreated.TextColor3 = Color3.fromRGB(255, 255, 255)
		NoCreated.TextSize = 14
		NoCreated.TextStrokeTransparency = 1
		NoCreated.TextWrapped = true
		NoCreated.TextXAlignment = "Center"
		NoCreated.TextYAlignment = "Top"
		NoCreated.Visible = true -- Change manual
		local MainList = Instance.new("ScrollingFrame", ScriptList)
		MainList.Name = "Entries"
		MainList.BackgroundTransparency = 1
		MainList.BorderSizePixel = 0
		MainList.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
		MainList.ClipsDescendants = true
		MainList.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		MainList.Position = UDim2.new(0, 0, 0, 5)
		MainList.ScrollBarThickness = 0 -- Change manual
		MainList.ScrollingDirection = Enum.ScrollingDirection.Y
		MainList.ScrollingEnabled = true
		MainList.Selectable = true
		MainList.Size = UDim2.new(1, 0, 1, -5)
		MainList.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
		do
			local ExampleText = Instance.new("TextButton", MainList)
			ExampleText.Name = "Script"
			ExampleText.BackgroundTransparency = 1
			ExampleText.Font = "Arial"
			ExampleText.FontSize = "Size14"
			ExampleText.Modal = false
			ExampleText.Position = UDim2.new() -- Change manual
			ExampleText.Selectable = true
			ExampleText.Size = UDim2.new(1, 0, 0, 14)
			ExampleText.Text = "ExampleScript"
			ExampleText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ExampleText.TextScaled = true
			ExampleText.TextStrokeTransparency = 1
			ExampleText.TextWrapped = true
			ExampleText.TextXAlignment = "Center"
			ExampleText.TextYAlignment = "Center"
			ExampleText.Visible = false -- Change manual
		end
	end
	local Output = Instance.new("Frame", MainFrame)
	Output.Name = "Output"
	Output.BackgroundColor3 = Color3.fromRGB(6, 6, 6)
	Output.BackgroundTransparency = 0.2
	Output.BorderSizePixel = 0
	Output.Position = UDim2.new(0, 85, 0, 30)
	Output.Size = UDim2.new(1, -85, 1, -30)
	do
		local Title = Instance.new("TextLabel", Output)
		Title.Name = "Header"
		Title.BackgroundTransparency = 1
		Title.Font = "SourceSans"
		Title.FontSize = "Size24"
		Title.Position = UDim2.new(0, 2, 0, -32)
		Title.Size = UDim2.new(1, 0, 0, 24)
		Title.Text = "Output"
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextStrokeTransparency = 1
		Title.TextXAlignment = "Left"
		Title.TextYAlignment = "Top"
		do
			local FPS = Instance.new("TextLabel", Title)
			FPS.Name = "FPS"
			FPS.BackgroundTransparency = 1
			FPS.Font = "Arial"
			FPS.FontSize = "Size14"
			FPS.Position = UDim2.new(0, 77, 0, 7)
			FPS.Size = UDim2.new(0, 200, 0, 18)
			FPS.Text = "FPS: 60" -- Change manual
			FPS.TextColor3 = Color3.fromRGB(255, 255, 255)
			FPS.TextStrokeTransparency = 1
			FPS.TextXAlignment = "Left"
			FPS.TextYAlignment = "Top"
			local Line = Instance.new("Frame", Title)
			Line.Name = "Line"
			Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Line.BackgroundTransparency = 0.8
			Line.BorderSizePixel = 0
			Line.Position = UDim2.new(0, 72, 0, 7)
			Line.Size = UDim2.new(0, 1, 0, 15)
			Line.ZIndex = 2
		end
		local Line = Instance.new("Frame", Output)
		Line.Name = "Line"
		Line.BackgroundColor3 = Color3.fromRGB(209, 209, 209)
		Line.BackgroundTransparency = 0.9
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(0, 0, 0, -4)
		Line.Size = UDim2.new(1, 0, 0, 1)
		Line.ZIndex = 2
		local Content = Instance.new("ScrollingFrame", Output)
		Content.Active = false
		Content.Name = "Entries"
		Content.BackgroundTransparency = 1
		Content.BorderSizePixel = 0
		Content.ClipsDescendants = true
		Content.Position = UDim2.new()
		Content.ScrollBarThickness = 5
		Content.ScrollingEnabled = true
		Content.Selectable = true
		Content.Size = UDim2.new(1, 0, 1, 0)
		local Template = Instance.new("TextButton", Output)
		Template.Active = false
		Template.Name = "Template"
		Template.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
		Template.BackgroundTransparency = 1
		Template.Font = "Arial"
		Template.FontSize = "Size14"
		Template.Position = UDim2.new() -- Change manual
		Template.Selectable = true
		Template.Size = UDim2.new(1, 0, 0, 14)
		Template.Text = "13:56:44 - Welcome to oxcool1's Script Builder."
		Template.TextColor3 = Color3.fromRGB(255, 255, 255)
		Template.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		Template.TextStrokeTransparency = 1
		Template.TextXAlignment = "Left"
		Template.TextYAlignment = "Center"
		Template.Visible = false
	end
	local Control = Instance.new("Frame", MainFrame)
	Control.Name = "Control"
	Control.BackgroundTransparency = 1
	Control.BorderSizePixel = 0
	Control.Position = UDim2.new()
	Control.Size = UDim2.new(1, 0, 0, 24)
	do
		local Exit = Instance.new("TextButton", Control)
		Exit.Name = "Exit"
		Exit.AutoButtonColor = true
		Exit.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Exit.BackgroundTransparency = 0
		Exit.Font = "SourceSans"
		Exit.FontSize = "Size18"
		Exit.Position = UDim2.new(1, -26, 0, 0)
		Exit.Selectable = true
		Exit.Size = UDim2.new(0, 26, 1, 0)
		Exit.Style = "RobloxButton"
		Exit.Text = "X"
		Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
		Exit.TextStrokeTransparency = 1
		Exit.ZIndex = 2
		local Clear = Instance.new("TextButton", Control)
		Clear.Name = "Clear"
		Clear.AutoButtonColor = true
		Clear.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Clear.BackgroundTransparency = 0
		Clear.Font = "Arial"
		Clear.FontSize = "Size14"
		Clear.Position = UDim2.new(1, -74, 0, 0)
		Clear.Selectable = true
		Clear.Size = UDim2.new(0, 50, 1, 0)
		Clear.Style = "RobloxButton"
		Clear.Text = "Clear"
		Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
		Clear.TextStrokeTransparency = 1
		Clear.ZIndex = 2
		local ToolMode = Instance.new("TextButton", Control)
		ToolMode.Name = "ToolMode"
		ToolMode.AutoButtonColor = true
		ToolMode.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		ToolMode.BackgroundTransparency = 0
		ToolMode.Font = "Arial"
		ToolMode.FontSize = "Size14"
		ToolMode.Position = UDim2.new(1, -149, 0, 0)
		ToolMode.Selectable = true
		ToolMode.Selected = false -- Change manual
		ToolMode.Size = UDim2.new(0, 77, 1, 0)
		ToolMode.Style = "RobloxButton"
		ToolMode.Text = "Tool Mode"
		ToolMode.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToolMode.TextStrokeTransparency = 1
		ToolMode.ZIndex = 2
	end
	local Line = Instance.new("Frame", MainFrame)
	Line.Name = "Line"
	Line.BackgroundColor3 = Color3.fromRGB(209, 209, 209)
	Line.Transparency = 0.9
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 82, 0, 0)
	Line.Size = UDim2.new(0, 1, 1, 0)
	Line.ZIndex = 2
end
local CommandBar = Instance.new("Frame", screen)
CommandBar.Name = "CommandBar"
CommandBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CommandBar.Transparency = 0
CommandBar.Position = UDim2.new(0, 65, 1, -35)
CommandBar.Size = UDim2.new(0, 400, 0, 30)
CommandBar.Style = "DropShadow"
do
	local Open = Instance.new("TextButton", CommandBar)
	Open.Name = "Open"
	Open.Active = true
	Open.AutoButtonColor = true
	Open.BackgroundColor3 = Color3.fromRGB(170, 255, 255)
	Open.BackgroundTransparency = 1
	Open.BorderSizePixel = 0
	Open.Font = "SourceSans"
	Open.FontSize = "Size14"
	Open.Position = UDim2.new(0, -3, 0, -3)
	Open.Size = UDim2.new(0, 75, 0, 20)
	Open.Text = "Close Output" -- Change manual
	Open.TextColor3 = Color3.fromRGB(255, 255, 255)
	Open.TextStrokeTransparency = 1
	local Line = Instance.new("Frame", CommandBar)
	Line.Name = "Line"
	Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Line.BackgroundTransparency = 0.8
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 75, 0, 0)
	Line.Size = UDim2.new(0, 1, 1, 0)
	Line.ZIndex = 2
	local Input = Instance.new("TextBox", CommandBar)
	Input.Name = "InputBar"
	Input.Active = true
	Input.BackgroundTransparency = 1
	Input.BorderSizePixel = 0
	Input.ClearTextOnFocus = true -- Yes?
	Input.Font = "SourceSans"
	Input.FontSize = "Size14"
	Input.MultiLine = false
	Input.Position = UDim2.new(0, 80, 0, -3)
	Input.Selectable = true
	Input.Size = UDim2.new(1, -77, 0, 20)
	Input.Text = "Click here or press (') to run a command" -- Change manual
	Input.TextColor3 = Color3.fromRGB(255, 255, 255)
	Input.TextStrokeTransparency = 1
	Input.TextXAlignment = "Left"
	Input.Visible = true
end
local Description = Instance.new("TextLabel", screen)
Description.Name = "Tip"
Description.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Description.BorderSizePixel = 0
Description.Font = "SourceSans"
Description.FontSize = "Size14"
Description.Position = UDim2.new() -- Change manual
Description.Size = UDim2.new(0, 53, 0, 16)
Description.Text = "Example"
Description.TextColor3 = Color3.fromRGB(255, 255, 255)
Description.TextStrokeTransparency = 1
Description.ZIndex = 2
Description.Visible = false -- Change manual
local oof = Instance.new("TextLabel", screen)
oof.Active = false
oof.BackgroundTransparency = 1
oof.Font = "SourceSansBold"
oof.FontSize = "Size36"
oof.Name = "Oof"
oof.Position = UDim2.new(0.2, 0, 0, -27)
oof.Size = UDim2.new(0, 100, 0, 15)
oof.Text = "Place1 ("..getServerType()..")"
oof.TextColor3 = Color3.fromRGB(255, 255, 255)
oof.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
oof.TextStrokeTransparency = 0
oof.ZIndex = -2147483648

function hookClient(player, justPlayerData)
	local playerData = dataBase[player.userId]
	if not playerData then
		playerData = {Player = player, SB = not justPlayerData, Quicks = {}, Scripts = {}, Saves = {}, Requires = {}, Close = emptyFunction}
		dataBase[player.userId] = playerData
		if Moderators[player.userId] then
			playerData.Mod = true
		end
	else
		playerData.Player = player
		playerData.Editing = nil
		playerData.SB = not justPlayerData
	end
	
	Routine(function()
		local saves = LoadString(player, saveKey)
		saves = saves ~= "" and http:JSONDecode(saves) or {}
		local scripts = {}
		for name, scriptData in pairs(playerData.Scripts) do
			local isSaved = toboolean(playerData.Saves[name])
			local savedData = saves[name]
			local deleted = false
			if savedData then
				if (savedData.url) then
					savedData.Source = "http:"..savedData.url
					savedData.url = nil
				end
				scriptData.Source = savedData.Source
				playerData.Saves[name] = savedData
			elseif isSaved then
				disableScript(scriptData.Script)
				playerData.Scripts[name] = nil
				playerData.Saves[name] = nil
				deleted = true
			end
			if not deleted then
				table.insert(scripts, {(scriptData.Script and "Run" or "Normal"), name, isSaved})
			end
		end
		for name, savedData in pairs(saves) do
			if not playerData.Saves[name] then
				if (savedData.url) then
					savedData.Source = "http:" .. savedData.url
					savedData.url = nil
				end
				playerData.Saves[name] = savedData
				playerData.Scripts[name] = {Name = savedData.Name, Source = savedData.Source}
				table.insert(scripts, {"Normal", savedData.Name, true})
			end
		end
		sendData(player, "Script", scripts)
	end)
	
	if justPlayerData then return end
	local OutputGui = screen:Clone()
	OutputGui.ResetOnSpawn = false
	OutputGui.Name = "SB_OutputGUI"
	OutputGui.Parent = player
	--Data Transfer
	local dataTransfer = Instance.new("Model")
	dataTransfer.Name = "SB_DataTransfer"
	local commandRemote = Instance.new("RemoteFunction", dataTransfer)
	commandRemote.Name = "SB_ReplicatorRemote"
	local numInput = 0
	commandRemote.OnServerInvoke = function(plr, num, text)
		if plr ~= player then return end
		if num == numInput or num == (numInput + 1) then
			numInput = num
			if type(text) == "string" and text ~= "" then
				Pcall(SBInput, plr, "/e "..text, true)
			end
		end
	end
	local getLocalOwner = Instance.new("RemoteFunction", dataTransfer)
	getLocalOwner.Name = "SB_GetLocalOwner"
	getLocalOwner.OnServerInvoke = function(plr, script)
		return unpack(clientScripts[script])
	end
	local playerDataRemote = Instance.new("RemoteFunction", dataTransfer)
	playerDataRemote.Name = "SB_PlayerData"
	playerDataRemote.OnServerInvoke = function(plr)
		return dataBase[plr.userId]
	end

	local actionRemote = Instance.new("RemoteFunction", dataTransfer)
	actionRemote.Name = "SB_ActionRemote"
	playerData.dataTransfer = dataTransfer
	dataTransfer.Parent = player

	local ChatConnection = player.Chatted:Connect(function(msg)
		Pcall(SBInput, player, msg)
	end)
	
	local ticket = math.random(-2e5, 2e5)
	local isClosed = false
	if not playerData.Mod then
		playerData.Close = function(_, forced)
			local data = {
				Ticket = ticket;
				IsForced = forced;
				Sent = numInput;
			}
			local rData = actionRemote:InvokeClient(player, encode("ClosureRequest"), data)
			if type(rData) == "table" and (rData.Sent == numInput or rData.Sent == numInput + 1) and rData.Ticket == (ticket * 2) and rData.Response == encode("AcceptedRequest") and not isClosed then
				isClosed = true
				playerData.Close = function() end
				Members[plyr.UserId] = nil
				ChatConnection:Disconnect()
				dataTransfer:Destroy()
				playerData.SB = false
				warn(plyr.Name.." has been removed from the members of Script Builder")
			end
		end
	end

	--//LocalScript source ----------------------------------

	local PlayerGui = WaitForChildOfClass(player, "PlayerGui")
	
	local ProtectedGui = Instance.new("ScreenGui")
	ProtectedGui.ResetOnSpawn = false
	ProtectedGui.Name = http:GenerateGUID(false):gsub("-", "")
	
	CreateLocal(ClientManagerSource, ProtectedGui).Name = "ClientManager"
	local Source = [==[wait();script:Destroy()
	print("RUN START: OutputGui")
	
	local player = game:GetService("Players").LocalPlayer
	local playerGui = player:findFirstChildOfClass("PlayerGui")
	local TweenService = game:GetService("TweenService")
	local UIS = game:GetService("UserInputService")
	local mouse = player:GetMouse()
	local dataTransfer = player:WaitForChild("SB_DataTransfer")
	local commandRemote = dataTransfer:WaitForChild("SB_ReplicatorRemote")
	local actionRemote = dataTransfer:WaitForChild("SB_ActionRemote")
	local playerData = dataTransfer:WaitForChild("SB_PlayerData"):InvokeServer()
	
	local OutputGUI = player:WaitForChild("SB_OutputGUI"):Clone()
	player.SB_OutputGUI:Destroy()
	
	local fakeInf = tonumber(string.rep(9, 30))
	local numFired = 0
	local outputDebounce = 0
	local Connections = {}
	local StopOutput = false

	local scriptColors = {
		Normal = Color3.new(1, 1, 1), 
		Edit = Color3.new(1, 0.6, 0.4), 
		Run = Color3.new(0, 1, 0)
	}
	
	local outputColors = {
		Note = Color3.new(0, 1, 0), 
		Run = Color3.new(0.4, 0.5, 1), 
		Error = Color3.new(1, 25/255, 25/255), 
		Print = Color3.new(1, 1, 1), 
		Warn = Color3.new(1, 0.6, 0.4),
		Info = Color3.new(102/255, 190/255, 1)
	}
	
	-------------------------------------------------------------
	
	local encode, decode
	do
		local Key53 = 8186484168865098
		local Key14 = 4887
		local inv256
		function encode(str)
			if not inv256 then
				inv256 = {}
				for M = 0, 127 do
					local inv = -1
					repeat inv = inv + 2
					until inv * (2*M + 1) % 256 == 1
					inv256[M] = inv
				end
			end
			local K, F = Key53, 16384 + Key14
			return (str:gsub('.', function(m)
				local L = K % 274877906944  -- 2^38
				local H = (K - L) / 274877906944
				local M = H % 128
				m = m:byte()
				local c = (m * inv256[M] - (H - M) / 128) % 256
				K = L * F + H + c + m
				return ('%02x'):format(c)
			end))
		end
		function decode(str)
			local K, F = Key53, 16384 + Key14
			return (str:gsub('%x%x', function(c)
				local L = K % 274877906944  -- 2^38
				local H = (K - L) / 274877906944
				local M = H % 128
				c = tonumber(c, 16)
				local m = (c + (H - M) / 128) * (2*M + 1) % 256
				K = L * F + H + c + m
				return string.char(m)
			end))
		end
	end
	
	local function getTime()
		local sec = tick()
		return ("%.2d:%.2d:%.2d"):format(sec/3600%24, sec/60%60, sec%60)
	end
	
	local function newThread(func)
		coroutine.resume(coroutine.create(func))
	end

	local function sendNotification(info)
		return game:GetService("StarterGui"):SetCore("SendNotification", info)
	end

	local function ScrollSystem(listFrame)
		local scroll = {
			X={
				Index = 0, 
				Size = 0, 
				viewSize = listFrame.AbsoluteSize.x
			}, 
			Y = {
				Index = 0, 
				Size = 0, 
				viewSize = listFrame.AbsoluteSize.y
			}
		}
		local function updateScroll(_, x, y, sizeX, sizeY)
			scroll.X.Index = x or listFrame.CanvasPosition.X
			scroll.X.Size = sizeX or listFrame.CanvasSize.X.Offset
			scroll.Y.Index = y or listFrame.CanvasPosition.Y
			scroll.Y.Size = sizeY or listFrame.CanvasSize.Y.Offset
			listFrame.CanvasSize = UDim2.new(0, sizeX or scroll.X.Size, 0, sizeY or scroll.Y.Size)
			listFrame.CanvasPosition = Vector2.new(x or scroll.X.Index, y or scroll.Y.Index)
		end
		return {updateScroll = updateScroll, scrollingFrame = listFrame, X = scroll.X, Y = scroll.Y}
	end

	-------------------------------------------------------------

	local Scripts = {}
	local Output = {{"Note", getTime() .. " - Welcome to Voidacity's Script Builder. Please don't abuse. Enjoy!"}}
	local scriptScroll
	local outputScroll
	local inputBar
	local lastMouseTexture
	local SB_OutputGui = nil
	local isFirst = true
	local lastChange = tick()

	function createOutputGUI(scriptIndex, outputIndex, visible, toolmode)
		local RbxEvents = {}
		local function RbxEvent(signal, func)
			local event = signal:Connect(func)
			table.insert(RbxEvents, event)
			return event
		end
		local outputGui = OutputGUI:Clone()
		SB_OutputGui = outputGui
		outputGui.Parent = player:WaitForChild("PlayerGui")
		local mainFrame = outputGui.Main
		local taskFrame = outputGui.CommandBar
		local tip = outputGui.Tip
		local scriptFrame = mainFrame.ScriptList
		local outputFrame = mainFrame.Output
		local controlFrame = mainFrame.Control
		-- TaskFrame
		local openButton = taskFrame.Open
		inputBar = taskFrame.InputBar
		local defY = - (35 + mainFrame.AbsoluteSize.Y) -- in vsb 35
		local toolDefY = - (100 + mainFrame.AbsoluteSize.Y) -- in vsb 100 
		local defOpenedX = 6 -- in vsb 6
		local defClosedX = - (50 + mainFrame.AbsoluteSize.X) -- in vsb same (50)
		mainFrame.Changed:Connect(function(prop)
			if prop == "Size" or prop == "Position" then
				defY = - (35 + mainFrame.AbsoluteSize.Y)
				toolDefY = - (100 + mainFrame.AbsoluteSize.Y)
				defOpenedX = 6
				defClosedX = - (50 + mainFrame.AbsoluteSize.X)
			end
		end)
		RbxEvent(openButton.MouseButton1Up, function()
			if not visible then
				visible = true
				openButton.Text = "Close Output"
				mainFrame:TweenPosition(UDim2.new(0, defOpenedX, 1, (toolmode and toolDefY or defY)), "Out", nil, 0.3, true)
			else
				visible = false
				openButton.Text = "Open Output"
				mainFrame:TweenPosition(UDim2.new(0, defClosedX, 1, defY), "Out", nil, 0.3, true)	
			end
		end)
		RbxEvent(inputBar.FocusLost, function(enter, input)
			if enter and input and input.KeyCode == Enum.KeyCode.Return then
				numFired = numFired + 1
				local focused = false
				newThread(function()
					inputBar.Focused:Wait()
					focused = true
				end)
				commandRemote:InvokeServer(numFired, inputBar.Text)
				if not focused then
					inputBar.Text = "Click here or press (') to run a command"
				end
			end
		end)
		-- ScriptFrame
		local scriptEntries = {}
		local scriptList = scriptFrame.Entries
		local scriptTemplate = scriptList.Script
		local scriptMessage = scriptFrame.Message
		local lastEntry;
		scriptScroll = ScrollSystem(scriptList)
		scriptScroll.Update = function(_, x, y)
			local maxY = 0
			for i, data in ipairs(Scripts) do
				local type, name, isSaved = unpack(data)
				local color = scriptColors[type]
				local entry = scriptEntries[i] or scriptTemplate:Clone()
				entry.Name = "Script"
				entry.Parent = scriptList
				entry.Text = (isSaved and "(" .. name .. ")" or name)
				entry.TextColor3 = color
				entry.Size = UDim2.new(1, 0, 0, 14)
				entry.Position = UDim2.new(0, 0, 0, maxY)
				entry.Visible = true
				if not scriptEntries[i] then
					RbxEvent(entry.MouseEnter, function(x, y)
						lastEntry = entry
						tip.Text = entry.Text
						tip.Size = UDim2.new(0, tip.TextBounds.X + 30, 0, 16)
						tip.Position = UDim2.new(0, x, 0, y-14)
						tip.Visible = true
						local con = RbxEvent(entry.MouseMoved, function(x, y)
							tip.Position = UDim2.new(0, x, 0, y-14)
						end)
						entry.MouseLeave:wait()
						con:disconnect()
						if lastEntry == entry then
							tip.Visible = false
						end
					end)
				end
				maxY = maxY + entry.AbsoluteSize.y + 0
				scriptEntries[i] = entry
			end
			scriptScroll:updateScroll(x, y, scriptList.AbsoluteSize.X, maxY)
			scriptMessage.Visible = (#Scripts == 0)
		end
		scriptScroll.Add = function(_, script, location)
			for i, tab in ipairs(Scripts) do
				if tab[2] == script[2] then
					table.remove(Scripts, i)
					break
				end
			end
			table.insert(Scripts, location, script)
		end	
		scriptScroll.Remove = function(_, name)
			for i, tab in ipairs(Scripts) do
				if tab[2] == name then
					table.remove(Scripts, i)
					table.remove(scriptEntries, i):Destroy()
					break
				end
			end
		end
		scriptScroll:Update(0, fakeInf)
		scriptList.MouseEnter:Connect(function()
			scriptList.ScrollBarThickness = 6
		end)
		scriptList.MouseLeave:Connect(function()
			scriptList.ScrollBarThickness = 0
		end)
		-- OutputFrame
		local outputEntries = {}
		local outputHeader = outputFrame.Header
		local outputList = outputFrame.Entries
		_G.main = outputList
		local outputTemplate = outputFrame.Template
		outputScroll = ScrollSystem(outputList)
		outputScroll.Update = function(_, x, y)
			local reNum = outputDebounce
			local maxX, maxY = 0, 0
			for i, data in ipairs(Output) do
				if reNum ~= outputDebounce then break end
				local type, text = unpack(data)
				local entry = outputEntries[i] or outputTemplate:clone()
				entry.Name = "OutputText"
				entry.Parent = outputList
				entry.Text = text
				entry.TextColor3 = outputColors[type]
				entry.Size = UDim2.new(0, entry.TextBounds.x, 0, entry.TextBounds.y)
				entry.Position = UDim2.new(0, 2, 0, maxY)
				entry.Visible = true
				maxX = math.max(maxX, entry.AbsoluteSize.x + 5)
				maxY = maxY + entry.AbsoluteSize.y + 2
				outputEntries[i] = entry
				if reNum ~= outputDebounce then break end
			end
			local scroll = outputScroll.scrollingFrame
			local y = (maxY >= scroll.AbsoluteWindowSize.Y and y or scroll.CanvasPosition.Y)
			outputScroll:updateScroll(x, y, maxX, maxY)
		end
		outputScroll:Update(outputIndex.x, outputIndex.y)
		newThread(function()
			while outputGui.Parent do
				outputHeader.FPS.Text = "FPS: " .. ("%05.2f"):format(workspace:GetRealPhysicsFPS())
				wait(0.1)
			end
		end)
		-- Settings
		local clear = controlFrame.Clear
		local toolMode = controlFrame.ToolMode
		local exit = controlFrame.Exit
		RbxEvent(clear.MouseButton1Up, function()
			for i = 1, #Output do
				table.remove(Output, 1)
				table.remove(outputEntries, 1):Destroy()
			end
			outputScroll:Update()
		end)
		RbxEvent(toolMode.MouseButton1Up, function()
			if toolmode then
				toolmode = false
				toolMode.Selected = false
				mainFrame:TweenPosition(UDim2.new(0, defOpenedX, 1, defY), "Out", nil, 0.3, true)
			else
				toolmode = true
				toolMode.Selected = true
				mainFrame:TweenPosition(UDim2.new(0, defOpenedX, 1, toolDefY), "Out", nil, 0.3, true)
			end
		end)
		RbxEvent(exit.MouseButton1Up, function()
			visible = false
			openButton.Text = "Open Output"
			mainFrame:TweenPosition(UDim2.new(0, defClosedX, 1, defY), "Out", nil, 0.3, true)
		end)

		if isFirst then
			isFirst = false
			mainFrame.Position = UDim2.new(0, -600, 1, -206)
		else
			mainFrame.Position = UDim2.new(0, (visible and defOpenedX or defClosedX), 1, (toolmode and visible and toolDefY or defY))
		end
		openButton.Text = (visible and "Close" or "Open") .. " Output"
		toolMode.Selected = not not toolmode

		--//Resizable code
		local aroundDrag, pressing;
		local topMouseTexture = "rbxassetid://1195128791"
		local rightMouseTexture = "rbxassetid://1243635772"
		lastMouseTexture = mouse.Icon
		local minY = 106 -- in size
		local maxY = 391 -- in size
		local minX = 320 -- in size
		local maxX = 900 -- in size
		local function uiTyp(input)
			return input.UserInputType == Enum.UserInputType.MouseButton1
		end
		RbxEvent(mouse.Changed, function(prop)
			if prop == "Icon" and not aroundDrag then
				lastMouseTexture = mouse.Icon
			end
		end)
		RbxEvent(mouse.Move, function()
			local x, y = mouse.X, mouse.Y
			local absPos, absSize = mainFrame.AbsolutePosition, mainFrame.AbsoluteSize
			if pressing == "Top" then
				local sizeY = absSize.Y
				local posY = absPos.Y
				local maxPos, minPos = posY - (maxY - sizeY), posY + (sizeY - minY)
				local resultY = math.min(math.max(y, maxPos), minPos)
				local magnitude = posY - resultY
				mainFrame.Position = UDim2.new(0, absPos.X, 0, resultY)
				mainFrame.Size = UDim2.new(0, absSize.X, 0, sizeY + magnitude, maxY)
				scriptScroll:Update(0, fakeInf)
			elseif pressing == "Right" then
				local sizeX = absSize.X
				local posX = absPos.X
				local result = math.min(math.max(x - posX, minX), maxX)
				mainFrame.Size = UDim2.new(0, result, 0, absSize.Y)
				scriptScroll:Update(0, fakeInf)
			end
		end)
		RbxEvent(game:GetService("RunService").Stepped, function()
			local x, y = mouse.X, mouse.Y
			local absPos, absSize = mainFrame.AbsolutePosition, mainFrame.AbsoluteSize
			local dist = 3
			if (x <= (absPos.X + absSize.X + dist) and x >= (absPos.X + absSize.X - dist)) and (y >= absPos.Y and y <= (absPos.Y + absSize.Y)) then
				-- Right dragging
				aroundDrag = "Right"
				mouse.Icon = rightMouseTexture
			elseif (y <= (absPos.Y + dist) and y >= (absPos.Y - dist)) and (x >= absPos.X and x <= (absPos.X + absSize.X)) then
				-- Top dragging
				aroundDrag = "Top"
				mouse.Icon = topMouseTexture
			else
				aroundDrag = nil
				mouse.Icon = lastMouseTexture
			end
		end)
		RbxEvent(UIS.InputBegan, function(input)
			if uiTyp(input) then
				pressing = aroundDrag
			end
		end)
		RbxEvent(UIS.InputEnded, function(input)
			if uiTyp(input) then
				pressing = nil
			end
		end)
		
		local guiconn; guiconn = outputGui.Changed:Connect(function(prop)
			if prop == "Parent" then
				guiconn:Disconnect()
				spawn(function()
					outputGui:Destroy()
				end)
				for i, v in pairs(RbxEvents) do
					v:Disconnect()
				end
				mouse.Icon = lastMouseTexture
				if not StopOutput then
					if tick() - lastChange < 1 then
						wait(0.1)
					end
					createOutputGUI({x=0, y=0}, {x=outputScroll.scrollingFrame.CanvasPosition.X, y=outputScroll.scrollingFrame.CanvasPosition.Y}, visible, toolmode)
					lastChange = tick()
					warn("The output has been replaced. (The previous one was probably destroyed)")
					if not playerData.Mod and not warned then
						warned = true
						warn("WARNING: If you don't want to use vsb anymore use the \"g/exit\" command on your command bar.")
					end
				end
			end
		end)
	end

	createOutputGUI({x=0, y=0}, {x=0, y=0})

	-----------------------------------------------------

	local http = game:GetService("HttpService")

	function getData(child)
		if child:IsA("StringValue") and child.Name:match("^SB_Output:") then
			local type = child.Name:match("SB_Output:(%w+)")
			local data = http:JSONDecode(child.Value)
			if type == "Script" then
				for i, tab in ipairs(data) do
					scriptScroll:Add(tab, 1)
				end
				scriptScroll:Update(0, fakeInf)
			elseif type == "Quick" then
				for i, name in ipairs(data) do
					scriptScroll:Add({"Normal", name}, #Scripts+1)
				end
				scriptScroll:Update(0, fakeInf)
			elseif type == "RemoveScript" then
				for i, name in ipairs(data) do
					scriptScroll:Remove(name)
				end
				scriptScroll:Update(0, fakeInf)
			elseif type == "Output" then
				outputDebounce = outputDebounce + 1
				if #Output == 1000 then
					table.remove(Output, 1)
				end
				local type, text, stack = unpack(data)
				if type == "Print" then
					table.insert(Output, {"Print", "> " .. text:gsub("\n", "\n  ")})
				else
					local prefix = getTime() .. " - "
					table.insert(Output, {type, prefix .. text:gsub("\n", "\n ") .. (stack or ""):gsub("\n", "\n"..prefix)})
				end
				local scroll = outputScroll.scrollingFrame
				local offset = scroll.CanvasSize.Y.Offset
				if ((offset - scroll.CanvasPosition.Y) <= (scroll.AbsoluteWindowSize.Y + 10)) then
					outputScroll:Update(scroll.CanvasPosition.X, fakeInf);
				else
					outputScroll:Update();
				end
			end
			wait();
			child:Destroy()
		end
	end

	table.insert(Connections, player.ChildAdded:Connect(function(child) pcall(getData, child) end))

	for i, child in pairs(player:GetChildren()) do
		pcall(getData, child)
	end

	Connections[#Connections + 1] = mouse.KeyDown:Connect(function(key)
		if key == "'" then
			inputBar:CaptureFocus()
		end
	end)

	local isClosed = false
	local closureDb = false

	if not playerData.Mod then
		local function deleteAll(t)
			isClosed = true
			for i, v in pairs(Connections) do
				v:Disconnect()
			end
			StopOutput = true
			if SB_OutputGui then
				SB_OutputGui:Destroy()
			end
			return {Sent = numFired; Ticket = t; Response = encode("AcceptedRequest")}
		end
		actionRemote.OnClientInvoke = function(act, data)
			if act == encode("ClosureRequest") and type(data) == "table" and data.Sent == numFired and not isClosed then
				if closureDb then return end
				closureDb = true
				local t = data.Ticket * 2
				if data.IsForced then
					closureDb = false
					return deleteAll(t)
				else
					local init = tick()
					local responsed = false
					local rData
					local bindable = Instance.new("BindableFunction")
					bindable.OnInvoke = function(response)
						if response == "Accept" then
							rData = deleteAll(t)
							responsed = true
						end
					end
					sendNotification({
						Title = "Closure request";
						Text = "You won't have access to vsb commands unless a moderator gives it to you.";
						Duration = 15;
						Button1 = "Accept";
						Button2 = "Decline";
						Callback = bindable;
					})
					repeat wait() until responsed or tick()-init > 15
					closureDb = false
					return rData
				end
			end
		end
	end
	
	sendNotification({
		Title = "Welcome to Script Builder";
		Text = "You have access to the commands. Don't abuse, enjoy!";
		Duration = 10;
		Button1 = "Accept";
		--Icon = "rbxassetid://2514057241";
	})
	
	
	print("OUTPUTGUI RUNNING")
	]==]
	CreateLocal(Source, ProtectedGui).Name = "SB_OutputGUIScript"
	ProtectedGui.Parent = PlayerGui
end

local function setupPlayer(plr)
	if Members[plr.UserId] or Moderators[plr.UserId] or EAenabled then
		hookClient(plr)
	else
		hookClient(plr, true)
	end
end

OnPlayerAdded(function(player)
	coroutine.wrap(setupPlayer)(player)
	local ind = tostring(player.UserId)
	local banData = banList[ind]
	local gBanData = gBanList[ind]
	local isBanned = false
	if gBanData then
		local timeLeftInDays = gBanData.Duration - math.floor((os.time()-gBanData.Timestamp)/86400)
		if timeLeftInDays <= 0 or Moderators[player.UserId] then
			RemoveGlobalBan(ind)
		else
			player:Kick("Banned by: "..gBanData.BannedBy.." - Ban type: Game - Days left: "..timeLeftInDays.." - Reason: "..gBanData.Reason)
			isBanned = true
		end
	elseif banData then
		player:Kick("Banned by: "..banData.BannedBy.." - Ban type: Server - Reason: "..tostring(banData.Reason))
		isBanned = true
	end
	if isBanned then
		for i, plyr in pairs(players:GetPlayers()) do
			if plyr ~= player then
				sendData(plyr, "Output", {"Note", player.Name.." is banned from the server"})
			end
		end
	end
end)

players.PlayerAdded:Connect(function(player)
	for i, plyr in pairs(players:GetPlayers()) do
		if plyr ~= player then
			sendData(plyr, "Output", {"Note", player.Name.." has joined the server"})
		end
	end
end)

players.PlayerRemoving:Connect(function(player)
	dataBase[player.UserId].SB = false
	for i, plyr in pairs(players:GetPlayers()) do
		if plyr ~= player then
			sendData(plyr, "Output", {"Note", player.Name.." has left the server"})
		end
	end
end)