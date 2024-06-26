local spoofs = {}
local intentNull = newproxy()

local function spoofproperty(obj, prop, val)
	assert(typeof(obj) == "Instance", "spoofproperty argument 1 invalid type ("..typeof(obj)..", expected Instance)")
	assert(type(prop) == "string", "spoofproperty argument 2 invalid type ("..typeof(obj)..", expected string)")

	if not pcall(function() return obj[prop] end) then
		warn("spoofproperty: "..prop.." is not a valid property of "..obj:GetFullName())
	end

	if val == nil then
		val = intentNull
	end

	local props = spoofs[obj]
	if not props then
		props = {}
		spoofs[obj] = props
	end

	props[prop] = val
end

local function unspoofproperty(obj, prop)
	local props = spoofs[obj]
	if props then
		props[prop] = nil
	end
end

local getproperty; getproperty = hookmetamethod(game, "__index", function(self, index)
	local props = spoofs[self]
	local val = props and props[index]

	if val ~= nil then
		if val == intentNull then
			return nil
		end
		return val
	end
	
	return getproperty(self, index)
end)

getfenv(0).spoofproperty = spoofproperty
getfenv(0).unspoofproperty = unspoofproperty
getfenv(0).getproperty = getproperty