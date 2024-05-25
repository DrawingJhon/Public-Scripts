local originals = setmetatable({}, {__mode = "k"})
local wrappeds = setmetatable({}, {__mode = "v"})
local customProperties = {}

local function argsFunc(f, ...)
	local t={n=select("#",...),...}
	for i=1,t.n do
		t[i]=f(select(i,...))
	end
	return unpack(t,1,t.n)
end

local function isInstance(obj)
	return pcall(game.isA, obj, "Instance")
end

local function eject(obj, functionName)
    if not isInstance(obj) then error("Expected ':' not '.' calling member function "..functionName) end
end

local function setmeta(meta, obj)
	meta.__tostring = function()
		return tostring(obj);
	end
	meta.__concat = function(v1, v2)
		return wrap(wrap(v1) .. wrap(v2));
	end
	meta.__add = function(v1, v2)
		return wrap(wrap(v1) + wrap(v2));
	end
	meta.__sub = function(v1, v2)
		return wrap(wrap(v1) - wrap(v2));
	end
	meta.__mul = function(v1, v2)
		return wrap(wrap(v1) * wrap(v2));
	 end
	meta.__div = function(v1, v2)
		return wrap(wrap(v1) / wrap(v2));
	end
	meta.__mod = function(v1, v2)
		return wrap(wrap(v1) % wrap(v2));
	end
	meta.__pow = function(v1, v2)
		return wrap(wrap(v1) ^ wrap(v2));
	end
	meta.__unm = function()
		return wrap(-obj)
	end
	meta.__eq = function(v1, v2)
		return wrap(wrap(v1) == wrap(v2));
	end
	meta.__lt = function(v1, v2)
		return wrap(wrap(v1) < wrap(v2));
	end
	meta.__le = function(v1, v2)
		return wrap(wrap(v1) <= wrap(v2));
	end
	meta.__len = function()
		return wrap(#obj);
	end
	meta.__metatable = getmetatable(obj);
end

function wrap(real)
	local original = originals[real]
	if original then
		return original
	end
	local wrapped = wrappeds[real]
	if wrapped then
		return wrapped
	end
	if type(real) == "userdata" then
		local fake = newproxy(true)
		local meta = getmetatable(fake)
		if isInstance(real) then
			local class = real.ClassName
			meta.__index = function(self, index)
				local customValue = customProperties["onread:"..class..":"..index] or customProperties["onread:Instance:"..index]
				local onIndex = customProperties["onindex:"..class] or customProperties["onindex:Instance"] or customProperties["onindex:"..class..":"..index] or customProperties["onindex:Instance:"..index]
				if onIndex then
					return wrap(onIndex(real, wrap(index)))
				elseif customValue then
					return wrap(customValue)
				else
					return wrap(real[wrap(index)])
				end
			end
			meta.__newindex = function(self, index, value)
				local onEdit = customProperties["onedit:"..class..":"..index] or customProperties["onedit:Instance:"..index]
				local onNewIndex = customProperties["onedit:"..class] or customProperties["onedit:Instance"]
				if onNewIndex then
					onNewIndex(real, wrap(index), wrap(value))
				elseif onEdit then
					onEdit(real, wrap(value))
				else
					real[wrap(index)] = wrap(value)
				end
			end
		else
			meta.__index = function(self, index)
				return wrap(real[wrap(index)])
			end
			meta.__newindex = function(self, index, value)
				real[wrap(index)] = wrap(value)
			end
			meta.__call = function(self, ...)
				local args = wrap{...}
				local result = wrap{real(unpack(args))}
				return unpack(result)
			end
		end
		setmeta(meta, real)
		wrappeds[real] = fake
		originals[fake] = real
		return fake
	elseif type(real) == "function" then
		local fake = function(...)
			return argsFunc(wrap, real(argsFunc(wrap, ...)))
		end
		wrappeds[real] = fake
		originals[fake] = real
		return fake
	elseif type(real) == "table" then
		local fake = {}
		for i, v in pairs(real) do
			fake[wrap(i)] = wrap(v)
		end
		if getmetatable(real) then
			local meta = {}
			meta.__index = function(self, index)
				return wrap(real[wrap(index)])
			end
			meta.__newindex = function(self, index, value)
				real[wrap(index)] = wrap(value)
			end
			meta.__call = function(self, ...)
				local fake = function(...)
					local args = wrap{...}
					local result = wrap{real(unpack(args))}
					return unpack(result)
				end
				originals[fake] = real
				wrappeds[real] = fake
				return fake
			end
			setmeta(meta, real)
			setmetatable(fake, meta)
		end
		return fake
	else
		return real
	end
end

local LocalScript = NLS([==[local Event = script:WaitForChild("Remote")
local ahh = script:waitForChild'GetClientProperty'
local Mouse = owner:GetMouse()
local UIS = game:GetService("UserInputService")
local cam = workspace.CurrentCamera
local mData = {'KeyDown','KeyUp','Button1Down','Button1Up','Button2Down','Button2Up'}
local cData = {CFrame=nil,CoordinateFrame=nil,CameraSubject=nil,CameraType=nil,FieldOfView=nil,Focus=nil,HeadLocked=nil,HeadScale=nil,ViewportSize=nil}
local onMouse = function(int, type)
	Mouse[type]:connect(function(...)
		Event:FireServer({Type='Mouse',Event=type:lower(),Args={...}})
	end)
end
table.foreach(mData, onMouse)
local input = function(type)
	UIS[type]:connect(function(io,RobloxHandled)
		if RobloxHandled then return end
		Event:FireServer({Type='UserInput',Event=type:lower(),Args={{KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState}, false}})
	end)
end
input('InputBegan') input('InputChanged') input('InputEnded')
UIS.TextBoxFocusReleased:connect(function(inst)
	Event:FireServer{Type='TextboxReplication',TextBox=inst,Text=inst.Text}
end)
Event.OnClientEvent:Connect(function(action, data)
	if action == "newindex" then
		local obj = data.Instance
		if obj == "Camera" then
			cam[data.Index] = data.NewIndex
		else
			obj[data.Index] = data.NewIndex
		end
	end
end)
local h,t,x,y
local HB = game:GetService("RunService").Heartbeat
ahh.OnClientInvoke = function(wht, obj, int)
	if wht == 'Ready' then
		return true
	elseif wht == 'GetProperty' then
		return obj[int]
	end
end
while true do
	if h~=Mouse.Hit or t~=Mouse.Target or x~=Mouse.X or y~=Mouse.Y then
		h,t=Mouse.Hit,Mouse.Target
		Event:FireServer({Type='Mouse',Variables={Hit=h,Target=t,X=x,Y=y}})
	end
	local changed = false
	local sentCam = {}
	for prop, value in pairs(cData) do
		if cam[prop] ~= value then
			sentCam[prop] = cam[prop]
			changed = true
		end
		cData[prop] = cam[prop]
	end
	if changed then
		Event:FireServer({Type='Camera',Variables=sentCam})
	end
	for i=1,2 do
		HB:Wait()
	end
end]==], owner.PlayerGui)

local Bindable = Instance.new("BindableEvent")
local remote = Instance.new("RemoteEvent")
remote.Name = "Remote"
local GetProperty = Instance.new("RemoteFunction")
GetProperty.Name = "GetClientProperty"
GetProperty.Parent = LocalScript
remote.Parent = LocalScript
local Sounds = setmetatable({}, {__mode = "k"})
local FakeCam = {
	["CFrame"] = CFrame.new();
	["CoordinateFrame"] = CFrame.new();
}

local FakeMouse = {
	["Hit"] = CFrame.new();
	["Target"] = nil;
	["X"] = 0;
	["Y"] = 0;
}

remote.OnServerEvent:Connect(function(plr, data)
	if plr ~= owner then return end
	if data.Type == "Camera" then
		for i, v in next, data.Variables do
			FakeCam[i] = v
		end
	elseif data.Type == "Mouse" and data.Variables then
		for i, v in next, data.Variables do
			FakeMouse[i] = v
		end
	elseif data.Type == "TextboxReplication" then
		local tb = data.TextBox
		if not tb then return end
		local text = data.Text
		tb.Text = text
		Bindable:Fire{Type = "TextBox", Event = "FocusLost", Args = {tb}}
	end
end)
local function RegSound(sound)
	if not sound:IsA("Sound") then return end
	game:GetService("RunService").Heartbeat:Connect(function()
		if sound.Parent then
			local pl = GetProperty:InvokeClient(owner, sound.Parent and "GetProperty" or "Ready", sound, "PlaybackLoudness")
			if pl then
				Sounds[sound] = pl
			end
		end
	end)
end
for i, v in pairs(workspace:GetDescendants()) do
	RegSound(v)
end
workspace.DescendantAdded:Connect(RegSound)

customProperties = {
	["onread:Players:LocalPlayer,localPlayer"] = owner,
	["onread:RunService:RenderStepped,renderStepped"] = game:GetService("RunService").Heartbeat,
	["onread:Player:GetMouse,getMouse"] = function(plr)
		eject(plr, "GetMouse")
		if plr ~= owner then return end
		local fake = newproxy(true)
		local mt = getmetatable(fake)

		mt.__index = function(self, index)
			if FakeMouse[index] then
				return FakeMouse[index]
			elseif index == "x" then
				return FakeMouse.X
			elseif index == "y" then
				return FakeMouse.Y
			end
			local ValidConns = {"KeyDown", "keyDown", "KeyUp", "keyUp", "Button1Down", "button1Down",
			"Button1Up", "button1Up", "Button2Down", "button2Down", "Button2Up", "button2Up", "HitMoved",
			"hitMoved"}
			local function OnEvent(type)
				local ud = newproxy(true)
				local meta = getmetatable(ud)
				meta.__index = function(self, index)
					if index == "Connect" or index == "connect" then
						return function(self, func)
							if self ~= ud then
								error("Invalid argument #1 to 'Connect' (RBXScriptSignal expected, got "..tostring(self)..")")
							end
							return remote.OnServerEvent:Connect(function(plr, data)
								if plr ~= owner or data.Type ~= "Mouse" then return end
								if data.Event == type:lower() then
									local args = data.Args
									local result = wrap(args)
									func(unpack(result))
								end
							end)
						end
					elseif index == "Wait" or index == "wait" then
						return function(self)
							if self ~= ud then
								error("Invalid argument #1 to 'Connect' (RBXScriptSignal expected, got "..tostring(self)..")")
							end
							local result
							repeat
								local plr, data = remote.OnServerEvent:Wait()
								if plr == owner then
									if data.Event == type:lower() then
										result = data.Args
									end
								end
							until result
							return unpack(result)
						end
					end
					error(index.." is not valid member of RBXScriptSignal")
				end
				meta.__newindex = function(self, k, v)
					error(k..' is not valid member of PlayerMouse "Instance"')
				end
				meta.__tostring = function(self)
					return "Signal "..type
				end
				meta.__metatable = "The metatable is locked"
				meta.__call = function(self)
					error("attempt to call a RBXScriptSignal value")
				end
				return ud
			end
			if table.find(ValidConns, index) then
				return OnEvent(index)
			end
			error(index..' is not valid member of PlayerMouse "Instance"')
		end
		mt.__newindex = function(self, k, v)
			error(k..' is not valid member of PlayerMouse "Instance"')
		end
		mt.__metatable = "The metatable is locked"
		mt.__tostring = function(self)
			return "Instance"
		end
		mt.__call = function(self)
			error("attempt to call a "..tostring(self).." value")
		end
		return fake
	end,
	["onindex:UserInputService"] = function(obj, index)
		local ValidConns = {"InputChanged", "inputChanged", "InputBegan", "inputBegan", "InputEnded",
		"inputEnded"}
		local remote = wrap(remote)
		local function OnEvent(type)
			local ud = newproxy(true)
			local meta = getmetatable(ud)
			meta.__index = function(self, index)
				if index == "Connect" or index == "connect" then
					return function(self, func)
						if self ~= ud then
							error("Invalid argument #1 to 'Connect' (RBXScriptSignal expected, got "..tostring(self)..")")
						end
						return remote.OnServerEvent:Connect(function(plr, data)
							if plr ~= owner or data.Type ~= "UserInput" then return end
							if data.Event == type:lower() then
								local args = data.Args
								func(unpack(wrap(args)))
							end
						end)
					end
				elseif index == "Wait" or index == "wait" then
					return function(self)
						if self ~= ud then
							error("Invalid argument #1 to 'Connect' (RBXScriptSignal expected, got "..tostring(self)..")")
						end
						local result
						repeat
							local plr, data = remote.OnServerEvent:Wait()
							if plr == owner then
								if data.Event == type:lower() then
									result = data.Args
								end
							end
						until result
						return unpack(result)
					end
				end
				error(index.." is not valid member of RBXScriptSignal")
			end
			meta.__newindex = function(self, k, v)
				error(k..' cannot be assigned to')
			end
			meta.__tostring = function(self)
				return "Signal "..type
			end
			meta.__metatable = "The metatable is locked"
			meta.__call = function(self)
				error("attempt to call a "..tostring(self).." value")
			end
			return ud
		end
		if table.find(ValidConns, index) then
			return OnEvent(index)
		end
		error(index..' is not valid member of UserInputService "Instance"')			
	end,
	["onindex:Camera"] = function(obj, index)
		local prop = obj[index]
		return FakeCam[index] or prop
	end,
	["onedit:Camera"] = function(obj, i, v)
		local bruh = obj[i]
		if obj == workspace.CurrentCamera then
			remote:FireClient(owner, "newindex", {Instance = "Camera", Index = i, NewIndex = v})
		else
			remote:FireClient(owner, "newindex", {Instance = obj, Index = i, NewIndex = v})
		end
	end,
	["onindex:Sound:PlaybackLoudness"] = function(obj, index)
		local result = Sounds[obj]
		return result or obj[index]
	end,
	["onindex:TextBox:FocusLost,focusLost"] = function(obj, index)
		local ud = newproxy(true)
		local meta = getmetatable(ud)
		meta.__index = function(self, index)
			if index == "Connect" or index == "connect" then
				return function(self, func)
					if self ~= ud then
						error("Invalid argument #1 to 'Connect' (RBXScriptSignal expected, got "..tostring(self)..")")
					end
					return Bindable.Event:Connect(function(data)
						if data.Type ~= "TextBox" then return end
						if data.Event == "FocusLost" then
							local tb = data.Args[1]
							if tb == obj then
								local args = data.Args
								local result = wrap(args)
								func(unpack(result))
							end
						end
					end)
				end
			elseif index == "Wait" or index == "wait" then
				return function(self)
					if self ~= ud then
						error("Invalid argument #1 to 'Connect' (RBXScriptSignal expected, got "..tostring(self)..")")
					end
					local result
					repeat wait()
						local data = Bindable.Event:Wait()
						if data.Event == "FocusLost" then
							local textbox = data.Args[1]
							if textbox == obj then
								result = data.Args
							end
						end
					until result
					return unpack(result)
				end
			end
			error(index.." is not valid member of RBXScriptSignal")
		end
		meta.__newindex = function(self, k, v)
			error(k..' cannot be assigned to')
		end
		meta.__tostring = function(self)
			return "Signal "..type
		end
		meta.__metatable = "The metatable is locked"
		meta.__call = function(self)
			error("attempt to call a "..tostring(self).." value")
		end
		return ud
	end
}
do
	local modifiedCustomProperties = {};
	local modifiedcustomLibrary = {};
	for data, value in next, customProperties do
		local behavior, class, props = string.match(data, "(%a+):(%a+):(.+)");
		if props then
			for prop in string.gmatch(props, "[^,]+") do
				modifiedCustomProperties[behavior..":"..class..":"..prop] = value;
			end
		else
			modifiedCustomProperties[data] = value
		end	
	end
	customProperties = modifiedCustomProperties;
end

repeat wait() until GetProperty:InvokeClient(owner, "Ready")
local http = game:GetService("HttpService"):GetAsync("https://pastebin.com/raw/EEKTXf2S")
local Loadstring = loadstring(http, "Bruh")
if Loadstring then
	local env = getfenv(Loadstring)
	local FakeEnv = {}
	setfenv(Loadstring, setmetatable({script = wrap(script), owner = wrap(owner)}, {
		__index = function(self, k)
			local lib = env[k]
			if wrappeds[lib] then
				return wrappeds[lib]
			end
			return wrap(env[k])
		end,
		__metatable = getmetatable(env)
	}))
	print("Running...")
	Loadstring()
end