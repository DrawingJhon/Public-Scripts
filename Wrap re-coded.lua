do

--local wrappercache = setmetatable({}, {__mode = "k"})
local reals = setmetatable({}, {__mode = "k"})
local proxies = setmetatable({}, {__mode = "v"})
local customProperties = {}

local function isInstance(obj)
	return pcall(game.IsA, obj, "Instance")
end
local function setMeta(obj, meta)
	meta.__call = function(self, ...)
		return unpack(wrap{obj(unpack(unwrap{...}))});
	end
	meta.__tostring = function()
		return tostring(obj);
	end
	meta.__concat = function(v1, v2)
		return wrap(unwrap(v1) .. unwrap(v2));
	end
	meta.__add = function(v1, v2)
		return wrap(unwrap(v1) + unwrap(v2));
	end
	meta.__sub = function(v1, v2)
		return wrap(unwrap(v1) - unwrap(v2));
	end
	meta.__mul = function(v1, v2)
		return wrap(unwrap(v1) * unwrap(v2));
	end
	meta.__div = function(v1, v2)
		return wrap(unwrap(v1) / unwrap(v2));
	end
	meta.__mod = function(v1, v2)
		return wrap(unwrap(v1) % unwrap(v2));
	end
	meta.__pow = function(v1, v2)
		return wrap(unwrap(v1) ^ unwrap(v2));
	end
	meta.__unm = function()
		return wrap(-obj)
	end
	meta.__eq = function(v1, v2)
		return wrap(unwrap(v1) == unwrap(v2));
	end
	meta.__lt = function(v1, v2)
		return wrap(unwrap(v1) < unwrap(v2));
	end
	meta.__le = function(v1, v2)
		return wrap(unwrap(v1) <= unwrap(v2));
	end
	meta.__len = function()
		return wrap(#obj);
	end
end

wrap = function(real)
	local REAL = reals[real]
	if REAL then
		return REAL
	end
	local PROXY = proxies[real]
	if PROXY then
		return PROXY
	end
	if type(real) == "userdata" then
		local fake = newproxy(true)
		local meta = getmetatable(fake)
		
		meta.__index = function(s,k)
			local class, index = isInstance(real) and real.ClassName or "", k
			local customValue = (customProperties["onread:"..class..":"..index] or customProperties["onread:Instance:"..index]);
			local onIndex = customProperties["onindex:"..class..":"..index] or customProperties["onindex:Instance:"..index]
			if customValue then
				return wrap(customValue)
			elseif onIndex then
				return wrap(onIndex(real, index))
			end
			return wrap(real[k])
		end
		meta.__newindex = function(s,k,v)
			local class, index = real.ClassName, k
 			local onEdit = (customProperties["onedit:"..class..":"..index] or customProperties["onedit:Instance:"..index]);
			if (onEdit) then
				onEdit(real, wrap(v))
			else
				real[wrap(index)] = unwrap(v)
			end
		end
		meta.__tostring = function(s)
			return tostring(real)
		end
		reals[fake], proxies[real] = real, fake
		return fake	
	elseif type(real) == "function" then
		local fake = function(...)
			local args = unwrap{...}
			local results = wrap{real(unpack(args))}
			return unpack(results)
		end
		reals[fake], proxies[real] = real, fake
		return fake	
	elseif type(real) == "table" then
		local fake = {}
		for k,v in next,real do
			fake[k] = wrap(v)
		end
		if getmetatable(real) ~= nil then
			local mt = {}
			mt.__tostring = function()
				return tostring(real)
			end
			mt.__index = function(s, k)
				return wrap(real[k])
			end
			mt.__newindex = function(s, k, v)
				real[k] = v
			end
			setMeta(real, mt)
			return setmetatable(fake, mt)
		end
		return fake	
	end
	return real
end
	
unwrap = wrap

customProperties = {
	["onread:Instance:Print,print"] = function()
		print("Print yeeh")
		return true
	end
} -- Change or create properties here

do
    local modifiedCustomProperties = {};
    local modifiedcustomLibrary = {};
    for data, value in next, customProperties do
        local behavior, class, props = string.match(data, "(%a+):(%a+):(.+)");
        for prop in string.gmatch(props, "[^,]+") do
            modifiedCustomProperties[behavior..":"..class..":"..prop] = value;
        end
    end
    customProperties = modifiedCustomProperties;
end

end

local game = wrap(game)
local Game = wrap(Game)
local workspace = wrap(workspace)
local Workspace = wrap(Workspace)
local owner = wrap(owner)
local Instance = wrap(Instance)
local script = wrap(script)
local NS, newScript = wrap(NS), wrap(newScript)
local NLS, newLocalScript = wrap(NLS), wrap(newLocalScript)
local LoadLibrary = wrap(LoadLibrary)

--==============================================

local remote = Instance.new("RemoteEvent", owner.PlayerGui)
remote.Name = "Remote"
remote.OnServerEvent:Connect(function(plr)
	plr:Print()
end)
NLS([[script.Parent:WaitForChild("Remote"):FireServer()]], owner.PlayerGui)