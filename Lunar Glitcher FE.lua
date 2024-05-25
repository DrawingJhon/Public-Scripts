--https://github.com/Mokiros/roblox-FE-compatibility
if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
local Player,game,owner = owner,game
local RealPlayer = Player
do
	print("FE Compatibility code V2 by Mokiros")
	local RealPlayer = RealPlayer
	script.Parent = RealPlayer.Character

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
		},"RunService")
	}
	rawset(FakeGame.Players,"localPlayer",FakeGame.Players.LocalPlayer)
	FakeGame.service = FakeGame.GetService
	FakeService(FakeGame,game)
	--Changing owner to fake player object to support owner:GetMouse()
	game,owner = FakeGame,FakeGame.Players.LocalPlayer
end
plr = owner
char = plr.Character
hum = char.Humanoid
mouse = plr:GetMouse()
Mouse = mouse
UserInputService = game:GetService("UserInputService")
ContextActionService = game:GetService("ContextActionService")
local cam = game.Workspace.CurrentCamera
Camera = cam
local CamInterrupt = false
local TwoD = false
local TargetInfo = {nil, nil}
cam.CameraType = "Custom"
t = char.Torso
h = char.Head
ra = char["Right Arm"]
la = char["Left Arm"]
rl = char["Right Leg"]
ll = char["Left Leg"]
tors = char.Torso
lleg = char["Left Leg"]
root = char.HumanoidRootPart
hed = char.Head
rleg = char["Right Leg"]
rarm = char["Right Arm"]
larm = char["Left Arm"]
radian = math.rad
random = math.random
Vec3 = Vector3.new
Inst = Instance.new
cFrame = CFrame.new
Euler = CFrame.fromEulerAnglesXYZ
vt = Vector3.new
bc = BrickColor.new
br = BrickColor.random
it = Instance.new
cf = CFrame.new

local Booleans = {
  CamFollow = true,
  GyroUse = true
}

function lerp(object, newCFrame, alpha)
  return object:lerp(newCFrame, alpha)
end

local Directer = Inst("BodyGyro", root)
Directer.MaxTorque = Vec3(0, 0, 0)
Directer.P = 600000
local CPart = Inst("Part")
CPart.Anchored = true
CPart.CanCollide = false
CPart.Locked = true
CPart.Transparency = 1

local rainbowmode = false
local chaosmode = false

local kan = Instance.new("Sound",char)
kan.Volume = 5
kan.TimePosition = 0
kan.PlaybackSpeed = 1
kan.Pitch = 1
kan.SoundId = "rbxassetid://561833161"
kan.Name = "wrecked"
kan.Looped = true
kan:Play()

local currentThemePlaying = kan.SoundId
local currentPitch = kan.Pitch
local currentVol = kan.Volume
function newTheme(ID,timepos,pitch,vol)
local kanz = kan
--kanz:Stop()
kanz.Volume = vol
--kanz.TimePosition = timepos
kanz.PlaybackSpeed = pitch
kanz.Pitch = pitch
kanz.SoundId = ID
kanz.Name = "wrecked"
kanz.Looped = true
currentThemePlaying = kanz.SoundId
currentVol = kanz.Volume
currentPitch = kanz.Pitch
--kanz:Play()
--coroutine.resume(coroutine.create(function()
--wait(0.05)
--end))
end


function newThemeCust(ID,timepos,pitch,vol)
local kanz = kan
kanz:Stop()
kanz.Volume = vol
kanz.TimePosition = timepos
kanz.PlaybackSpeed = pitch
kanz.Pitch = pitch
kanz.SoundId = ID
kanz.Name = "wrecked"
kanz.Looped = true
currentThemePlaying = kanz.SoundId
currentVol = kanz.Volume
currentPitch = kanz.Pitch
kanz:Play()
coroutine.resume(coroutine.create(function()
wait(0.05)
end))
end

local mutedtog = false

function CameraEnshaking(Length,Intensity)
coroutine.resume(coroutine.create(function()
      local intensity = 1*Intensity
      local rotM = 0.01*Intensity
for i = 0, Length, 0.1 do
swait()
intensity = intensity - 0.05*Intensity/Length
rotM = rotM - 0.0005*Intensity/Length
      hum.CameraOffset = Vec3(radian(random(-intensity, intensity)), radian(random(-intensity, intensity)), radian(random(-intensity, intensity)))
      cam.CFrame = cam.CFrame * cFrame(radian(random(-intensity, intensity)), radian(random(-intensity, intensity)), radian(random(-intensity, intensity))) * Euler(radian(random(-intensity, intensity)) * rotM, radian(random(-intensity, intensity)) * rotM, radian(random(-intensity, intensity)) * rotM)
end
Humanoid.CameraOffset = Vec3(0, 0, 0)
end))
end
CamShake=function(Part,Distan,Power,Times) 
local de=Part.Position
for i,v in pairs(workspace:children()) do
 if v:IsA("Model") and v:findFirstChild("Humanoid") then
for _,c in pairs(v:children()) do
if c.ClassName=="Part" and (c.Position - de).magnitude < Distan then
local Noob=v.Humanoid
if Noob~=nil then
coroutine.resume(coroutine.create(function()
FV = Instance.new("BoolValue", Noob)
FV.Name = "CameraShake"
for ShakeNum=1,Times do
swait()
local ef=Power
  if ef>=1 then
   Humanoid.CameraOffset = Vector3.new(math.random(-ef,ef),math.random(-ef,ef),math.random(-ef,ef))
  else
   ef=Power*10
   Humanoid.CameraOffset = Vector3.new(math.random(-ef,ef)/10,math.random(-ef,ef)/10,math.random(-ef,ef)/10)
  end	
end
Humanoid.CameraOffset = Vector3.new(0,0,0)
FV:Destroy()
end))
CameraShake(Times, Power, Noob)
end
end
end
end
end
end


function chatfunc(text,color,typet,font,timeex)
local chat = coroutine.wrap(function()
if Character:FindFirstChild("TalkingBillBoard")~= nil then
Character:FindFirstChild("TalkingBillBoard"):destroy()
end
local naeeym2 = Instance.new("BillboardGui",Character)
naeeym2.Size = UDim2.new(0,100,0,40)
naeeym2.StudsOffset = Vector3.new(0,3,0)
naeeym2.Adornee = Character.Head
naeeym2.Name = "TalkingBillBoard"
local tecks2 = Instance.new("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.BorderSizePixel = 0
tecks2.Text = ""
tecks2.Font = font
tecks2.TextSize = 30
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = color
tecks2.TextStrokeColor3 = Color3.new(0,0,0)
tecks2.Size = UDim2.new(1,0,0.5,0)
local tecks3 = Instance.new("TextLabel",naeeym2)
tecks3.BackgroundTransparency = 1
tecks3.BorderSizePixel = 0
tecks3.Text = ""
tecks3.Font = font
tecks3.TextSize = 30
tecks3.TextStrokeTransparency = 0
if typet == "Inverted" then
tecks3.TextColor3 = Color3.new(0,0,0)
tecks3.TextStrokeColor3 = color
elseif typet == "Normal" then
tecks3.TextColor3 = color
tecks3.TextStrokeColor3 = Color3.new(0,0,0)
end
tecks3.Size = UDim2.new(1,0,0.5,0)
coroutine.resume(coroutine.create(function()
while true do
swait(1)
if chaosmode == true then
tecks2.TextColor3 = BrickColor.random().Color
tecks3.TextStrokeColor3 = BrickColor.random().Color
end
end
end))
modet.TextTransparency = modet.TextTransparency  + 1
modet.TextStrokeTransparency = modet.TextStrokeTransparency + 1
for i = 0, 74*timeex do
swait()
modet.TextTransparency = 1
modet.TextStrokeTransparency = 1
tecks2.Text = text
tecks3.Text = text
end
local randomrot = math.random(1,2)
if randomrot == 1 then
for i = 1, 50 do
swait()
tecks2.Text = text
tecks3.Text = text
modet.TextTransparency = modet.TextTransparency - .02
modet.TextStrokeTransparency = modet.TextStrokeTransparency - .02
tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks2.TextTransparency = tecks2.TextTransparency + .04
tecks3.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks3.TextTransparency = tecks2.TextTransparency + .04
end
elseif randomrot == 2 then
	for i = 1, 50 do
swait()
tecks2.Text = text
tecks3.Text = text
modet.TextTransparency = modet.TextTransparency - .02
modet.TextStrokeTransparency = modet.TextStrokeTransparency - .02
tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks2.TextTransparency = tecks2.TextTransparency + .04
tecks3.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks3.TextTransparency = tecks2.TextTransparency + .04
end
end
modet.TextTransparency = 0
modet.TextStrokeTransparency = 0
if toggleTag == false then
modet.TextTransparency = 1
modet.TextStrokeTransparency = 1
end
naeeym2:Destroy()
end)
chat()
end

function bosschatfunc(text,color,watval)
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
coroutine.resume(coroutine.create(function()
if v.PlayerGui:FindFirstChild("Dialog")~= nil then
v.PlayerGui:FindFirstChild("Dialog"):destroy()
end
local scrg = Instance.new("ScreenGui",v.PlayerGui)
CFuncs["EchoSound"].Create("rbxassetid://525200869", scrg, 0.5, 1,0,10,0.1,0.25,1)
scrg.Name = "Dialog"
local txtlb = Instance.new("TextLabel",scrg)
txtlb.Text = ""
txtlb.Font = "Bodoni"
txtlb.TextColor3 = Color3.new(0,0,0)
txtlb.TextStrokeTransparency = 0
txtlb.BackgroundTransparency = 0.75
txtlb.BackgroundColor3 = Color3.new(0,0,0)
txtlb.TextStrokeColor3 = color
txtlb.TextScaled = true
txtlb.Size = UDim2.new(1,0,0.25,0)
txtlb.TextXAlignment = "Left"
txtlb.Position = UDim2.new(0,0,0.75 + 1,0)
local txtlb2 = Instance.new("TextLabel",scrg)
txtlb2.Text = "aomFetty Edit"
txtlb2.Font = "Arcade"
txtlb2.TextColor3 = Color3.new(0,0,0)
txtlb2.TextStrokeTransparency = 0
txtlb2.BackgroundTransparency = 1
txtlb2.TextStrokeColor3 = color
txtlb2.TextSize = 40
txtlb2.Size = UDim2.new(1,0,0.25,0)
txtlb2.TextXAlignment = "Left"
txtlb2.Position = UDim2.new(0,0,1,0)
local fvalen = 0.55
local fval = -0.49
coroutine.resume(coroutine.create(function()
while true do
swait()
if chaosmode == true then
txtlb.Rotation = math.random(-1,1)
txtlb2.Rotation = math.random(-1,1)
txtlb.Position = txtlb.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
txtlb2.Position = txtlb2.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
txtlb.TextStrokeColor3 = BrickColor.random().Color
txtlb2.TextStrokeColor3 = BrickColor.random().Color
end
end
end))
coroutine.resume(coroutine.create(function()
while true do
swait()
if scrg.Parent ~= nil then
	fvalen = fvalen - 0.0001
elseif scrg.Parent == nil then
break
end
end
end))
local flol = 1.75
local flil = 1.6
coroutine.resume(coroutine.create(function()
	for i = 0, 9 do
		swait()
		fval = fval + 0.05
		flol = flol - 0.1
		flil = flil - 0.1
		txtlb.Text = ""
		txtlb.Position = UDim2.new(0,0,flol,0)
		txtlb2.Position = UDim2.new(0,0,flil,0)
	end
	txtlb.Text = text
wait(watval)
local valinc = 0
for i = 0, 99 do
swait()
valinc = valinc + 0.0001
flol = flol + valinc
flil = flil + valinc
txtlb.Rotation = txtlb.Rotation + valinc*20
txtlb2.Rotation = txtlb2.Rotation - valinc*50
txtlb.Position = UDim2.new(0,0,flol,0)
txtlb2.Position = UDim2.new(0,0,flil,0)
txtlb.TextStrokeTransparency = txtlb.TextStrokeTransparency + 0.01
txtlb.TextTransparency = txtlb.TextTransparency + 0.01
txtlb2.TextStrokeTransparency = txtlb2.TextStrokeTransparency + 0.01
txtlb2.TextTransparency = txtlb2.TextTransparency + 0.01
txtlb.BackgroundTransparency = txtlb.BackgroundTransparency + 0.0025
end
scrg:Destroy()
end))
end))
end
end

local disably = false
function warnedpeople(text,represfont,color,color2)
	if disably ~= true then
CFuncs["Sound"].Create("rbxassetid://534859368", char, 2.5,1)
CFuncs["Sound"].Create("rbxassetid://963718869", char, 1,1)
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
coroutine.resume(coroutine.create(function()
if v.PlayerGui:FindFirstChild("Spinny")~= nil then
v.PlayerGui:FindFirstChild("Spinny"):destroy()
end
local scrg = Instance.new("ScreenGui",v.PlayerGui)
scrg.Name = "Spinny"
local frm = Instance.new("Frame",scrg)
frm.BackgroundTransparency = 0.25
frm.BackgroundColor3 = color
frm.BorderSizePixel = 0
frm.Rotation = 45
frm.Size = UDim2.new(3,0,0,100)
frm.Position = UDim2.new(-4,0,0,0)
local frm2 = frm:Clone()
frm2.Parent = scrg
frm2.BackgroundColor3 = color2
frm2.Position = UDim2.new(-4.05,0,0,0)
local imlb = Instance.new("ImageLabel",scrg)
imlb.BackgroundTransparency = 1
imlb.BackgroundColor3 = Color3.new(0,0,0)
imlb.Image = "rbxassetid://2344851144"
imlb.Size = UDim2.new(0,750,0,750)
imlb.ImageColor3 = color2
imlb.ImageTransparency = 0.25
imlb.Position = UDim2.new(-2.5,0,-2.5,0)
local imlb2 = imlb:Clone()
imlb2.Image = "rbxassetid://2325939897"
imlb2.Size = UDim2.new(1,0,1,0)
imlb2.ImageColor3 = color
imlb2.ImageTransparency = 0
imlb2.Position = UDim2.new(0,0,0,0)
local imlb3 = imlb:Clone()
imlb3.Image = "rbxassetid://2344830904"
imlb3.Size = UDim2.new(1,0,1,0)
imlb3.ImageColor3 = color2
imlb3.ImageTransparency = 0
imlb3.Position = UDim2.new(0,0,0,0)
local imlb4 = imlb:Clone()
imlb4.Image = "rbxassetid://2344870656"
imlb4.Size = UDim2.new(3,0,3,0)
imlb4.ImageColor3 = Color3.new(1,1,1)
imlb4.ImageTransparency = 0
imlb4.Position = UDim2.new(-1,0,-1,0)
local imlb5 = imlb:Clone()
imlb5.Image = "rbxassetid://2344870656"
imlb5.Size = UDim2.new(10,0,10,0)
imlb5.ImageColor3 = color2
imlb5.ImageTransparency = 0
imlb5.Position = UDim2.new(-4.5,0,-4.5,0)
imlb2.Parent = imlb
imlb3.Parent = imlb
imlb4.Parent = imlb
imlb5.Parent = imlb
local txtlb2 = Instance.new("TextLabel",imlb)
txtlb2.Text = text
txtlb2.Font = represfont
txtlb2.TextColor3 = color
txtlb2.TextStrokeTransparency = 0
txtlb2.BackgroundTransparency = 1
txtlb2.TextStrokeColor3 = color2
txtlb2.TextScaled = true
txtlb2.Size = UDim2.new(1,0,1,0)
txtlb2.Position = UDim2.new(0,0,0,0)
local fvalen = 0.55
local fval = -0.49
coroutine.resume(coroutine.create(function()
while true do
swait()
if chaosmode == true then
txtlb2.Rotation = math.random(-1,1)
imlb.Position = imlb.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
txtlb2.Position = txtlb2.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
imlb.ImageColor3 = BrickColor.random().Color
txtlb2.TextStrokeColor3 = BrickColor.random().Color
end
end
end))
coroutine.resume(coroutine.create(function()
while true do
swait()
if scrg.Parent ~= nil then
	fvalen = fvalen - 0.0001
elseif scrg.Parent == nil then
break
end
end
end))
local flol = -5
local flil = 1.6
coroutine.resume(coroutine.create(function()
	for i = 0, 49 do
		swait()
		flol = flol + 0.125
		flil = flil - 0.1
		frm.Size = frm.Size + UDim2.new(0.1,0,0,0)
		frm.Rotation = frm.Rotation - 0.25
		frm2.Size = frm2.Size + UDim2.new(0.1,0,0,0)
		frm2.Rotation = frm.Rotation + 0.325
		imlb3.Rotation = imlb3.Rotation - 10
		imlb2.Rotation = imlb.Rotation + 7.5
		imlb.Rotation = imlb.Rotation + 5
		txtlb2.Rotation = txtlb2.Rotation - 5.125
		imlb.Position = imlb.Position + UDim2.new(0.05125,0,0.04775,0)
	end
	for i = 0, 99 do
		swait()
		fval = fval + 0.05
		flol = flol + 0.005
		frm.Size = frm.Size + UDim2.new(0.005,0,0,0)
		frm.Rotation = frm.Rotation - 0.075
		frm2.Size = frm2.Size + UDim2.new(0.005,0,0,0)
		frm2.Rotation = frm2.Rotation + 0.125
		imlb3.Rotation = imlb3.Rotation - 2
		imlb2.Rotation = imlb.Rotation + 1.5
		imlb.Rotation = imlb.Rotation + 1
		txtlb2.Rotation = txtlb2.Rotation - 1.125
		imlb.Position = imlb.Position + UDim2.new(0.0015,0,0.00075,0)
	end
local valinc = 0
local vinc2 = 1
for i = 0, 99 do
swait()
vinc2 = vinc2 + 0.25
valinc = valinc + 0.0001
flol = flol + valinc
flil = flil + valinc
txtlb2.Rotation = txtlb2.Rotation - 1.125*vinc2
imlb3.Rotation = imlb3.Rotation - 2*vinc2
imlb.Rotation = imlb.Rotation + 1*vinc2
imlb.Position = imlb.Position + UDim2.new(0.0015*vinc2,0,0.0005*vinc2,0)
frm.Size = frm.Size + UDim2.new(0.005*vinc2,0,0,0)
frm.Rotation = frm.Rotation + 0.1*vinc2
frm2.Size = frm2.Size + UDim2.new(0.005*vinc2,0,0,0)
frm2.Rotation = frm2.Rotation + 0.225*vinc2
frm2.BackgroundTransparency = frm2.BackgroundTransparency + 0.0075
frm.BackgroundTransparency = frm.BackgroundTransparency + 0.0075
imlb.ImageTransparency = imlb.ImageTransparency + 0.005
imlb2.ImageTransparency = imlb2.ImageTransparency + 0.01
imlb3.ImageTransparency = imlb3.ImageTransparency + 0.01
imlb4.ImageTransparency = imlb4.ImageTransparency + 0.01
imlb5.ImageTransparency = imlb4.ImageTransparency + 0.01
txtlb2.TextStrokeTransparency = txtlb2.TextStrokeTransparency + 0.01
txtlb2.TextTransparency = txtlb2.TextTransparency + 0.01
end
scrg:Destroy()
end))
end))
end
end
end

local Create = LoadLibrary("RbxUtility").Create

CFuncs = {	
	["Part"] = {
		Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
			local Part = Create("Part"){
				Parent = Parent,
				Reflectance = Reflectance,
				Transparency = Transparency,
				CanCollide = false,
				Locked = true,
				BrickColor = BrickColor.new(tostring(BColor)),
				Name = Name,
				Size = Size,
				Material = Material,
			}
			RemoveOutlines(Part)
			return Part
		end;
	};
	
	["Mesh"] = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh){
				Parent = Part,
				Offset = OffSet,
				Scale = Scale,
			}
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end;
	};
	
	["Mesh"] = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh){
				Parent = Part,
				Offset = OffSet,
				Scale = Scale,
			}
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end;
	};
	
	["Weld"] = {
		Create = function(Parent, Part0, Part1, C0, C1)
			local Weld = Create("Weld"){
				Parent = Parent,
				Part0 = Part0,
				Part1 = Part1,
				C0 = C0,
				C1 = C1,
			}
			return Weld
		end;
	};

	["Sound"] = {
		Create = function(id, par, vol, pit) 
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound"){
					Volume = vol,
                                        Name = "EffectSoundo",
					Pitch = pit or 1,
					SoundId = id,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 10)
			end))
		end;
	};

	["TimeSound"] = {
		Create = function(id, par, vol, pit, timepos) 
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound"){
					Volume = vol,
                                        Name = "EffectSoundo",
					Pitch = pit or 1,
					SoundId = id,
                                        TimePosition = timepos,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 10)
			end))
		end;
	};
		["EchoSound"] = {
		Create = function(id, par, vol, pit, timepos,delays,echodelay,fedb,dryl) 
			coroutine.resume(coroutine.create(function()
				local Sas = Create("Sound"){
					Volume = vol,
                    Name = "EffectSoundo",
					Pitch = pit or 1,
					SoundId = id,
                    TimePosition = timepos,
					Parent = par or workspace,
				}
				local E = Create("EchoSoundEffect"){
					Delay = echodelay,
                    Name = "Echo",
					Feedback = fedb,
                    DryLevel = dryl,
					Parent = Sas,
				}
				wait() 
				Sas:play() 
				game:GetService("Debris"):AddItem(Sas, delays)
			end))
		end;
	};

["LongSound"] = {
		Create = function(id, par, vol, pit) 
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound"){
					Volume = vol,
					Pitch = pit or 1,
					SoundId = id,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 60)
			end))
		end;
	};
	
	["ParticleEmitter"] = {
		Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
			local fp = Create("ParticleEmitter"){
				Parent = Parent,
				Color = ColorSequence.new(Color1, Color2),
				LightEmission = LightEmission,
				Size = Size,
				Texture = Texture,
				Transparency = Transparency,
				ZOffset = ZOffset,
				Acceleration = Accel,
				Drag = Drag,
				LockedToPart = LockedToPart,
				VelocityInheritance = VelocityInheritance,
				EmissionDirection = EmissionDirection,
				Enabled = Enabled,
				Lifetime = LifeTime,
				Rate = Rate,
				Rotation = Rotation,
				RotSpeed = RotSpeed,
				Speed = Speed,
				VelocitySpread = VelocitySpread,
			}
			return fp
		end;
	};

	CreateTemplate = {
	
	};
}



New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end
local halocolor = BrickColor.new("Pastel light blue")
local halocolor2 = BrickColor.new("Cool yellow")
local starcolor = BrickColor.new("Bright yellow")
local lunacolor = BrickColor.new("Navy blue")
local lunacolor2 = BrickColor.new("Bright blue")
local wepcolor = BrickColor.new("Really black")
local maincolor = BrickColor.new("Really black")
local m = Instance.new("Model",char)
local m2 = Instance.new("Model",char)
local m3 = Instance.new("Model",char)
local mw1 = Instance.new("Model",char)
local mw2 = Instance.new("Model",char)




local extrawingmod1 = Instance.new("Model",char)
local extrawingmod2 = Instance.new("Model",char)

function CreateParta(parent,transparency,reflectance,material,brickcolor)
local p = Instance.new("Part")
p.TopSurface = 0
p.BottomSurface = 0
p.Parent = parent
p.Size = Vector3.new(0.1,0.1,0.1)
p.Transparency = transparency
p.Reflectance = reflectance
p.CanCollide = false
p.Locked = true
p.BrickColor = brickcolor
p.Material = material
return p
end

function CreateMesh(parent,meshtype,x1,y1,z1)
local mesh = Instance.new("SpecialMesh",parent)
mesh.MeshType = meshtype
mesh.Scale = Vector3.new(x1*10,y1*10,z1*10)
return mesh
end

function CreateSpecialMesh(parent,meshid,x1,y1,z1)
local mesh = Instance.new("SpecialMesh",parent)
mesh.MeshType = "FileMesh"
mesh.MeshId = meshid
mesh.Scale = Vector3.new(x1,y1,z1)
return mesh
end


function CreateSpecialGlowMesh(parent,meshid,x1,y1,z1)
local mesh = Instance.new("SpecialMesh",parent)
mesh.MeshType = "FileMesh"
mesh.MeshId = meshid
mesh.TextureId = "http://www.roblox.com/asset/?id=269748808"
mesh.Scale = Vector3.new(x1,y1,z1)
mesh.VertexColor = Vector3.new(parent.BrickColor.r, parent.BrickColor.g, parent.BrickColor.b)
return mesh
end

function CreateWeld(parent,part0,part1,C1X,C1Y,C1Z,C1Xa,C1Ya,C1Za,C0X,C0Y,C0Z,C0Xa,C0Ya,C0Za)
local weld = Instance.new("Weld")
weld.Parent = parent
weld.Part0 = part0
weld.Part1 = part1
weld.C1 = CFrame.new(C1X,C1Y,C1Z)*CFrame.Angles(C1Xa,C1Ya,C1Za)
weld.C0 = CFrame.new(C0X,C0Y,C0Z)*CFrame.Angles(C0Xa,C0Ya,C0Za)
return weld
end


--------------
--------------
local sorb = CreateParta(m,1,1,"SmoothPlastic",BrickColor.random())
CreateWeld(sorb,rarm,sorb,0,1,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local sorb2 = CreateParta(m,1,1,"SmoothPlastic",BrickColor.random())
CreateWeld(sorb2,larm,sorb2,0,1,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local handlex = CreateParta(mw2,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0,0,0)
local handlexweld = CreateWeld(handlex,tors,handlex,0,-1.5,-1.05,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local valuaring = 10
for i = 0, 49 do
	valuaring = valuaring + 10
rn = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(rn,"Brick",0.25,0.1,0.1)
CreateWeld(rn,handlex,rn,0,1,0,math.rad(0),math.rad(0),math.rad(valuaring),0,0,0,math.rad(0),math.rad(0),math.rad(0))
end

handlex = CreateParta(mw2,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0,0,0)
CreateWeld(handlex,tors,handlex,0,-3,-2.1,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local valuaring = 10
for i = 0, 49 do
	valuaring = valuaring + 10
rn = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(rn,"Brick",0.5,0.2,0.2)
CreateWeld(rn,handlex,rn,0,2,0,math.rad(0),math.rad(0),math.rad(valuaring),0,0,0,math.rad(0),math.rad(0),math.rad(0))
end


local handle = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local handleweld = CreateWeld(handle,tors,handle,0,-1.5,-1.05,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

--- Left wing.

local lwing1 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing1weld = CreateWeld(lwing1,handle,lwing1,3,0,0,math.rad(5),math.rad(0),math.rad(12.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing1,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing1,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25,0.25)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,lwing1,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,-0.25,-2)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,lwing1,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

tl1 = Instance.new('Trail',wed)
tl1.Attachment0 = A1
tl1.Attachment1 = A0
tl1.Texture = "rbxassetid://2108945559"
tl1.LightEmission = 1
tl1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl1.Color = ColorSequence.new(BrickColor.new('Really blue').Color)
tl1.Lifetime = 0.6


local lwing2 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing2weld = CreateWeld(lwing2,handle,lwing2,4,1,0,math.rad(10),math.rad(0),math.rad(25),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing2,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing2,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25,0.25)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,lwing2,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,-0.25,-2)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,lwing2,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

tl2 = Instance.new('Trail',wed)
tl2.Attachment0 = A1
tl2.Attachment1 = A0
tl2.Texture = "rbxassetid://2108945559"
tl2.LightEmission = 1
tl2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl2.Color = ColorSequence.new(BrickColor.new('Really blue').Color)
tl2.Lifetime = 0.6

local lwing3 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing3weld = CreateWeld(lwing3,handle,lwing3,4.75,2,0,math.rad(15),math.rad(0),math.rad(37.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing3,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing3,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25,0.25)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,lwing3,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,-0.25,-2)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,lwing3,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

tl3 = Instance.new('Trail',wed)
tl3.Attachment0 = A1
tl3.Attachment1 = A0
tl3.Texture = "rbxassetid://2108945559"
tl3.LightEmission = 1
tl3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl3.Color = ColorSequence.new(BrickColor.new('Really blue').Color)
tl3.Lifetime = 0.6

tl1.Enabled = false
tl2.Enabled = false
tl3.Enabled = false
local lwing4 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing4weld = CreateWeld(lwing4,handle,lwing4,5.75,3,0,math.rad(20),math.rad(0),math.rad(50),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing4,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing4,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,lwing4,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,lwing4,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local lwing5 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing5weld = CreateWeld(lwing5,handle,lwing5,6.75,4,0,math.rad(25),math.rad(0),math.rad(62.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing5,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing5,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,lwing5,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,lwing5,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local lwing6 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing6weld = CreateWeld(lwing6,handle,lwing6,7.75,5,0,math.rad(30),math.rad(0),math.rad(75),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing6,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing6,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,lwing6,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,lwing6,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

-- Right wing.

local rwing1 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing1weld = CreateWeld(rwing1,handle,rwing1,-3,0,0,math.rad(5),math.rad(0),math.rad(-12.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing1,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25,0.25)
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing1,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,rwing1,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,rwing1,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,2,0.25)

tr1 = Instance.new('Trail',wed)
tr1.Attachment0 = A1
tr1.Attachment1 = A0
tr1.Texture = "rbxassetid://2108945559"
tr1.LightEmission = 1
tr1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tr1.Color = ColorSequence.new(BrickColor.new('Really blue').Color)
tr1.Lifetime = 0.6

local rwing2 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing2weld = CreateWeld(rwing2,handle,rwing2,-4,1,0,math.rad(10),math.rad(0),math.rad(-25),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing2,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25,0.25)
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing2,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,rwing2,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,rwing2,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,2,0.25)

tr2 = Instance.new('Trail',wed)
tr2.Attachment0 = A1
tr2.Attachment1 = A0
tr2.Texture = "rbxassetid://2108945559"
tr2.LightEmission = 1
tr2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tr2.Color = ColorSequence.new(BrickColor.new('Really blue').Color)
tr2.Lifetime = 0.6

local rwing3 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing3weld = CreateWeld(rwing3,handle,rwing3,-4.75,2,0,math.rad(15),math.rad(0),math.rad(-37.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing3,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25,0.25)
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing3,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,rwing3,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,rwing3,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,2,0.25)

tr3 = Instance.new('Trail',wed)
tr3.Attachment0 = A1
tr3.Attachment1 = A0
tr3.Texture = "rbxassetid://2108945559"
tr3.LightEmission = 1
tr3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tr3.Color = ColorSequence.new(BrickColor.new('Really blue').Color)
tr3.Lifetime = 0.6


local rwing4 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing4weld = CreateWeld(rwing4,handle,rwing4,-5.75,3,0,math.rad(20),math.rad(0),math.rad(-50),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing4,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing4,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,rwing4,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,rwing4,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local rwing5 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing5weld = CreateWeld(rwing5,handle,rwing5,-6.75,4,0,math.rad(25),math.rad(0),math.rad(-62.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing5,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing5,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,rwing5,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,rwing5,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local rwing6 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing6weld = CreateWeld(rwing6,handle,rwing6,-7.75,3,0,math.rad(30),math.rad(0),math.rad(-75),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing6,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing6,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,rwing6,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,rwing6,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

--HERES THE RING


--[[ran = CreateParta(m2,0,0,"SmoothPlastic",wepcolor)
CreateMesh(ran,"Wedge",1.02,1.02,1.02)
CreateWeld(ran,larm,ran,0,0.15,0,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
ran = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(ran,"Wedge",0.9,0.9,1.025)
CreateWeld(ran,larm,ran,0,0.155,0,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
ran = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(ran,"Wedge",1.025,0.9,0.9)
CreateWeld(ran,larm,ran,0,0.155,-0.025,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))


gan = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(gan,"Brick",1.075,0.1,1.075)
CreateWeld(gan,larm,gan,0,0.5,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

gan = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(gan,"Brick",1.075,0.1,1.075)
CreateWeld(gan,larm,gan,0,0.75,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))



gan = CreateParta(m2,0,0,"Neon",halocolor2)
CreateMesh(gan,"Brick",1.095,0.035,1.095)
CreateWeld(gan,larm,gan,0,0.5,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

gan = CreateParta(m2,0,0,"Neon",halocolor2)
CreateMesh(gan,"Brick",1.095,0.035,1.095)
CreateWeld(gan,larm,gan,0,0.75,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

gane = CreateParta(m3,0,0,"SmoothPlastic",lunacolor2)
CreateMesh(gane,"Brick",1.0625,0.2,1.0625)
CreateWeld(gane,larm,gane,0,0.6,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

star = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateSpecialMesh(star,"http://www.roblox.com/asset/?id=45428961",2.5,2.5,2.5)
CreateWeld(star,larm,star,0,0.475,0.6,math.rad(90),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
starl = CreateParta(m3,0,0,"SmoothPlastic",starcolor)
CreateSpecialMesh(starl,"http://www.roblox.com/asset/?id=45428961",1.95,2.55,1.95)
CreateWeld(starl,larm,starl,0,0.475,0.6,math.rad(90),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))]]--

--- second ring


gan = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(gan,"Brick",1.075,0.1,1.075)
CreateWeld(gan,rarm,gan,0,0.5,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

gan = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(gan,"Brick",1.075,0.1,1.075)
CreateWeld(gan,rarm,gan,0,0.75,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))



gan = CreateParta(m2,0,0,"Neon",halocolor2)
CreateMesh(gan,"Brick",1.095,0.035,1.095)
CreateWeld(gan,rarm,gan,0,0.5,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

gan = CreateParta(m2,0,0,"Neon",halocolor2)
CreateMesh(gan,"Brick",1.095,0.035,1.095)
CreateWeld(gan,rarm,gan,0,0.75,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

gane = CreateParta(m3,0,0,"SmoothPlastic",lunacolor2)
CreateMesh(gane,"Brick",1.0625,0.2,1.0625)
CreateWeld(gane,rarm,gane,0,0.6,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

star = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateSpecialMesh(star,"http://www.roblox.com/asset/?id=45428961",2.5,2.5,2.5)
CreateWeld(star,rarm,star,0,-0.475,0.6,math.rad(90),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
starl = CreateParta(m3,0,0,"SmoothPlastic",starcolor)
CreateSpecialMesh(starl,"http://www.roblox.com/asset/?id=45428961",1.95,2.55,1.95)
CreateWeld(starl,rarm,starl,0,-0.475,0.6,math.rad(90),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))



for i, v in pairs(m:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = BrickColor.new("Really black")
v.Material = "Glass"
end
end
for i, v in pairs(m2:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = BrickColor.new("Crimson")
v.Material = "Granite"
end
end
for i, v in pairs(m3:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = BrickColor.new("Really blue")
v.Material = "Neon"
end
end
for i, v in pairs(mw2:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = BrickColor.new("Really blue")
v.Material = "Neon"
end
end
for i, v in pairs(mw1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 1
v.BrickColor = BrickColor.new("Really blue")
v.Material = "Neon"
end
end
for i, v in pairs(extrawingmod1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 1
v.BrickColor = BrickColor.new("White")
v.Material = "Neon"
end
end
for i, v in pairs(extrawingmod2:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 1
v.BrickColor = BrickColor.new("White")
v.Material = "Neon"
end
end
local MAINRUINCOLOR = BrickColor.new("Navy blue")
local SECONDRUINCOLOR  = BrickColor.new("Navy blue")
local THIRDRUINCOLOR = BrickColor.new("Really black")

function RecolorThing(one,two,three,four,five,exonetran,exone,extwotran,extwo)
for i, v in pairs(mw2:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = one
v.Material = "Neon"
end
end
refec.Color = ColorSequence.new(one.Color)
refec2.Color = ColorSequence.new(one.Color)
refec3.Color = ColorSequence.new(one.Color)
tr1.Color = ColorSequence.new(one.Color)
tr2.Color = ColorSequence.new(one.Color)
tr3.Color = ColorSequence.new(one.Color)
imgl2.ImageColor3 = one.Color
circl.ImageColor3 = two.Color
techc.ImageColor3 = one.Color
circl2.ImageColor3 = one.Color
ned.TextColor3 = two.Color
ned.TextStrokeColor3 = one.Color
for i, v in pairs(mw1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 0
v.BrickColor = two
v.Material = "Neon"
end
end
tl1.Color = ColorSequence.new(two.Color)
tl2.Color = ColorSequence.new(two.Color)
tl3.Color = ColorSequence.new(two.Color)
for i, v in pairs(m:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = three
v.Material = "Ice"
end
end
for i, v in pairs(m2:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = four
v.Material = "Ice"
end
end
for i, v in pairs(m3:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = five
v.Material = "Neon"
end
end
for i, v in pairs(extrawingmod1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = exonetran
v.BrickColor = exone
v.Material = "Neon"
end
end
for i, v in pairs(extrawingmod2:GetChildren()) do
if v:IsA("Part") then
v.Transparency = extwotran
v.BrickColor = extwo
v.Material = "Neon"
end
end
end

function bosschatfunc(text,color,watval)
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
coroutine.resume(coroutine.create(function()
if v.PlayerGui:FindFirstChild("Dialog")~= nil then
v.PlayerGui:FindFirstChild("Dialog"):destroy()
end
local scrg = Instance.new("ScreenGui",v.PlayerGui)
scrg.Name = "Dialog"
local txtlb = Instance.new("TextLabel",scrg)
txtlb.Text = ""
txtlb.Font = "Bodoni"
txtlb.TextColor3 = Color3.new(0,0,0)
txtlb.TextStrokeTransparency = 0
txtlb.BackgroundTransparency = 0.75
txtlb.BackgroundColor3 = Color3.new(0,0,0)
txtlb.TextStrokeColor3 = color
txtlb.TextScaled = true
txtlb.Size = UDim2.new(1,0,0.25,0)
txtlb.TextXAlignment = "Left"
txtlb.Position = UDim2.new(0,0,0.75 + 1,0)
local txtlb2 = Instance.new("TextLabel",scrg)
txtlb2.Text = " "..(Player.name).."|Lunar:"
txtlb2.Font = "Arcade"
txtlb2.TextColor3 = Color3.new(0,0,0)
txtlb2.TextStrokeTransparency = 0
txtlb2.BackgroundTransparency = 1
txtlb2.TextStrokeColor3 = color
txtlb2.TextSize = 40
txtlb2.Size = UDim2.new(1,0,0.25,0)
txtlb2.TextXAlignment = "Left"
txtlb2.Position = UDim2.new(0,0,1,0)
local fvalen = 0.55
local fval = -0.49
coroutine.resume(coroutine.create(function()
while true do
Swait()
if MODE == "Sanity" then
txtlb.Rotation = math.random(-1,1)
txtlb2.Rotation = math.random(-1,1)
txtlb.Position = txtlb.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
txtlb2.Position = txtlb2.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
txtlb.TextStrokeColor3 = BrickColor.random().Color
txtlb2.TextStrokeColor3 = BrickColor.random().Color
end
end
end))
coroutine.resume(coroutine.create(function()
while true do
Swait()
if scrg.Parent ~= nil then
	fvalen = fvalen - 0.0001
elseif scrg.Parent == nil then
break
end
end
end))
local flol = 1.75
local flil = 1.6
coroutine.resume(coroutine.create(function()
	for i = 0, 9 do
		Swait()
		fval = fval + 0.05
		flol = flol - 0.1
		flil = flil - 0.1
		txtlb.Text = ""
		txtlb.Position = UDim2.new(0,0,flol,0)
		txtlb2.Position = UDim2.new(0,0,flil,0)
	end
	txtlb.Text = text
wait(watval)
local valinc = 0
for i = 0, 99 do
Swait()
valinc = valinc + 0.0001
flol = flol + valinc
flil = flil + valinc
txtlb.Rotation = txtlb.Rotation + valinc*20
txtlb2.Rotation = txtlb2.Rotation - valinc*50
txtlb.Position = UDim2.new(0,0,flol,0)
txtlb2.Position = UDim2.new(0,0,flil,0)
txtlb.TextStrokeTransparency = txtlb.TextStrokeTransparency + 0.01
txtlb.TextTransparency = txtlb.TextTransparency + 0.01
txtlb2.TextStrokeTransparency = txtlb2.TextStrokeTransparency + 0.01
txtlb2.TextTransparency = txtlb2.TextTransparency + 0.01
txtlb.BackgroundTransparency = txtlb.BackgroundTransparency + 0.0025
end
scrg:Destroy()
end))
end))
end
end

function BigBlack(text,color,watval)
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
coroutine.resume(coroutine.create(function()
if v.PlayerGui:FindFirstChild("Dialog")~= nil then
v.PlayerGui:FindFirstChild("Dialog"):destroy()
end
local scrg = Instance.new("ScreenGui",v.PlayerGui)
scrg.Name = "Dialog"
local txtlb = Instance.new("TextLabel",scrg)
txtlb.Text = ""
txtlb.Font = "Bodoni"
txtlb.TextColor3 = Color3.new(0,0,0)
txtlb.TextStrokeTransparency = 1
txtlb.BackgroundTransparency = 1
txtlb.BackgroundColor3 = Color3.new(0,0,0)
txtlb.TextStrokeColor3 = color
txtlb.TextScaled = true
txtlb.Size = UDim2.new(1,0,1,0)
txtlb.TextXAlignment = "Center"
txtlb.Position = UDim2.new(0,0,6.75 + 1,0)
local txtlb2 = Instance.new("TextLabel",scrg)
txtlb2.Text = " "..(Player.name).."|Lunar:"
txtlb2.Font = "Arcade"
txtlb2.TextColor3 = Color3.new(0,0,0)
txtlb2.TextStrokeTransparency = 0
txtlb2.BackgroundTransparency = 1
txtlb2.TextStrokeColor3 = color
txtlb2.TextSize = 40
txtlb2.Size = UDim2.new(1,0,0.25,0)
txtlb2.TextXAlignment = "Left"
txtlb2.Position = UDim2.new(0,0,1,0)
local fvalen = 0.55
local fval = -0.49
coroutine.resume(coroutine.create(function()
while true do
Swait()
if MODE == "Sanity" then
txtlb.Rotation = math.random(-1,1)
txtlb2.Rotation = math.random(-1,1)
txtlb.Position = txtlb.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
txtlb2.Position = txtlb2.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
txtlb.TextStrokeColor3 = BrickColor.random().Color
txtlb2.TextStrokeColor3 = BrickColor.random().Color
end
end
end))
coroutine.resume(coroutine.create(function()
while true do
Swait()
if scrg.Parent ~= nil then
	fvalen = fvalen - 0.0001
elseif scrg.Parent == nil then
break
end
end
end))
local flol = 1.05
local flil = 0.75
local flil2 = -0.2
	coroutine.resume(coroutine.create(function()
	for i = 1,string.len(text),1 do
		wait()
		text.Text = string.sub(text,1,i)
	end
	end))
coroutine.resume(coroutine.create(function()
	for i = 0, 1 do
		fval = fval + 0.05
		flol = flol - 0.1
		flil2 = flil2 + 0.1
		txtlb.Text = ""
		txtlb.Position = UDim2.new(flil2,0,0,0)
		txtlb.BackgroundTransparency = 1 - 0.1
		txtlb2.Position = UDim2.new(flil2,0,0,0)
	end
	
		for i = 0, 99 do
txtlb.TextStrokeTransparency = txtlb.TextStrokeTransparency - 0.01
txtlb.TextTransparency = txtlb.TextTransparency - 0.01
txtlb2.TextStrokeTransparency = txtlb2.TextStrokeTransparency - 0.01
txtlb2.TextTransparency = txtlb2.TextTransparency - 0.01
txtlb.BackgroundTransparency = txtlb.BackgroundTransparency - 0.0025
	end
	
	txtlb.Text = text
wait(watval)
local valinc = 0
for i = 0, 99 do
Swait()
valinc = valinc + 0.0002
flol = flol + valinc
flil2 = flil2 + valinc
txtlb.Rotation = txtlb.Rotation + valinc*15
txtlb2.Rotation = txtlb2.Rotation - valinc*15
txtlb.Position = UDim2.new(flil2,0,0,0)
txtlb2.Position = UDim2.new(flil2,0,0,0)
txtlb.TextStrokeTransparency = txtlb.TextStrokeTransparency + 0.01
txtlb.TextTransparency = txtlb.TextTransparency + 0.01
txtlb2.TextStrokeTransparency = txtlb2.TextStrokeTransparency + 0.01
txtlb2.TextTransparency = txtlb2.TextTransparency + 0.01
txtlb.BackgroundTransparency = txtlb.BackgroundTransparency + 0.0025
end
scrg:Destroy()
end))
end))
end
end
------


function RemoveOutlines(part)
  part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
function CreatePart(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
  local Part = Create("Part")({
    Parent = Parent,
    Reflectance = Reflectance,
    Transparency = Transparency,
    CanCollide = false,
    Locked = true,
    BrickColor = BrickColor.new(tostring(BColor)),
    Name = Name,
    Size = Size,
    Material = Material
  })
  Part.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0.001, 0.001, 0.001, 0.001)
  RemoveOutlines(Part)
  return Part
end
function CreateMesha(Mesh, Part, MeshType, MeshId, OffSet, Scale)
  local Msh = Create(Mesh)({
    Parent = Part,
    Offset = OffSet,
    Scale = Scale
  })
  if Mesh == "SpecialMesh" then
    Msh.MeshType = MeshType
    Msh.MeshId = MeshId
  end
  return Msh
end
function CreateWeld(Parent, Part0, Part1, C0, C1)
  local Weld = Create("Weld")({
    Parent = Parent,
    Part0 = Part0,
    Part1 = Part1,
    C0 = C0,
    C1 = C1
  })
  return Weld
end



Player = plr
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
RootPart = Character["HumanoidRootPart"]
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
local sick = Instance.new("Sound",Torso)
sick.SoundId = "rbxassetid://1306847940"
sick.Looped = true
sick.Pitch = 1
sick.Volume = 0
sick.TimePosition = 0
Character.Archivable = true
Humanoid.DisplayDistanceType = "None"

local naeeym2 = Instance.new("BillboardGui",Character)
naeeym2.AlwaysOnTop = true
naeeym2.Size = UDim2.new(5,35,2,35)
naeeym2.StudsOffset = Vector3.new(0,3,0)
naeeym2.Adornee = Character.Head
naeeym2.Name = "Name"
local tecks2 = Instance.new("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.TextScaled = true
tecks2.BorderSizePixel = 0
tecks2.Text = "â± Éâ¦â³â±¤"
tecks2.Font = "Arcade"
tecks2.TextSize = 30
tecks2.TextTransparency = 1
tecks2.TextStrokeTransparency = 1
tecks2.TextColor3 = Color3.new(0/255,0/255,255/255)
tecks2.Size = UDim2.new(1,0,0.5,0)
tecks2.Parent = naeeym2

IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor

--//=================================\\
--|| 	      USEFUL VALUES
--\\=================================//

Animation_Speed = 3
local FORCERESET = false
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
local Speed = 16
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local DAMAGEMULTIPLIER = 1
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = false
local COMBO = 1
local Rooted = false
local INTRO = false
local Gun = IT("Model")
Gun.Name = "Gun"
local SINE = 0
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
local VALUE1 = false
local VALUE2 = false
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
--ROBLOXIDLEANIMATION.Parent = Humanoid
local WEAPONGUI = IT("ScreenGui", PlayerGui)
WEAPONGUI.Name = "BanishV3Gui"
local Weapon = IT("Model")
Weapon.Name = "Adds"
local FaceGradient = IT("Folder", Character)
FaceGradient.Name = "FaceGradient"
local Effects = IT("Folder", Weapon)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character:FindFirstChild("Animate")
local UNANCHOR = true
local TOBANISH = {}
script.Parent = PlayerGui

--//=================================\\
--\\=================================//


--//=================================\\
--||		  CUSTOMIZATION
--\\=================================//

Class_Name = "Sharpshooter"
Weapon_Name = "Add-ons"

	Custom_Color_1 = BRICKC("Really black"); --1st color for the weapon.
	Custom_Color_2 = BRICKC("Maroon"); --2nd color for the weapon.

	Custom_Color_3 = BRICKC("Navy blue"); --Color for the abilities.
	Custom_Color_4 = BRICKC("Institutional white"); --Color for the secondary bar.
	Custom_Color_5 = BRICKC("Institutional white"); --Color for the mana bar.
	Custom_Color_6 = BRICKC("Institutional white"); --Color for the health bar.
	Custom_Color_7 = BRICKC("Institutional white"); --Color for the stun bar.

	Custom_Color_8 = BRICKC("Institutional white"); --Background for the mana bar.
	Custom_Color_9 = BRICKC("Institutional white"); --Background for the secondary mana bar.
	Custom_Color_10 = BRICKC("Institutional white"); --Background for the stun bar.
	Custom_Color_11 = BRICKC("Institutional white"); --Background for the health bar.
	Custom_Color_12 = BRICKC("Institutional white"); --Background for the abilities.


Player_Size = 1 --Size of the player.
Animation_Speed = 3
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)

local Speed = 16
local Effects2 = {}

--//=================================\\
--|| 	  END OF CUSTOMIZATION
--\\=================================//


--//=================================\\
--|| SAZERENOS' ARTIFICIAL HEARTBEAT
--\\=================================//

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.ArtificialHB:Fire()
			end
		lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

--//=================================\\
--\\=================================//

--//=================================\\
--|| 	      SOME FUNCTIONS
--\\=================================//

function Clerp(a, b, t)
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end

function CreateFrame(PARENT, TRANSPARENCY, BORDERSIZEPIXEL, POSITION, SIZE, COLOR, BORDERCOLOR, NAME)
	local frame = IT("Frame")
	frame.BackgroundTransparency = TRANSPARENCY
	frame.BorderSizePixel = BORDERSIZEPIXEL
	frame.Position = POSITION
	frame.Size = SIZE
	frame.BackgroundColor3 = COLOR
	frame.BorderColor3 = BORDERCOLOR
	frame.Name = NAME
	frame.Parent = PARENT
	return frame
end

function CreateLabel(PARENT, TEXT, TEXTCOLOR, TEXTFONTSIZE, TEXTFONT, TRANSPARENCY, BORDERSIZEPIXEL, STROKETRANSPARENCY, NAME)
	local label = IT("TextLabel")
	label.BackgroundTransparency = 1
	label.Size = UD2(1, 0, 1, 0)
	label.Position = UD2(0, 0, 0, 0)
	label.TextColor3 = TEXTCOLOR
	label.TextStrokeTransparency = STROKETRANSPARENCY
	label.TextTransparency = TRANSPARENCY
	label.FontSize = TEXTFONTSIZE
	label.Font = TEXTFONT
	label.BorderSizePixel = BORDERSIZEPIXEL
	label.TextScaled = false
	label.Text = TEXT
	label.Name = NAME
	label.Parent = PARENT
	return label
end

function CreateDebreeRing(FLOOR,POSITION,SIZE,BLOCKSIZE,SWAIT)
	if FLOOR ~= nil then
		coroutine.resume(coroutine.create(function()
			local PART = CreatePart(3, Effects, "Plastic", 0, 1, "Pearl", "DebreeCenter", VT(0,0,0))
			PART.CFrame = CF(POSITION)
			for i = 1, 45 do
				local RingPiece = CreatePart(3, Effects, "Plastic", 0, 0, "Pearl", "DebreePart", BLOCKSIZE)
				RingPiece.Material = FLOOR.Material
				RingPiece.Color = FLOOR.Color
				RingPiece.CFrame = PART.CFrame * ANGLES(RAD(0), RAD(i*8), RAD(0)) * CF(SIZE, 0, 0) * ANGLES(RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)))
				Debris:AddItem(RingPiece,SWAIT)
			end
			PART:remove()
		end))
	end
end

function CreateFlyingDebree(FLOOR,POSITION,AMOUNT,BLOCKSIZE,SWAIT,STRENGTH)
	if FLOOR ~= nil then
		for i = 1, AMOUNT do
			local DEBREE = CreatePart(3, Effects, "Neon", FLOOR.Reflectance, FLOOR.Transparency, "Peal", "Debree", BLOCKSIZE, false)
			DEBREE.Material = FLOOR.Material
			DEBREE.Color = FLOOR.Color
			DEBREE.CFrame = POSITION * ANGLES(RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)))
			DEBREE.Velocity = VT(MRANDOM(-STRENGTH,STRENGTH),MRANDOM(-STRENGTH,STRENGTH),MRANDOM(-STRENGTH,STRENGTH))
			coroutine.resume(coroutine.create(function()
				Swait(15)
				DEBREE.Parent = workspace
				DEBREE.CanCollide = true
				Debris:AddItem(DEBREE,SWAIT)
			end))
		end
	end
end

function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end

function PositiveAngle(NUMBER)
	if NUMBER >= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function NegativeAngle(NUMBER)
	if NUMBER <= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

	local function weldBetween(a, b)
	    local weldd = Instance.new("ManualWeld")
	    weldd.Part0 = a
	    weldd.Part1 = b
	    weldd.C0 = CFrame.new()
	    weldd.C1 = b.CFrame:inverse() * a.CFrame
	    weldd.Parent = a
	    return weldd
	end


function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then 
		local s = math.sqrt(1 + trace)
		local recip = 0.5 / s
		return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
	else
		local i = 0
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = 0.5 / s
			return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = 0.5 / s
			return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = 0.5 / s return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
		end
	end
end
 
function QuaternionToCFrame(px, py, pz, x, y, z, w)
	local xs, ys, zs = x + x, y + y, z + z
	local wx, wy, wz = w * xs, w * ys, w * zs
	local xx = x * xs
	local xy = x * ys
	local xz = x * zs
	local yy = y * ys
	local yz = y * zs
	local zz = z * zs
	return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end
 
function QuaternionSlerp(a, b, t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp, finishInterp;
	if cosTheta >= 0.0001 then
		if (1 - cosTheta) > 0.0001 then
			local theta = ACOS(cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((1 - t) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	else
		if (1 + cosTheta) > 0.0001 then
			local theta = ACOS(-cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((t - 1) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = t - 1
			finishInterp = t
		end
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end

function Clerp(a, b, t)
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end

function CreateFrame(PARENT, TRANSPARENCY, BORDERSIZEPIXEL, POSITION, SIZE, COLOR, BORDERCOLOR, NAME)
	local frame = IT("Frame")
	frame.BackgroundTransparency = TRANSPARENCY
	frame.BorderSizePixel = BORDERSIZEPIXEL
	frame.Position = POSITION
	frame.Size = SIZE
	frame.BackgroundColor3 = COLOR
	frame.BorderColor3 = BORDERCOLOR
	frame.Name = NAME
	frame.Parent = PARENT
	return frame
end

function CreateLabel(PARENT, TEXT, TEXTCOLOR, TEXTFONTSIZE, TEXTFONT, TRANSPARENCY, BORDERSIZEPIXEL, STROKETRANSPARENCY, NAME)
	local label = IT("TextLabel")
	label.BackgroundTransparency = 1
	label.Size = UD2(1, 0, 1, 0)
	label.Position = UD2(0, 0, 0, 0)
	label.TextColor3 = TEXTCOLOR
	label.TextStrokeTransparency = STROKETRANSPARENCY
	label.TextTransparency = TRANSPARENCY
	label.FontSize = TEXTFONTSIZE
	label.Font = TEXTFONT
	label.BorderSizePixel = BORDERSIZEPIXEL
	label.TextScaled = false
	label.Text = TEXT
	label.Name = NAME
	label.Parent = PARENT
	return label
end

function NoOutlines(PART)
	PART.TopSurface, PART.BottomSurface, PART.LeftSurface, PART.RightSurface, PART.FrontSurface, PART.BackSurface = 10, 10, 10, 10, 10, 10
end

function CreateWeldOrSnapOrMotor(TYPE, PARENT, PART0, PART1, C0, C1)
	local NEWWELD = IT(TYPE)
	NEWWELD.Part0 = PART0
	NEWWELD.Part1 = PART1
	NEWWELD.C0 = C0
	NEWWELD.C1 = C1
	NEWWELD.Parent = PARENT
	return NEWWELD
end

local S = IT("Sound")
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false or NEWSOUND.Parent ~= PARENT
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end

function CFrameFromTopBack(at, top, back)
	local right = top:Cross(back)
	return CF(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end

--WACKYEFFECT({EffectType = "", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
function WACKYEFFECT(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local ENDSIZE = (Table.Size2 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
		elseif TYPE == "Block" then
			MSH = IT("BlockMesh",EFFECT)
			MSH.Scale = VT(SIZE.X,SIZE.X,SIZE.X)
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "1051557", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				MOVESPEED = (CFRAME.p - MOVEDIRECTION).Magnitude/TIME
			end
			local GROWTH = SIZE - ENDSIZE
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			for LOOP = 1, TIME+1 do
				Swait()
				MSH.Scale = MSH.Scale - GROWTH/TIME
				if TYPE == "Wave" then
					MSH.Offset = VT(0,0,-MSH.Scale.X/8)
				end
				EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
				if TYPE == "Block" then
					EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
				else
					EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
				end
				if MOVEDIRECTION ~= nil then
					local ORI = EFFECT.Orientation
					EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
					EFFECT.Orientation = ORI
				end
			end
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				SOUND.Stopped:Connect(function()
					EFFECT:remove()
				end)
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until SOUND.Playing == false
				EFFECT:remove()
			end
		end
	end))
end

local DECAL = IT("Decal")
function MakeRing()
	local RING = CreatePart(3, Effects, "Neon", 0, 1, BRICKC("Navy blue"), "MagicRing", VT(0, 0, 0), true)
	local MSH = IT("BlockMesh", RING)
	local TOP = DECAL:Clone()
	local BOTTOM = DECAL:Clone()
	TOP.Parent = RING
	BOTTOM.Parent = RING
	TOP.Face = "Top"
	BOTTOM.Face = "Bottom"
	TOP.Texture = "http://www.roblox.com/asset/?id=127817121"
	BOTTOM.Texture = "http://www.roblox.com/asset/?id=127817121"
	local function REMOVE()
		coroutine.resume(coroutine.create(function()
			local SIZE = MSH.Scale.X
			for i = 1, 35 do
				Swait()
				MSH.Scale = MSH.Scale - VT(SIZE, 0, SIZE) / 60
				TOP.Transparency = TOP.Transparency + 0.02857142857142857
				BOTTOM.Transparency = BOTTOM.Transparency + 0.02857142857142857
				RING.CFrame = RING.CFrame * ANGLES(RAD(0), RAD(-5), RAD(0))
			end
			RING:remove()
		end))
	end
	return RING, MSH, REMOVE
end

function MakeForm(PART,TYPE)
	if TYPE == "Cyl" then
		local MSH = IT("CylinderMesh",PART)
	elseif TYPE == "Ball" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Wedge"
	end
end

function SpawnTrail(FROM,TO,BIG)
	local TRAIL = CreatePart(3, Effects, "Neon", 0, 0.5, "Navy blue", "Trail", VT(0,0,0))
	MakeForm(TRAIL,"Cyl")
	local DIST = (FROM - TO).Magnitude
	if BIG == true then
		TRAIL.Size = VT(0.5,DIST,0.5)
	else
		TRAIL.Size = VT(0.25,DIST,0.25)
	end
	TRAIL.CFrame = CF(FROM, TO) * CF(0, 0, -DIST/2) * ANGLES(RAD(90),RAD(0),RAD(0))
	coroutine.resume(coroutine.create(function()
		for i = 1, 5 do
			Swait()
			TRAIL.Transparency = TRAIL.Transparency + 0.1
		end
		TRAIL:remove()
	end))
end
--WACKYEFFECT({EffectType = "", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
function WACKYEFFECT(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local ENDSIZE = (Table.Size2 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = IT("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "1051557", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				MOVESPEED = (CFRAME.p - MOVEDIRECTION).Magnitude/TIME
			end
			local GROWTH = SIZE - ENDSIZE
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			for LOOP = 1, TIME+1 do
				Swait()
				MSH.Scale = MSH.Scale - GROWTH/TIME
				if TYPE == "Wave" then
					MSH.Offset = VT(0,0,-MSH.Scale.X/8)
				end
				EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
				if TYPE == "Block" then
					EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
				else
					EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
				end
				if MOVEDIRECTION ~= nil then
					local ORI = EFFECT.Orientation
					EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
					EFFECT.Orientation = ORI
				end
			end
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		end
	end))
end

function MakeForm(PART,TYPE)
	if TYPE == "Cyl" then
		local MSH = IT("CylinderMesh",PART)
	elseif TYPE == "Ball" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Wedge"
	end
end

function SpawnTrail(FROM,TO,BIG)
	local TRAIL = CreatePart(3, Effects, "Neon", 0, 0.5, "Navy blue", "Trail", VT(0,0,0))
	MakeForm(TRAIL,"Cyl")
	local DIST = (FROM - TO).Magnitude
	if BIG == true then
		TRAIL.Size = VT(0.5,DIST,0.5)
	else
		TRAIL.Size = VT(0.25,DIST,0.25)
	end
	TRAIL.CFrame = CF(FROM, TO) * CF(0, 0, -DIST/2) * ANGLES(RAD(90),RAD(0),RAD(0))
	coroutine.resume(coroutine.create(function()
		for i = 1, 5 do
			Swait()
			TRAIL.Transparency = TRAIL.Transparency + 0.1
		end
		TRAIL:remove()
	end))
end

function SHAKECAM(POSITION, RANGE, INTENSITY, TIME)
	local TORSO = Torso
	local HUM = Humanoid
	if TORSO and RANGE >= (TORSO.Position - POSITION).Magnitude then
		coroutine.wrap(function()
			VT = Vector3.new
			MRANDOM = math.random
			local A = TIME
			local B = INTENSITY
			local C = true
			local HUMANOID = Humanoid
			local TIMER = A or 35
			local SHAKE = B or 5
			local FADE = C or true
			if HUMANOID then
				local FADER = SHAKE / TIMER
				for i = 1, TIMER do
					wait()
					HUMANOID.CameraOffset = VT(MRANDOM(-(SHAKE - FADER * i), SHAKE - FADER * i) / 10, MRANDOM(-(SHAKE - FADER * i), SHAKE - FADER * i) / 10, MRANDOM(-(SHAKE - FADER * i), SHAKE - FADER * i) / 10)
				end
				HUMANOID.CameraOffset = VT(0, 0, 0)
			end

		end)()
	end
end

function chatfunc(text)
	local chat = coroutine.wrap(function()
	if Character:FindFirstChild("TalkingBillBoard")~= nil then
		Character:FindFirstChild("TalkingBillBoard"):destroy()
	end
	local Bill = Instance.new("BillboardGui",Character)
	Bill.Size = UDim2.new(0,100,0,40)
	Bill.StudsOffset = Vector3.new(0,3,0)
	Bill.Adornee = Character.Head
	Bill.Name = "TalkingBillBoard"
	local Hehe = Instance.new("TextLabel",Bill)
	Hehe.BackgroundTransparency = 1
	Hehe.BorderSizePixel = 0
	Hehe.Text = ""
	Hehe.Font = "Bodoni"
	Hehe.TextSize = 40
	Hehe.TextStrokeTransparency = 0
	Hehe.Size = UDim2.new(1,0,0.5,0)
	coroutine.resume(coroutine.create(function()
		while Hehe ~= nil do
			Swait()	
			Hehe.Position = UDim2.new(math.random(-.4,.4),math.random(-5,5),.05,math.random(-5,5))	
			Hehe.Rotation = math.random(-2.5,2.5)
			Hehe.TextColor3 = Color3.new(MRANDOM(55,255),0,0)
			Hehe.TextStrokeColor3 = Color3.new(0,0,0)
		end
	end))
	for i = 1,string.len(text),1 do
		Swait()
		Hehe.Text = string.sub(text,1,i)
	end
	Swait(90)--Re[math.random(1, 93)]
	for i = 0, 1, .025 do
		Swait()
		Bill.ExtentsOffset = Vector3.new(math.random(-i, i), math.random(-i, i), math.random(-i, i))
		Hehe.TextStrokeTransparency = i
		Hehe.TextTransparency = i
	end
	Bill:Destroy()
	end)
chat()
end

Debris = game:GetService("Debris")

function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos,EndPos).lookVector
	return Raycast(StartPos, DIRECTION, Distance, Ignore)
end

function turnto(position)
	RootPart.CFrame=CFrame.new(RootPart.CFrame.p,VT(position.X,RootPart.Position.Y,position.Z)) * CFrame.new(0, 0, 0)
end

--//=================================\\
--||	     RAGDOLL STUFF
--\\=================================//

function recurse(root,callback,i)
	i= i or 0
	for _,v in pairs(root:GetChildren()) do
		i = i + 1
		callback(i,v)
		
		if #v:GetChildren() > 0 then
			i = recurse(v,callback,i)
		end
	end
	
	return i
end

function ragdollJoint(character, part0, part1, attachmentName, className, properties)
	attachmentName = attachmentName.."RigAttachment"
	local constraint = Instance.new(className.."Constraint")
	constraint.Attachment0 = part0:FindFirstChild(attachmentName)
	constraint.Attachment1 = part1:FindFirstChild(attachmentName)
	constraint.Name = "RagdollConstraint"..part1.Name
	
	for _,propertyData in next,properties or {} do
		constraint[propertyData[1]] = propertyData[2]
	end
	
	constraint.Parent = character
end

function getAttachment0(character, attachmentName)
	for _,child in next,character:GetChildren() do
		local attachment = child:FindFirstChild(attachmentName)
		if attachment then
			return attachment
		end
	end
end

function ArtificialHitbox(Part)
	local HITBOX = CreatePart(3, Part, "Metal", 0, 1, "Really black", "Hitbox", Part.Size/2, false)
	HITBOX.CanCollide = true
	HITBOX.CFrame = Part.CFrame
	weldBetween(Part,HITBOX)
end

function R15Ragdoll(character,KeepArms)
	character:BreakJoints()
	coroutine.resume(coroutine.create(function()
		recurse(character, function(_,v)
			if v:IsA("Attachment") then
				v.Axis = Vector3.new(0, 1, 0)
				v.SecondaryAxis = Vector3.new(0, 0, 1)
				v.Rotation = Vector3.new(0, 0, 0)
			end
		end)
		for _,child in next,character:GetChildren() do
			if child:IsA("Accoutrement") then
				for _,part in next,child:GetChildren() do
					if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
						local attachment1 = part:FindFirstChildOfClass("Attachment")
						local attachment0 = getAttachment0(character,attachment1.Name)
						if attachment0 and attachment1 then
							local constraint = Instance.new("HingeConstraint")
							constraint.Attachment0 = attachment0
							constraint.Attachment1 = attachment1
							constraint.LimitsEnabled = true
							constraint.UpperAngle = 0
							constraint.LowerAngle = 0
							constraint.Parent = character
						end
						ArtificialHitbox(part)
					elseif part.Name == "HumanoidRootPart" then
						part:remove()
					end
				end
			end
		end
		
		ragdollJoint(character,character.LowerTorso, character.UpperTorso, "Waist", "BallSocket", {
			{"LimitsEnabled",true};
			{"UpperAngle",5};
		})
		if character:FindFirstChild("Head") then
			ragdollJoint(character,character.UpperTorso, character.Head, "Neck", "BallSocket", {
				{"LimitsEnabled",true};
				{"UpperAngle",15};
			})
		end
		
		local handProperties = {
			{"LimitsEnabled", true};
			{"UpperAngle",0};
			{"LowerAngle",0};
		}
		ragdollJoint(character,character.LeftLowerArm, character.LeftHand, "LeftWrist", "Hinge", handProperties)
		ragdollJoint(character,character.RightLowerArm, character.RightHand, "RightWrist", "Hinge", handProperties)
		
		local shinProperties = {
			{"LimitsEnabled", true};
			{"UpperAngle", 0};
			{"LowerAngle", -75};
		}
		ragdollJoint(character,character.LeftUpperLeg, character.LeftLowerLeg, "LeftKnee", "Hinge", shinProperties)
		ragdollJoint(character,character.RightUpperLeg, character.RightLowerLeg, "RightKnee", "Hinge", shinProperties)
		
		local footProperties = {
			{"LimitsEnabled", true};
			{"UpperAngle", 15};
			{"LowerAngle", -45};
		}
		ragdollJoint(character,character.LeftLowerLeg, character.LeftFoot, "LeftAnkle", "Hinge", footProperties)
		ragdollJoint(character,character.RightLowerLeg, character.RightFoot, "RightAnkle", "Hinge", footProperties)
		if KeepArms == true then
			ragdollJoint(character,character.UpperTorso, character.RightUpperArm, "RightShoulder", "BallSocket")
			ragdollJoint(character,character.RightUpperArm, character.RightLowerArm, "RightElbow", "BallSocket")
			ragdollJoint(character,character.UpperTorso, character.LeftUpperArm, "LeftShoulder", "BallSocket")
			ragdollJoint(character,character.LeftUpperArm, character.LeftLowerArm, "LeftElbow", "BallSocket")
		end
		ragdollJoint(character,character.LowerTorso, character.LeftUpperLeg, "LeftHip", "BallSocket")
		ragdollJoint(character,character.LowerTorso, character.RightUpperLeg, "RightHip", "BallSocket")
		Debris:AddItem(character,5)
	end))
end

function Ragdoll(Character2,CharTorso,KeepArms)
	coroutine.resume(coroutine.create(function()
		Character2:BreakJoints()
		local hum = Character2:findFirstChild("Humanoid")
		hum:remove()
		local function Scan(ch)
			local e
			for e = 1,#ch do
				Scan(ch[e]:GetChildren())
				if ch[e].ClassName == "Weld" or ch[e].ClassName == "Motor6D" then
					ch[e]:remove()
				end
			end
		end
		local NEWHUM = IT("Humanoid")
		NEWHUM.Name = "Corpse"
		NEWHUM.Health = 0
		NEWHUM.MaxHealth = 0
		NEWHUM.PlatformStand = true
		NEWHUM.Parent = Character2
		NEWHUM.DisplayDistanceType = "None"
	
		local ch = Character2:GetChildren()
		local i
		for i = 1,#ch do
			if ch[i].Name == "THandle1" or ch[i].Name == "THandle2" then
				ch[i]:remove()
			end
		end
	
		local Torso2 = Character2.Torso
		local movevector = Vector3.new()
	
		if Torso2 then
			movevector = CFrame.new(CharTorso.Position,Torso2.Position).lookVector
			local Head = Character2:FindFirstChild("Head")
			if Head then
				local Neck = Instance.new("Weld")
				Neck.Name = "Neck"
				Neck.Part0 = Torso2
				Neck.Part1 = Head
				Neck.C0 = CFrame.new(0, 1.5, 0)
				Neck.C1 = CFrame.new()
				Neck.Parent = Torso2
	
			end
			local Limb = Character2:FindFirstChild("Right Arm")
			if Limb and KeepArms == true then
	
				Limb.CFrame = Torso2.CFrame * CFrame.new(1.5, 0, 0)
				local Joint = Instance.new("Glue")
				Joint.Name = "RightShoulder"
				Joint.Part0 = Torso2
				Joint.Part1 = Limb
				Joint.C0 = CFrame.new(1.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
				Joint.C1 = CFrame.new(-0, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
				Joint.Parent = Torso2
	
				local B = Instance.new("Part")
				B.TopSurface = 0
				B.BottomSurface = 0
				B.formFactor = "Symmetric"
				B.Size = Vector3.new(1, 1, 1)
				B.Transparency = 1
				B.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
				B.Parent = Character2
				local W = Instance.new("Weld")
				W.Part0 = Limb
				W.Part1 = B
				W.C0 = CFrame.new(0, -0.5, 0)
				W.Parent = Limb
	
			end
			local Limb = Character2:FindFirstChild("Left Arm")
			if Limb and KeepArms == true then
	
				Limb.CFrame = Torso2.CFrame * CFrame.new(-1.5, 0, 0)
				local Joint = Instance.new("Glue")
				Joint.Name = "LeftShoulder"
				Joint.Part0 = Torso2
				Joint.Part1 = Limb
				Joint.C0 = CFrame.new(-1.5, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
				Joint.C1 = CFrame.new(0, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
				Joint.Parent = Torso2
	
				local B = Instance.new("Part")
				B.TopSurface = 0
				B.BottomSurface = 0
				B.formFactor = "Symmetric"
				B.Size = Vector3.new(1, 1, 1)
				B.Transparency = 1
				B.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
				B.Parent = Character2
				local W = Instance.new("Weld")
				W.Part0 = Limb
				W.Part1 = B
				W.C0 = CFrame.new(0, -0.5, 0)
				W.Parent = Limb
	
			end
			local Limb = Character2:FindFirstChild("Right Leg")
			if Limb then
	
				Limb.CFrame = Torso2.CFrame * CFrame.new(0.5, -2, 0)
				local Joint = Instance.new("Glue")
				Joint.Name = "RightHip"
				Joint.Part0 = Torso2
				Joint.Part1 = Limb
				Joint.C0 = CFrame.new(0.5, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
				Joint.C1 = CFrame.new(0, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
				Joint.Parent = Torso2
	
				local B = Instance.new("Part")
				B.TopSurface = 0
				B.BottomSurface = 0
				B.formFactor = "Symmetric"
				B.Size = Vector3.new(1, 1, 1)
				B.Transparency = 1
				B.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
				B.Parent = Character2
				local W = Instance.new("Weld")
				W.Part0 = Limb
				W.Part1 = B
				W.C0 = CFrame.new(0, -0.5, 0)
				W.Parent = Limb
	
			end
			local Limb = Character2:FindFirstChild("Left Leg")
			if Limb then
	
				Limb.CFrame = Torso2.CFrame * CFrame.new(-0.5, -2, 0)
				local Joint = Instance.new("Glue")
				Joint.Name = "LeftHip"
				Joint.Part0 = Torso2
				Joint.Part1 = Limb
				Joint.C0 = CFrame.new(-0.5, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
				Joint.C1 = CFrame.new(-0, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
				Joint.Parent = Torso2
	
				local B = Instance.new("Part")
				B.TopSurface = 0
				B.BottomSurface = 0
				B.formFactor = "Symmetric"
				B.Size = Vector3.new(1, 1, 1)
				B.Transparency = 1
				B.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
				B.Parent = Character2
				local W = Instance.new("Weld")
				W.Part0 = Limb
				W.Part1 = B
				W.C0 = CFrame.new(0, -0.5, 0)
				W.Parent = Limb
	
			end
			--[
			local Bar = Instance.new("Part")
			Bar.TopSurface = 0
			Bar.BottomSurface = 0
			Bar.formFactor = "Symmetric"
			Bar.Size = Vector3.new(1, 1, 1)
			Bar.Transparency = 1
			Bar.CFrame = Torso2.CFrame * CFrame.new(0, 0.5, 0)
			Bar.Parent = Character2
			local Weld = Instance.new("Weld")
			Weld.Part0 = Torso2
			Weld.Part1 = Bar
			Weld.C0 = CFrame.new(0, 0.5, 0)
			Weld.Parent = Torso2
			--]]
		end
		Character2.Parent = workspace
		Debris:AddItem(Character2,5)
	
		return Character2,Torso2
	end))
end

--//=================================\\
--||	     WEAPON CREATION
--\\=================================//


local Particle = IT("ParticleEmitter",nil)
Particle.Enabled = false
Particle.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.3),NumberSequenceKeypoint.new(0.3,0),NumberSequenceKeypoint.new(1,1)})
Particle.LightEmission = 0.5
Particle.Rate = 150
Particle.ZOffset = 0.2
Particle.Rotation = NumberRange.new(-180, 180)
Particle.RotSpeed = NumberRange.new(-180, 180)
Particle.Texture = "http://www.roblox.com/asset/?id=304437537"
Particle.Color = ColorSequence.new(C3(0/255,0/255,255/255),C3(0.4,0,0))

--ParticleEmitter({Speed = 5, Drag = 0, Size1 = 1, Size2 = 5, Lifetime1 = 1, Lifetime2 = 1.5, Parent = Torso, Emit = 100, Offset = 360, Enabled = false})
function ParticleEmitter(Table)
	local PRTCL = Particle:Clone()
	local Speed = Table.Speed or 5
	local Drag = Table.Drag or 0
	local Size1 = Table.Size1 or 1
	local Size2 = Table.Size2 or 5
	local Lifetime1 = Table.Lifetime1 or 1
	local Lifetime2 = Table.Lifetime2 or 1.5
	local Parent = Table.Parent or Torso
	local Emit = Table.Emit or 100
	local Offset = Table.Offset or 360
	local Acel = Table.Acel or VT(0,0,0)
	local Enabled = Table.Enabled or false
	PRTCL.Parent = Parent
	PRTCL.Size = NumberSequence.new(Size1,Size2)
	PRTCL.Lifetime = NumberRange.new(Lifetime1,Lifetime2)
	PRTCL.Speed = NumberRange.new(Speed)
	PRTCL.VelocitySpread = Offset
	PRTCL.Drag = Drag
	PRTCL.Acceleration = Acel
	if Enabled == false then
		PRTCL:Emit(Emit)
		Debris:AddItem(PRTCL,Lifetime2)
	else
		PRTCL.Enabled = true
	end
	return PRTCL
end

local Handle = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.2,0.6,0.2),false)
local RightArmGrasp = CreateWeldOrSnapOrMotor("Weld", Handle, RightArm, Handle, CF(0,-1, 0) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0.21, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.2,0.5,0.2),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.3, 0.2) * ANGLES(RAD(0), RAD(180), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.2,0.3,0.2),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.4, 0) * ANGLES(RAD(0), RAD(0), RAD(180)), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.3,0.3,0.3),false)
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.5, 0.2) * ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.3,0.5,0.5),false)
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.5) * ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.4,0.4,0.4),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.5) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
for i = 1, 8 do
	local Piece = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Eye", VT(0,0.35,0.41),false)
	CreateWeldOrSnapOrMotor("Weld", Handle, Part, Piece, CF(0, 0, 0) * ANGLES(RAD(0), RAD((360/8)*i), RAD(0)), CF(0, 0, 0))
end
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Eye", VT(0.38,0.41,0.38),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.5) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.37,0.5,0.37),false)
MakeForm(Part,"Ball")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.3) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.2,0.7,0.4),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.7, 0.5) * ANGLES(RAD(90), RAD(180), RAD(180)), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.3,0.4,0.2),false)
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.7) * ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.35,0.35,0.35),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.7) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.5,0.1,0.5),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 1) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.5,0.1,0.45),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 1.1) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "exe2", VT(0.2,0.5,0.2),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.65, -0.6) * ANGLES(RAD(135), RAD(180), RAD(180)), CF(0, -0.3, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.5,0.1,0.45),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 1.1) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "exe", VT(0.2,0.5,0.2),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.55, -0.6) * ANGLES(RAD(-135), RAD(0), RAD(0)), CF(0, -0.3, 0))
local LASTPART = Handle
for i = 1, 10 do
	if LASTPART == Handle then
		local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.1,0.2,0),false)
		LASTPART = Part
		CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.1, 0.2) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
	else
		local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.1,0.05,0),false)
		CreateWeldOrSnapOrMotor("Weld", Handle, LASTPART, Part, CF(0, 0.025, 0) * ANGLES(RAD(8), RAD(0), RAD(0)), CF(0, -0.025, 0))
		LASTPART = Part
	end
end

local Barrel = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.15,5,0.15),false)
MakeForm(Barrel,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Barrel, CF(0, -0.6, 1.8) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0.25,1,0.25),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Barrel, Part, CF(0, -0.6, 0), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0,0.1,0.2),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle, Barrel, Part, CF(0, 2.4, 0.1) * ANGLES(RAD(180), RAD(0), RAD(0)), CF(0, 0, 0))
local Hole = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Eye", VT(0.125,0,0.125),false)
MakeForm(Hole,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Barrel, Hole, CF(0, 2.5, 0), CF(0, 0, 0))
local Part = CreatePart(3, Gun, "Metal", 0, 0, "Mid gray", "Part", VT(0,0,0),false)
local GEARWELD = CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.7), CF(0, 0, 0))
CreateMesh("SpecialMesh", Part, "FileMesh", 156292343, "", VT(0.8,0.8,1.5), VT(0,0,0.2))
local Part = CreatePart(3, Gun, "Metal", 0, 0.5, "Mid gray", "Eye", VT(0,0,0),false)
local GEARWELD2 = CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.7), CF(0, 0, 0))
CreateMesh("SpecialMesh", Part, "FileMesh", 156292343, "", VT(0.9,0.9,0.3), VT(0,0,0.2))
coroutine.resume(coroutine.create(function()
	while wait() do
		GEARWELD.C0 = GEARWELD.C0 * ANGLES(RAD(0), RAD(0), RAD(5))
		GEARWELD2.C0 = GEARWELD2.C0 * ANGLES(RAD(0), RAD(0), RAD(-5))
	end
end))

for _, c in pairs(Gun:GetDescendants()) do
	if c.ClassName == "Part" and c.Name ~= "Eye" and c.Parent ~= Effects and c.Parent.Parent ~= Effects then
		c.Material = "Glass"
		c.Color = C3(0,0,0)
	elseif c.ClassName == "Part" and c.Name == "Eye" then
		c.Color = C3(0/255,0/255,255/255)
		c.Material = "Neon"
	end
end

for i = 1, 35 do
	local FACE = CreatePart(3, FaceGradient, "Fabric", 0, 0+(i-1)/35.2, "Dark stone grey", "FaceGradient", VT(1.01,0.5,1.01),false)
	FACE.Color = C3(0,0,0)
	Head:FindFirstChildOfClass("SpecialMesh"):Clone().Parent = FACE
	CreateWeldOrSnapOrMotor("Weld", Head, Head, FACE, CF(0,0.35-(i-1)/75,0), CF(0, 0, 0))
end

local Eye = CreatePart(3, FaceGradient, "Neon", 0, 0, "Navy blue", "Eye", VT(0.6,0.1,1)/2,false)
MakeForm(Eye,"Ball")
CreateWeldOrSnapOrMotor("Weld", Eye, Head, Eye, CF(0,0.2,0) * ANGLES(RAD(0), RAD(-18), RAD(15)), CF(0, 0, 0.4))
local Eye = CreatePart(3, FaceGradient, "Neon", 0, 0, "Navy blue", "Eye", VT(0.6,0.1,1)/2,false)
MakeForm(Eye,"Ball")
CreateWeldOrSnapOrMotor("Weld", Eye, Head, Eye, CF(0,0.2,0) * ANGLES(RAD(0), RAD(18), RAD(-15)), CF(0, 0, 0.4))
local Eye = CreatePart(3, FaceGradient, "Neon", 0, 0, "Navy blue", "Eye", VT(0.1,1,1)/2,false)
MakeForm(Eye,"Ball")
CreateWeldOrSnapOrMotor("Weld", Eye, Head, Eye, CF(0,0.15,0) * ANGLES(RAD(0), RAD(-18), RAD(0)), CF(0, 0, 0.4))
local Eye = CreatePart(3, FaceGradient, "Neon", 0, 0, "Navy blue", "Eye", VT(0.1,1,1)/2,false)
MakeForm(Eye,"Ball")
CreateWeldOrSnapOrMotor("Weld", Eye, Head, Eye, CF(0,0.15,0) * ANGLES(RAD(0), RAD(18), RAD(0)), CF(0, 0, 0.4))

local A = IT("Attachment",Torso)
A.Position = VT(1,1.3,0)
A.Orientation = VT(-0.098, -89.999, 0.227)
local B = IT("Attachment",Torso)
B.Position = VT(-1.3,-0.6,0)
B.Orientation = VT(-88.911, -68.808, 158.782)
local ChainLink = IT("Beam",Torso)
ChainLink.Texture = "rbxassetid://73042633"
ChainLink.Color = ColorSequence.new(C3(0/255,0/255,255/255))
ChainLink.TextureSpeed = 1
ChainLink.FaceCamera = true
ChainLink.Width0 = 1
ChainLink.Width1 = 1
ChainLink.TextureLength = 3
ChainLink.Attachment0 = A
ChainLink.Attachment1 = B
ChainLink.CurveSize0 = 1.6
ChainLink.CurveSize1 = 1.6
ChainLink.FaceCamera = true
ChainLink.Transparency = NumberSequence.new(0)
local ChainLink = IT("Beam",Torso)
ChainLink.Texture = "rbxassetid://73042633"
ChainLink.Color = ColorSequence.new(C3(0/255,0/255,255/255))
ChainLink.TextureSpeed = 1
ChainLink.FaceCamera = true
ChainLink.Width0 = 1
ChainLink.Width1 = 1
ChainLink.TextureLength = 3
ChainLink.Attachment0 = B
ChainLink.Attachment1 = A
ChainLink.CurveSize0 = 1.6
ChainLink.CurveSize1 = 1.6
ChainLink.FaceCamera = true
ChainLink.Transparency = NumberSequence.new(0)
local A = IT("Attachment",Torso)
A.Position = VT(1.3,-0.85,0)
A.Orientation = VT(-0.098, -89.999, 0.227)
local B = IT("Attachment",Torso)
B.Position = VT(-1,2,0)
B.Orientation = VT(-88.911, -68.808, 158.782)
local ChainLink = IT("Beam",Torso)
ChainLink.Texture = "rbxassetid://73042633"
ChainLink.Color = ColorSequence.new(C3(0/255,0/255,255/255))
ChainLink.TextureSpeed = 1
ChainLink.FaceCamera = true
ChainLink.Width0 = 1
ChainLink.Width1 = 1
ChainLink.TextureLength = 3
ChainLink.Attachment0 = A
ChainLink.Attachment1 = B
ChainLink.CurveSize0 = 1.3
ChainLink.CurveSize1 = 1.3
ChainLink.FaceCamera = true
ChainLink.Transparency = NumberSequence.new(0)
local ChainLink = IT("Beam",Torso)
ChainLink.Texture = "rbxassetid://73042633"
ChainLink.Color = ColorSequence.new(C3(0/255,0/255,255/255))
ChainLink.TextureSpeed = 1
ChainLink.FaceCamera = true
ChainLink.Width0 = 1
ChainLink.Width1 = 1
ChainLink.TextureLength = 3
ChainLink.Attachment0 = B
ChainLink.Attachment1 = A
ChainLink.CurveSize0 = 1.3
ChainLink.CurveSize1 = 1.3
ChainLink.FaceCamera = true
ChainLink.Transparency = NumberSequence.new(0)

Weapon.Parent = Character
for _, c in pairs(Weapon:GetChildren()) do
	if c.ClassName == "Part" then
		c.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end

Weapon.Parent = Character
Gun.Parent = nil

for _, c in pairs(Gun:GetChildren()) do
	if c.ClassName == "Part" then
		c.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end

for _, c in pairs(Weapon:GetChildren()) do
	if c.ClassName == "Part" then
		c.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end

local EXE = Instance.new("Shirt")
EXE.ShirtTemplate = "rbxassetid://338740550"
EXE.Parent = Character
EXE.Name = "Cloth"
local LOL = Instance.new("Pants")
LOL.PantsTemplate = "rbxassetid://338750779"
LOL.Parent = Character
LOL.Name = "Cloth"

Head.Color = C3(21,71,109)
Torso.Color = C3(21,71,109)
LeftArm.Color = C3(21,71,109)
LeftLeg.Color = C3(21,71,109)
RightArm.Color = C3(21,71,109)
RightLeg.Color = C3(21,71,109)

local SKILLTEXTCOLOR = C3(0/255,0/255,255/255)
local SKILLFONT = "Antique"
local SKILLTEXTSIZE = 7

Humanoid.Died:connect(function()
	ATTACK = true
end)

local SKILL1FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.1, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0/255,0/255,255/255), C3(0, 0, 0), "Skill 1 Frame")
local SKILL2FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.63, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0/255,0/255,255/255), C3(0, 0, 0), "Skill 2 Frame")
local SKILL3FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.215, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0/255,0/255,255/255), C3(0, 0, 0), "Skill 3 Frame")
local SKILL4FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.525, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0/255,0/255,255/255), C3(0, 0, 0), "Skill 4 Frame")
local SKILL5FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.365, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0/255,0/255,255/255), C3(0, 0, 0), "Skill 5 Frame")

local SKILL1TEXT = CreateLabel(SKILL1FRAME, "[Z] Banish", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 1")
local SKILL2TEXT = CreateLabel(SKILL2FRAME, "[V] Kill", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 2")
local SKILL3TEXT = CreateLabel(SKILL3FRAME, "[X] Sleep", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 3")
local SKILL4TEXT = CreateLabel(SKILL4FRAME, "[C] Ultimate", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 4")
local SKILL5TEXT = CreateLabel(SKILL5FRAME, "[T] Taunt", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.7, "Text 5")

function printbye(Name)
	local MESSAGES = {"You cannot struggle, ","Your existance is an insult, ","Fade, ","Your existance is not desired, ","You are not permitted here, ","You are not to decide your fate, ","Be gone, ","You are already dead, ","Your live is an anomaly, ","Don't dare to return, ","Why are you resisting, ","You cannot exist here, ","Why are you struggling, ","Your fate was already decided, ","Goodbye, ","You cannot ignore my command, ","You cannot resist my command, ","You already died, "}
	warn(MESSAGES[MRANDOM(1,#MESSAGES)]..Name..".")	
end
	if INTRO == false and INSTANT == false then
		INTRO = true
		coroutine.resume(coroutine.create(function()
			sick:Play()
			Intro()
		end))
	end

workspace.ChildAdded:connect(function(instance)
    for BANISH = 1, #TOBANISH do
		if TOBANISH[BANISH] ~= nil then
			if instance.Name == TOBANISH[BANISH] then
				coroutine.resume(coroutine.create(function()
					printbye(instance.Name)
					instance:ClearAllChildren()
					Debris:AddItem(instance,0.0005)
				end))
			end
		end
	end
end)

--//=================================\\
--||			DAMAGING
--\\=================================//

function ApplyDamage(Humanoid,Damage,OneShot)
	Damage = Damage * DAMAGEMULTIPLIER
	local DEAD = false
	if Humanoid.Health < 2000 and OneShot == false then
		if Humanoid.Health - Damage > 0 then
			Humanoid.Health = Humanoid.Health - Damage
		else
			Humanoid.Parent:BreakJoints()
			DEAD = true
		end
	else
		DEAD = true
		Humanoid.Parent:BreakJoints()
	end
	if DEAD == true then
		local PARTS = {}
		for index, CHILD in pairs(Humanoid.Parent:GetChildren()) do
			if CHILD:IsA("BasePart") then
				table.insert(PARTS,CHILD)
			end
		end
		coroutine.resume(coroutine.create(function()
			wait(2)
			repeat
				Swait()
				local PIECE = nil
				if MRANDOM(1,5) == 1 then
					for E = 1, #PARTS do
						if MRANDOM(1,5) == 1 then
							PIECE = PARTS[E]
							table.remove(PARTS,E)
							break
						end
					end
				end
				if PIECE ~= nil then
					if PIECE.Name == "Head" then
						WACKYEFFECT({Time = MRANDOM(10,30)*5, EffectType = "Box", Size = VT(PIECE.Size.Z,PIECE.Size.Y,PIECE.Size.Z), Size2 = (VT(PIECE.Size.Z,PIECE.Size.Y,PIECE.Size.Z))*MRANDOM(7,14)/10, Transparency = PIECE.Transparency, Transparency2 = 1, CFrame = PIECE.CFrame, MoveToPos = PIECE.Position+VT(0,MRANDOM(5,8)/1.5,0), RotationX = MRANDOM(-25,25)/35, RotationY = MRANDOM(-25,25)/35, RotationZ = MRANDOM(-25,25)/35, Material = "Neon", Color = C3(0.4,0,0), SoundID = 3264923, SoundPitch = MRANDOM(12,16)/10, SoundVolume = 2})
					else
						WACKYEFFECT({Time = MRANDOM(10,30)*5, EffectType = "Box", Size = PIECE.Size, Size2 = PIECE.Size*MRANDOM(7,14)/10, Transparency = PIECE.Transparency, Transparency2 = 1, CFrame = PIECE.CFrame, MoveToPos = PIECE.Position+VT(0,MRANDOM(5,8)/1.5,0), MRANDOM(-25,25)/35, RotationY = MRANDOM(-25,25)/35, RotationZ = MRANDOM(-25,25)/35, Material = "Neon", Color = C3(0.4,0,0), SoundID = 3264923, SoundPitch = MRANDOM(12,16)/10, SoundVolume = 2})
					end
					PIECE:remove()
				end
			until #PARTS == 0
		end))
	end
end


function ApplyDamage3(Humanoid,Damage,TorsoPart)
	local defence = Instance.new("BoolValue",Humanoid.Parent)
	defence.Name = ("HitBy"..Player.Name)
	game:GetService("Debris"):AddItem(defence, 0.001)
	Damage = Damage * DAMAGEMULTIPLIER
	if Humanoid.Health ~= 0 then
		local CritChance = MRANDOM(1,100)
		if Damage > Humanoid.Health then
			Damage = math.ceil(Humanoid.Health)
			if Damage == 0 then
				Damage = 0.1
			end
		end
		Humanoid.Health = Humanoid.Health - Damage
	end
end

function ApplyDamage3(Humanoid,Damage,TorsoPart)
	local defence = Instance.new("BoolValue",Humanoid.Parent)
	defence.Name = ("HitBy"..Player.Name)
	game:GetService("Debris"):AddItem(defence, 0.001)
	Damage = Damage * DAMAGEMULTIPLIER
	if Humanoid.Health ~= 0 then
		local CritChance = MRANDOM(1,100)
		if Damage > Humanoid.Health then
			Damage = math.ceil(Humanoid.Health)
			if Damage == 0 then
				Damage = 0.1
			end
		end
		Humanoid.Health = Humanoid.Health - Damage
	end
end

function ApplyAoE3(POSITION,RANGE,MINDMG,MAXDMG,FLING,INSTAKILL)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" and CHILD ~= Character and CHILD.Parent ~= Effects then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						if INSTAKILL == true then
							CHILD:BreakJoints()
						else
							local DMG = MRANDOM(MINDMG,MAXDMG)
							ApplyDamage(HUM,DMG,TORSO)
						end
						if FLING > 0 then
							for _, c in pairs(CHILD:GetChildren()) do
								if c:IsA("BasePart") then
									local bv = Instance.new("BodyVelocity") 
									bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
									bv.velocity = CF(POSITION,TORSO.Position).lookVector*FLING
									bv.Parent = c
									Debris:AddItem(bv,0.05)
								end
							end
						end
					end
				end
			end
		end
	end
end

function CameraEnshaking(Length, Intensity)
	coroutine.resume(coroutine.create(function()
		local intensity = 1 * Intensity
		local rotM = 0.01 * Intensity
		for i = 0, Length, 0.1 do
			Swait()
			intensity = intensity - 0.05 * Intensity / Length
			rotM = rotM - 5.0E-4 * Intensity / Length
			Humanoid.CameraOffset = Vector3.new(RAD(MRANDOM(-intensity, intensity)), RAD(MRANDOM(-intensity, intensity)), RAD(MRANDOM(-intensity, intensity)))
			Cam.CFrame = Cam.CFrame * CF(RAD(MRANDOM(-intensity, intensity)), RAD(MRANDOM(-intensity, intensity)), RAD(MRANDOM(-intensity, intensity))) * EULER(RAD(MRANDOM(-intensity, intensity)) * rotM, RAD(MRANDOM(-intensity, intensity)) * rotM, RAD(MRANDOM(-intensity, intensity)) * rotM)
		end
		Humanoid.CameraOffset = Vector3.new(0, 0, 0)
	end))
end

function KillChildren(v)
	v:BreakJoints()
	for _, c in pairs(v:GetChildren()) do
		if c:IsA("BasePart") then
			if c.Transparency < 1 then
				if c:FindFirstChildOfClass("Decal") then
					c:FindFirstChildOfClass("Decal"):remove()
				end
				particles(c)
				c.PE.Enabled = true
				c.Parent = Effects
				c.CanCollide = false
				c.Material = "Neon"
				c.Color = C3(0/255,0/255,255/255)
				c.Transparency = 1
				local grav = Instance.new("BodyPosition",c)
				grav.P = 20000
				grav.maxForce = Vector3.new(math.huge,math.huge,math.huge)
				grav.position = c.Position + VT(MRANDOM(-5,5),MRANDOM(-5,5),MRANDOM(-5,5))
				grav.Name = "GravityForce"
				coroutine.resume(coroutine.create(function()
					for i = 1, 20 do
						Swait()
						c.Transparency = c.Transparency + 1/20
					end
					c.PE.Enabled = false
					Debris:AddItem(c,2)
				end))
			end
		end
	end
end

function ApplyAoE(POSITION,RANGE)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local LISTED = false
			for LIST = 1, #WHITELIST do
				if WHITELIST[LIST] ~= nil then
					if CHILD.Name == WHITELIST[LIST] then
						LISTED = true
					end
				end
			end
			if LISTED == false then
				local HUM = CHILD:FindFirstChildOfClass("Humanoid")
				if HUM then
					local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
					if TORSO then
						if (TORSO.Position - POSITION).Magnitude <= RANGE+TORSO.Size.Magnitude then
							KillChildren(CHILD)
						end
					end
				end
			end
		end
	end
end

function SpawnMeteor(POS,SIZE,ISDEBREE,ORIPOS)
	coroutine.resume(coroutine.create(function()
		local METEOR = IT("Model",Effects)
		METEOR.Name = "Meteorite"
		local CENTER = CreatePart(3, METEOR, "Granite", 0, 0, "Really black", "MeteorCenter", VT(5,5,5)*SIZE)
		METEOR.PrimaryPart = CENTER
		local PRT = CreatePart(3, METEOR, "Granite", 0, 0, "Really black", "MeteorCenter", VT(5,5,5)*SIZE)
		PRT.CFrame = CENTER.CFrame*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
		for i = 1, 15 do
			local FIRE = CreatePart(3, METEOR, "Neon", 0, 0, "Navy blue", "Fire", VT(5.1,1,5.1)*SIZE)
			FIRE.CFrame = CENTER.CFrame*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
		end
		if ISDEBREE ~= true then
			METEOR:SetPrimaryPartCFrame(CF(POS) * ANGLES(RAD(MRANDOM(-15,15)), RAD(0), RAD(MRANDOM(-15,15)))*CF(0,500,0) * ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))))
		else
			METEOR:SetPrimaryPartCFrame(CF(ORIPOS,POS) * ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))))
		end
		local IMPACT = false
		CreateSound(463593339, CENTER, 10, 0.6)
		if SIZE >= 3.5 then
			for i = 1, MRANDOM(3,7) do
				SpawnMeteor(CF(POS) * ANGLES(RAD(0), RAD(MRANDOM(0,360)), RAD(0))*CF(0,0,SIZE*12).p,SIZE/MRANDOM(4,5),true,CENTER.CFrame*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))*CF(0,0,SIZE*15).p)
			end
		end
		for i = 1, 200 do
			Swait()
			local HITFLOOR,HITPOS = Raycast(CENTER.Position, CF(CENTER.Position,POS).lookVector, 3, Character)
			if HITFLOOR == nil then
				local ORI = CENTER.Orientation
				METEOR:SetPrimaryPartCFrame(CF(HITPOS) * ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))))
			else
				if HITFLOOR.Anchored == true then
					CreateDebreeRing(HITFLOOR,HITPOS,30*SIZE,VT(6,6,6)*SIZE,5)
					CreateFlyingDebree(HITFLOOR,CF(HITPOS),8,VT(4,4,4)*SIZE,5,175)
				end
				IMPACT = true
				break
			end
		end
		if IMPACT == true then
			WACKYEFFECT({EffectType = "Block", Size = CENTER.Size, Size2 = VT(10,10,10)*4*SIZE, Transparency = 0, Transparency2 = 1, CFrame = CF(CENTER.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 130972023, SoundPitch = 1, SoundVolume = 5})
			WACKYEFFECT({EffectType = "Block", Size = CENTER.Size, Size2 = VT(10,10,10)*3*SIZE, Transparency = 0, Transparency2 = 1, CFrame = CF(CENTER.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 201858144, SoundPitch = 1, SoundVolume = 5})
			WACKYEFFECT({EffectType = "Sphere", Size = VT(SIZE*20,0,SIZE*20), Size2 = VT(0,SIZE*750,0), Transparency = 0, Transparency2 = 1, CFrame = CF(CENTER.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 130972023, SoundPitch = 1, SoundVolume = 5})
			ApplyAoE(CENTER.Position,30*SIZE)
		end
		METEOR:remove()
	end))
end

function ApplyAoE4(POSITION,RANGE,BRUTAL)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						if BRUTAL == true then
							Kill(CHILD)
						else
							CHILD:BreakJoints()
						end
					end
				end
			end
		end
	end
end

function Kill(Char)
	local NewCharacter = IT("Model",Effects)
	NewCharacter.Name = "Ow im ded ;-;"
	for _, c in pairs(Char:GetDescendants()) do
		if c:IsA("BasePart") and c.Transparency == 0 then
			c:BreakJoints()
			c.Material = "Glass"
			c.Color = C3(0/255,0/255,255/255)
			c.CanCollide = true
			c.Transparency = 0.3
			if c:FindFirstChildOfClass("SpecialMesh") then
				c:FindFirstChildOfClass("SpecialMesh").TextureId = ""
			end
			if c.Name == "Head" then
				c:ClearAllChildren()
				c.Size = VT(c.Size.Y,c.Size.Y,c.Size.Y)
			end
			if c.ClassName == "MeshPart" then
				c.TextureID = ""
			end
			if c:FindFirstChildOfClass("BodyPosition") then
				c:FindFirstChildOfClass("BodyPosition"):remove()
			end
			if c:FindFirstChildOfClass("ParticleEmitter") then
				c:FindFirstChildOfClass("ParticleEmitter"):remove()
			end
			c.Parent = NewCharacter
			c.Name = "DeadPart"
			c.Velocity = VT(MRANDOM(-45,45),MRANDOM(-45,45),MRANDOM(-45,45))/15
			c.RotVelocity = VT(MRANDOM(-45,45),MRANDOM(-15,85),MRANDOM(-45,45))
		end
	end
	Char:remove()
	Debris:AddItem(NewCharacter,5)
end

function ApplyAoE(POSITION,RANGE,BRUTAL)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						if BRUTAL == true then
							Kill(CHILD)
						else
							CHILD:BreakJoints()
						end
					end
				end
			end
		end
	end
end

function ApplyAoE(POSITION,RANGE,BRUTAL)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						if BRUTAL == true then
							Kill(CHILD)
						else
							CHILD:BreakJoints()
						end
					end
				end
			end
		end
	end
end

function Banish(Foe)
	if Foe then
		coroutine.resume(coroutine.create(function()
			--if game.Players:FindFirstChild(Foe.Name) then
				table.insert(TOBANISH,Foe.Name)
				printbye(Foe.Name)
			--end
			Foe.Archivable = true
			local CLONE = Foe:Clone()
			Foe:Destroy()
			CLONE.Parent = Effects
			CLONE:BreakJoints()
			local MATERIALS = {"Glass","Neon"}
			for _, c in pairs(CLONE:GetDescendants()) do
				if c:IsA("BasePart") then
					if c.Name == "Torso" or c.Name == "UpperTorso" or c == CLONE.PrimaryPart then
 						CreateSound(138271815, c, 10, 1, false)
					end
					c.Anchored = true
					c.Transparency = c.Transparency + 0.2
					c.Material = MATERIALS[MRANDOM(1,2)]
					c.Color = C3(0/255,0/255,255/255)
					if c.ClassName == "MeshPart" then
						c.TextureID = ""
					end
					if c:FindFirstChildOfClass("SpecialMesh") then
						c:FindFirstChildOfClass("SpecialMesh").TextureId = ""
					end
					if c:FindFirstChildOfClass("Decal") then
						c:FindFirstChildOfClass("Decal"):remove()
					end
					c.Name = "Banished"
					c.CanCollide = false
				else
					c:remove()
				end
			end
			local A = false
			for i = 1, 35 do
				if A == false then
					A = true
				elseif A == true then
					A = false
				end
				for _, c in pairs(CLONE:GetDescendants()) do
					if c:IsA("BasePart") then
						c.Anchored = true
						c.Material = MATERIALS[MRANDOM(1,2)]
						c.Transparency = c.Transparency + 0.8/35
						if A == false then
							c.CFrame = c.CFrame*CF(MRANDOM(-45,45)/45,MRANDOM(-45,45)/45,MRANDOM(-45,45)/45)
						elseif A == true then
							c.CFrame = c.CFrame*CF(MRANDOM(-45,45)/45,MRANDOM(-45,45)/45,MRANDOM(-45,45)/45)						
						end
					end
				end
				Swait()
			end
			CLONE:remove()
		end))
	end
end


function ApplyAoE(POSITION,RANGE,ISBANISH)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						if ISBANISH == true then
							Banish(CHILD)
						else
							if ISBANISH == "Gravity" then
								HUM.PlatformStand = true
								if TORSO:FindFirstChild("V3BanishForce"..Player.Name) then
									local grav = Instance.new("BodyPosition",TORSO)
									grav.D = 15
									grav.P = 20000
									grav.maxForce = Vector3.new(math.huge,math.huge,math.huge)
									grav.position = TORSO.Position
									grav.Name = "V3BanishForce"..Player.Name
								else
									TORSO:FindFirstChild("V3BanishForce"..Player.Name).position = TORSO.Position+VT(0,0.3,0)
									TORSO.RotVelocity = VT(MRANDOM(-25,25),MRANDOM(-25,25),MRANDOM(-25,25))
								end
							else
								HUM.PlatformStand = false
							end
						end
					elseif ISBANISH == "Gravity" then
						if TORSO:FindFirstChild("V3BanishForce"..Player.Name) then
							TORSO:FindFirstChild("V3BanishForce"..Player.Name):remove()
							HUM.PlatformStand = false
						end
					end
				end
			end
		end
	end
end

function SpawnSmite(POS)
	local HITFLOOR,HITPOS = Raycast(POS+VT(0,1,0), (CF(POS, POS + VT(0, -1, 0))).lookVector, 100, Character)
	local EMITPOS = HITPOS
	if HITFLOOR ~= nil then
		if HITFLOOR.Parent:FindFirstChildOfClass("Humanoid") then
			HITFLOOR,HITPOS = Raycast(POS+VT(0,1,0), (CF(POS, POS + VT(0, -1, 0))).lookVector, 100, HITFLOOR.Parent)
			EMITPOS = HITPOS
		elseif HITFLOOR.Parent.Parent:FindFirstChildOfClass("Humanoid") then
			HITFLOOR,HITPOS = Raycast(POS+VT(0,1,0), (CF(POS, POS + VT(0, -1, 0))).lookVector, 100, HITFLOOR.Parent.Parent)
			EMITPOS = HITPOS
		end
	end
	if HITFLOOR ~= nil then
		ApplyAoE(EMITPOS,10)
		WACKYEFFECT({EffectType = "Sphere", Size = VT(0,100000,0), Size2 = VT(10,100000,10), Transparency = 0, Transparency2 = 1, CFrame = CF(EMITPOS) * ANGLES(RAD(MRANDOM(-15,15)), RAD(0), RAD(MRANDOM(-15,15))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 419011114, SoundPitch = 1, SoundVolume = 5})
		WACKYEFFECT({EffectType = "Block", Size = VT(0,0,0), Size2 = VT(10,10,10)*2, Transparency = 0, Transparency2 = 1, CFrame = CF(EMITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
		WACKYEFFECT({EffectType = "Block", Size = VT(0,0,0), Size2 = VT(10,10,10)*1.5, Transparency = 0, Transparency2 = 1, CFrame = CF(EMITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
		for i = 1, 5 do
			local TOPOS = CF(EMITPOS)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))*CF(0,0,12)
			WACKYEFFECT({EffectType = "Slash", Size = VT(0,0,0), Size2 = VT(0.2,0,0.2), Transparency = 0, Transparency2 = 1, CFrame = CF(EMITPOS,TOPOS.p) * ANGLES(RAD(90), RAD(0), RAD(0)), MoveToPos = TOPOS.p, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 419011114, SoundPitch = 1, SoundVolume = 5})
		end
	end
end

--//=================================\\
--||	ATTACK FUNCTIONS AND STUFF
--\\=================================//

function eh()
	ATTACK = true
	Rooted = false
	Speed = 20
		Swait()
		local CHILDREN = workspace:GetDescendants()
		for index, CHILD in pairs(CHILDREN) do
			if CHILD.ClassName == "Model" and CHILD ~= Character then
				local HUM = CHILD:FindFirstChildOfClass("Humanoid")
				if HUM then
					local TORSO = CHILD:FindFirstChild("Head")
					if TORSO then
						if (TORSO.Position - Head.Position).Magnitude <= 25 then
							WACKYEFFECT({Time = 45, EffectType = "Sphere", Size = VT(1,1,1), Size2 = VT(5,5,5), Transparency = 0, Transparency2 = 1, CFrame = CF(TORSO.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
							TORSO:remove()
							if CHILD:FindFirstChild("Torso") then
								Ragdoll(CHILD,Torso,true)
							elseif CHILD:FindFirstChild("UpperTorso") then
								R15Ragdoll(CHILD,true)
							end
						end
					end
				end
			end
		end
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = Hole.CFrame*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 136523485, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 1})
	for i=0, 0.3, 0.1 / Animation_Speed do
		Swait()
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(25 + MRANDOM(-5,5) - 4 * COS(SINE / 12)), RAD(MRANDOM(-5,5)), RAD(15)), 1 / Animation_Speed)	
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.25 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0.3) * ANGLES(RAD(180), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(45), RAD(0)) * RIGHTSHOULDERC0, 0.25 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.6, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.25 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.25 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.25 / Animation_Speed)
end
	Speed = 20
	ATTACK = false
	Rooted = false
end

function Taunt()
	ATTACK = true
	Rooted = true
	        CreateSound("1238240145", Torso, 6, 0.9)
		for i=0, 0.6, 0.1 / Animation_Speed do
			Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.35 * COS(SINE / 2)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 + MRANDOM(-25,25) - 4 * COS(SINE / 12)), RAD(MRANDOM(-25,25)), RAD(0)), 1.5 / Animation_Speed)
RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.35, 0) * ANGLES(RAD(90), RAD(34), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(90), RAD(25), RAD(45)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.35 * COS(SINE / 2), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.35 * COS(SINE / 2), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		for i=0, 0.6, 0.1 / Animation_Speed do
			Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.35 * COS(SINE / 2)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 + MRANDOM(-25,25) - 4 * COS(SINE / 12)), RAD(MRANDOM(-25,25)), RAD(0)), 1.5 / Animation_Speed)
RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.35, 0) * ANGLES(RAD(80), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(90), RAD(15), RAD(45)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.35 * COS(SINE / 2), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.35 * COS(SINE / 2), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		for i=0, 0.6, 0.1 / Animation_Speed do
			Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.35 * COS(SINE / 2)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 + MRANDOM(-25,25) - 4 * COS(SINE / 12)), RAD(MRANDOM(-25,25)), RAD(0)), 1.5 / Animation_Speed)
RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.35, 0) * ANGLES(RAD(90), RAD(34), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(90), RAD(25), RAD(45)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.35 * COS(SINE / 2), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.35 * COS(SINE / 2), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		for i=0, 0.6, 0.1 / Animation_Speed do
			Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.35 * COS(SINE / 2)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 + MRANDOM(-25,25) - 4 * COS(SINE / 12)), RAD(MRANDOM(-25,25)), RAD(0)), 1.5 / Animation_Speed)
RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.35, 0) * ANGLES(RAD(80), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(90), RAD(15), RAD(45)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.35 * COS(SINE / 2), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.35 * COS(SINE / 2), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		for i=0, 0.6, 0.1 / Animation_Speed do
			Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.35 * COS(SINE / 2)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 + MRANDOM(-25,25) - 4 * COS(SINE / 12)), RAD(MRANDOM(-25,25)), RAD(0)), 1.5 / Animation_Speed)
RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.35, 0) * ANGLES(RAD(90), RAD(34), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(90), RAD(25), RAD(45)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.35 * COS(SINE / 2), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.35 * COS(SINE / 2), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		for i=0, 0.6, 0.1 / Animation_Speed do
			Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.35 * COS(SINE / 2)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 + MRANDOM(-25,25) - 4 * COS(SINE / 12)), RAD(MRANDOM(-25,25)), RAD(0)), 1.5 / Animation_Speed)
RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.35, 0) * ANGLES(RAD(80), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(90), RAD(15), RAD(45)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.35 * COS(SINE / 2), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.35 * COS(SINE / 2), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
	ATTACK = false
	Rooted = false
end

function TakeOnMe()
	Speed = 16
	local MEME = CreateSound(1171341451, Effects, 2, 1, false)
	ATTACK = true
	Rooted = false
	local DANCE = true
	local KEY = Mouse.KeyDown:connect(function(NEWKEY)
		if NEWKEY == "p" then
			DANCE = false
		end
	end)
	PLAYSONG = false
	while true do
		for i = 1, 15 do
			Swait()
			MEME.Parent = Effects
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		if DANCE == false then
			break
		end
		for i = 1, 15 do
			Swait()
			MEME.Parent = Effects
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(25 + MRANDOM(-5,5) - 4 * COS(SINE / 12)), RAD(MRANDOM(-5,5)), RAD(15)), 1 / Animation_Speed)
			if MRANDOM(1,7) == 1 then
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 + MRANDOM(-25,25) - 4 * COS(SINE / 12)), RAD(MRANDOM(-25,25)), RAD(0)), 1.5 / Animation_Speed)
			end			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.35, 0) * ANGLES(RAD(150), RAD(65), RAD(85)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(150), RAD(65), RAD(85)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
	end
	PLAYSONG = true
	KEY:Disconnect()
	MEME:remove()
	Speed = 25
	ATTACK = false
	Rooted = false
end

function Intro()
	ATTACK = true
	Rooted = true
	local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
	local POSITION = CF(HITPOS)*ANGLES(RAD(0),RAD(0),RAD(0))*CF(0,1,0).p
	BigBlack("themrbenja2's edit",MAINRUINCOLOR.Color,3)
	for i=0, 6, 0.1 / Animation_Speed do
		Swait()
			WACKYEFFECT({TIME = 15, EffectType = "Block", Size = VT(3,3,3)/3, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = RightLeg.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
			WACKYEFFECT({TIME = 15, EffectType = "Block", Size = VT(3,3,3)/3, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = LeftLeg.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
			rwing1weld.C1 = Clerp(rwing1weld.C1, CF(-2.5, -1, 0) * ANGLES(RAD(0), RAD(0 + 0.75 * SIN(SINE / 15) - 1.75 * COS(SINE / 15)), RAD(-1 - 8 * SIN(SINE / 15))), 3 / Animation_Speed)
			rwing2weld.C1 = Clerp(rwing2weld.C1, CF(-4, -1.25, 0) * ANGLES(RAD(0), RAD(0 + 1 * SIN(SINE / 15) - 2 * COS(SINE / 15)), RAD(-5  - 6 * SIN(SINE / 15))), 3 / Animation_Speed)
			rwing3weld.C1 = Clerp(rwing3weld.C1, CF(-5.5, -1.5, 0) * ANGLES(RAD(0), RAD(0 + 1.25 * SIN(SINE / 15) - 2.25 * COS(SINE / 15)), RAD(-10 - 4 * SIN(SINE / 15))), 3 / Animation_Speed)
			lwing1weld.C1 = Clerp(lwing1weld.C1, CF(2.5, -1, 0) * ANGLES(RAD(0), RAD(0 - 0.75 * SIN(SINE / 15) + 1.75 * COS(SINE / 15)), RAD(-1 + 8 * SIN(SINE / 15))), 3 / Animation_Speed)
			lwing2weld.C1 = Clerp(lwing2weld.C1, CF(4, -1.25, 0) * ANGLES(RAD(0), RAD(0 - 1 * SIN(SINE / 15) + 2 * COS(SINE / 15)), RAD(5 + 6 * SIN(SINE / 15))), 3 / Animation_Speed)
			lwing3weld.C1 = Clerp(lwing3weld.C1, CF(5.5, -1.5, 0) * ANGLES(RAD(0), RAD(0 - 1.25 * SIN(SINE / 15) + 2.25 * COS(SINE / 15)), RAD(10 + 4 * SIN(SINE / 15))), 3 / Animation_Speed)
			handleweld.C1 = Clerp(handleweld.C1, CF(0, -1, -1.5) * ANGLES(RAD(0), RAD(0), RAD(0)), 3 / Animation_Speed)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 5 + 0.05 * COS(SINE / 30)) * ANGLES(RAD(15), RAD(0), RAD(0)), 0.1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(35 - 2.5 * SIN(SINE / 30)), RAD(0), RAD(0)), 0.1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 - 0.1 * COS(SINE / 30), -0.5) * ANGLES(RAD(170), RAD(0), RAD(-40)) * RIGHTSHOULDERC0, 0.1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 - 0.1 * COS(SINE / 30), -0.5) * ANGLES(RAD(170), RAD(0), RAD(40)) * LEFTSHOULDERC0, 0.1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.5 - 0.025 * COS(SINE / 30), -0.5) * ANGLES(RAD(15), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.5 - 0.025 * COS(SINE / 30), -0.5) * ANGLES(RAD(15), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.1 / Animation_Speed)				
	end
	WACKYEFFECT({EffectType = "Block", Size = VT(6,6,6), Size2 = VT(15,15,15), Transparency = 0, Transparency2 = 1, CFrame = Torso.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
	WACKYEFFECT({EffectType = "Block", Size = VT(8,8,8), Size2 = VT(17,17,17), Transparency = 0.5, Transparency2 = 1, CFrame = Torso.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
	CreateSound(1208650519, Torso, 2, 0.8)
	CreateSound(333446256, Character, 10, 1)
	BigBlack("hahahahaha...",MAINRUINCOLOR.Color,6)
	for i=0, 17, 0.1 / Animation_Speed do
		Swait()
			WACKYEFFECT({TIME = 15, EffectType = "Block", Size = VT(3,3,3)/3, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = RightLeg.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
			WACKYEFFECT({TIME = 15, EffectType = "Block", Size = VT(3,3,3)/3, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = LeftLeg.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
			rwing1weld.C1 = Clerp(rwing1weld.C1, CF(-2.5, -1, 0) * ANGLES(RAD(0), RAD(0 + 0.75 * SIN(SINE / 15) - 1.75 * COS(SINE / 15)), RAD(-1 - 8 * SIN(SINE / 15))), 3 / Animation_Speed)
			rwing2weld.C1 = Clerp(rwing2weld.C1, CF(-4, -1.25, 0) * ANGLES(RAD(0), RAD(0 + 1 * SIN(SINE / 15) - 2 * COS(SINE / 15)), RAD(-5  - 6 * SIN(SINE / 15))), 3 / Animation_Speed)
			rwing3weld.C1 = Clerp(rwing3weld.C1, CF(-5.5, -1.5, 0) * ANGLES(RAD(0), RAD(0 + 1.25 * SIN(SINE / 15) - 2.25 * COS(SINE / 15)), RAD(-10 - 4 * SIN(SINE / 15))), 3 / Animation_Speed)
			lwing1weld.C1 = Clerp(lwing1weld.C1, CF(2.5, -1, 0) * ANGLES(RAD(0), RAD(0 - 0.75 * SIN(SINE / 15) + 1.75 * COS(SINE / 15)), RAD(-1 + 8 * SIN(SINE / 15))), 3 / Animation_Speed)
			lwing2weld.C1 = Clerp(lwing2weld.C1, CF(4, -1.25, 0) * ANGLES(RAD(0), RAD(0 - 1 * SIN(SINE / 15) + 2 * COS(SINE / 15)), RAD(5 + 6 * SIN(SINE / 15))), 3 / Animation_Speed)
			lwing3weld.C1 = Clerp(lwing3weld.C1, CF(5.5, -1.5, 0) * ANGLES(RAD(0), RAD(0 - 1.25 * SIN(SINE / 15) + 2.25 * COS(SINE / 15)), RAD(10 + 4 * SIN(SINE / 15))), 3 / Animation_Speed)
			handleweld.C1 = Clerp(handleweld.C1, CF(0, -1, -1.5) * ANGLES(RAD(0), RAD(0), RAD(0)), 3 / Animation_Speed)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 4 + 0.05 * COS(SINE / 30)) * ANGLES(RAD(15), RAD(0), RAD(0)), 0.1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(35 - 2.5 * SIN(SINE / 30)), RAD(0), RAD(0)), 0.1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 - 0.1 * COS(SINE / 30), -0.5) * ANGLES(RAD(170), RAD(0), RAD(-40)) * RIGHTSHOULDERC0, 0.1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 - 0.1 * COS(SINE / 30), -0.5) * ANGLES(RAD(170), RAD(0), RAD(40)) * LEFTSHOULDERC0, 0.1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.5 - 0.025 * COS(SINE / 30), -0.5) * ANGLES(RAD(15), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.5 - 0.025 * COS(SINE / 30), -0.5) * ANGLES(RAD(15), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.1 / Animation_Speed)				
	end
    WACKYEFFECT({Time = 50 ,EffectType = "Sphere", Size = VT(0,0,0), Size2 = VT(75,75,75), Transparency = 0, Transparency2 = 1, CFrame = CF(RootPart.CFrame.p), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})	
    WACKYEFFECT({Time = 150 ,EffectType = "Block", Size = VT(0,0,0), Size2 = VT(90,90,90), Transparency = 0, Transparency2 = 1, CFrame = CF(RootPart.CFrame.p), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 50 ,EffectType = "Box", Size = VT(0,0,0), Size2 = VT(5,150,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
    WACKYEFFECT({Time = 75 ,EffectType = "Crystal", Size = VT(0,0,0), Size2 = VT(5,100,5), Transparency = 0, Transparency2 = 1, CFrame = CF(POSITION)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	CreateSound(1841058541,Character,3,1,false)
	for i=0, 0.7, 0.1 / Animation_Speed do
		Swait()
			rwing1weld.C1 = Clerp(rwing1weld.C1, CF(-2.5, -1, 0) * ANGLES(RAD(0), RAD(0 + 0.75 * SIN(SINE / 15) - 1.75 * COS(SINE / 15)), RAD(-1 - 8 * SIN(SINE / 15))), 3 / Animation_Speed)
			rwing2weld.C1 = Clerp(rwing2weld.C1, CF(-4, -1.25, 0) * ANGLES(RAD(0), RAD(0 + 1 * SIN(SINE / 15) - 2 * COS(SINE / 15)), RAD(-5  - 6 * SIN(SINE / 15))), 3 / Animation_Speed)
			rwing3weld.C1 = Clerp(rwing3weld.C1, CF(-5.5, -1.5, 0) * ANGLES(RAD(0), RAD(0 + 1.25 * SIN(SINE / 15) - 2.25 * COS(SINE / 15)), RAD(-10 - 4 * SIN(SINE / 15))), 3 / Animation_Speed)
			lwing1weld.C1 = Clerp(lwing1weld.C1, CF(2.5, -1, 0) * ANGLES(RAD(0), RAD(0 - 0.75 * SIN(SINE / 15) + 1.75 * COS(SINE / 15)), RAD(-1 + 8 * SIN(SINE / 15))), 3 / Animation_Speed)
			lwing2weld.C1 = Clerp(lwing2weld.C1, CF(4, -1.25, 0) * ANGLES(RAD(0), RAD(0 - 1 * SIN(SINE / 15) + 2 * COS(SINE / 15)), RAD(5 + 6 * SIN(SINE / 15))), 3 / Animation_Speed)
			lwing3weld.C1 = Clerp(lwing3weld.C1, CF(5.5, -1.5, 0) * ANGLES(RAD(0), RAD(0 - 1.25 * SIN(SINE / 15) + 2.25 * COS(SINE / 15)), RAD(10 + 4 * SIN(SINE / 15))), 3 / Animation_Speed)
			handleweld.C1 = Clerp(handleweld.C1, CF(0, -1, -1.5) * ANGLES(RAD(0), RAD(0), RAD(0)), 3 / Animation_Speed)
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0 * Player_Size, 0 * Player_Size, -1 * Player_Size) * ANGLES(RAD(45), RAD(0), RAD(0)), 0.2 / Animation_Speed*3)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0 * Player_Size, 0 * Player_Size, 0 + ((1 * Player_Size) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 1 * Player_Size, -1.4 * Player_Size) * ANGLES(RAD(30), RAD(-690), RAD(2 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 24))) * RIGHTSHOULDERC0, 0.15 / Animation_Speed*5)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(90), RAD(25), RAD(45)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1 * Player_Size, -0.3 * Player_Size, -1 * Player_Size) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-20)), 0.2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.2, 0.2 - 0.1 * COS(SINE / 24), -0.4 - 0.1 * COS(SINE / 24)) * ANGLES(RAD(45), RAD(-70), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(10)), 0.2 / Animation_Speed)				
	end
	Head.Color = C3(0/255,0/255,255/255)
	Torso.Color = C3(0/255,0/255,255/255)
	LeftArm.Color = C3(0/255,0/255,255/255)
	LeftLeg.Color = C3(0/255,0/255,255/255)
	RightArm.Color = C3(0/255,0/255,255/255)
	RightLeg.Color = C3(0/255,0/255,255/255)
	EXE.ShirtTemplate = "rbxassetid://692429048"
	LOL.PantsTemplate = "rbxassetid://692430604"
	Gun.Parent = Character
	tecks2.TextTransparency = 0
	for i = 1, 100 do
		Swait()
		for _, c in pairs(Character:GetChildren()) do
			if c.ClassName == "Part" and c.Name ~= "HumanoidRootPart" then
				c.Transparency = 0
			end
		end
		for _, c in pairs(Weapon:GetChildren()) do
			if c.ClassName == "Part" and c.Name ~= "HumanoidRootPart" then
				c.Transparency = 0
			end
		end
	end
	TRANSFORMED = true
	ATTACK = false
	Rooted = false
end

function Shot()
	ATTACK = true
	Rooted = false
	for i=0, 0.2, 0.05 / Animation_Speed do
		Swait()
		turnto(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(90)), 0.5 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-90)), 0.5 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.6, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
	end
	repeat
		for i=0, 0.2, 0.05 / Animation_Speed do
			Swait()
			turnto(Mouse.Hit.p)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(90)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-90)), 0.5 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.6, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		end
		local HIT,POS = CastProperRay(Hole.Position, Mouse.Hit.p, 1000, Character)
		SpawnTrail(Hole.Position,POS)
		if HIT ~= nil then
			if HIT.Parent ~= workspace and HIT.Parent.ClassName ~= "Folder" then
				Banish(HIT.Parent)
			end
		end
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = Hole.CFrame*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 136523485, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = CF(POS,Hole.Position) * ANGLES(RAD(-90), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = CF(POS,Hole.Position) * ANGLES(RAD(-90), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
	Humanoid.CameraOffset = VT(MRANDOM(-5,5)/2.5,MRANDOM(-5,5)/2.5,MRANDOM(-5,5)/2.5)/30
		for i=0, 0.2, 0.05 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(90)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-90)), 0.25 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(15), RAD(90)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.6, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		end
	until KEYHOLD == false
	ATTACK = false
	Rooted = false
end

function Shot2()
	ATTACK = true
	Rooted = false
	for i=0, 0.2, 0.05 / Animation_Speed do
		Swait()
		turnto(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(90)), 0.5 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-90)), 0.5 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.6, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
	end
	repeat
		for i=0, 0.2, 0.05 / Animation_Speed do
			Swait()
			turnto(Mouse.Hit.p)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(90)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-90)), 0.5 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.6, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		end
		local HIT,POS = CastProperRay(Hole.Position, Mouse.Hit.p, 1000, Character)
		SpawnTrail(Hole.Position,POS)
		if HIT ~= nil then
			if HIT.Parent ~= workspace and HIT.Parent.ClassName ~= "Folder" then
				Kill(HIT.Parent)
			end
		end
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = Hole.CFrame*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 136523485, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = CF(POS,Hole.Position) * ANGLES(RAD(-90), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = CF(POS,Hole.Position) * ANGLES(RAD(-90), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
	Humanoid.CameraOffset = VT(MRANDOM(-5,5)/2.5,MRANDOM(-5,5)/2.5,MRANDOM(-5,5)/2.5)/30
		for i=0, 0.2, 0.05 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(90)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-90)), 0.25 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(15), RAD(90)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.6, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		end
	until KEYHOLD == false
	ATTACK = false
	Rooted = false
end

function AttackTemplate()
	ATTACK = true
	Rooted = false
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(90)), 0.5 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-90)), 0.5 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(90), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.6, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
	end
	ATTACK = false
	Rooted = false
end

function Finisher()
	local TARGET = Mouse.Target
	if TARGET ~= nil then
		if TARGET.Parent:FindFirstChildOfClass("Humanoid") then
			local HUM = TARGET.Parent:FindFirstChildOfClass("Humanoid")
			local ROOT = TARGET.Parent:FindFirstChild("HumanoidRootPart") or TARGET.Parent:FindFirstChild("Torso") or TARGET.Parent:FindFirstChild("UpperTorso")
			if ROOT and HUM.Health > 0 then
				local FOE = Mouse.Target.Parent
				ATTACK = true
				Rooted = true
				RootPart.CFrame = ROOT.CFrame*CF(-1.35,0,4)
				ROOT.Anchored = true
				CreateSound(670796769, Torso, 9999, 0.6, false)
				CreateSound(159882598, Torso, 5, 0.9, false)
				for i=0, 0.4, 0.1 / Animation_Speed do
					Swait()
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(80), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				end
				HUM.PlatformStand = true
				ROOT.CFrame = ROOT.CFrame * CF(0,-2*ROOT.Size.Z,0) * ANGLES(RAD(-90), RAD(0), RAD(0))
				coroutine.resume(coroutine.create(function()
					Swait()
					ROOT.Anchored = true
				end))
				RootPart.CFrame = RootPart.CFrame*CF(0,0,-0.6)
				for i=0, 0.2, 0.1 / Animation_Speed do
					Swait()
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(45)), 1 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-45)), 1 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, -0.5) * ANGLES(RAD(90), RAD(0), RAD(45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(0), RAD(-50), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1 / Animation_Speed)
				end
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = Hole.CFrame*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 136523485, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
				for i=0, 0.2, 0.1 / Animation_Speed do
					Swait()
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(15)), 1 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-15)), 1 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.01) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				end
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = Hole.CFrame*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 136523485, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
				local AMMO = 6
				local FIRING = true
				local SHOOTING = false
				local TIMER = 70
				CreateSound(147722227, GunPoint, 6, 1.3, false)
				for i=0, 0.2, 0.1 / Animation_Speed do
					Swait()
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(45)), 1 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-45)), 1 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(30), RAD(0), RAD(45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(0), RAD(-65), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1 / Animation_Speed)
				end
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = Hole.CFrame*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 136523485, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
				for i = 1, 6 do
					local GUNPOS = Hole.CFrame*CF(0, 0, 0).p
					local DISTANCE = (FOE.Head.Position - GUNPOS).Magnitude
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = Hole.CFrame*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 136523485, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
					HUM.Health = HUM.Health/1.5
					for i=0, 0.2, 0.1 / Animation_Speed do
						Swait()
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(45)), 1 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-45)), 1 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(70), RAD(0), RAD(45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(0), RAD(-65), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1 / Animation_Speed)
				end
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = Hole.CFrame*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 136523485, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
					for i=0, 0.2, 0.1 / Animation_Speed do
						Swait()
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(45)), 1 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-45)), 1 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(30), RAD(0), RAD(45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(0), RAD(-65), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1 / Animation_Speed)
					end
				end
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = Hole.CFrame*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(0/255,0/255,255/255), SoundID = 136523485, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
				ApplyDamage(HUM,0,true)
				FOE:BreakJoints()
				ROOT.Anchored = false
				for i=0, 0.3, 0.1 / Animation_Speed do
					Swait()
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(25), RAD(0), RAD(15)), 1 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.525, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(5)) * LEFTSHOULDERC0, 1 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				end
				ATTACK = false
				Rooted = false
			end
		end
	end
end

--//=================================\\
--||	  ASSIGN THINGS TO KEYS
--\\=================================//

function MouseDown(Mouse)
	if ATTACK == false then
	end
end

function MouseUp(Mouse)
HOLD = false
end

function KeyDown(Key)
	KEYHOLD = true
	if Key == "z" and ATTACK == false then
		Shot()
	end

	if Key == "v" and ATTACK == false then
		Shot2()
	end

	if Key == "x" and ATTACK == false then
                Finisher()
	end

	if Key == "t" and ATTACK == false then
               Taunt()
	end

	if Key == "c" and ATTACK == false then
                eh()
	end
end

local OVMID = 561833161
local OVMPIT = 1
local OVMVOL = 1
plr.Chatted:connect(function(message)
if ATTACK == false then
if message:sub(1,5) == "play/" then
OVMID = message:sub(6)
newThemeCust("rbxassetid://"..OVMID,0,OVMPIT,OVMVOL)
elseif message:sub(1,6) == "pitch/" then
OVMPIT = message:sub(7)
newTheme("rbxassetid://"..OVMID,0,OVMPIT,OVMVOL)
elseif message:sub(1,4) == "vol/" then
OVMVOL = message:sub(5)
newTheme("rbxassetid://"..OVMID,0,OVMPIT,OVMVOL)
elseif message:sub(1,7) == "sr/" then
chatfunc("Skipped to "..message:sub(8).." out of "..math.floor(kan.TimeLength).." seconds.",MAINRUINCOLOR.Color,"Inverted","Arcade",1)
newThemeCust("rbxassetid://"..OVMID,message:sub(8),OVMPIT,OVMVOL)
elseif message:sub(1,9) == "te/" then
chatfunc("Current time pos: "..math.floor(kan.TimePosition).." out of "..math.floor(kan.TimeLength).." seconds.",MAINRUINCOLOR.Color,"Inverted","Arcade",1)
end
end
end)

function KeyUp(Key)
	KEYHOLD = false
end

	Mouse.Button1Down:connect(function(NEWKEY)
		MouseDown(NEWKEY)
	end)
	Mouse.Button1Up:connect(function(NEWKEY)
		MouseUp(NEWKEY)
	end)
	Mouse.KeyDown:connect(function(NEWKEY)
		KeyDown(NEWKEY)
	end)
	Mouse.KeyUp:connect(function(NEWKEY)
		KeyUp(NEWKEY)
	end)

--//=================================\\
--\\=================================//


function unanchor()
	if UNANCHOR == true then
		g = Character:GetChildren()
		for i = 1, #g do
			if g[i].ClassName == "Part" then
				g[i].Anchored = false
			end
		end
	end
end


--//=================================\\
--||	WRAP THE WHOLE SCRIPT UP
--\\=================================//

Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and (Disable_Jump == true) then
		Humanoid.Jump = false
	end
end)

local FF = IT("ForceField",Character)
FF.Visible = false
INSTANT = false
Speed = 20

while true do
	Swait()
	SINE = SINE + CHANGE
		ANIMATE.Parent = nil
		local IDLEANIMATION = Humanoid:LoadAnimation(ROBLOXIDLEANIMATION)
		IDLEANIMATION:Play()
		if TRANSFORMED == true then
			tecks2.TextTransparency = 0
			for _, c in pairs(Character:GetChildren()) do
				if c.ClassName == "Part" and c.Name ~= "HumanoidRootPart" then
					c.Anchored = false
					c.Transparency = 0
				end
			end
			for _, c in pairs(Weapon:GetChildren()) do
				if c.ClassName == "Part" then
					c.Transparency = 0
				end
			end
			local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
			local TORSOVERTICALVELOCITY = RootPart.Velocity.y
			local LV = Torso.CFrame:pointToObjectSpace(Torso.Velocity - Torso.Position)
			local HITFLOOR = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4 * Player_Size, Character)
			local WALKSPEEDVALUE = 6 / (Humanoid.WalkSpeed / 16)
			rwing1weld.C1 = Clerp(rwing1weld.C1, CF(-2.5, -1, 0) * ANGLES(RAD(0), RAD(0 + 0.75 * SIN(SINE / 15) - 1.75 * COS(SINE / 15)), RAD(-1 - 8 * SIN(SINE / 15))), 3 / Animation_Speed)
			rwing2weld.C1 = Clerp(rwing2weld.C1, CF(-4, -1.25, 0) * ANGLES(RAD(0), RAD(0 + 1 * SIN(SINE / 15) - 2 * COS(SINE / 15)), RAD(-5  - 6 * SIN(SINE / 15))), 3 / Animation_Speed)
			rwing3weld.C1 = Clerp(rwing3weld.C1, CF(-5.5, -1.5, 0) * ANGLES(RAD(0), RAD(0 + 1.25 * SIN(SINE / 15) - 2.25 * COS(SINE / 15)), RAD(-10 - 4 * SIN(SINE / 15))), 3 / Animation_Speed)
			lwing1weld.C1 = Clerp(lwing1weld.C1, CF(2.5, -1, 0) * ANGLES(RAD(0), RAD(0 - 0.75 * SIN(SINE / 15) + 1.75 * COS(SINE / 15)), RAD(-1 + 8 * SIN(SINE / 15))), 3 / Animation_Speed)
			lwing2weld.C1 = Clerp(lwing2weld.C1, CF(4, -1.25, 0) * ANGLES(RAD(0), RAD(0 - 1 * SIN(SINE / 15) + 2 * COS(SINE / 15)), RAD(5 + 6 * SIN(SINE / 15))), 3 / Animation_Speed)
			lwing3weld.C1 = Clerp(lwing3weld.C1, CF(5.5, -1.5, 0) * ANGLES(RAD(0), RAD(0 - 1.25 * SIN(SINE / 15) + 2.25 * COS(SINE / 15)), RAD(10 + 4 * SIN(SINE / 15))), 3 / Animation_Speed)
			handleweld.C1 = Clerp(handleweld.C1, CF(0, -1, -1.5) * ANGLES(RAD(0), RAD(0), RAD(0)), 3 / Animation_Speed)
			if ATTACK == false and VALUE2 == false then
                            end
			if ANIM == "Walk" and TORSOVELOCITY > 1 then
				RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, -0.15 * COS(SINE / (WALKSPEEDVALUE / 2)) * Player_Size) * ANGLES(RAD(0), RAD(0) - RootPart.RotVelocity.Y / 75, RAD(0)), 2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
				Neck.C1 = Clerp(Neck.C1, CF(0 * Player_Size, -0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(2.5 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0) - Head.RotVelocity.Y / 30), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
				RightHip.C1 = Clerp(RightHip.C1, CF(0.5 * Player_Size, 0.875 * Player_Size - 0.125 * SIN(SINE / WALKSPEEDVALUE) * Player_Size, -0.125 * COS(SINE / WALKSPEEDVALUE) * Player_Size) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0) - RightLeg.RotVelocity.Y / 75, RAD(0), RAD(76 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
				LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5 * Player_Size, 0.875 * Player_Size + 0.125 * SIN(SINE / WALKSPEEDVALUE) * Player_Size, 0.125 * COS(SINE / WALKSPEEDVALUE) * Player_Size) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0) + LeftLeg.RotVelocity.Y / 75, RAD(0), RAD(76 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
			elseif (ANIM ~= "Walk") or (TORSOVELOCITY < 1) then
				RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
				Neck.C1 = Clerp(Neck.C1, CF(0 * Player_Size, -0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
				RightHip.C1 = Clerp(RightHip.C1, CF(0.5 * Player_Size, 1 * Player_Size, 0 * Player_Size) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
				LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5 * Player_Size, 1 * Player_Size, 0 * Player_Size) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			end
			if TORSOVERTICALVELOCITY > 1 and HITFLOOR == nil then
				ANIM = "Jump"
				if ATTACK == false then
					RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 * Player_Size, 0 + ((1) - 1)) * ANGLES(RAD(-20), RAD(0), RAD(0)), 0.2 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-40), RAD(0), RAD(20)) * RIGHTSHOULDERC0, 0.2 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-40), RAD(0), RAD(-20)) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.3) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-20)), 0.2 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.3) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(20)), 0.2 / Animation_Speed)
			       end
			elseif TORSOVERTICALVELOCITY < -1 and HITFLOOR == nil then
				ANIM = "Fall"
				if ATTACK == false then
					RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 ) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(20), RAD(0), RAD(0)), 0.2 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(60)) * RIGHTSHOULDERC0, 0.2 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-60)) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(20)), 0.2 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(10)), 0.2 / Animation_Speed)
				end
			elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
				ANIM = "Idle"
				if ATTACK == false then
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(25 + MRANDOM(-5,5) - 4 * COS(SINE / 12)), RAD(MRANDOM(-5,5)), RAD(15)), 1 / Animation_Speed)
			if MRANDOM(1,7) == 1 then
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 + MRANDOM(-25,25) - 4 * COS(SINE / 12)), RAD(MRANDOM(-25,25)), RAD(0)), 1.5 / Animation_Speed)
			end		
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.25 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(180), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(45), RAD(0)) * RIGHTSHOULDERC0, 0.25 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.6, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.25 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.25 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.25 / Animation_Speed)
				end
			elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
				ANIM = "Walk"
				if ATTACK == false then
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.1) * ANGLES(RAD(5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(25 + MRANDOM(-5,5) - 4 * COS(SINE / 12)), RAD(MRANDOM(-5,5)), RAD(15)), 1 / Animation_Speed)
			if MRANDOM(1,7) == 1 then
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 + MRANDOM(-25,25) - 4 * COS(SINE / 12)), RAD(MRANDOM(-25,25)), RAD(0)), 1.5 / Animation_Speed)
			end
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.35, 0) * ANGLES(RAD(0), RAD(180), RAD(180)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-60 * COS(SINE / WALKSPEEDVALUE)), RAD(0), RAD(-5)) * LEFTSHOULDERC0, 0.35 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1 - 0.15 * COS(SINE / WALKSPEEDVALUE*2), -0.2+ 0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-15)), 2 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.15 * COS(SINE / WALKSPEEDVALUE*2), -0.2+ -0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(15)), 2 / Animation_Speed)
				end
			end
		end
	--end
	Humanoid.DisplayDistanceType = "None"
	unanchor()
	Humanoid.MaxHealth = "inf"
	Humanoid.Health = "inf"
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
	if Head:FindFirstChild("face") then
		Head.face.Texture = "rbxassetid://403870689"
	end
	for _, c in pairs(Character:GetChildren()) do
		if (c.ClassName == "Shirt" or c.ClassName == "Pants") and c.Name ~= "Cloth" then
			c:remove()
		end
			if c:FindFirstChildOfClass("ParticleEmitter") then
				c:FindFirstChildOfClass("ParticleEmitter"):remove()
			end
	end
	local MATHS = {"0","1"}
	Humanoid.Name = MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]..MATHS[MRANDOM(1,#MATHS)]
	Humanoid.PlatformStand = false
	if INTRO == false and INSTANT == false then
		INTRO = true
		coroutine.resume(coroutine.create(function()
			sick:Play()
			Intro()
		end))
	end
	if INSTANT == true then
		if TRANSFORMED == false then
			sick.TimePosition = 60
			sick:Play()
		end
		TRANSFORMED = true
	end
	script.Parent = PlayerGui
	Character.Parent = workspace
	Humanoid.Parent = Character
end
--//=================================\\
--\\=================================//





--//====================================================\\--
--||			  		 END OF SCRIPT
--\\====================================================//--