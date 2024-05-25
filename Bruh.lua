if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
Player,game,owner = owner,game
local RealPlayer = Player
do
	print("FE Compatibility code V2 by Mokiros")
	local RealPlayer = RealPlayer
	script.Parent = RealPlayer.PlayerGui

	--Fake event to make stuff like Mouse.KeyDown work
	local Disconnect_Function = function(this)
		this[1].Functions[this[2]] = nil
	end
	local Disconnect_Metatable = {__index={disconnect=Disconnect_Function,Disconnect=Disconnect_Function}}
	local FakeEvent_Metatable = {__index={
		Connect = function(this,f)
			local i = tostring(math.random(0,10000))
			while this.Functions[i] do
				i = tostring(math.random(0,10000))
			end
			this.Functions[i] = f
			return setmetatable({this,i},Disconnect_Metatable)
		end
	}}
	FakeEvent_Metatable.__index.connect = FakeEvent_Metatable.__index.Connect
	local function fakeEvent()
		return setmetatable({Functions={}},FakeEvent_Metatable)
	end

	--Creating fake input objects with fake variables
    local FakeMouse = {Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent(),Button2Up=fakeEvent(),Button2Down=fakeEvent()}
    FakeMouse.keyUp = FakeMouse.KeyUp
    FakeMouse.keyDown = FakeMouse.KeyDown
	local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
	local CAS = {Actions={},BindAction=function(self,name,fun,touch,...)
		CAS.Actions[name] = fun and {Name=name,Function=fun,Keys={...}} or nil
	end}
	--Merged 2 functions into one by checking amount of arguments
	CAS.UnbindAction = CAS.BindAction

	--This function will trigger the events that have been :Connect()'ed
	local function TriggerEvent(self,ev,...)
		for _,f in pairs(self[ev].Functions) do
			f(...)
		end
	end
	FakeMouse.TriggerEvent = TriggerEvent
	UIS.TriggerEvent = TriggerEvent

	--Client communication
	local Event = Instance.new("RemoteEvent")
	Event.Name = "UserInput_Event"
	Event.OnServerEvent:Connect(function(plr,io)
	    if plr~=RealPlayer then return end
		FakeMouse.Target = io.Target
		FakeMouse.Hit = io.Hit
		if not io.isMouse then
			local b = io.UserInputState == Enum.UserInputState.Begin
			if io.UserInputType == Enum.UserInputType.MouseButton1 then
				return FakeMouse:TriggerEvent(b and "Button1Down" or "Button1Up")
			end
			if io.UserInputType == Enum.UserInputType.MouseButton2 then
				return FakeMouse:TriggerEvent(b and "Button2Down" or "Button2Up")
			end
			for _,t in pairs(CAS.Actions) do
				for _,k in pairs(t.Keys) do
					if k==io.KeyCode then
						t.Function(t.Name,io.UserInputState,io)
					end
				end
			end
			FakeMouse:TriggerEvent(b and "KeyDown" or "KeyUp",io.KeyCode.Name:lower())
			UIS:TriggerEvent(b and "InputBegan" or "InputEnded",io,false)
	    end
	end)
	Event.Parent = NLS([==[local Event = script:WaitForChild("UserInput_Event")
	local Mouse = owner:GetMouse()
	local UIS = game:GetService("UserInputService")
	local input = function(io,RobloxHandled)
		if RobloxHandled then return end
		--Since InputObject is a client-side instance, we create and pass table instead
		Event:FireServer({KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState,Hit=Mouse.Hit,Target=Mouse.Target})
	end
	UIS.InputBegan:Connect(input)
	UIS.InputEnded:Connect(input)
	local h,t
	--Give the server mouse data every second frame, but only if the values changed
	--If player is not moving their mouse, client won't fire events
	local HB = game:GetService("RunService").Heartbeat
	while true do
		if h~=Mouse.Hit or t~=Mouse.Target then
			h,t=Mouse.Hit,Mouse.Target
			Event:FireServer({isMouse=true,Target=t,Hit=h})
		end
		--Wait 2 frames
		for i=1,2 do
			HB:Wait()
		end
	end]==],script)

	----Sandboxed game object that allows the usage of client-side methods and services
	--Real game object
	local RealGame = game

	--Metatable for fake service
	local FakeService_Metatable = {
		__index = function(self,k)
			local s = rawget(self,"_RealService")
			if s then
				return typeof(s[k])=="function"
				and function(_,...)return s[k](s,...)end or s[k]
			end
		end,
		__newindex = function(self,k,v)
			local s = rawget(self,"_RealService")
			if s then s[k]=v end
		end
	}
	local function FakeService(t,RealService)
		t._RealService = typeof(RealService)=="string" and RealGame:GetService(RealService) or RealService
		return setmetatable(t,FakeService_Metatable)
	end

	--Fake game object
	local FakeGame = {
		GetService = function(self,s)
			return rawget(self,s) or RealGame:GetService(s)
		end,
		Players = FakeService({
			LocalPlayer = FakeService({GetMouse=function(self)return FakeMouse end},Player)
		},"Players"),
		UserInputService = FakeService(UIS,"UserInputService"),
		ContextActionService = FakeService(CAS,"ContextActionService"),
		RunService = FakeService({
			_btrs = {},
			RenderStepped = RealGame:GetService("RunService").Heartbeat,
			BindToRenderStep = function(self,name,_,fun)
				self._btrs[name] = self.Heartbeat:Connect(fun)
			end,
			UnbindFromRenderStep = function(self,name)
				self._btrs[name]:Disconnect()
			end,
			IsClient = function()
				return true
			end
		},"RunService"),
		IsLoaded = function()
			return true
		end,
		StarterGui = setmetatable({}, { 
			__index = function(self, index)
				print("StarterGui: "..tostring(index))
				local ind = RealGame:GetService("StarterGui")[index]
				if type(ind) == "function" then
					return function(self, ...)
						for i, v in pairs(select(2,...)) do
							print(i, v)
						end
						return ind(RealGame:GetService("StarterGui"), ...)
					end
				end
				return RealGame:GetService("StarterGui")[index]
			end,
			__newindex = function(self, index, value)
				print("StarterGui: "..tostring(index), ",", tostring(value))
				RealGame:GetService("StarterGui")[index] = value
			end,
			__tostring = "StarterGui"
		}),
		Shutdown = function(self)
			warn("Fake shutdown")
			return error("Script ended by fake shutdown")
		end
	}
	rawset(FakeGame.Players,"localPlayer",FakeGame.Players.LocalPlayer)
	rawset(FakeGame.RunService, "isClient", FakeGame.RunService.IsClient)
	FakeGame.service = FakeGame.GetService
	FakeService(FakeGame,game)
	--Changing owner to fake player object to support owner:GetMouse()
	game,owner = FakeGame,FakeGame.Players.LocalPlayer
end
do
	local RealGame = game
	local Players = RealGame:GetService("Players")
	game = newproxy(true)
	local meta = getmetatable(game)
	local childGame = {
		CoreGui = RealGame.Players.LocalPlayer.PlayerGui
	}
	meta.__index = function(self, index)
		if index == "HttpGet" then
			return function(self, ...)
				return RealGame:GetService("HttpService"):GetAsync(...)
			end
		end
		if childGame[index] then
			return childGame[index]
		end
		local validServices = {"GetService", "getService", "service", "Service", "FindService", "findService"}
		if table.find(validServices, index) then
			return function(self, service)
				local fake = childGame[service]
				return fake or RealGame:GetService(service)
			end
		end
		if type(RealGame[index]) == "function" then
			return function(self, ...)
				return RealGame[index](RealGame, ...)
			end
		end
		return not print("Game: "..tostring(index)) and RealGame[index]
	end
	meta.__newindex = function(self, index, value)
		RealGame[index] = value
	end
	meta.__tostring = function(self)
		return "Game"
	end
	meta.__metatable = "The metatable is locked"
	local lEnabled = pcall(loadstring, "") and true
	local RealLdstr = lEnabled and loadstring or require(5343495217)
	function loadstring(str, bool)
		return RealLdstr(str, lEnabled and "T_String" or getfenv(0))
	end
	function settings()
		return {}
	end
	function getgenv()
		return getfenv(0)
	end
	function getrawmetatable(obj)
		if obj == game then
			return meta
		else
			warn("doesn't exist metatable: "..tostring(obj))
			return {}
		end
	end
	function setreadonly(meta, bool)
		return meta
	end
	function newcclosure(f)
		return f
	end
	function sethiddenproperty(...)
		--idk what makes this function xd
		return true
	end
	function saveinstance(...)
		return (...)
	end
	function protosmasher()
		return true
	end
	local files = {}
	function readfile(name)
		return name --files[name] or "{\"Hola\":\"MUNDO\"}"
	end
	function isIclosure()
		return false
	end
	function islclosure()
		return false
	end
	function set_hidden_prop()
		return true
	end
	function writefile(name, idk)
		print("Writted: "..tostring(name), idk)
		files[name] = idk
		return true
	end
	local realTypeof = typeof
	function typeof(obj)
		if obj == game then
			return realTypeof(RealGame)
		else
			return realTypeof(obj)
		end
	end
end
_G = {}
_G.CheckCustomBuilds = false --true
_G.DefaulBuilds = false --true
_G.Barrier = true
_G.bridge2 = true
_G.bridge4 = true
_G.ladder = true
_G.Nazi = true
_G.penis = true
_G.platform = true
_G.stairs = true
_G.BigPP = true

_G.RGB = false
_G.RGBswitchDelay = .4

_G.RejoinWaitDelayForReExecute = 5  -- tell how long the script will wait before rejoining (for synapse script queing)
local realWait = wait
function wait(n)
	print("Wait "..tostring(n))
	return realWait(n)
end
print(game:GetService("RunService"):IsClient())
local Debounce = false
delay(10, function()
	Debounce = true
end)
local load = loadstring(game:HttpGet("https://ssbtools.netlify.app/assets/storage/LOADSTRING_SCRIPT2.txt"), true)
setfenv(load, setmetatable({}, {
	__index = function(self, index)
		if Debounce or not getfenv(0)[index] then
			print(index)
		end
		return getfenv(0)[index]
	end;
}))
load()