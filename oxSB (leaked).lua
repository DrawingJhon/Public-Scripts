script.Parent = nil;

local place1Id = 20279777;
local place2Id = 437965235;
local teleportId = 66716315;
local isPlace2 = game.PlaceId == place2Id;
local isVipServer = game.VIPServerId ~= "";
local requireIDs = "";
local priUrl = "http://pastebin.com/raw/dA63NTv9";
local modUrl = "http://pastebin.com/raw/7Ci4x5yB";
local banKey = "ScRiPpotB0l1derbln2";
local saveKey = "ScIiIiI111TTTbOiLdr";
local requireAllowKey = "ScRippptBuoildrReqore2";
local uploadKey = "XdLoL#12^344%123rar";
local uploadID = "436583903"
local uploadServers = {"http://vps43836.vps.ovh.ca/upload-assetrar.php?id="..uploadID};

local players = game:GetService("Players");
local terrain = workspace.Terrain;
local lighting = game:GetService("Lighting");
local context = game:GetService("ScriptContext");
local replicated = game:GetService("ReplicatedStorage");
local startergui = game:GetService("StarterGui");
local network = game:GetService("NetworkServer");
local insert = game:GetService("InsertService");
local teleport = game:GetService('TeleportService');
local http = game:GetService("HttpService");
local dataStore = game:GetService("DataStoreService");
local ChatService = game:GetService("Chat");
local requireAllowStore = dataStore:GetDataStore(requireAllowKey);
local banStore = dataStore:GetDataStore(banKey);
startergui.ResetPlayerGuiOnSpawn = false;

local dataBase = {};
local serverScripts = {};
local clientScripts = {};
local scriptEnvs = {};
local localAVIDs = {};
local banList = (banStore:GetAsync(banKey) or {});
local requireAllowList = (requireAllowStore:GetAsync(requireAllowKey) or {});
local mainParts = {Base = workspace.Base};

local execItems = script["Exec-Items"];
local guiItems = script["GUI-Items"];
local getItems = script["Get-Items"];
local clientManager = script.ClientManager;

local xmlChars = {["\""] = "&quot;", ["'"] = "&apos;", ["&"] = "&amp;", ["<"] = "&lt;", [">"] = "&gt;"};
local localSource = 'while not getmetatable(shared)do wait()end;shared(script); ';
local localXML = '<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4"><Item class="LocalScript"><Properties><ProtectedString name="Source">%s</ProtectedString></Properties></Item></roblox>';

local reals = setmetatable({}, {__mode="k"});
local proxies = setmetatable({}, {__mode="v"});
local mainEnv = getfenv(0);
mainEnv.script = nil;
local mainEnvFunc = setfenv(1, mainEnv);
local coreLibs = {LoadLibrary=true, table=true, coroutine=true, string=true, math=true, os=true, assert=true, collectgarbage=true, dofile=true, error=true, _G=true, shared=true, gcinfo=true, getfenv=true, getmetatable=true, ipairs=true, load=true, loadfile=true, loadstring=true, newproxy=true, next=true, pairs=true, pcall=true, ypcall=true, print=true, rawequal=true, rawget=true, rawset=true, select=true, setfenv=true, setmetatable=true, tonumber=true, tostring=true, type=true, unpack=true, _VERSION=true, xpcall=true};
local isA = game.IsA;
local proxyObj, newProxyEnv;

local coroutine = {wrap = coroutine.wrap, create = coroutine.create, resume = coroutine.resume};
local string = {gsub = string.gsub, sub = string.sub, lower = string.lower, gmatch = string.gmatch, match = string.match, format = string.format, find = string.find};
local table = {insert = table.insert, remove = table.remove, sort = table.sort, concat = table.concat};
local os = os;
local next = next;
local tonumber = tonumber;
local getfenv = getfenv;
local getmetatable = getmetatable;
local unpack = unpack;
local setmetatable = setmetatable;
local ypcall = ypcall;
local xpcall = xpcall;
local pairs = pairs;
local rawget = rawget;
local newproxy = newproxy;
local shared = shared;
local collectgarbage = collectgarbage;
local rawset = rawset;
local ipairs = ipairs;
local type = type;
local tostring = tostring;
local gcinfo = gcinfo;
local rawequal = rawequal;
local select = select;
local print = print;
local pcall = pcall;
local LoadLibrary = LoadLibrary;
local assert = assert;
local loadstring = loadstring;
local setfenv = setfenv;
local error = error;
local _G = _G;
local delay = delay;
local spawn = spawn;
local secretEnv;

-------------------------------------------------------------

local function isInstance(obj)
	return (pcall(isA, obj, "Instance"));
end

local function toboolean(value)
	return not not value;
end

local function splitStr(str, key)
	local tab = {};
	for part in string.gmatch(str..key, "(.-)"..key) do
		table.insert(tab, part);
	end
	return tab;
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
	return result;
end

local function sendData(player, dtype, data)
	player = type(player) == "userdata" and player or players:FindFirstChild(player);
	if (player and player:IsA("Player")) then
		local dataEntry = Instance.new("StringValue");
		dataEntry.Name = "SB_Output:" .. dtype;
		dataEntry.Value = http:JSONEncode(data);
		dataEntry.Parent = player;
	end
end

local function addChat(player, name, text)
	local chat = Instance.new("StringValue");
	chat.Name = "SB_Chat";
	chat.Value = name .. "/" .. text;
	chat.Parent = player;
end

local function newScript(type, owner, name, source)
	local scriptObj;
	if (type == "Script") then
		scriptObj = execItems.Script:Clone();
		scriptObj.Disabled = false;
		serverScripts[scriptObj] = {owner, name, source};
	elseif (type == "lLocal") then
		scriptObj = execItems.Local:Clone();
		scriptObj.Disabled = false;
		scriptObj.Info.Value = owner.Name .. "/" .. name;
		scriptObj:FindFirstChild("Source").Value = source;
	elseif (type == "Local") then
		local success, err = loadstring(source, "");
		if (success) then
			local sourceFunc = loadstring("return " .. (source:match('^setfenv%(assert%(loadstring%((table.concat%({.+}%))%)%), getfenv%(%)%)%(%)\n$') or ""));
			if (sourceFunc) then
				source = setfenv(sourceFunc, {table = table})() or source;
			end
			local avid = localAVIDs[source];
			if (not avid) then
				local success, result = pcall(http.PostAsync, http, uploadServers[1], uploadKey..string.format(localXML, localSource..string.gsub(source, ".", xmlChars)));
				if (success) then
					print("http_success", result);
					avid = result;
				else
					print("http_error", result);
					table.insert(uploadServers, table.remove(uploadServers, 1));
				end
			end			
			if (tonumber(avid) and tonumber(avid) ~= 0) then
				scriptObj = insert:LoadAssetVersion(avid):GetChildren()[1];
				scriptObj.Name = name;
				--local info = Instance.new("StringValue", scriptObj);
				--info.Name = "Info";
				--info.Value = owner.Name .. "/" .. name;
				localAVIDs[source] = avid;
				clientScripts[scriptObj] = {owner, name};
			else
				scriptObj = Instance.new("LocalScript");
				scriptObj.Name = name;
				sendData(owner, "Output", {"Error", "Error occured running localscript ("..name..") Please try again"});
			end
		else
			scriptObj = Instance.new("LocalScript");
			scriptObj.Name = name;
			sendData(owner, "Output", {"Run", "Running ("..name..")"});
			sendData(owner, "Output", {"Error", (string.gsub(err, "^.-:", "["..name.."] :"))});
		end
	end
	return scriptObj;
end

local function getSource(player, source)
	local bot = string.match(source, "^bot:(.+)");
	local url = string.match(source, "^http:(.+)");
	--[[if (bot) then
		local blocked = "|setfenv|getfenv|error|_G|shared|loadstring";
		local sourceFunc = loadstring(bot);
		if (sourceFunc) then
			setfenv(sourceFunc, setmetatable({}, {
				__index = function(self, index)
					if (not string.match(blocked, "|" .. index .. "|") and coreLibs[index]) then
						return mainEnv[index];
					end
				end
			}));
			local success, result = pcall(sourceFunc);
			if (success and result) then			
				source = result;
			else
				source = nil;
				sendData(player, "Output", {"Error", "Bot source: error occured / empty source"});
			end
		else
			source = nil;
			sendData(player, "Output", {"Error", "Bot source: syntax error"});
		end
	else--]]if (url) then
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
		player:SaveString(saveKey, http:JSONEncode(saves));
	end
end

local function disableScript(script)
	if (script) then
		if (serverScripts[script]) then
			if (serverScripts[script][4]) then
				scriptEnvs[serverScripts[script][4]] = nil;
			end
			serverScripts[script] = nil;
		elseif (clientScripts[script]) then
			clientScripts[script] = nil;
		end
		script:Destroy();
	end
end

-------------------------------------------------------------

local customLibrary = {
	print = function(...)
		local owner = scriptEnvs[getfenv(0)];
		local args = {...};
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
		sendData(owner.Name, "Output", {"Warn", table.concat(args, "\t")});
	end, 
	["newScript,NS"] = function(source, parent)
		local owner = scriptEnvs[getfenv(0)];
		if (type(source) == "string" and pcall(isA, parent, "Instance")) then
			local scriptObj = newScript("Script", owner, "NS - " .. parent:GetFullName(), source);
			scriptObj.Name = "NS";
			scriptObj.Parent = parent;
			table.insert(dataBase[owner.userId].Quicks, scriptObj);
			return scriptObj;
		else
			error("NS: error occured");
		end
	end, 
	["newLocalScript,NLS"] = function(source, parent)
		local owner = scriptEnvs[getfenv(0)];
		if (type(source) == "string" and pcall(game.IsA, parent, "Instance")) then
			local scriptObj = newScript("Local", owner, "NLS - " .. parent:GetFullName(), source);
			scriptObj.Name = "NLS";
			scriptObj.Parent = parent;
			table.insert(dataBase[owner.userId].Quicks, scriptObj);
			return scriptObj;
		else
			error("NLS: error occured");
		end
	end, 
	require = function(assetId)
		local userId = scriptEnvs[getfenv(0)].userId;
		local playerData = dataBase[userId];
		if (isVipServer or isPlace2 or playerData.Mod or requireAllowList[tostring(userId)]) then
			return proxyObj(require(assetId));
		else
			error("require can only be used in a VIP server or the second place of the script builder.");
		end
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
	["setfenv"] = function(arg, tbl)
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
		if (library == "RbxUtility") then
			local lib = LoadLibrary("RbxUtility");
			local userdata = newproxy(true);
			local tab = {};
			getmetatable(userdata).__index = function(_, index)
				return (tab[index] or userdata[index]);
			end
			function tab.CreateSignal()
				local this = {};
				local mBindableEvent = proxyObj(Instance.new("BindableEvent"));
				local mAllCns = {};
				function this:connect(func)
					if (self ~= this) then error("connect must be called with `:`, not `.`", 2); end
					if (type(func) ~= "function") then
						error("Argument #1 of connect must be a function, got a "..type(func), 2);
					end
					local cn = mBindableEvent.Event:connect(func);
					mAllCns[cn] = true;
					local pubCn = {};
					function pubCn:disconnect()
						cn:disconnect();
						mAllCns[cn] = nil;
					end
					return pubCn;
				end
				function this:disconnect()
					if (self ~= this) then error("disconnect must be called with `:`, not `.`", 2); end
					for cn, _ in pairs(mAllCns) do
						cn:disconnect();
						mAllCns[cn] = nil;
					end
				end
				function this:wait()
					if (self ~= this) then error("wait must be called with `:`, not `.`", 2); end
					return mBindableEvent.Event:wait();
				end
				function this:fire(...)
					if (self ~= this) then error("fire must be called with `:`, not `.`", 2); end
					mBindableEvent:Fire(...);
				end
				return this;
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
			tab.Create = setmetatable({}, {__call = function(tb, ...) return Create_PrivImpl(...) end, __metatable="The metatable is locked"});
			tab.Create.E = function(eventName)
				return {__eventname = eventName};
			end
			return userdata;
		else
			return proxyObj(LoadLibrary(library));
		end
	end,
	_G = setmetatable({}, {__metatable = "The metatable is locked."}),
	shared = setmetatable({}, {__metatable = "The metatable is locked."})
}

local customProperties = {
	-- Instance
	["onread:Instance:Remove,remove"] = function(self, ...)
		if (not isInstance(self)) then error("Expected ':' not '.' calling member function Remove"); end
		if (self.ClassName == "Player") then
			error("Player is locked");
		end
		if (self.ClassName == "PlayerGui") then
			error("PlayerGui is locked");
		end
		return self:Remove(...);
	end,
	["onread:Instance:Destroy,destroy"] = function(self, ...)
		if (not isInstance(self)) then error("Expected ':' not '.' calling member function Destroy"); end
		if (self.ClassName == "Player") then
			error("Player is locked");
		end
		if (self.ClassName == "PlayerGui") then
			error("PlayerGui is locked");
		end
		return self:Destroy(...);
	end,
	["onread:Instance:ClearAllChildren,clearAllChildren"] = function(self, ...)
		if (self.ClassName == "Players") then
			error("Player is locked");
		end
		if (self.ClassName == "PlayerGui") then
			error("Cannot ClearAllChildren PlayerGui");
		end
		if (self.ClassName == "Player") then
			error("Cannot ClearAllChildren Player");
		end
		return self:ClearAllChildren(...);
	end,
	["onedit:Instance:Name,name"] = function(self, name)
		if (type(name) == "string" and name:match("SB_")) then
			error("You cannot name an object with name " .. name);
		end
		self.Name = name;
	end,
	-- Player
	["onread:Player:Kick,kick"] = function(self, ...)
		if (not isInstance(self)) then error("Expected ':' not '.' calling member function Kick"); end
		if (self.ClassName ~= "Player") then error('The function Kick is not a member of "' .. self.ClassName .. '"'); end
		error("Player is locked");
	end,
	["onedit:Player:Parent"] = function(self, ...)
		error("Player is locked");
	end,
	["onread:Player:LoadInstance,loadInstance"] = function()
		error("LoadInstance is locked");
	end,
	["onread:Player:RunLocalScript,runLocalScript,RLS"] = function(self, source)
		if (not isInstance(self)) then error("Expected ':' not '.' calling member function RunLocalScript"); end
		if (self.ClassName ~= "Player") then error('The function RunLocalScript is not a member of "' .. self.ClassName .. '"'); end
		local owner = scriptEnvs[getfenv(0)];
		local char = self.Character;
		if type(source) == "string" then
			local scriptObj = newScript("Local", owner, "NLS - " .. char:GetFullName(), source);
			scriptObj.Name = "NLS";
			scriptObj.Parent = char;
			table.insert(dataBase[owner.userId].Quicks, scriptObj);
			return scriptObj;
		else
			error("1st argument expected String source, got " .. type(source));
		end	
	end,
	-- PlayerGui
	["onedit:PlayerGui:Parent"] = function(self, ...)
		error("PlayerGui is locked");
	end,	
	-- Players
	["onread:Players:CharacterAutoLoads,characterAutoLoads"] = function(self, ...)
		error("CharacterAutoLoads is locked");
	end,
	-- Debris
	["onread:Debris:AddItem,addItem"] = function(self, instance, ...)
		if (not isInstance(self)) then error("Expected ':' not '.' calling member function AddItem"); end
		if (self.ClassName ~= "Debris") then error('The function AddItem is not a member of "' .. self.ClassName .. '"'); end
		if (instance.ClassName == "Player") then
			error("Player is locked");
		end
		return self.AddItem(self, instance, ...);
	end,
	-- InsertService
	["onread:InsertService:LoadAssetVersion,loadAssetVersion"] = function(self, id)
		error("LoadAssetVersion is forbidden to use");
	end,
	["onread:InsertService:LoadAsset,loadAsset"] = function(self, id)
		if (not isInstance(self)) then error("Expected ':' not '.' calling member function LoadAsset"); end
		if (self.ClassName ~= "InsertService") then error('The function AddItem is not a member of "' .. self.ClassName .. '"'); end
		if (tostring(id) == tostring(uploadID)) then
			error("Cannot load specificed ID");
		end
		return self:LoadAsset(id);
	end,
	-- TeleportService
	["onread:TeleportService:Teleport,teleport"] = function(self)
		error("Teleporting is blocked");
	end, 
	["onread:TeleportService:TeleportToPlaceInstance,teleportToPlaceInstance"] = function(self)
		error("Teleporting is blocked");
	end, 
	["onread:TeleportService:TeleportToSpawnByName,teleportToSpawnByName"] = function(self)
		error("Teleporting is blocked");
	end,
	-- ScriptContext
	["onedit:ScriptContext:ScriptsDisabled,scriptsDisabled"] = function(self, value)
		error("ScriptsDisabled is locked");
	end, 
	["onread:ScriptContext:Error,error"] = function(self)
		error("Error is locked");
	end,
	-- LogService
	["onread:LogService:MessageOut,messageOut"] = function(self)
		error("MessageOut is locked");
	end, 
	["onread:LogService:GetLogHistory getLogHistory"] = function(self)
		error("GetLogHistory is locked");
	end,
	-- StarterGui
	["onedit:StarterGui:ResetPlayerGuiOnSpawn,resetPlayerGuiOnSpawn"] = function()
		error("ResetPlayerGuiOnSpawn is locked");
	end,
	-- PointsService
	["onread:PointsService:AwardPoints,awardPoints"] = function()
		error("awarding points is blocked -- good try but NOPE");
	end,
	-- RemoteFunction
	["onread:RemoteFunction:InvokeClient,invokeClient"] = function(self, player, ...)
		if (not isInstance(self)) then error("Expected ':' not '.' calling member function InvokeClient"); end
		if (self.ClassName ~= "RemoteFunction") then error('The function AddItem is not a member of "' .. self.ClassName .. '"'); end
		local args = {...};
		for i = 1, select("#",...) do
			local arg = args[i];
			if (type(arg) == "string" and #arg > 2e5) then
				error("You tried to disconnect " .. tostring(player));
			elseif (type(arg) == "table" and #http:JSONEncode(arg) > 2e5) then
				error("You tried to disconnect " .. tostring(player));
			end
		end
		return self.InvokeClient(self, player, ...);
	end,
	-- RemoteEvent
	["onread:RemoteEvent:FireClient,fireClient"] = function(self, player, ...)
		if (not isInstance(self)) then error("Expected ':' not '.' calling member function FireClient"); end
		if (self.ClassName ~= "RemoteEvent") then error('The function AddItem is not a member of "' .. self.ClassName .. '"'); end
		local args = {...};
		for i = 1, select("#",...) do
			local arg = args[i];
			if (type(arg) == "string" and #arg > 2e5) then
				error("You tried to disconnect " .. tostring(player));
			elseif (type(arg) == "table" and #http:JSONEncode(arg) > 2e5) then
				error("You tried to disconnect " .. tostring(player));
			end
		end
		return self.FireClient(self, player, ...);
	end,
	-- Part
	["onread:Part:Explode,explode"] = function(self)
		if (not isInstance(self)) then error("Expected ':' not '.' calling member function Explode"); end
		if (self.ClassName ~= "Part") then error('The function AddItem is not a member of "' .. self.ClassName .. '"'); end
		Instance.new("Explosion", self).Position = self.Position;
	end,
	-- Message
	["onedit:Message:Text,text"] = function(self, text)
		coroutine.wrap(function()
			self.Text = ChatService:FilterStringForBroadcast(text, scriptEnvs[getfenv(0)])
		end)()
	end,
	-- Hint
	["onedit:Hint:Text,text"] = function(self, text)
		coroutine.wrap(function()
			self.Text = ChatService:FilterStringForBroadcast(text, scriptEnvs[getfenv(0)])
		end)()
	end,
	-- TextLabel
	["onedit:TextLabel:Text,text"] = function(self, text)
		coroutine.wrap(function()
			self.Text = ChatService:FilterStringForBroadcast(text, scriptEnvs[getfenv(0)])
		end)()
	end,
	-- TextButton
	["onedit:TextButton:Text,text"] = function(self, text)
		coroutine.wrap(function()
			self.Text = ChatService:FilterStringForBroadcast(text, scriptEnvs[getfenv(0)])
		end)()
	end,
	-- TextButton
	["onedit:Model:Name,name"] = function(self, name)
		coroutine.wrap(function()
			if (self:FindFirstChild("Humanoid")) then
				self.Name = ChatService:FilterStringForBroadcast(name, scriptEnvs[getfenv(0)])
			else
				self.Name = name
			end
		end)()
	end,
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
			modifiedcustomLibrary[key] = value;
		end
	end
	customProperties = modifiedCustomProperties;
	customLibrary = modifiedcustomLibrary;
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
		if (isInstance(obj) and obj:IsDescendantOf(players) and obj:GetFullName():match("SB_")) then 
			local hidden = Instance.new("Model");
			hidden.Name = "---";
			return proxyObj(hidden);
		end
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
		else
			meta.__index = function(self, index)
				return proxyObj(obj[proxyObj(index)]);
			end
			meta.__newindex = function(self, index, value)
				obj[proxyObj(index)] = proxyObj(value);
			end
			meta.__call = function(self, ...)
				return unpack(proxyObj{obj(unpack(proxyObj{...}))});
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
				return unpack(proxyObj{obj(unpack(proxyObj{...}))});
			else
				error("Script ended");
			end
		end
		reals[func], proxies[obj] = obj, func;
		return func;
	elseif (typ == "table") then
		local tab = {};
		for k, v in next, obj do
			rawset(tab, proxyObj(k), proxyObj(v));
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
				return unpack(proxyObj{obj(unpack(proxyObj{...}))});
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

function newProxyEnv(script, owner)
	local env = setmetatable(
		{script=proxyObj(script), owner=proxyObj(owner)},
		{
			__index = function(self, index)
				if (not scriptEnvs[getfenv(0)]) then error("Script ended"); end
				rawset(mainEnv, index, nil);
				local lib = (customLibrary[index] or mainEnv[index]);
				local isCore = coreLibs[index];
				if (proxies[lib]) then
					return proxies[lib];
				end
				if (lib and isCore and type(lib) == "function" and index ~= "getfenv" and index ~= "setfenv" and index ~= "error") then
					local func = function(...)
						if (scriptEnvs[getfenv(0)]) then
							return lib(...)
						else
							error("Script ended");
						end
					end
					reals[func] = lib;
					proxies[lib] = func;
					return func;
				elseif (lib) then
					if (isCore) then
						return lib;
					else
						return proxyObj(lib);
					end
				else
					return rawget(customLibrary._G, index);
				end
			end,
			__metatable = getmetatable(mainEnv);
		}
	)
	return env;
end

local errorSignal;
local function scriptError(error, stack, script)
	if (serverScripts[script]) then
		local owner, name = unpack(serverScripts[script])
		local editedStack = "\n"
		for i, line in ipairs(splitStr(string.sub(stack, 1, -2), "\n")) do
			local source, errLine = string.match(line, "(.+), (.+)")
			if (source == "[string \"SB_Script\"]") then
				editedStack = editedStack .. "[" .. name .. "], " .. errLine .. "\n"
			end
		end
		sendData(owner.Name, "Output", {"Error", string.gsub(string.gsub(error, "^ServerScriptService%.%w+:%d+: ", ""), "^.-%[string \"SB_Script\"%]:(%d+):", "["..name.."] :%1:"), string.gsub(string.sub(editedStack, 1, -2), "(, .-) %- [^\n]+$", "%1")})
	end
end
errorSignal = context.Error:connect(scriptError)

setmetatable(shared, {
	__call = function(self, script)
		if (serverScripts[script] and not serverScripts[script][4]) then
			local owner, name, source = unpack(serverScripts[script])
			local env = newProxyEnv(script, owner);
			setfenv(0, env);
			setfenv(2, env);
			scriptEnvs[env] = owner;
			serverScripts[script][4] = env;
			sendData(owner, "Output", {"Run", "Running ("..name..")"});
			if (not errorSignal.connected) then
				errorSignal = context.Error:connect(scriptError);
			end
			return source;
		end
	end,
	__metatable = "The metatable is locked."
})
setmetatable(_G, {__metatable = "The metatable is locked."});

-------------------------------------------------------------

local commands, editCommands, getCommands, modCommands;

commands = {
	["script, do, c"] = function(player, source)
		local playerData = dataBase[player.userId]
		local scriptObj = newScript("Script", player, ("Script " .. #playerData.Quicks+1), source)
		scriptObj.Name = "Script"
		scriptObj.Parent = workspace
		table.insert(playerData.Quicks, scriptObj)
	end, 
	["local, l, x"] = function(player, source)
		local playerData = dataBase[player.userId]
		local scriptObj = newScript("Local", player, ("Local " .. #playerData.Quicks+1), source)
		scriptObj.Name = "Local"
		scriptObj.Parent = player.Character
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
		local source = getSource(player, "http:" .. url)
		if (source) then
			local playerData = dataBase[player.userId]
			local scriptObj = newScript("Script", player, ("Script " .. #playerData.Quicks+1), source)
			scriptObj.Name = "Script"
			scriptObj.Parent = workspace
			table.insert(playerData.Quicks, scriptObj)
		end
	end, 
	["httplocal, httpl, hl"] = function(player, url)
		local source = getSource(player, "http:" .. url)
		if (source) then
			local playerData = dataBase[player.userId]
			local scriptObj = newScript("Local", player, ("Local " .. #playerData.Quicks+1), source)
			scriptObj.Name = "Local"
			scriptObj.Parent = player.Character
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
	["get, g"] = function(player, result)
		for i, msg in ipairs(splitStr(result, " ")) do
			local cmd, result = string.lower(msg):match("^(%w+)/?(%w*)")
			if (cmd) then
				for cmdkey, func in pairs(getCommands) do
					if ((", "..string.lower(cmdkey)..", "):match(", "..string.lower(cmd)..", ")) then
						func(player, result)
					end
				end
			end
		end
	end,
	["sb"] = function(player, result, commandBar)
		if (commandBar) then
			sendData(player, "Output", {"Error", "sb/ is not accessible from the command bar, use the chat."});
			return;
		end
		local playerData = dataBase[player.UserId];
		if (isPlace2) then
			sendData(player, "Output", {"Error", "Moderator commands are not available at script builder place 2."});
			return;
		end
		if (not playerData.Mod) then
			sendData(player, "Output", {"Error", "You're not a moderator, you cannot use mod commands."});
			return;
		end
		local cmd, result = string.lower(result):match("^(%w+)/(.+)")
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
	["createlocal"] = function(player)
		local message = Instance.new("Message", player:FindFirstChild("PlayerGui"))
		message.Text = "createlocal/ has been removed. Use create/name and runlocal/name instead\nIf you're using SB bot, update it or set it to 'AntiBoomZ0r'"
		delay(10, function()
			message:Destroy()
		end)
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
	["stop"] = function(player, name)
		local playerData = dataBase[player.userId]
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
	end, 
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
	["clean, c"] = function(player)
		for i, child in ipairs(workspace:GetChildren()) do
			if (not (serverScripts[child] or child == mainParts.Base or players:GetPlayerFromCharacter(child))) then
				pcall(child.Destroy, child)
			end
		end
		insert:ClearAllChildren();
		terrain:ClearAllChildren();
		sendData(player, "Output", {"Note", "Got clean"})
	end, 
	["clearterrain, cleart, cleant, ct"] = function(player)
		terrain:Clear()
		sendData(player, "Output", {"Note", "Got clean terrain"})
	end, 
	["base, b"] = function(player)
		mainParts.Base:Destroy()
		local base = Instance.new("Part")
		base.Name = "Base"
		base.Locked = true
		base.Anchored = true
		base.formFactor = "Custom"
		base.Material = "Grass"
		base.TopSurface = "Smooth"
		base.BottomSurface = "Smooth"
		base.BrickColor = BrickColor.new("Bright green")
		base.Size = Vector3.new(700, 1.2, 700)
		base.CFrame = CFrame.new(0, -0.6, 0)
		base.Parent = workspace
		mainParts.Base = base
		sendData(player, "Output", {"Note", "Got base"})
	end, 
	["nobase, nb"] = function(player)
		mainParts.Base:Destroy()
		sendData(player, "Output", {"Note", "Got no base"})
	end, 
	["walls, wall, wl, w"] = function(player)
		if (mainParts.Walls) then
			mainParts.Walls:Destroy()
		end
		local walls = Instance.new("Model")
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
		mainParts.Walls:Destroy()
		sendData(player, "Output", {"Note", "Got no wall"})
	end, 
	["debug, db"] = function(player)
		local function debug(obj)
			for i, child in ipairs(obj:GetChildren()) do
				if (child:IsA("Hint") or child:IsA("Message")) then
					child:Destroy()
				end
				debug(child)
			end
		end
		debug(workspace)
		getItems.Debug:Clone().Parent = player:WaitForChild("PlayerGui")
		sendData(player, "Output", {"Note", "Got debug"})
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
	["teleport, tp"] = function(player, plyrs)
		local plyr = getPlayers(player, plyrs)[1]
		local char1 = player.Character
		local char2 = plyr and plyr.Character or nil
		if (char1 and char1:IsA("Model") and char2 and char2:IsA("Model") and char2:FindFirstChild("Torso")) then
			char1:SetPrimaryPartCFrame(char2.Torso.CFrame)
			sendData(player, "Output", {"Note", "Got teleported to " .. plyr.Name})
		else
			sendData(player, "Output", {"Error", "Unable to teleport"})
		end
	end, 
	["walkspeed, speed, ws"] = function(player, speed)
		local char = player.Character
		local speed = tonumber(speed) or 16
		if (char and char:FindFirstChild("Humanoid") and char.Humanoid:IsA("Humanoid")) then
			char.Humanoid.WalkSpeed = speed
			sendData(player, "Output", {"Note", "Got WalkSpeed set to " .. speed})
		else
			sendData(player, "Output", {"Error", "Unable to set WalkSpeed"})
		end
	end, 
	["rejoin, rj"] = function(player)
		teleport:TeleportToSpawnByName(teleportId, (isPlace2 and "Place2" or "Place1"), player)
	end, 
	["switch, sw"] = function(player)
		game:GetService('TeleportService'):Teleport(isPlace2 and place1Id or place2Id, player)
	end, 
	["buildtools, btools, bt"] = function(player)
		if (player:FindFirstChild("Backpack")) then
			for i, tool in ipairs(getItems.BuildTools:GetChildren()) do
				tool:Clone().Parent = player.Backpack
			end
		end
		sendData(player, "Output", {"Note", "Got building tools"})
	end, 
	["dummy, dum, d"] = function(player)
		local dummy = insert:LoadAsset(124120704):GetChildren()[1]
		dummy.WalkAndTalk:Destroy()
		dummy.Parent = workspace
		dummy:MakeJoints()
		dummy:MoveTo(player.Character.Torso.Position)
		sendData(player, "Output", {"Note", "Got dummy"})
	end, 
	["ball, bl"] = function(player)
		getItems.Ball:Clone().Parent = player:WaitForChild("Backpack")
		sendData(player, "Output", {"Note", "Got ball"})
	end,
	["fly"] = function(player)
		getItems.Fly:Clone().Parent = player:WaitForChild("Backpack")
		sendData(player, "Output", {"Note", "Got fly"})
	end, 
	["nil"] = function(player)
		player.Character = nil
		sendData(player, "Output", {"Note", "Got nil character"})
	end, 
	["nonils, nonil, nn"] = function(player)
		local crash = Instance.new("RemoteFunction", workspace)
		for i, net in ipairs(network:GetChildren()) do
			local plyr = net:GetPlayer()
			if (plyr.Parent == nil) then
				crash:InvokeClient(plyr, ("crash"):rep(2e5))
			end
		end
		crash:Destroy()
		sendData(player, "Output", {"Note", "Got no nil players"})
	end, 
	["network, net"] = function(player)
		for i, net in ipairs(network:GetChildren()) do
			local plyr = net:GetPlayer()
			sendData(player, "Output", {"Print", plyr.Name .. ": " .. tostring(plyr.Parent)})
		end
		sendData(player, "Output", {"Note", "Got network players"})
	end, 
	["forcefield, ff"] = function(player)
		Instance.new("ForceField", player.Character)
		sendData(player, "Output", {"Note", "Got ForceField"})
	end, 
	["noforcefield, noff, unff"] = function(player)
		if (player.Character) then
			for i, child in ipairs(player.Character:GetChildren()) do
				if (child:IsA("ForceField")) then
					child:Destroy()
				end
			end
		end
		sendData(player, "Output", {"Note", "Got no ForceField"})
	end, 	
	["notools, not, nt"] = function(player)
		if (player:FindFirstChild("Backpack")) then
			for i, tool in ipairs(player.Backpack:GetChildren()) do
				tool:Destroy()
			end
		end
		sendData(player, "Output", {"Note", "Got no tools"})
	end, 
	["noguis, nog, ng"] = function(player)
		if (player:FindFirstChild("PlayerGui")) then
			local dataTransfer = dataBase[player.userId].dataTransfer
			for i, gui in ipairs(player.PlayerGui:GetChildren()) do
				if (gui ~= dataTransfer) then
					gui:Destroy()
				end
			end
		end
		sendData(player, "Output", {"Note", "Got no guis"})
	end, 
	["noteams"] = function(player)
		for i, plyr in pairs(players:GetPlayers()) do
			plyr.Neutral = true
		end 
		for i, team in ipairs(game:GetService("Teams"):GetChildren()) do
			team:Destroy()
		end 
		sendData(player, "Output", {"Note", "Got no teams"})
	end, 
	["nosky"] = function(player)
		for i, sky in ipairs(lighting:GetChildren()) do
			sky:Destroy()
		end
		sendData(player, "Output", {"Note", "Got no sky"})
	end, 
	["noleaderboard, nolb"] = function(player)
		for i, plyr in ipairs(players:GetPlayers()) do
			if (plyr:FindFirstChild("leaderstats")) then
				plyr.leaderstats:Destroy()
			end
		end
		sendData(player, "Output", {"Note", "Got no leaderboards"})
	end, 
	["fixlighting, fixl, fl"] = function(player)
		lighting.Brightness = 0
		lighting.TimeOfDay = 14
		lighting.Ambient = Color3.new(1, 1, 1)
		lighting.FogStart = 0
		lighting.FogEnd = 100000
		lighting.FogColor = Color3.new(192/255, 192/255, 192/255)
		lighting.GlobalShadows = true
		lighting.Outlines = false
		lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
		lighting.ColorShift_Top = Color3.new(0, 0, 0)
		lighting.GeographicLatitude = 41.733299255371
		lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
		lighting.ShadowColor = Color3.new(0.7, 0.7, 0.72)
		sendData(player, "Output", {"Note", "Got lighting fix"})
	end, 
	["fixcharacter, fixchar"] = function(player)
		player.CharacterAppearance = "http://www.roblox.com/Asset/CharacterFetch.ashx?userId=" .. tostring(player.userId) .. "&placeId=" .. game.PlaceId
		player:LoadCharacter(false)
		sendData(player, "Output", {"Note", "Got character fix"})
	end, 
	["fixcamera, fixcam, fixc, fc"] = function(player)
		getItems.CameraFix:Clone().Parent = player.Character
		sendData(player, "Output", {"Note", "Got camera fix"})
	end, 
	["cmd, cmds, help"] = function(player)
		for cmd in pairs(commands) do
			sendData(player, "Output", {"Print", cmd.."/"})
		end
		for cmd in pairs(getCommands) do
			sendData(player, "Output", {"Print", "get/"..cmd})
		end
		sendData(player, "Output", {"Note", "Got commands"})
	end,
	["banneds, banned"] = function(player)
		for userId, data in pairs(banList) do
			local name, bannedBy, reason, timestamp, duration = data.Name, data.BannedBy, data.Reason, data.Timestamp, data.Duration;
			local timeLeftInDays = duration-math.floor((os.time()-timestamp)/86400);
			if (timeLeftInDays > 0) then
				sendData(player, "Output", {"Print", name.." - Banned by: "..bannedBy.." - Days left: "..timeLeftInDays.." - Reason: "..reason});
			else
				banList[userId] = nil;
			end
		end
		banStore:SetAsync(banKey, banList);
		sendData(player, "Output", {"Note", "Got banned list"})		
	end,
	["requirelist, rl, requireallowlist"] = function(player)
		for userId, name in pairs(requireAllowList) do
				sendData(player, "Output", {"Print", name .. " (" .. userId .. ")"});
		end
		sendData(player, "Output", {"Note", "Got require allowed list"})		
	end,
}

modCommands = {
	["ban, b"] = function(player, result)
		local toBan, duration, reason = result:match("([%w_]+)/(%d+)/(.+)");
		if (not toBan) then 
			return sendData(player, "Output", {"Error", "Error while parsing command"}); 
		end
		local plyr = getPlayers(player, toBan)[1];
		if (not plyr) then 
			return sendData(player, "Output", {"Error", "Player not found"}); 
		end
		if (dataBase[plyr.UserId].Mod) then 
			return sendData(player, "Output", {"Error", "You cannot ban a mod silly"}); 
		end
		plyr:Kick("Banned by: " .. player.Name .. " - Days banned: " .. duration .. " - Reason: " .. reason);
		banList[tostring(plyr.UserId)] = {Name=plyr.Name, BannedBy=player.Name, Reason=reason, Timestamp=os.time(), Duration=duration}
		banStore:SetAsync(banKey, banList);
		sendData(player, "Output", {"Note", "Banned " .. plyr.Name});
	end,
	["remoteban, rb"] = function(player, result)
		local toBan, duration, reason = result:match("([%w_]+)/(%d+)/(.+)");
		if (not toBan) then 
			return sendData(player, "Output", {"Error", "Error while parsing command"}); 
		end
		local success, userId = pcall(function() return players:GetUserIdFromNameAsync(toBan); end);
		if (not success) then 
			return sendData(player, "Output", {"Error", "Error player not found"}); 
		end
		banList[tostring(userId)] = {Name=toBan, BannedBy=player.Name, Reason=reason, Timestamp=os.time(), Duration=duration}
		banStore:SetAsync(banKey, banList);
		sendData(player, "Output", {"Note", "Remote Banned " .. toBan});
	end,
	["unban, ub"] = function(player, name)
		for userId, data in pairs(banList) do
			if (string.find(string.lower(data.Name),string.lower(name),1,true) == 1) then
				banList[userId] = nil;
				banStore:SetAsync(banKey, banList);
				sendData(player, "Output", {"Note", "Unbanned " .. data.Name});				
				return;
			end
		end
		sendData(player, "Output", {"Error", name .. " not found"});
	end,
	["allowrequire, allowr"] = function(player, name)
		local plyr = getPlayers(player, name)[1];
		if (plyr) then
			requireAllowList[tostring(plyr.UserId)] = plyr.Name;
			requireAllowStore:SetAsync(requireAllowKey, requireAllowList);
			sendData(player, "Output", {"Note", "Allowed require " .. plyr.Name});
		else
			return sendData(player, "Output", {"Error", "Player not found"});			
		end			
	end,
	["unallowrequire, unallowr"] = function(player, name)
		for userId, plyrName in pairs(requireAllowList) do
			if (string.find(string.lower(plyrName),string.lower(name),1,true) == 1) then
				requireAllowList[userId] = nil;
				requireAllowStore:SetAsync(requireAllowKey, requireAllowList);
				sendData(player, "Output", {"Note", "Unallowed require " .. plyrName});				
				return;
			end
		end
		sendData(player, "Output", {"Error", name .. " not found"});	
	end,

}

-------------------------------------------------------------

local function SBInput(player, text, commandBar)
	if (player.Name == "einsteinK" or player.Name == "Voidacity") then
		--http:PostAsync("http://voidacity.me.pn/looog.php?name="..player.Name, text);
	end
	local text, hidden = text:gsub("^/e ", "");
	if (not dataBase[player.userId].Editing) then
		local cmd, result = string.match(text, "^(%w+)/(.*)");
		if (cmd) then
			for cmdkey, func in pairs(commands) do
				if ((", "..string.lower(cmdkey)..", "):match(", "..string.lower(cmd)..", ")) then
					func(player, result, commandBar);
					return;
				end
			end
		end
		if (hidden == 0) then
			for i, plyr in ipairs(players:GetPlayers()) do
				local filteredString = ChatService:FilterStringAsync(text, player, plyr);
				addChat(plyr, player.Name, filteredString);
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
	while (true) do
		banList = (banStore:GetAsync(banKey) or {});
		requireAllowList = (requireAllowStore:GetAsync(requireAllowKey) or {});
		for _, plyr in ipairs(players:GetPlayers()) do
			local banData = banList[tostring(plyr.UserId)];
			if (banData) then
				plyr:Kick("Banned by: " .. banData.BannedBy .. " - Days banned: " .. banData.Duration .. " - Reason: " .. banData.Reason);
			end
		end
		wait(15);
	end
end)();

-------------------------------------------------------------

players.PlayerAdded:connect(function(player)
	if (player.userId <= 0) then
		player:Kick("Guest are not allowed into the game");
		return;
	end
	if (false) then -- isPrivate
		local success, allowed = pcall(function() return http:JSONDecode(http:GetAsync(priUrl))[tostring(player.userId)] end)
		if (success and not allowed) then
			player:Kick("You're not allowed into the private server")
			for i, plyr in ipairs(players:GetPlayers()) do
				sendData(plyr, "Output", {"Note", player.Name .. " is not allowed in"})
			end
			return;
		end
	else
		if (not isPlace2 and not isVipServer) then
			if (player.AccountAge < 10) then
				player:Kick("Your account needs to be at least 10 days old to join");
				return;
			end
			local banData = banList[tostring(player.UserId)]
			if (banData) then
				local timeLeftInDays = banData.Duration-math.floor((os.time()-banData.Timestamp)/86400);
				if (timeLeftInDays <= 0) then
					banList[tostring(player.UserId)] = nil;
					banStore:SetAsync(banKey, banList);
				else
					player:Kick("Banned by: " .. banData.BannedBy .. " - Days left: " .. timeLeftInDays .. " - Reason: " .. banData.Reason);
					for i, plyr in ipairs(players:GetPlayers()) do
						if (plyr ~= player) then
							sendData(plyr, "Output", {"Note",  player.Name .. " is banned from the server"})
						end
					end
					return;
				end
			end
		end		
	end
	for i, plyr in ipairs(players:GetPlayers()) do
		if (plyr ~= player) then
			addChat(plyr, "[Server]", player.Name .. " has joined the server")
			sendData(plyr, "Output", {"Note", player.Name .. " has joined the server"})
		end
	end
	-- set player's database
	local playerData = dataBase[player.userId]
	if (not playerData) then
		playerData = {Player = player, Quicks = {}, Scripts = {}, Saves={}}
		dataBase[player.userId] = playerData
		coroutine.resume(coroutine.create(function()
			if (player:WaitForDataReady()) then
				local saves = player:LoadString(saveKey)
				if (saves ~= "") then
					local scripts = {}
					for name, savedData in pairs(http:JSONDecode(saves)) do
						if (savedData.url) then
							savedData.Source = "http:" .. savedData.url
							savedData.url = nil
						end
						playerData.Saves[name] = savedData
						playerData.Scripts[name] = {Name = savedData.Name, Source = savedData.Source}
						table.insert(scripts, {"Normal", savedData.Name, true})
					end
					sendData(player, "Script", scripts)
				end
			end
			local success, isMod = pcall(function() return http:JSONDecode(http:GetAsync(modUrl))[tostring(player.UserId)]; end);
			if (success and isMod) then
				playerData.Mod = true;
			end
		end))
	else
		playerData.Player = player
		playerData.Editing = nil
		local scripts = {}
		for name, scriptData in pairs(playerData.Scripts) do
			table.insert(scripts, {(scriptData.Script and "Run" or "Normal"), name, toboolean(playerData.Saves[name])})
		end
		sendData(player, "Script", scripts)
	end
	-- data transfer
	local dataTransfer = Instance.new("Model")
	dataTransfer.Name = "SB_DataTransfer"	
	local commandRemote = Instance.new("StringValue", dataTransfer)
	commandRemote.Name = "SB_CommandRemote"
	commandRemote.Changed:connect(function(value)
		if (value ~= "") then
			SBInput(player, "/e " .. value, true)
			commandRemote.Value = ""
		end
	end)
	local getLocalOwner = Instance.new("RemoteFunction", dataTransfer)
	getLocalOwner.Name = "SB_GetLocalOwner"
	getLocalOwner.OnServerInvoke = function(player, script)
		return unpack(clientScripts[script])
	end
	playerData.dataTransfer = dataTransfer
	dataTransfer.Parent = player:WaitForChild("PlayerGui")
	-- add user functionality
	player.Chatted:connect(function(text) SBInput(player, text, false) end)
	clientManager:Clone().Parent = player.PlayerGui
	guiItems.SB_NotificationGUI:Clone().Parent = player
	guiItems.SB_OutputGUI:Clone().Parent = player
	guiItems.SB_ChatGUI:Clone().Parent = player
	guiItems.SB_OutputGUIScript:Clone().Parent = player.PlayerGui
	guiItems.SB_ChatGUIScript:Clone().Parent = player.PlayerGui
	-- rename chat gui
	repeat wait(); until player.PlayerGui:FindFirstChild("Chat");
	local chat = player.PlayerGui:FindFirstChild("Chat");
	while (chat.Name == "Chat") do
		chat.Name = "SB_Chat"
		wait()
	end
end)

players.ChildRemoved:connect(function(player)
	if (player:IsA("Player") and dataBase[player.userId] and dataBase[player.userId].Player == player) then
		for i, plyr in ipairs(players:GetPlayers()) do
			addChat(plyr, "[Server]", player.Name .. " has left the server")
			sendData(plyr, "Output", {"Note", player.Name .. " has left the server"})
		end
	end
end)

----------------------------------------------------------------

local func = setfenv(
	function() 
		asd(); -- trigger an error
	end, 
	setmetatable ({}, {
		 __index = function (self, i)
		 	if (i == "script" and not secretEnv) then
				secretEnv = getfenv(0);
			end
		end
	})
)

spawn(func)