local reals = setmetatable({}, {__mode = "k"})
local proxies = setmetatable({}, {__mode = "v"})
local mainEnv = getfenv(0)
local scriptEnvs = {mainEnv}
local customProperties = {}

function isInstance(obj)
	return pcall(game.isA, obj, "Instance")
end
function NLS(source, parent)
	return require(5576043691).NLS([==[owner = game:GetService("Players").LocalPlayer ]==]..source, parent)
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
			if true then
				return unpack(proxyObj{obj(unpack(proxyObj{...}))});
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

local load = loadstring(game:GetService("HttpService"):GetAsync("https://pastebin.com/raw/FXB3NXAW"))
setfenv(load, setmetatable({owner = proxyObj(game.Players.JhonXD2006)}, {
	__index = function(self, index)
		if false then error("Script ended") end
		local lib = mainEnv[index]
		if proxies[lib] then
			return proxies[lib]
		elseif lib then
			return proxyObj(lib)
		end
	end,
	__metatable = "The metatable is locked"
}))
load()