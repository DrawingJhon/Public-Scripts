--[[

   _____________________________
 //						    	\
||  ? Undertale Sans Script?   > (Â´???`)
 \\_____________________________/
  also by v4mp
  before this, there was no facial expressions, faces, or animations.
  It was just sans attacks with your normal avatar
  there also was no teleport
  Chatfunc by v4mp
  v4mp truly is the greatest
  v4mp13r2On1c
  Thanks MLG for the healthbar its actually epic and im not good at these things
   ______________________________________________
 //							                     \
||  ?Created by Zalgo_exe/Kunoleo/EXEcution?    > (?///?///?)
 \\______________________________________________/
   Improved by v4mp13r2On1c/CORRUPT V4MP
   _____________________________
 //                             \
||  ?Made for PsychBeamTeam?   >  (???)
 \\_____________________________/

	 		  _________________________________
			 //                          	   \
(?Â´?Â´)?*:???	<  	This is the local script verz~  |
			 \\________________________________/

------------------------------------------------------------------------------------------------------------------



~-[Move List for Sans]-~

~[Left Mouse Click] - Telekinesis, drags your target to the position of your mouse.

~[F] - Sends 3-5 bones toward the direction of your mouse.

~[R] - Shoots 1 bone projectile to the position of your mouse.

~[C] - Summons a cluster of bones on the position of your mouse.

~[Q] - Summons 1 Gaster Blaster and aims towards the position of your mouse.

~[G] - Summons a group of Gaster Blasters ranging from 2, 4, and 8 to the position of your mouse.

~[V] - Summons a group of Gaster Blasters in a set pattern, much similar to the first attack Sans does in the game.
-}][]{{]]



script.Parent = owner.Character
local Model1ll1ll1l = Instance.new("Model")
do
	local Color1 = Instance.new("Color3Value", Model1ll1ll1l)
	Color1.Name = "Color1"
	local Color2 = Instance.new("Color3Value", Model1ll1ll1l)
	Color2.Name = "Color2"
	local Ghghghghgh = Instance.new("NumberValue", Model1ll1ll1l)
	Ghghghghgh.Name = "Ghghghghgh"
	local Mode = Instance.new("NumberValue", Model1ll1ll1l)
	Mode.Name = "Mode"
	local ModeName = Instance.new("StringValue", Model1ll1ll1l)
	ModeName.Name = "ModeName"
	local Music = Instance.new("ObjectValue", Model1ll1ll1l)
	Music.Name = "Music"
	local Text = Instance.new("StringValue", Model1ll1ll1l)
	Text.Name = "Text"
	local NewDialog = Instance.new("ScreenGui", Model1ll1ll1l) -- Start ScreenGui
	NewDialog.Name = "NewDialog"
	NewDialog.Enabled = false
	local H = Instance.new("Frame", NewDialog)
	H.Name = "H"
	H.Active = false
	H.AnchorPoint = Vector2.new(0, 0.5)
	H.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	H.BackgroundTransparency = 1
	H.BorderColor3 = Color3.fromRGB(27, 42, 53)
	H.BorderSizePixel = 0
	H.Position = UDim2.new(0, 0, 0.892, 0)
	H.Size = UDim2.new(1, 0, 0.216, 0)
	H.ZIndex = 66
	local H1 = Instance.new("Frame", H)
	H1.Name = "H1"
	H1.Active = false
	H1.AnchorPoint = Vector2.new(0.5, 0.5)
	H1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	H1.BackgroundTransparency = 0.3
	H1.BorderColor3 = Color3.fromRGB(170, 0, 0)
	H1.BorderSizePixel = 5
	H1.Position = UDim2.new(0.02, 0, -0.2, 0)
	H1.Rotation = 45
	H1.Size = UDim2.new(0, 150, 0, 150)
	H1.Visible = false
	H1.ZIndex = 4
	local H12 = Instance.new("Frame", H)
	H12.Name = "H12"
	H12.Active = false
	H12.AnchorPoint = Vector2.new(0.5, 0.5)
	H12.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	H12.BackgroundTransparency = 0.4
	H12.BorderColor3 = Color3.fromRGB(170, 0, 0)
	H12.BorderSizePixel = 5
	H12.Position = UDim2.new(0.1, 0, -0.14, 0)
	H12.Rotation = 70
	H12.Size = UDim2.new(0, 100, 0, 100)
	H12.Visible = false
	H12.ZIndex = 3
	local H13 = Instance.new("Frame", H)
	H13.Name = "H13"
	H13.Active = false
	H13.AnchorPoint = Vector2.new(0.5, 0.5)
	H13.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	H13.BackgroundTransparency = 0.4
	H13.BorderColor3 = Color3.fromRGB(170, 0, 0)
	H13.BorderSizePixel = 5
	H13.Position = UDim2.new(0.18, 0, -0.07, 0)
	H13.Rotation = 105
	H13.Size = UDim2.new(0, 75, 0, 75)
	H13.Visible = false
	H13.ZIndex = 2
	local H14 = Instance.new("Frame", H)
	H14.Name = "H14"
	H14.Active = false
	H14.AnchorPoint = Vector2.new(0.5, 0.5)
	H14.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	H14.BackgroundTransparency = 0.4
	H14.BorderColor3 = Color3.fromRGB(170, 0, 0)
	H14.BorderSizePixel = 5
	H14.Position = UDim2.new(0.246, 0, -0.048, 0)
	H14.Rotation = 120
	H14.Size = UDim2.new(0, 50, 0, 50)
	H14.Visible = false
	H14.ZIndex = 1
	local PULSE = Instance.new("Frame", H)
	PULSE.Name = "PULSE"
	PULSE.Active = false
	PULSE.AnchorPoint = Vector2.new(0, 0.5)
	PULSE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PULSE.BackgroundTransparency = 0
	PULSE.BorderColor3 = Color3.fromRGB(27, 42, 53)
	PULSE.BorderSizePixel = 0
	PULSE.Position = UDim2.new(0.075, 0, 0.5, 0)
	PULSE.Size = UDim2.new(0.85, 0, 1, 0)
	PULSE.Visible = true
	PULSE.ZIndex = 63
	local character = Instance.new("ImageLabel", H)
	character.Name = "character"
	character.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	character.BackgroundTransparency = 1
	character.BorderColor3 = Color3.fromRGB(27, 42, 53)
	character.BorderSizePixel = 0
	character.LayoutOrder = 2
	character.Position = UDim2.new(0, 5, 0, 0)
	character.Size = UDim2.new(0, 107, 0, 107)
	character.Visible = true
	character.ZIndex = 1
	character.Image = "rbxassetid://4526172761"
	character.ImageColor3 = Color3.fromRGB(203, 203, 203)
	character.TileSize = UDim2.new(1, 0, 1, 0)
	local h = Instance.new("TextLabel", H)
	h.Name = "H"
	h.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	h.BorderColor3 = Color3.fromRGB(27, 42, 53)
	h.BorderSizePixel = 0
	h.Position = UDim2.new(0.08, 0, 0.05, 0)
	h.Size = UDim2.new(0.838, 0, 0.9, 0)
	h.Visible = true
	h.ZIndex = 69
	h.Font = Enum.Font.Arcade
	h.LineHeight = 1
	h.Text = "* You feel like you're going to have a bad time"
	h.TextColor3 = Color3.fromRGB(255, 255, 255)
	h.TextScaled = true
	h.TextSize = 14
	h.TextStrokeColor3 = Color3.fromRGB(170, 0, 0)
	h.TextStrokeTransparency = 1
	h.TextWrapped = true
	h.TextXAlignment = "Left"
	h.TextYAlignment = "Top"
	local HealthBar = Instance.new("BillboardGui", script)
	HealthBar.AlwaysOnTop = true
	HealthBar.Name = "HealthBar"
	HealthBar.DistanceUpperLimit = -1
	HealthBar.ExtentsOffset = Vector3.new(0, 2, 0)
	HealthBar.MaxDistance = 300
	HealthBar.Size = UDim2.new(4, 0, 2, 0)
	local Frame = Instance.new("Frame", HealthBar)
	Frame.Name = "Frame"
	Frame.Active = false
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1
	Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame.BorderSizePixel = 1
	Frame.Size = UDim2.new(1, 0, 1, 0)
	Frame.Visible = true
	Frame.ZIndex = 1
	local BackHealth = Instance.new("Frame", Frame)
	BackHealth.Name = "BackHealth"
	BackHealth.Active = false
	BackHealth.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	BackHealth.BackgroundTransparency = 0
	BackHealth.BorderColor3 = Color3.fromRGB(27, 42, 53)
	BackHealth.BorderSizePixel = 1
	BackHealth.Position = UDim2.new(0.23, 0, 0.25, 0)
	BackHealth.Size = UDim2.new(0.45, 0, 0.25, 0)
	BackHealth.Visible = true
	BackHealth.ZIndex = 0
	local Health = Instance.new("Frame", Frame)
	Health.Name = "Health"
	Health.Active = false
	Health.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
	Health.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Health.BorderSizePixel = 1
	Health.Position = UDim2.new(0.23, 0, 0.25, 0)
	Health.Size = UDim2.new(0.45, 0, 0.25, 0)
	Health.Visible = true
	Health.ZIndex = 1
	local HP = Instance.new("TextLabel", Frame)
	HP.Name = "HP"
	HP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HP.BackgroundTransparency = 1
	HP.BorderColor3 = Color3.fromRGB(27, 42, 53)
	HP.BorderSizePixel = 1
	HP.Font = "Arcade"
	HP.FontSize = "Size14"
	HP.Position = UDim2.new(0, 0, 0.2, 0)
	HP.Size = UDim2.new(0.3, 0, 0.3, 0)
	HP.Text = "HP"
	HP.TextScaled = true
	HP.TextWrapped = true
	HP.TextColor3 = Color3.fromRGB(255, 255, 255)
	HP.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	HP.TextStrokeTransparency = 0
	HP.Visible = true
	HP.ZIndex = 1
	local HealthLabel = Instance.new("TextBox", Frame)
	HealthLabel.Name = "HealthLabel"
	HealthLabel.Active = false
	HealthLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HealthLabel.BackgroundTransparency = 1
	HealthLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
	HealthLabel.BorderSizePixel = 1
	HealthLabel.Position = UDim2.new(0.7, 0, 0.2, 0)
	HealthLabel.Size = UDim2.new(0.3, 0, 0.36, 0)
	HealthLabel.Visible = true
	HealthLabel.ZIndex = 1
	HealthLabel.Font = Enum.Font.Arcade
	HealthLabel.LineHeight = 1
	HealthLabel.Text = "placeholder"
	HealthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	HealthLabel.TextScaled = true
	HealthLabel.TextSize = 14
	HealthLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	HealthLabel.TextStrokeTransparency = 0
	HealthLabel.TextWrapped = true
	local PName = Instance.new("TextLabel", Frame)
	PName.Name = "PName"
	PName.Active = false
	PName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PName.BackgroundTransparency = 1
	PName.BorderColor3 = Color3.fromRGB(27, 42, 53)
	PName.BorderSizePixel = 1
	PName.LayoutOrder = 1
	PName.Position = UDim2.new(-0.5, 0, -0.22, 0)
	PName.Selectable = true
	PName.Size = UDim2.new(2, 0, 0.5, 0)
	PName.Visible = true
	PName.ZIndex = 1
	PName.Font = Enum.Font.Arcade
	PName.LineHeight = 1
	PName.Text = "abc"
	PName.TextColor3 = Color3.fromRGB(255, 255, 255)
	PName.TextScaled = true
	PName.TextSize = 5
	PName.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	PName.TextStrokeTransparency = 0
	PName.TextWrapped = true
	PName.TextXAlignment = "Center"
	PName.TextYAlignment = "Bottom"
	local glitchboard = Instance.new("BillboardGui", script)
	glitchboard.Name = "glitchboard"
	glitchboard.AlwaysOnTop = false
	glitchboard.Enabled = false
	glitchboard.ExtentsOffset = Vector3.new(0, 2, 0)
	glitchboard.MaxDistance = 300
	glitchboard.Size = UDim2.new(6, 0, 3, 0)
	local TextLabel1 = Instance.new("TextLabel", glitchboard)
	TextLabel1.Name = "TextLabel"
	TextLabel1.Active = false
	TextLabel1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel1.BorderColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel1.BorderMode = "Middle"
	TextLabel1.BorderSizePixel = 5
	TextLabel1.Size = UDim2.new(1, 0, 1, 0)
	TextLabel1.Visible = true
	TextLabel1.ZIndex = -1
	TextLabel1.Font = Enum.Font.Arcade
	TextLabel1.LineHeight = 1
	TextLabel1.Text = ""
	TextLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel1.TextScaled = true
	TextLabel1.TextSize = 30
	TextLabel1.TextStrokeColor3 = Color3.fromRGB(35, 8, 172)
	TextLabel1.TextStrokeTransparency = 1
	TextLabel1.TextWrapped = true
	local textboard = Instance.new("BillboardGui", script)
	textboard.Name = "textboard"
	textboard.AlwaysOnTop = true
	textboard.Enabled = false
	textboard.ExtentsOffset = Vector3.new(0, 2, 0)
	textboard.MaxDistance = 300
	textboard.Size = UDim2.new(5.8, 0, 2.8, 0)
	local TextLabel2 = Instance.new("TextLabel", textboard)
	TextLabel2.Name = "TextLabel"
	TextLabel2.Active = false
	TextLabel2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel2.BorderColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel2.BorderSizePixel = 3
	TextLabel2.Size = UDim2.new(1, 0, 1, 0)
	TextLabel2.Visible = true
	TextLabel2.ZIndex = 1
	TextLabel2.Font = Enum.Font.Arcade
	TextLabel2.LineHeight = 1
	TextLabel2.Text = "Hey, what do you think you're doing!?"
	TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel2.TextScaled = true
	TextLabel2.TextSize = 30
	TextLabel2.TextStrokeColor3 = Color3.fromRGB(35, 8, 172)
	TextLabel2.TextStrokeTransparency = 1
	TextLabel2.TextWrapped = true
end

------------------------------------------------------
--Start LocalScripts--
------------------------------------------------------

local ls1 = NLS([===[local Player = game:GetService("Players").LocalPlayer

    local Char = Player.Character
    local Event = Char:WaitForChild("UserInput_Event")

    local UIS = game:GetService("UserInputService")

    local input = function(io,a)
        if a then return end
        local io = {KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState}
        Event:FireServer(io)
    end
    UIS.InputBegan:Connect(input)
    UIS.InputEnded:Connect(input)
    local Changed = false
    local Mouse = Player:GetMouse()
    local h,t = Mouse.Hit,Mouse.Target
    while wait(1/30) do
        if h~=Mouse.Hit or t~=Mouse.Target then
            Event:FireServer({isMouse=true,Target=Mouse.Target,Hit=Mouse.Hit})
            h,t=Mouse.Hit,Mouse.Target
        end
    end
]===], script)

ls1.Name = "Do Not Touch"

local ls2 = NLS([===[local PLR = game.Players.LocalPlayer
wait()

repeat
	wait()
until script:FindFirstChild("Undo")
local BOOL = script.Undo
if PLR then
	do
		local TIMER = 15
		local CAM = workspace.CurrentCamera
		local FX = Instance.new("ColorCorrectionEffect", CAM)
		FX.Brightness = 1
		FX.Saturation = -1
		local TIME1 = math.ceil(TIMER / 7)
		for i = 1, TIME1 do
			wait()
			FX.Brightness = FX.Brightness - 1 / TIME1
		end
		BOOL.Changed:Connect(function()
			if BOOL.Value == true then
				for i = 1, TIMER do
					wait()
					FX.Saturation = FX.Saturation + 1 / TIMER
				end
				FX:Remove()
				script:Remove()
			end
		end)
	end
else
	BOOL.Changed:Connect(function()
		script:Remove()
	end)
end
]===], script)

ls2.Name = "Permachrome"

local ls3 = NLS([===[ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")
Frame_Speed = 1 / 60
frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
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

function swait(num)
if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, num do
			ArtificialHB.Event:wait()
		end
	end
end
Create=function(obj)
				local inst = Instance.new(obj)
				return function(props)
					for prop,valu in next, props do
						inst[prop]=valu
					end
					return inst
				end	
			end
Echo = function(id, par, vol, pit, timepos,delays,echodelay,fedb,dryl)
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
end

script:WaitForChild'NewDialog'
local r = 255
local g = 0
local b = 0

coroutine.resume(coroutine.create(function()
while wait() do
	for i = 0, 254/5 do
		swait()
		g = g + 5
	end
	for i = 0, 254/5 do
		swait()
		r = r - 5
	end
	for i = 0, 254/5 do
		swait()
		b = b + 5
	end
	for i = 0, 254/5 do
		swait()
		g = g - 5
	end
	for i = 0, 254/5 do
		swait()
		r = r + 5
	end
	for i = 0, 254/5 do
		swait()
		b = b - 5
	end
end
end))
v=game:service'Players'.localPlayer
function newbosschatfunc(kan,ModeOfGlitch,modet,text,color,color2,watval)
local text = type(text) == "string" and text or ""
coroutine.resume(coroutine.create(function()
if v.PlayerGui:FindFirstChild("NewDialog")~= nil then
v.PlayerGui:FindFirstChild("NewDialog"):destroy()
end
local Bruh=script.NewDialog:Clone()
Bruh.Parent=v.PlayerGui
Bruh.Enabled=true
local Bruh2=Bruh.H
game:GetService("Debris"):AddItem(Bruh,20)
--local scrg = Instance.new("ScreenGui",v.PlayerGui)
Echo("rbxassetid://2254573308", Bruh, 0.5, 1,0,10,0.1,0.25,1)

--V bad code - salvo
coroutine.resume(coroutine.create(function()
while true do
swait()
Bruh2.BackgroundColor3=color
Bruh2.PULSE.BackgroundColor3=Color3.new(255,255,255)
end
end))


Bruh2.H.Text=text


Bruh2:TweenPosition(UDim2.new(0,0,.8,0), "Out", "Quad", .2,true)


local function pul()
Bruh2.PULSE:TweenSize(UDim2.new(1.1,0,1.3,0), "Out", "Quint", 1,true)
Bruh2.PULSE.BackgroundTransparency=0
end

local dah=false
coroutine.resume(coroutine.create(function(aaaa)
	for i = 1,string.len(text),1 do
		swait()
		aaaa.Text = string.sub(text,1,i)
	end
end),Bruh2.H)
coroutine.resume(coroutine.create(function(t1,t2,t3,t4)
local mo1=1
local mo2=10
local mo3=0
repeat
	
local hahahaaa={"Black","Crimson","Maroon","Bright red","Cocoa","Really red"}
Bruh2.PULSE.BackgroundTransparency=Bruh2.PULSE.BackgroundTransparency+.04
mo1=mo1+2
mo2=mo2-2
mo3=mo3+1
if mo1>=10 then
mo1=1
end
if mo2<=1 then
mo2=10
end
if mo3>=69 then
mo3=0
Bruh2.PULSE.Size=UDim2.new(1,0,1,0)
pul()
end

if dah then
Bruh2.Rotation=Bruh2.Rotation-.2
end

swait()
until t1.Parent==nil or t2.Parent==nil or t3.Parent==nil or t4.Parent==nil
end),Bruh2.H1,Bruh2.H12,Bruh2.H13,Bruh2.H14)

pcall(function()
for i=1,watval do
swait()
Bruh2:TweenPosition(UDim2.new(0,0,.8+.02*math.cos((tick()*100) / 61),0), "Out", "Quad", .2,true)
if Bruh.Parent==nil then
break
end
end

if Bruh.Parent~=nil and Bruh2.Parent~=nil then
Bruh2:TweenPosition(UDim2.new(-.1,0,2,0), "In", "Quart", 1.6,true)
dah=true
swait(180)
Bruh:Remove()

end
end)

script:destroy()
end))
end

--(kan,ModeOfGlitch,modet,text,color,color2,watval)
newbosschatfunc(script.Music.Value,script.Mode.Value,script.ModeName.Value,script.Text.Value,script.Color1.Value,script.Color2.Value,script.Ghghghghgh.Value)
]===], script)

ls3.Name = "TalkChat"
for i, v in pairs(Model1ll1ll1l:GetChildren()) do
	v.Parent = ls3
end

------------------------------------------------------
--End LocalScripts--
------------------------------------------------------


local Player = game.Players:GetPlayerFromCharacter(script.Parent)   --<=== Replace With Your Name


local Mouse,mouse,UserInputService,ContextActionService
do
	script.Parent = Player.Character
	local CAS = {Actions={}}
	local Event = Instance.new("RemoteEvent")
	Event.Name = "UserInput_Event"
	Event.Parent = Player.Character
	local fakeEvent = function()
		local t = {_fakeEvent=true}
		t.Connect = function(self,f)self.Function=f end
		t.connect = t.Connect
		return t
	end
    local m = {Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
	local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
	function CAS:BindAction(name,fun,touch,...)
		CAS.Actions[name] = {Name=name,Function=fun,Keys={...}}
	end
	function CAS:UnbindAction(name)
		CAS.Actions[name] = nil
	end
	local function te(self,ev,...)
		local t = m[ev]
		if t and t._fakeEvent and t.Function then
			t.Function(...)
		end
	end
	m.TrigEvent = te
	UIS.TrigEvent = te
	Event.OnServerEvent:Connect(function(plr,io)
	    if plr~=Player then return end
		if io.isMouse then
			m.Target = io.Target
			m.Hit = io.Hit
		elseif io.UserInputType == Enum.UserInputType.MouseButton1 then
	        if io.UserInputState == Enum.UserInputState.Begin then
				m:TrigEvent("Button1Down")
			else
				m:TrigEvent("Button1Up")
			end
		else
			for n,t in pairs(CAS.Actions) do
				for _,k in pairs(t.Keys) do
					if k==io.KeyCode then
						t.Function(t.Name,io.UserInputState,io)
					end
				end
			end
	        if io.UserInputState == Enum.UserInputState.Begin then
	            m:TrigEvent("KeyDown",io.KeyCode.Name:lower())
				UIS:TrigEvent("InputBegan",io,false)
			else
				m:TrigEvent("KeyUp",io.KeyCode.Name:lower())
				UIS:TrigEvent("InputEnded",io,false)
	        end
	    end
	end)
	Mouse,mouse,UserInputService,ContextActionService = m,m,UIS,CAS
	end

--]]
local Player, Character = game.Players:GetPlayerFromCharacter(script.Parent), Player.Character;
local Torso = Character:FindFirstChild("Torso")
local rootPart = Character:FindFirstChild("HumanoidRootPart")
local Humanoid = Character:FindFirstChild("Humanoid")
local Head = Character:FindFirstChild("Head")
local Right_Arm = Character:FindFirstChild("Right Arm")
local Left_Arm = Character:FindFirstChild("Left Arm")
local Right_Leg = Character:FindFirstChild("Right Leg")
local Left_Leg = Character:FindFirstChild("Left Leg")
local Right_Shoulder = Torso:FindFirstChild("Right Shoulder")
local Left_Shoulder = Torso:FindFirstChild("Left Shoulder")
local Right_Hip = Torso:FindFirstChild("Right Hip")
local Left_Hip = Torso:FindFirstChild("Left Hip")
local Neck = Torso:FindFirstChild("Neck")
local rootPart = Character:FindFirstChild("HumanoidRootPart")
local rootJoint = rootPart:FindFirstChild("RootJoint")
local CurrentIdle = "Idling1"
local isAttacking = false
local isSprinting = false
local Animations = false
local Angle = 0
local Axis = 0
local angleSpeed = 1
local axisSpeed = angleSpeed
local currentAnim
shirt = Instance.new("Shirt", Character)
shirt.Name = "Shirt"
pants = Instance.new("Pants", Character)
pants.Name = "Pants"
--Character.Shirt.ShirtTemplate = "rbxassetid://3011516827"--2097021887
Character.Shirt.ShirtTemplate = "rbxassetid://388330836"
Character.Pants.PantsTemplate = "rbxassetid://386822275"
Humanoid.MaxHealth = 100
Humanoid.Health = Humanoid.MaxHealth




sine = 0
change = 1
sprint=false

idly = 0
idle = idly
Sanim = 0.025
--original Sanim value = 0.15
dedebounce = false
attack2 = false
attack = false

sin = math.sin
Right_Leg.FormFactor 		= "Custom";
Left_Leg.FormFactor			= "Custom";
rootPart.Archivable 		= true;
rootJoint.Archivable 		= true;
c_new						= CFrame.new;
cam = game.Workspace.CurrentCamera
c_angles					= CFrame.Angles;
i_new = Instance.new

newWeld = function(wp0, wp1, wc0x, wc0y, wc0z)
	local wld = Instance.new("Weld", wp1)
	wld.Part0 = wp0
	wld.Part1 = wp1
	wld.C0 = CFrame.new(wc0x, wc0y, wc0z)
	return wld
end

Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)

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
	


function swait(num)
	if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, num do
			ArtificialHB.Event:wait()
		end
	end
end

function QuaternionFromCFrame(cf) 
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components() 
	local trace = m00 + m11 + m22 
	if trace > 0 then 
		local s = math.sqrt(1 + trace) 
		local recip = 0.5/s 
		return (m21-m12)*recip, (m02-m20)*recip, (m10-m01)*recip, s*0.5 
	else 
		local i = 0 
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then 
			i = 2 
		end 
		if i == 0 then 
			local s = math.sqrt(m00-m11-m22+1) 
			local recip = 0.5/s 
			return 0.5*s, (m10+m01)*recip, (m20+m02)*recip, (m21-m12)*recip 
		elseif i == 1 then 
			local s = math.sqrt(m11-m22-m00+1) 
			local recip = 0.5/s 
			return (m01+m10)*recip, 0.5*s, (m21+m12)*recip, (m02-m20)*recip 
		elseif i == 2 then 
			local s = math.sqrt(m22-m00-m11+1) 
			local recip = 0.5/s return (m02+m20)*recip, (m12+m21)*recip, 0.5*s, (m10-m01)*recip 
		end 
	end 
end

function QuaternionToCFrame(px, py, pz, x, y, z, w) 
	local xs, ys, zs = x + x, y + y, z + z 
	local wx, wy, wz = w*xs, w*ys, w*zs 
	local xx = x*xs 
	local xy = x*ys 
	local xz = x*zs 
	local yy = y*ys 
	local yz = y*zs 
	local zz = z*zs 
	return CFrame.new(px, py, pz,1-(yy+zz), xy - wz, xz + wy,xy + wz, 1-(xx+zz), yz - wx, xz - wy, yz + wx, 1-(xx+yy)) 
end

function QuaternionSlerp(a, b, t) 
	local cosTheta = a[1]*b[1] + a[2]*b[2] + a[3]*b[3] + a[4]*b[4] 
	local startInterp, finishInterp; 
	if cosTheta >= 0.0001 then 
		if (1 - cosTheta) > 0.0001 then 
			local theta = math.acos(cosTheta) 
			local invSinTheta = 1/math.sin(theta) 
			startInterp = math.sin((1-t)*theta)*invSinTheta 
			finishInterp = math.sin(t*theta)*invSinTheta  
		else 
			startInterp = 1-t 
			finishInterp = t 
		end 
	else 
		if (1+cosTheta) > 0.0001 then 
			local theta = math.acos(-cosTheta) 
			local invSinTheta = 1/math.sin(theta) 
			startInterp = math.sin((t-1)*theta)*invSinTheta 
			finishInterp = math.sin(t*theta)*invSinTheta 
		else 
			startInterp = t-1 
			finishInterp = t 
		end 
	end 
	return a[1]*startInterp + b[1]*finishInterp, a[2]*startInterp + b[2]*finishInterp, a[3]*startInterp + b[3]*finishInterp, a[4]*startInterp + b[4]*finishInterp 
end

function clerp(a, b, t) 
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)} 
	local ax, ay, az = a.x, a.y, a.z 
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1-t
	return QuaternionToCFrame(_t*ax + t*bx, _t*ay + t*by, _t*az + t*bz,QuaternionSlerp(qa, qb, t)) 
end

swait()
LA_Weld = newWeld(Torso, Left_Arm, -1.5, 0.5, 0)
Left_Arm.Weld.C1 = CFrame.new(0, 0.5, 0)
RA_Weld = newWeld(Torso, Right_Arm, 1.5, 0.5, 0)
Right_Arm.Weld.C1 = CFrame.new(0, 0.5, 0)
LL_Weld = newWeld(Torso, Left_Leg, -0.5, -1, 0)
Left_Leg.Weld.C1 = CFrame.new(0, 1, 0) -- Left_Leg.Weld.C1 = CFrame.new(0, 1, 0.15)
RL_Weld = newWeld(Torso, Right_Leg, 0.5, -1, 0)
Right_Leg.Weld.C1 = CFrame.new(0, 1, 0) -- Right_Leg.Weld.C1 = CFrame.new(0, 1, 0.15)
Torso_Weld = newWeld(rootPart, Torso, 0, -1, 0)
Torso.Weld.C1 = CFrame.new(0, -1, 0)
Head_Weld = newWeld(Torso, Head, 0, 1.5, 0)







local S = Instance.new("Sound")
function CreateSound(ID, PARENT, VOLUME, PITCH)
	local NEWSOUND
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id=" .. ID
		swait()
		NEWSOUND:play()
		game:GetService("Debris"):AddItem(NEWSOUND, 15)
	end))
	return NEWSOUND
end



function newbosschatfunc(text,color1,color2,delay,typea)
	for _,v in next, game:service'Players':players() do
		coroutine.wrap(function()
			if(script:FindFirstChild'TalkChat' and v.Character)then
				local cha = script.TalkChat --:Clone()
				cha.Color1.Value=color1
				cha.Color2.Value=color2
				cha.Text.Value=text
				cha.Ghghghghgh.Value=delay
				cha.Mode.Value=1
				cha.Parent=v.Character
				wait()
				cha.Disabled = false
				game:service'Debris':AddItem(cha,(delay/30))
			end
		end)()
	end
end

function bosschatfunc(text,color,watval,type)
	newbosschatfunc(text,BrickColor.new("Institutional white").Color,color,watval,type)
end


function Pointing()
attack = true
Animations = true
local Point= Instance.new("BodyGyro")
Point.Parent = rootPart
Point.D = 175
Point.P = 20000
Point.MaxTorque = Vector3.new(0,4000000,0)
for i = 0,0.08,0.01 do
Point.cframe = CFrame.new(rootPart.Position,mouse.Hit.Position)
RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.5, 0.5 + math.sin(sine/7.5)/15, 0.3) * c_angles(math.rad(90),math.rad(0),math.rad(60)), 0.15)
LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(20)), 0.15)
LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5, -1.05 - math.sin(sine/7.5)/5, 0) * c_angles(math.rad(0),math.rad(0),math.rad(-10)), 0.15)
RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5, -1.05 - math.sin(sine/7.5)/5 , 0) * c_angles(math.rad(0),math.rad(0),math.rad(10)), 0.15)
Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(0, -1 + math.sin(sine/7.5)/15, 0) * c_angles(math.rad(0), math.rad(60),math.rad(0)), 0.15)
Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0, 1.5 - math.sin(sine/15)/15, 0) * c_angles(math.rad(-10),math.rad(-60), math.rad(0)), 0.15)
swait()
end
swait(5)
attack = false
Animations = false
Point:Destroy()
end
Character.Head.face:Destroy()
Expression = Instance.new("Decal",Head)
Expression.Texture = "rbxassetid://4484405390"
local Player, Character = game.Players:GetPlayerFromCharacter(script.Parent), Player.Character;
local Torso = Character:FindFirstChild("Torso")
local rootPart = Character:FindFirstChild("HumanoidRootPart")
local Humanoid = Character:FindFirstChild("Humanoid")
local Head = Character:FindFirstChild("Head")
local rootPart = Character:FindFirstChild("HumanoidRootPart")
local rapid = false
local rapid2 = false
local rapid3 = false
local debouncing = false
repeat wait() until Character ~= nil
		
function rayCast2(Pos, Dir, Max, Ignore)
return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore) 
end

local themeMoos = Instance.new("Sound")
themeMoos.Parent = Torso
themeMoos.SoundId = "rbxassetid://4628607656"
themeMoos.Looped = true
themeMoos.Volume = 5
themeMoos.Pitch = 1
themeMoos.Name = "MusicTheme"
local themeMoos2 = Instance.new("Sound")
themeMoos2.Parent = Torso
themeMoos2.SoundId = "rbxassetid://320255931"
themeMoos2.Looped = true
themeMoos2.Volume = 8
themeMoos2.Pitch = 1
themeMoos2.Name = "SpareTheme"
wait()
themeMoos:Play()
local Happened = false
function Start()
	Animations = true
	attack = true
	themeMoos:Stop()
	Expression.Texture = "rbxassetid://4484446057"
	chatfunc("* it's a beautiful day outside.")
	wait(3)
	chatfunc("* birds are singing, flowers are blooming...")
	wait(5)
	chatfunc("* on days like these, monsters like me...")
	wait(4)
	Expression.Texture = "rbxassetid://4484436948"
	chatfunc("* CAN NOT AFFORD NOT TO CARE ANYMORE.")
	wait(15)
	idle=idly
	Animations = true
	Expression.Texture = "rbxassetid://4484405390"
	chatfunc("* seems familiar to you?")
	wait(6)
	Expression.Texture = "rbxassetid://4484407199"
	chatfunc("* well, not for long.")
	wait(5)
	Expression.Texture = "rbxassetid://4484405390"
	themeMoos:Play()
    bosschatfunc("* Sans is finally giving it his all.",BrickColor.new("Institutional white").Color,120)
	Animations = false
	attack = false
end
local Death = false
local emitters={}
local emitter = Instance.new("ParticleEmitter")
emitter.Name = "Dust"
emitter.LightEmission = 1
emitter.Transparency = NumberSequence.new(0,1)
emitter.Size = NumberSequence.new(0,0.2)
emitter.SpreadAngle = Vector2.new(360,360)
emitter.Speed = NumberRange.new(0.5)
emitter.Lifetime = NumberRange.new(0.75)
emitter.Texture = "rbxassetid://241812810"
emitter.Rate = 1000
emitter.Color = ColorSequence.new(Color3.new(1,1,1))
emitter.LockedToPart = false
table.insert(emitters,emitter)
function particles(art)
	emitter:Clone().Parent = art
end
local Death2 = false
local Slash = Instance.new("Decal", Torso)
Slash.Texture = ""
local bill = script.HealthBar
bill.Frame.PName.Text = "sans"
bill.Parent = Head
FLOOR = math.floor
local health = Head.HealthBar.Frame.HealthLabel
local Humanoid = Character:WaitForChild("Humanoid")
local damagedsound = Instance.new("Sound")
damagedsound.Name = "damaged"
damagedsound.SoundId = "rbxassetid://357417055" -- damages sound effect
damagedsound.Pitch = 1
damagedsound.Volume = 3
damagedsound.Parent = Torso

health.Text = (Humanoid.Health/100).."/1" -- health text is now the humanoid health out of 1000
Humanoid.HealthChanged:Connect(function()
	damagedsound:Play()
	if Death == false and Death2 == false then
	health.Text = FLOOR(Humanoid.Health/100).."/1" -- when the humanoid health changes the text updates with the new humanoid health value
	health.Parent.Health.Size = UDim2.new(Humanoid.Health/222.2,0,.25,0)
	elseif Death == true and Death2 == false then
	health.Text = "0.0001/1" -- when the humanoid health changes the text updates with the new humanoid health value
	health.Parent.Health.Size = UDim2.new(Humanoid.Health/111111.1,0,.25,0)
	elseif Death == false and Death2 == true then
	health.Text = FLOOR(Humanoid.Health/1500).."/1" -- when the humanoid health changes the text updates with the new humanoid health value
	health.Parent.Health.Size = UDim2.new(Humanoid.Health/3333.3,0,.25,0)
	end
end)
function Dead()
	attack = true
attack2 = true
Animations = true
candodge = false
dodging = false
Happened = true
canblock = true
blocking = false
Humanoid.MaxHealth = math.huge
Humanoid.Health = math.huge
	Expression.Texture = "rbxassetid://1371827222"
local Dizz = Instance.new("Sound")
Dizz.Parent = Character.Torso
Dizz.SoundId = "rbxassetid://623904185"
Dizz.Volume = 10
Dizz.Looped = false
Dizz.Pitch = 1
Dizz:Play()
Slash.Texture = "rbxassetid://403969152"
health.Text = "0/1"
health.Parent.Health.Size = UDim2.new(0/2222.2,0,.25,0)
	for i = 0,1,0.01 do
themeMoos.Pitch = themeMoos.Pitch - 0.01
RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.1, 0.5 + math.sin(sine/7.5)/10, 0) * c_angles(math.rad(-20),math.rad(-20),math.rad(0)), 0.15)
LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.1, 0.5 + math.sin(sine/7.5)/10, 0) * c_angles(math.rad(-20),math.rad(20),math.rad(0)), 0.15)
LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5, -1 - math.sin(sine/7.5)/10, 0) * c_angles(math.rad(60),math.rad(20),math.rad(0)), 0.15)
RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5, -1 - math.sin(sine/7.5)/10, 0) * c_angles(math.rad(60),math.rad(-20),math.rad(0)), 0.15)
Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(0, -3 + math.sin(sine/7.5)/10, 0) * c_angles(math.rad(20), math.rad(0),math.rad(0)), 0.15)
Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0, 1.5 + math.sin(sine/15)/10, 0) * c_angles(math.rad(-20),math.rad(0), math.rad(0) + math.sin(sine/15)/5), 0.15)
swait()
	end

local Soul1 = Instance.new("Part", Character)
Soul1.Name = "Soul"
Soul1.Anchored = true
Soul1.Shape = Enum.PartType.Block
Soul1.CanCollide = false
Soul1.BrickColor = BrickColor.new("Institutional white")
Soul1.Transparency = 0.001
Soul1.Material = "Neon"
Soul1.Size = Vector3.new(0.26, 0.5, 0.21)
Soul1.TopSurface = Enum.SurfaceType.Smooth
Soul1.BottomSurface = Enum.SurfaceType.Smooth


local M1 = Instance.new("SpecialMesh")
M1.Parent = Soul1
M1.MeshType = "Sphere"
M1.Scale = Vector3.new(1,1,1)

local Soul2 = Instance.new("Part", Character)
Soul2.Name = "Soul"
Soul2.Anchored = true
Soul2.Shape = Enum.PartType.Block
Soul2.CanCollide = false
Soul2.BrickColor = BrickColor.new("Institutional white")
Soul2.Transparency = 0.001
Soul2.Material = "Neon"
Soul2.Size = Vector3.new(0.26, 0.5, 0.21)
Soul2.TopSurface = Enum.SurfaceType.Smooth
Soul2.BottomSurface = Enum.SurfaceType.Smooth


local M1 = Instance.new("SpecialMesh")
M1.Parent = Soul2
M1.MeshType = "Sphere"
M1.Scale = Vector3.new(1,1,1)
Dizz:Destroy()
themeMoos.Volume = 0
S = Instance.new("Sound")
S.Parent = Character.Torso
S.SoundId = "rbxassetid://1292392651"
S.Volume = 10
S.Looped = false
S.Pitch = 1
S:Play()

Soul1.CFrame = rootPart.CFrame * CFrame.new(0.1, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(30))
Soul2.CFrame = rootPart.CFrame * CFrame.new(-0.1, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(-30))


Death = true

chatfunc("* ...")
wait(2)
S:Stop()
for i = 0,1.7,0.01 do
Soul1.CFrame = rootPart.CFrame * CFrame.new(math.random(5,15)/100, math.random(95,105)/100, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(30))
Soul2.CFrame = rootPart.CFrame * CFrame.new(math.random(-15,-5)/100, math.random(95,105)/100, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(-30))
end
chatfunc("* !?")
wait(3)
themeMoos:Stop()
themeMoos.Pitch = 1
themeMoos.SoundId = "rbxassetid://4867583303"
themeMoos:Play()
CreateSound("446961725", Head, 7, 1)
health.Text = "0.0001/1"
health.Parent.Health.Size = UDim2.new(100/22222.2,0,.25,0)
Soul1.CFrame = rootPart.CFrame * CFrame.new(0.1, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(30))
Soul2.CFrame = rootPart.CFrame * CFrame.new(-0.1, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(-30))
wait(5)
for i = 1,60,2 do
Soul1.Transparency = i/30
Soul2.Transparency = i/30
swait()
end
wait(2)
chatfunc("* i'm not throwing in the towel just yet.")
Expression.Texture = "rbxassetid://4899271896"
wait(3)
chatfunc("* ...")
wait(3)
for i = 0,1.7,0.01 do
		RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(0)), Sanim + 0.025)
		LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(0)), Sanim + 0.025)
		LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5 + math.sin(sine/15)/6, -1.05 - math.sin(sine/7.5)/5, 0) * c_angles(math.rad(20) - math.sin(sine/15)/5,math.rad(0),math.rad(-10)), Sanim)
		RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5 + math.sin(sine/15)/6, -1.05 - math.sin(sine/7.5)/5 , 0) * c_angles(math.rad(20) - math.sin(sine/15)/5,math.rad(0),math.rad(10)), Sanim)
		Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(0 - math.sin(sine/15)/10, -0.95 + math.sin(sine/7.5)/5, 0) * c_angles(math.rad(-20) + math.sin(sine/15)/10, math.rad(0),math.rad(0)), Sanim)
		Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0 - math.sin(sine/15)/6, 1.5, 0) * c_angles(math.rad(0) + math.sin(sine/7.5)/5,math.rad(math.random(-15,10)), math.rad(0) + math.sin(sine/15)/4), Sanim)
end
wait(1)
Animations = false
chatfunc("* because even if this fight is unwinnable")
Expression.Texture = "rbxassetid://4899271517"
wait(3)
chatfunc("* i am willing to give it my all.")
wait(3)
chatfunc("it's not like i have any other choice...")
wait(3)
chatfunc("* i am willing to put you into place once and for all.")
wait(3)
chatfunc("* and even if i fail..")
wait(2)
chatfunc("* at least i die with a feeling of satisfaction.")
wait(3)
chatfunc("* that i finally got to see who you really are.")
wait(3)
chatfunc("* prepare yourself, kid... or whatever you are.")
wait(5)
chatfunc("* because...")
local Rev = Instance.new("Sound")
Rev.Parent = Character.Torso
Rev.SoundId = "rbxassetid://364420478"
Rev.Volume = 10
Rev.Looped = false
Rev.Pitch = 1
Rev:Play()
repeat wait() until Rev.Playing == false
local RevB = Instance.new("Sound")
RevB.Parent = Character.Torso
RevB.SoundId = "rbxassetid://446961725"
RevB.Volume = 10
RevB.Looped = false
RevB.Pitch = 1
RevB:Play()
Expression.Texture = "rbxassetid://4899271236"
chatfunc("* you're about to get dunked on even harder than before.")
themeMoos:Stop()
themeMoos.Pitch = 1
themeMoos.Volume = 5
themeMoos.SoundId = "rbxassetid://4686555781"
themeMoos:Play()
bosschatfunc("* Sans is 'dead' serious about this.",BrickColor.new("Institutional white").Color,120)
Sanim = 0.0001
attack = false
attack2 = false
Animations = false
Humanoid.MaxHealth = 500
Humanoid.Health = 500
end

--death2
function Dead2()
	attack = true
attack2 = true
specialattack = false
Animations = true
Humanoid.MaxHealth = math.huge
Humanoid.Health = math.huge
	Expression.Texture = "rbxassetid://1371827222"
local Dizz = Instance.new("Sound")
Dizz.Parent = Character.Torso
Dizz.SoundId = "rbxassetid://623904185"
Dizz.Volume = 10
Dizz.Looped = false
Dizz.Pitch = 0.7
Dizz:Play()
Slash.Texture = "rbxassetid://405155520"
health.Text = "0/1"
health.Parent.Health.Size = UDim2.new(0/2222.2,0,.25,0)
	for i = 0,1,0.01 do
themeMoos.Pitch = themeMoos.Pitch - 0.01
RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.1, 0.5 + math.sin(sine/7.5)/10, 0) * c_angles(math.rad(-20),math.rad(-20),math.rad(0)), 0.15)
LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.1, 0.5 + math.sin(sine/7.5)/10, 0) * c_angles(math.rad(-20),math.rad(20),math.rad(0)), 0.15)
LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5, -1 - math.sin(sine/7.5)/10, 0) * c_angles(math.rad(60),math.rad(20),math.rad(0)), 0.15)
RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5, -1 - math.sin(sine/7.5)/10, 0) * c_angles(math.rad(60),math.rad(-20),math.rad(0)), 0.15)
Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(0, -3 + math.sin(sine/7.5)/10, 0) * c_angles(math.rad(20), math.rad(0),math.rad(0)), 0.15)
Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0, 1.5 + math.sin(sine/15)/10, 0) * c_angles(math.rad(-20),math.rad(0), math.rad(0) + math.sin(sine/15)/5), 0.15)
swait()
	end
	wait(2)
	Expression.Texture = "rbxassetid://4484446057"
	chatfunc("* ...")
	for i = 0,1,0.01 do
themeMoos.Pitch = themeMoos.Pitch - 0.01
RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.1, 0.5 + math.sin(sine/7.5)/10, 0) * c_angles(math.rad(-20),math.rad(-20),math.rad(0)), 0.15)
LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.1, 0.5 + math.sin(sine/7.5)/10, 0) * c_angles(math.rad(40),math.rad(20),math.rad(70)), 0.15)
LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5, -1 - math.sin(sine/7.5)/10, 0) * c_angles(math.rad(60),math.rad(20),math.rad(0)), 0.15)
RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5, -1 - math.sin(sine/7.5)/10, 0) * c_angles(math.rad(60),math.rad(-20),math.rad(0)), 0.15)
Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(0, -3 + math.sin(sine/7.5)/10, 0) * c_angles(math.rad(20), math.rad(0),math.rad(0)), 0.15)
Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0, 1.5 + math.sin(sine/15)/10, 0) * c_angles(math.rad(-20),math.rad(0), math.rad(0) + math.sin(sine/15)/5), 0.15)
swait()
	end
	wait(1)
    Expression.Texture = "rbxassetid://4484447540"
	chatfunc("* ...")
	wait(3)
	chatfunc("* so...")
	wait(2)
	chatfunc("* guess that's it, huh?")
	wait(4)
	Expression.Texture = "rbxassetid://1371827222"
	chatfunc("* ...")
	wait(6)
	Expression.Texture = "rbxassetid://4484446057"
	chatfunc("* welp.")
	wait(3)
local Soul1 = Instance.new("Part", Character)
Soul1.Name = "Soul"
Soul1.Anchored = true
Soul1.Shape = Enum.PartType.Block
Soul1.CanCollide = false
Soul1.BrickColor = BrickColor.new("Institutional white")
Soul1.Transparency = 0.001
Soul1.Material = "Neon"
Soul1.Size = Vector3.new(0.26, 0.5, 0.21)
Soul1.TopSurface = Enum.SurfaceType.Smooth
Soul1.BottomSurface = Enum.SurfaceType.Smooth


local M1 = Instance.new("SpecialMesh")
M1.Parent = Soul1
M1.MeshType = "Sphere"
M1.Scale = Vector3.new(1,1,1)

local Soul2 = Instance.new("Part", Character)
Soul2.Name = "Soul"
Soul2.Anchored = true
Soul2.Shape = Enum.PartType.Block
Soul2.CanCollide = false
Soul2.BrickColor = BrickColor.new("Institutional white")
Soul2.Transparency = 0.001
Soul2.Material = "Neon"
Soul2.Size = Vector3.new(0.26, 0.5, 0.21)
Soul2.TopSurface = Enum.SurfaceType.Smooth
Soul2.BottomSurface = Enum.SurfaceType.Smooth


local M1 = Instance.new("SpecialMesh")
M1.Parent = Soul2
M1.MeshType = "Sphere"
M1.Scale = Vector3.new(1,1,1)
Dizz:Destroy()
themeMoos.Volume = 0
S = Instance.new("Sound")
S.Parent = Character.Torso
S.SoundId = "rbxassetid://1292392651"
S.Volume = 10
S.Looped = false
S.Pitch = 1
S:Play()

Soul1.CFrame = rootPart.CFrame * CFrame.new(0.1, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(30))
Soul2.CFrame = rootPart.CFrame * CFrame.new(-0.1, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(-30))



for i = 0,1.7,0.01 do
Soul1.CFrame = rootPart.CFrame * CFrame.new(math.random(5,15)/100, math.random(95,105)/100, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(30))
Soul2.CFrame = rootPart.CFrame * CFrame.new(math.random(-15,-5)/100, math.random(95,105)/100, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(-30))
RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.5, 0.5, 0) * c_angles(math.rad(150),math.rad(-25),math.rad(66)), 0.2)
LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.5, 0.5, 0) * c_angles(math.rad(150),math.rad(16),math.rad(-50)), 0.2)
LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5, -1, 0) * c_angles(math.rad(0),math.rad(0),math.rad(-20)), 0.2)
RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5, -1, 0) * c_angles(math.rad(0),math.rad(0),math.rad(20)), 0.2)
Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(0, -2.5, 0) * c_angles(math.rad(-80), math.rad(0),math.rad(0)), 0.2)
Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0, 2, -0.3) * c_angles(math.rad(50),math.rad(0), math.rad(45)), 0.2)
swait()
end
Soul1.CFrame = rootPart.CFrame * CFrame.new(0.1, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(30))
Soul2.CFrame = rootPart.CFrame * CFrame.new(-0.1, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(-30))
wait(1)
S = Instance.new("Sound")
S.Parent = Character.Torso
S.SoundId = "rbxassetid://973028066"
S.Volume = 10
S.Looped = false
S.Pitch = 1
S:Play()
Soul1.CFrame = rootPart.CFrame * CFrame.new(0.25, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(30))
Soul2.CFrame = rootPart.CFrame * CFrame.new(-0.25, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(-30))
wait(1)
S:Stop()
Soul1.BrickColor = BrickColor.new("Really red")
Soul2.BrickColor = BrickColor.new("Really red")
local Rev = Instance.new("Sound")
Rev.Parent = Character.Torso
Rev.SoundId = "rbxassetid://364420478"
Rev.Volume = 10
Rev.Looped = false
Rev.Pitch = 1
Rev:Play()
	repeat
		swait()
		Rev.Parent = Head
Soul1.CFrame = rootPart.CFrame * CFrame.new(math.random(5,15)/100, math.random(95,105)/100, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(-30))
Soul2.CFrame = rootPart.CFrame * CFrame.new(math.random(-15,-5)/100, math.random(95,105)/100, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(30))
	until Rev.Playing == false
	Soul1.CFrame = rootPart.CFrame * CFrame.new(0.1, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(-30))
Soul2.CFrame = rootPart.CFrame * CFrame.new(-0.1, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(30))
for i = 1,60,2 do
Soul1.Transparency = i/30
Soul2.Transparency = i/30
swait()
end
Death = false
Death2 = true
			for _, c in pairs(Character:GetChildren()) do
		if c.ClassName == "Part" then
			if c.Transparency == 0 and c:FindFirstChild("Dust") ~= nil then
				c.Dust:Destroy()
			end
		end
		end
local Bam = Instance.new("Sound")
Bam.Parent = Character.Torso
Bam.SoundId = "rbxassetid://367453005"
Bam.Volume = 10
Bam.Looped = false
Bam.Pitch = 1
Bam:Play()
health.Text = "1/1"
health.Parent.Health.Size = UDim2.new(0.45,0,.25,0)
Expression.Texture = "rbxassetid://1747799573"
script.textboard.TextLabel.TextColor3 = Color3.new(255,0,0)
chatfunc("* Hahahahhaha.")
themeMoos:Stop()
themeMoos.SoundId = "rbxassetid://4739499225"
themeMoos:Play()
Sanim = 0.0001
attack = false
attack2 = false
Animations = false
Humanoid.MaxHealth = 1500
Humanoid.Health = 1500
wait(155)
Expression.Texture = "rbxassetid://1747799573"
chatfunc("* ð£â ââ â¹ â ð£â â âï¸â.")
end
local Happened2 = false
function swait(num)
	if num == 0 or num == nil then
		game:GetService("RunService").Stepped:wait(0)
	else
		for i = 0, num do
			game:GetService("RunService").Stepped:wait(0)
		end
	end
end

Effects = Instance.new("Folder",Character)
Effects.Name = "Stuff"

		local CFRAME = rootPart.CFrame * CFrame.new(0, 0, -2)
	local CHROMES = {}
	local AFFECTEDPEOPLE = {}
		local function AoE(POS, RANGE)
			for index, CHILD in pairs(workspace:GetDescendants()) do
				if CHILD.ClassName == "Model" then
					local HUM = CHILD:FindFirstChildOfClass("Humanoid")
					if HUM then
						local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
						if TORSO and RANGE >= (TORSO.Position - POS).Magnitude then
							local PASS = true
							for E = 1, #AFFECTEDPEOPLE do
								if AFFECTEDPEOPLE[E][1] == CHILD then
									PASS = false
								end
							end
							if PASS == true then
								local CHROME = script.Permachrome --:Clone()
								CHROME.Parent = CHILD
								CHROME.Disabled = false
								local UNDO = Instance.new("BoolValue", CHROME)
								UNDO.Name = "Undo"
								table.insert(CHROMES, CHROME)
							end
						end
					end
				end
			end
		end
		
		function teleport()
			local tele1 = CreateSound("12222170", Head, 5, 0.6)
			--AoE(CFRAME.p, 500000)
			repeat swait() until tele1.Playing == false
			wait(0.5)
			local tele2 = CreateSound("12222170", Head, 5, 0.65)
			 Torso.CFrame = CFrame.new(Vector3.new(Mouse.Hit.p.X,Mouse.Hit.p.Y+1.5,Mouse.Hit.p.Z),Torso.CFrame.p)
          wait(1)
			  --for E = 1, #CHROMES do
				--CHROMES[E]:Destroy()
              --end
		end
function Beam2(parent,color,size,pose)
local MouseLook=CFrame.new((parent.Position+pose)/2,pose)
local hit,pos = rayCast2(parent.Position,MouseLook.lookVector,999,rootPart.Parent)
local mag=(parent.Position-pos).magnitude 

local Shockwave = Instance.new("Part",Effects)
Shockwave.Anchored = true
Shockwave.Color = color
Shockwave.CanCollide = false
Shockwave.FormFactor = 3
Shockwave.Name = "Shockwave"
Shockwave.Material = "Neon"
Shockwave.Size = Vector3.new(1, 1, 1)
Shockwave.Transparency = 0
Shockwave.TopSurface = 0
Shockwave.BottomSurface = 0
Shockwave.CFrame = parent.CFrame
local rngm2 = Instance.new("SpecialMesh", Shockwave)
rngm2.Scale = Vector3.new(size, size, size)
rngm2.Offset = Vector3.new(0,0,0)
rngm2.MeshType = "Sphere"
spawn(function()
	wait(0.4)
	for i = 1, 10 do
		rngm2.Scale = Vector3.new(size - i*(size/10),size - i*(size/10),size - i*(size/10))
		swait()
	end
	wait()
	Shockwave:Destroy()
end)

local Shockwave = Instance.new("Part",Effects)
Shockwave.Anchored = true
Shockwave.Color = color
Shockwave.CanCollide = false
Shockwave.FormFactor = 3
Shockwave.Name = "Shockwave"
Shockwave.Material = "Neon"
Shockwave.Size = Vector3.new(1, 1, 1)
Shockwave.Transparency = 0
Shockwave.TopSurface = 0
Shockwave.BottomSurface = 0
Shockwave.CFrame = parent.CFrame *CFrame.new(0,0,(-mag))
local rngm2 = Instance.new("SpecialMesh", Shockwave)
rngm2.Scale = Vector3.new(size, size, size)
rngm2.Offset = Vector3.new(0,0,0)
rngm2.MeshType = "Sphere"
spawn(function()
	wait(0.4)
	for i = 1, 10 do
		rngm2.Scale = Vector3.new(size - i*(size/10),size - i*(size/10),size - i*(size/10))
		swait()
	end
	wait()
	Shockwave:Destroy()
end)

local Laser = Instance.new("Part",Torso)
Laser.Name = "MagicCircle"
Laser.Shape = Enum.PartType.Cylinder
Laser.CanCollide = false
Laser.Color = color
Laser.Transparency = 0
Laser.Anchored = true
Laser.Material = "Neon"
Laser.Size = Vector3.new(1 * mag,size, size)
Laser.TopSurface = Enum.SurfaceType.Smooth
Laser.BottomSurface = Enum.SurfaceType.Smooth
Laser.CFrame = parent.CFrame *CFrame.new(0,0,(-mag)/2) * CFrame.fromEulerAnglesXYZ(0,math.rad(90),0)

Laser.Touched:connect(function(hit)


if hit.Parent == Character then return end

for i,v in pairs(hit.Parent:GetChildren()) do
if v:IsA("Humanoid") then
padebounce = true
if padebounce == true then
padebounce = false

v.Health = v.Health-1
wait()
padebounce = true
end


end
end

end)

spawn(function()
e = size
wait(0.4)
for i = 1,10 do
e = e - (size/10)
Laser.Size = Vector3.new(1 * mag,e, e)
swait()
end
Laser:Destroy()
end)
end

function Beam(parent,color,size)
local MouseLook=CFrame.new((parent.Position+mouse.Hit.p)/2,mouse.Hit.p)
local hit,pos = rayCast2(parent.Position,MouseLook.lookVector,999,rootPart.Parent)
local mag=(parent.Position-pos).magnitude 

local Shockwave = Instance.new("Part",Effects)
Shockwave.Anchored = true
Shockwave.Color = color
Shockwave.CanCollide = false
Shockwave.FormFactor = 3
Shockwave.Name = "Shockwave"
Shockwave.Material = "Neon"
Shockwave.Size = Vector3.new(1, 1, 1)
Shockwave.Transparency = 0
Shockwave.TopSurface = 0
Shockwave.BottomSurface = 0
Shockwave.CFrame = parent.CFrame
local rngm2 = Instance.new("SpecialMesh", Shockwave)
rngm2.Scale = Vector3.new(size, size, size)
rngm2.Offset = Vector3.new(0,0,0)
rngm2.MeshType = "Sphere"
spawn(function()
	wait(0.4)
	for i = 1, 10 do
		rngm2.Scale = Vector3.new(size - i*(size/10),size - i*(size/10),size - i*(size/10))
		swait()
	end
	wait()
	Shockwave:Destroy()
end)

local Shockwave = Instance.new("Part",Effects)
Shockwave.Anchored = true
Shockwave.Color = color
Shockwave.CanCollide = false
Shockwave.FormFactor = 3
Shockwave.Name = "Shockwave"
Shockwave.Material = "Neon"
Shockwave.Size = Vector3.new(1, 1, 1)
Shockwave.Transparency = 0
Shockwave.TopSurface = 0
Shockwave.BottomSurface = 0
Shockwave.CFrame = parent.CFrame *CFrame.new(0,0,(-mag))
local rngm2 = Instance.new("SpecialMesh", Shockwave)
rngm2.Scale = Vector3.new(size, size, size)
rngm2.Offset = Vector3.new(0,0,0)
rngm2.MeshType = "Sphere"
spawn(function()
	wait(0.4)
	for i = 1, 10 do
		rngm2.Scale = Vector3.new(size - i*(size/10),size - i*(size/10),size - i*(size/10))
		swait()
	end
	wait()
	Shockwave:Destroy()
end)

local Laser = Instance.new("Part",Torso)
Laser.Name = "MagicCircle"
Laser.Shape = Enum.PartType.Cylinder
Laser.CanCollide = false
Laser.Color = color
Laser.Transparency = 0
Laser.Anchored = true
Laser.Material = "Neon"
Laser.Size = Vector3.new(1 * mag,size, size)
Laser.TopSurface = Enum.SurfaceType.Smooth
Laser.BottomSurface = Enum.SurfaceType.Smooth
Laser.CFrame = parent.CFrame *CFrame.new(0,0,(-mag)/2) * CFrame.fromEulerAnglesXYZ(0,math.rad(90),0)

Laser.Touched:connect(function(hit)


if hit.Parent == Character then return end

for i,v in pairs(hit.Parent:GetChildren()) do
if v:IsA("Humanoid") then
padebounce = true
if padebounce == true then
padebounce = false

v.Health = v.Health-1
wait()
padebounce = true
end


end
end

end)

spawn(function()
e = size
wait(0.4)
for i = 1,10 do
e = e - (size/10)
Laser.Size = Vector3.new(1 * mag,e, e)
swait()
end
Laser:Destroy()
end)
end

local mp = Instance.new("Part",Effects)
mp.CanCollide = false
mp.Name = "Point X"
mp.Transparency = 1
mp.Size = Vector3.new(1, 1, 1)

Point = Instance.new("BodyGyro")
Point.Parent = mp
Point.D = 175
Point.P = 200000
Point.MaxTorque = Vector3.new(0,400000000,0)

local mp2 = Instance.new("Part",Effects)
mp2.CanCollide = false
mp2.Name = "Point XYZ"
mp2.Transparency = 1
mp2.Size = Vector3.new(1, 1, 1)

Point2 = Instance.new("BodyGyro")
Point2.Parent = mp2
Point2.D = 175
Point2.P = 200000
Point2.MaxTorque = Vector3.new(400000000,400000000,400000000)

local mousep = nil
local pos = Instance.new("BodyPosition",mp)
pos.D = 1250
pos.P = 200000
pos.MaxForce = Vector3.new(4000000000, 4000000000, 4000000000)
local pos2 = Instance.new("BodyPosition",mp2)
pos2.D = 1250
pos2.P = 200000
pos2.MaxForce = Vector3.new(4000000000, 4000000000, 4000000000)
coroutine.wrap(function()
while true do
mousep = mouse.Hit.p
Point.cframe = CFrame.new(rootPart.Position,Mouse.Hit.Position)
pos.Position = rootPart.Position + Vector3.new(0,0,0)
Point2.cframe = CFrame.new(rootPart.Position,Mouse.Hit.Position)
pos2.Position = rootPart.Position + Vector3.new(0,0,0)
swait()
end
end)()

function GasterBlaster(position,x1,y1,z1,size,lasercolor,lasersize,pitch1,pitch2,x2,y2,z2)
local GasterB = Instance.new("Part",Effects)
GasterB.Touched:connect(function(hit)


if hit.Parent == Character then return end

for i,v in pairs(hit.Parent:GetChildren()) do
if v:IsA("Humanoid") then
padebounce = true
if padebounce == true then
padebounce = false

v.Health = v.Health-0.5
wait(.2)
padebounce = true
end


end
end

end)

GasterB.CFrame = rootPart.CFrame
GasterB.CanCollide = false
GasterB.Material = "SmoothPlastic"
GasterB.BrickColor = BrickColor.new("White")
local zxc = Instance.new("SpecialMesh",GasterB)
zxc.MeshType = "FileMesh"
zxc.Scale = Vector3.new(1, 1, 1)
zxc.MeshId = "rbxassetid://2649585735"

spawn(function()

local GBPoint = Instance.new("BodyGyro")
GBPoint.Parent = GasterB
GBPoint.D = 20000
GBPoint.P = 2000000000
GBPoint.MaxTorque = Vector3.new(x2,y2,z2)
local Fire = Instance.new("Sound",GasterB)
local Charge = Instance.new("Sound",GasterB)

local GBLoc = Instance.new("BodyPosition",GasterB)
GBLoc.D = 2000
GBLoc.P = 200000
GBLoc.MaxForce = Vector3.new((math.huge), (math.huge), (math.huge))
Charge.SoundId = "rbxassetid://482211201"
Charge.Volume = 1
Charge.Pitch = pitch1
Charge.PlayOnRemove = true
Charge:Destroy()
local x = x1
local y = y1
local z = z1
local c = 0
local posit = position
for i = 1,20 do
c = c + (size/20)
GBPoint.cframe = CFrame.new(GasterB.Position,posit)
zxc.Scale = Vector3.new(c, c, c)
GBLoc.Position = posit + Vector3.new(x,y,z)
swait()
end
for i = 1,40 do
	GBLoc.Position = posit + Vector3.new(x,y,z)
	swait()
end

GasterB.Anchored = true
zxc.MeshId = "rbxassetid://2649597177"
swait()
zxc.MeshId = "rbxassetid://2649610132"
swait()
Fire.SoundId = "rbxassetid://340722848"
Fire.Volume = 1
Fire.PlayOnRemove = true
Fire.Pitch = pitch2
Fire:Destroy()
Beam2(GasterB,lasercolor,lasersize,posit)
zxc.MeshId = "rbxassetid://2649605211"
swait()
zxc.MeshId = "rbxassetid://2649590388"

wait(0.5)
local t = size
for i = 1,20 do
t = t - (size/20)
	zxc.Scale = Vector3.new(t, t, t)
	GasterB.CFrame = GasterB.CFrame*CFrame.new(0,0,5)
	swait()
end
GasterB:Destroy()
end)
end

padebounce = false
debounce = true

function BoneObstacle()
rapid2 = true
local bonehit2nd = Instance.new("Sound",mp)
bonehit2nd.SoundId = "rbxassetid://401680588"
bonehit2nd.Volume = 0.2
bonehit2nd:Play()
while rapid2 == true and wait(0.05) do
  if Character.HumanoidRootPart.Velocity.y < 1 and hitfloor == nil then
  for i = 1,4 do
  local bone = Instance.new("Part",Character)
                           bone.Touched:connect(function(hit)
 
       
						if hit.Parent == Character then return end
       
				for i,v in pairs(hit.Parent:GetChildren()) do
					if v:IsA("Humanoid") then
              padebounce = true
            if padebounce == true then
              padebounce = false
             
						v.Health = v.Health-2
              wait()
              padebounce = true
              end
              
        
					end
            end
          
end)
  bone.CanCollide = false
  bone.Material = "SmoothPlastic"
  bone.BrickColor = BrickColor.new("White")
  bone.Anchored = true
  bone.CFrame = (mp.CFrame + Vector3.new(math.random(-25,25),-8,math.random(-25,25))) * CFrame.fromEulerAnglesXYZ(math.random(0,math.rad(0)),math.random(0,math.rad(0)),math.random(0,math.rad(0)))
   local zxc = Instance.new("SpecialMesh",bone)
zxc.MeshType = "FileMesh"
zxc.Scale = Vector3.new(0.03, 0.03, 0.03)
zxc.MeshId = "http://www.roblox.com/asset/?id=921085633"
wait() 
  
local gdisp = coroutine.wrap(function()
for i = 1,5 do
	bone.CFrame = bone.CFrame*CFrame.new(0,1,0)
	swait()
end
local bonehit3nd = Instance.new("Sound",mp)
bonehit3nd.SoundId = "rbxassetid://306247749"
bonehit3nd.Volume = 1
bonehit3nd:Play()
      wait(0.2)
for i = 1,240 do
bone.CFrame = bone.CFrame*CFrame.new(0,0,-1)
bone.Transparency = i/240
swait()
end
bone:Destroy()
end)
gdisp()
end
end
end
  end

function BoneProjectile()
rapid = true
while rapid == true and wait(0.1) do
local bone = Instance.new("Part",Character)
bone.Touched:connect(function(hit)


if hit.Parent == Character then return end

for i,v in pairs(hit.Parent:GetChildren()) do
if v:IsA("Humanoid") then
padebounce = true
if padebounce == true then
padebounce = false

v.Health = v.Health-2
wait()
padebounce = true
end


end
end

end)

bone.CFrame = mp2.CFrame
bone.CanCollide = false
bone.Material = "SmoothPlastic"
bone.BrickColor = BrickColor.new("White")
bone.Anchored = true
bone.CFrame = (mp2.CFrame + Vector3.new(math.random(-50,50)/10,math.random(20,40)/10,math.random(-50,50)/10)) * CFrame.fromEulerAnglesXYZ(math.rad(-90),math.random(0,math.rad(0)),math.random(0,math.rad(0)))
local zxc = Instance.new("SpecialMesh",bone)
zxc.MeshType = "FileMesh"
zxc.Scale = Vector3.new(0.01, 0.01, 0.01)
zxc.MeshId = "http://www.roblox.com/asset/?id=921085633"
wait() 
Pointing()
local gdisp = coroutine.wrap(function()
coroutine.wrap(function()
for i = 1,30 do
local fx = Instance.new("Part",Effects)
fx.Anchored = true
fx.Color = Color3.new(0,0.6,0.5)
fx.CanCollide = false
fx.FormFactor = 3
fx.Name = "Shockwave"
fx.Material = "Neon"
fx.Size = Vector3.new(1, 1, 1)
fx.Transparency = 0.35
fx.TopSurface = 0
fx.BottomSurface = 0
fx.CFrame = bone.CFrame
fx.CFrame = fx.CFrame * CFrame.new(0,0,0) * CFrame.Angles(math.rad(math.random(-3600,3600)/10),math.rad(math.random(-360,-360)/10),math.rad(math.random(-3600,3600)/10))
local fxm = Instance.new("SpecialMesh", fx)
fxm.Scale = Vector3.new(0,0,0)
fxm.Offset = Vector3.new(0,0,0)
fxm.MeshType = "Sphere"
spawn(function()
	for i = 1, 15, 1 do
		fxm.Scale = Vector3.new(0.25 - i*0.00416,.5  - i*0.0083 ,0.25 - i*0.00416)
		fx.CFrame = fx.CFrame * CFrame.new(0,0.5,0)
		fx.Transparency = i/15
		swait()
	end
	wait()
	fx:Destroy()
end)
end
end)()
local bonehit3nd = Instance.new("Sound",mp)
bonehit3nd.SoundId = "rbxassetid://306247749"
bonehit3nd.Volume = 1
bonehit3nd:Play()
for i = 1,120 do
bone.CFrame = bone.CFrame*CFrame.new(0,1.5,0)
bone.Transparency = i/120
local fx = Instance.new("Part",Effects)
fx.Anchored = true
fx.Color = Color3.new(0,0.6,0.5)
fx.CanCollide = false
fx.FormFactor = 3
fx.Name = "Shockwave"
fx.Material = "Neon"
fx.Size = Vector3.new(1, 1, 1)
fx.Transparency = 0.35
fx.TopSurface = 0
fx.BottomSurface = 0
fx.CFrame = bone.CFrame
fx.CFrame = fx.CFrame * CFrame.new(0,0,0) * CFrame.Angles(math.rad(math.random(-3600,3600)/10),math.rad(math.random(-360,-360)/10),math.rad(math.random(-3600,3600)/10))
local fxm = Instance.new("SpecialMesh", fx)
fxm.Scale = Vector3.new(0,0,0)
fxm.Offset = Vector3.new(0,0,0)
fxm.MeshType = "Sphere"
spawn(function()
	for i = 1, 15, 1 do
		fxm.Scale = Vector3.new(0.25 - i*0.00416,0.25 - i*0.00416,0.25 - i*0.00416)
		fx.Transparency = i/15
		swait()
	end
	wait()
	fx:Destroy()
end)
swait()
end
bone:Destroy()
end)
gdisp()
end
end

function BoneRise()

local rng3 = Instance.new("Part",Effects)
rng3.Anchored = true
rng3.Color = Color3.new(1,0,0)
rng3.CanCollide = false
rng3.Material = "Neon"
rng3.FormFactor = 3
rng3.Name = "Shockwave"
rng3.Size = Vector3.new(1, 1, 1)
rng3.Transparency = 0
rng3.TopSurface = 0
rng3.BottomSurface = 0
rng3.CFrame = CFrame.new(mousep) * CFrame.new(0,-0.45,0)
local rngm3 = Instance.new("SpecialMesh", rng3)
rngm3.Scale = Vector3.new(0, 0, 0)
rngm3.Offset = Vector3.new(0,0.5,0)
rngm3.MeshType = "Sphere"

spawn(function()
	for i = 1, 20 do
		rngm3.Scale = Vector3.new(6 + i*0.25,0.01,6 + i*0.25)
		rng3.Transparency = rng3.Transparency + 0.025
		swait()
	end
	wait(0.2)
	for i = 1, 10 do
		rngm3.Scale = Vector3.new(11 - i*0.25,0.01 + i*2,11 - i*0.25)
		rng3.Transparency = rng3.Transparency + 0.05
		swait()
	end
	wait()
	rng3:Destroy()
end)
local bonehit2nd = Instance.new("Sound",rng3)
bonehit2nd.SoundId = "rbxassetid://401680588"
bonehit2nd.Volume = 0.2
bonehit2nd:Play()
for i = 1,20 do
local bone = Instance.new("Part",Character)
bone.Touched:connect(function(hit)


if hit.Parent == Character then return end

for i,v in pairs(hit.Parent:GetChildren()) do
if v:IsA("Humanoid") then
padebounce = true
if padebounce == true then
padebounce = false

v.Health = v.Health-0.5
wait(.2)
padebounce = true
end


end
end

end)
bone.CanCollide = false
bone.Material = "SmoothPlastic"
bone.BrickColor = BrickColor.new("White")
bone.Anchored = true
bone.CFrame = CFrame.new(mousep) * CFrame.new(math.random(-10,10)/10,-8,math.random(-10,10)/10) * CFrame.fromEulerAnglesXYZ(math.random(-5,5)/10,math.random(-5,5)/10,math.random(-5,5)/10)
local zxc = Instance.new("SpecialMesh",bone)
zxc.MeshType = "FileMesh"
zxc.Scale = Vector3.new(0.03, 0.03, 0.03)
zxc.MeshId = "http://www.roblox.com/asset/?id=921085633"
local gdisp = coroutine.wrap(function()
local bonehit3nd = Instance.new("Sound",bone)
wait(0.8)
bonehit3nd.SoundId = "rbxassetid://306247749"
bonehit3nd.Volume = 1
bonehit3nd:Play()
for i = 1,5 do
	bone.CFrame = bone.CFrame*CFrame.new(0,1.8,0)
	swait()
end
for i = 1,5 do
	bone.CFrame = bone.CFrame*CFrame.new(0,-0.1,0)
	swait()
end
      wait(0.8)
for i = 1,5 do
	bone.CFrame = bone.CFrame*CFrame.new(0,-0.8,0)
	swait()
end
bone:Destroy()
end)
gdisp()
end
end

function GBShoot()
rapid3 = true
while rapid3 == true and wait(0.2) do
local GasterB = Instance.new("Part",Effects)
GasterB.Touched:connect(function(hit)


if hit.Parent == Character then return end

for i,v in pairs(hit.Parent:GetChildren()) do
if v:IsA("Humanoid") then
padebounce = true
if padebounce == true then
padebounce = false

v.Health = v.Health-0.5
wait(.2)
padebounce = true
end


end
end

end)

GasterB.CFrame = rootPart.CFrame
GasterB.CanCollide = false
GasterB.Material = "SmoothPlastic"
GasterB.BrickColor = BrickColor.new("White")
local zxc = Instance.new("SpecialMesh",GasterB)
zxc.MeshType = "FileMesh"
zxc.Scale = Vector3.new(1, 1, 1)
zxc.MeshId = "rbxassetid://2649585735"
Pointing()
spawn(function()

local GBPoint = Instance.new("BodyGyro")
GBPoint.Parent = GasterB
GBPoint.D = 2000
GBPoint.P = 2000000
GBPoint.MaxTorque = Vector3.new(400000000,400000000,400000000)
local Fire = Instance.new("Sound",GasterB)
local Charge = Instance.new("Sound",GasterB)

local GBLoc = Instance.new("BodyPosition",GasterB)
GBLoc.D = 2000
GBLoc.P = 200000
GBLoc.MaxForce = Vector3.new(40000, 40000, 40000)
Charge.SoundId = "rbxassetid://482211201"
Charge.Volume = 1
Charge.PlayOnRemove = true
Charge:Destroy()
local x = math.random((math.random(-250,-200)),(math.random(200,250)))/10
local y = (math.random(30,60)/10)
local z = math.random((math.random(-250,-200)),(math.random(200,250)))/10
local c = 0
local posit = rootPart.Position
for i = 1,15 do
c = c + 0.1
zxc.Scale = Vector3.new(c, c, c)
GBPoint.cframe = CFrame.new(GasterB.Position,Mouse.Hit.Position)
GBLoc.Position = posit + Vector3.new(x,y,z)
swait()
end
for i = 1,20 do
GBPoint.cframe = CFrame.new(GasterB.Position,Mouse.Hit.Position)
	GBLoc.Position = posit + Vector3.new(x,y,z)
	swait()
end

GasterB.Anchored = true
zxc.MeshId = "rbxassetid://2649597177"
swait()
zxc.MeshId = "rbxassetid://2649610132"
swait()
Fire.SoundId = "rbxassetid://340722848"
Fire.Volume = 5
Fire.PlayOnRemove = true
Fire:Destroy()
Beam(GasterB,Color3.new(1,1,1),5)
zxc.MeshId = "rbxassetid://2649605211"
swait()
zxc.MeshId = "rbxassetid://2649590388"



wait(1)
local t = 1.5
for i = 1,20 do
t = t - 0.075
	zxc.Scale = Vector3.new(t, t, t)
	GasterB.CFrame = GasterB.CFrame*CFrame.new(0,0,5)
	swait()
end
GasterB:Destroy()
end)
end
end

function RandomGBs()
local r = math.random(1,6)
local location = mouse.Hit.p
if r == 1 then
GasterBlaster(location,35,3.5,0,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,-35,3.5,0,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,0,5,35,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,0,3.5,-35,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,20,3.5,20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,-20,3.5,-20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,-20,3.5,20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,20,3.5,-20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
elseif r == 2 then
GasterBlaster(location,35,3.5,0,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,-35,3.5,0,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,0,5,35,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,0,3.5,-35,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
elseif r == 3 then
GasterBlaster(location,20,3.5,20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,-20,3.5,-20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,-20,5,20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,20,3.5,-20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
elseif r == 4 then
GasterBlaster(location,0,8,40,3,Color3.new(1,1,1),12,1,1,0,(math.huge),0)
GasterBlaster(location,0,8,-40,3,Color3.new(1,1,1),12,1,1,0,(math.huge),0)
elseif r == 5 then
GasterBlaster(location,40,8,0,3,Color3.new(1,1,1),12,1,1,0,(math.huge),0)
GasterBlaster(location,-40,8,0,3,Color3.new(1,1,1),12,1,1,0,(math.huge),0)
elseif r == 6 then
GasterBlaster(location,0,8,40,3,Color3.new(1,1,1),12,1,1,0,(math.huge),0)
GasterBlaster(location,0,8,-40,3,Color3.new(1,1,1),12,1,1,0,(math.huge),0)
GasterBlaster(location,40,8,0,3,Color3.new(1,1,1),12,1,1,0,(math.huge),0)
GasterBlaster(location,-40,8,0,3,Color3.new(1,1,1),12,1,1,0,(math.huge),0)
end
end

function ArrangedGBs()
debouncing = true
local location = mouse.Hit.p
GasterBlaster(location,20,5,20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,-20,5,-20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,-20,5,20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,20,5,-20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
wait(1)
GasterBlaster(location,35,5,0,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,-35,5,0,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,0,5,35,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,0,5,-35,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
wait(1)
GasterBlaster(location,20,5,20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,-20,5,-20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,-20,5,20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
GasterBlaster(location,20,5,-20,1.5,Color3.new(1,1,1),2,1,1,0,(math.huge),0)
wait(1)
GasterBlaster(location,35,5,0,1.5,Color3.new(1,1,1),1,1,1,0,(math.huge),0)
GasterBlaster(location,-35,5,0,1.5,Color3.new(1,1,1),1,1,1,0,(math.huge),0)
GasterBlaster(location,0,5,35,1.5,Color3.new(1,1,1),1,1,1,0,(math.huge),0)
GasterBlaster(location,0,5,-35,1.5,Color3.new(1,1,1),1,1,1,0,(math.huge),0)
GasterBlaster(location,20,5,20,1.5,Color3.new(1,1,1),1,1,1,0,(math.huge),0)
GasterBlaster(location,-20,5,-20,1.5,Color3.new(1,1,1),1,1,1,0,(math.huge),0)
GasterBlaster(location,-20,5,20,1.5,Color3.new(1,1,1),1,1,1,0,(math.huge),0)
GasterBlaster(location,20,5,-20,1.5,Color3.new(1,1,1),1,1,1,0,(math.huge),0)
wait(1)
GasterBlaster(location,0,5,40,3,Color3.new(1,1,1),12,1,1,0,(math.huge),0)
GasterBlaster(location,0,5,-40,3,Color3.new(1,1,1),12,1,1,0,(math.huge),0)
wait(1)
debouncing = false
end

function Grab()
grabbing = true
local hit = mouse.Target
if hit.Parent == Character then return end
if not hit.Parent:IsA("Model") or not hit.Parent:findFirstChild("Torso") or not hit.Parent:findFirstChild("HumanoidRootPart") then return end
S = Instance.new("Sound")
S.Parent = hit.Parent.Torso
S.SoundId = "rbxassetid://548991605"
S.Volume = 10
S.Looped = false
S.Pitch = 1
S:Play()

local GUI = Instance.new("BillboardGui",hit.Parent.HumanoidRootPart)
GUI.Size = UDim2.new(2,0,2,0)
GUI.MaxDistance = "inf"
GUI.AlwaysOnTop = true
GUI.ExtentsOffset = Vector3.new(0,0,0)

local Body = Instance.new("ImageLabel",GUI)
Body.Position = UDim2.new(0,0,0,0)
Body.Image = "rbxassetid://338425795"
Body.BackgroundTransparency = 1
Body.ImageTransparency = 0
Body.Size = UDim2.new(1,0,1,0)

local grabfire = Instance.new("Fire",hit.Parent.HumanoidRootPart)
grabfire.Size = 2
grabfire.Heat = 0
grabfire.Color = Color3.new(0,0,255)
grabfire.SecondaryColor = Color3.new(0,250,255)

local bodyp=Instance.new("BodyPosition",hit.Parent.HumanoidRootPart)
bodyp.MaxForce=Vector3.new(math.huge,math.huge,math.huge)

		coroutine.resume(coroutine.create(function()
        repeat
Expression.Texture = "rbxassetid://4484422735"
wait()
Expression.Texture = "rbxassetid://4484448817"
        until grabbing == false
        end))
while grabbing == true do
bodyp.Position= mouse.Hit.p
swait()
end
Expression.Texture = "rbxassetid://4484405390"
grabfire:Destroy()
bodyp:Destroy()
GUI:Destroy()
  end

dodging = false
candodge = true
canblock = false
blocking = false
talking = false
dialogue = 1
dialogue2 = 1
speech2 = {"i gotta say, i don't really understand why you're doing this.", "especially when you could've taken a greener path.", --1,2
	"you may not even have a reason to begin with anymore.", "you are probably doing it for kicks and giggles at this point.", --3, 4
	"speaking of which...", "your face... is a little unpleasant to look at.", "you're kind of a freak, y'know?", --5,6,7
	"y'know, looking back at it now...", "it seems like ive spent most of my life in this very place.", "it's not like i had any choice either.", "seeing what came next, i couldn't afford not to care anymore.", --8,9,10
	"but it seems as if it's not even a surprise anymore...", "after all, our lives are basically at your disposal.", --11,12
	"like as if we're puppets or somethin'.", "it's like our lives don't even matter to you.", "we're, uh, more than just punching bags y'know?", --13, 14, 15
	"what if someone else had your abilities?", "would they be as twisted as you are?", "would they try to find a more peaceful way to deal with everything?", "hell if i know.", --16, 17, 18
	"look kid.", "i tried to be good even with your actions.", "but i did not see any sign of good in you.", -- 19, 20, 21
	"kids your age would probably play with their friends outside.", "however, the only thing that sticks with you is that weapon.", "...", "you may have a sharp aim, but you dont have such a sharp mind.", -- 22, 23, 24, 25
	"hey, I always wondered...", "why do we even give ya the chance to dodge our attacks anyway?", "just think about it!", "everything would've been way easier if I just cornered you somewhere.", "and kill you right where you stood.", "but its not like i didnt try killing you before, did i?", "well, it doesn't really matter.", -- 26, 27, 28, 29, 30, 31, 32 (7 lines)
	"is this the only time i have talked to you about this?", "come to think of it, if i got this information from 'g' this time..", "it could probably happen again.", "hey, i don't know for sure but...", "whats stopping it from happening once again?", -- 33, 34, 35, 36, 37
	"...", "this is why i never make promises, old lady.", "because i can never guarantee i can keep that promise in the first place.", -- 38, 39, 40
	"you made a big mistake by even coming here.", "again, there is no reward.", "reaching the end will bring you nothing too exciting.", "it would be easier for the both of us if you just give up.", -- 41, 42, 43, 44
	"you're really just wasting your time at this point.", "give up. there is nothing interesting after this.", --45, 46
	"i mean it, kid. there is nothing after this.", "don't go any further.", "unless you want to see what comes next, of course.", "it comes with a risk, i'll assure that.", --47, 48, 49, 50
	"of course. you never give up.", "after all, you didn't come this far by giving up", "it's a shame that you're so determined to do such crimes.", "...", "actually, crime is a bit of an understatement for what you have done.",--51, 52, 53, 54, 55
	"*huff* ...", "this is taking a little longer than I wanted it to.", "anyways, kid. are you prepared for what comes next?", "are you ready for one of the hardest times you ever had in a battle?", "ready or not, i don't care.", "survive this turn, and, well...", "you're gonna find out for yourself.",--56, 57, 58, 59, 60, 61, 62 (7 lines)
	"*huff* ... *puff* ...", "huh? you're not dead yet, are you?", "i shouldn't be surprised.", "oh well, are you ready for what is coming now?", "i promise it won't be pleasant, and it won't be quick either.", "not like i care anyway.", "well... here goes nothing.", "oh, and one more thing...", "YOU ASKED FOR IT."--63,64,65,66,67,68,69,70,71 (9 lines)
}
speech = {"heh heh heh... you should've known by now that i'm not gonna stand there and take it, right?", --1
	"y'know...", --2
	"up until now, i never truly knew what you were doing...", --3
	"i could only guess it by the expression that you've shown every other day.", --4, 5
	"but now... you can say i've been daydreaming a lot recently.", --6, 7
	"i kept hallucinating at my sentry post today", "and i kept getting these feelings of stress.",--8
	"it was about this... 'g'.", "he told me about, well, everything that i know now.", --9, 10
	"what you have done, your 'objectives'...", -- 11
	"it all adds up to something, y'know?", -- 12
	"and that something is,", "the fact that you have done this more than once.", --13
	"speaking of repetition...", "you certainly are a little bored, aren't you?", -- 14, 15
	"welp, are you ready to see something new?", "not that i'm braggin but, i've got some new magic tricks...", -- 16, 17
	"that can 'possibly' entertain you...", "or that can cost you a few lives.", -- 18,19
	"ready?", "welp, i don't care what your answer is, anyways.", "here", "goes", "nothing.", "...", "...", -- 20, 21, 22, 23, 24, 25, 26
	"*sigh*", "why are you doing this?", --27,28
	"what could possibly motivate you to repeatedly slaughter us?", --29
	"are we really that much of a nuisance for you?", --30
	"or perhaps someone right here is as empty inside as one of my ketchup bottles..?", --31
	"*huff* no response huh?", "welp", "it's not like you do the talking around here.", --32
	"brace yourself, cause this is gonna be a looong one.", --33
	"what do you have to gain by doing this?", "let alone re-doing this!", --34
	"i just don't see where your going with this...", --35
	"i just don't understand...", "what is the 'objective' in all this?", "...", "where is the reward in all this?", --36
	"we could've lived a happy life you know?", "one where we could've had some bad jokes...", "one where could have some hotdogs together...", "one where, maybe i... was a little happier...", "oh, who am i kidding...", --37
	"that's just wishful thinking.", --38
	"well, are you prepared for what comes next?", --39
	"because it's not gonna be pleasant.", --40
	"and don't expect it to be my 'special attack'.",--41
	"because...",--42
	"i'll make sure you don't pull that trick on me again.",--43
	"welp here goes nothing.",--44
	"*huff*... *puff*...",--45
	"...",--46
	"you're really making this difficult, y'know?", "...", "trust me, kid...", --47,48,49
	"there is no reward.", "aleast not as a result", "of killing monsters.", "they weren't your enemy.", "y'know?", --50,51,52,53,54,55
	"you could've solved your beefs...", "in a better way,", "y'know?", "...", "as i should...", "...", "look, kid.", "i know that i can't beat you.", "atleast not permanetly.", "i would end up exhausting myself and eventually, well...", "...", "'bite the dust'.", "...", --56,57,58,59,60,61,62,63,64,65,66,67,68 (aka 13 lines of dialogue)
"have i told you that, there is a better way to uh, 'finish the game'?", "as i said, they weren't your enemy.", "they were just like you when you first came here.", "trapped in this mountain, hoping that one day...", "they would finally see the sun.", "as crazy as this sounds to you...", "you can spare them. you can help them.", "you can even become their friend.", "so, hey! why not have a good start at it?", "let's just say it would be nice for a change.", "so, what do you say?"}

function chatfunc(text)
local chat = coroutine.wrap(function()
if Character:FindFirstChild("textboard")~= nil then
Character:FindFirstChild("textboard"):destroy()
end
if Character:FindFirstChild("glitchboard")~= nil then
Character:FindFirstChild("glitchboard"):destroy()
end
local naeeym2 = script.textboard:Clone()
naeeym2.Parent = Character
naeeym2.StudsOffset = Vector3.new(0,3,0)
naeeym2.Adornee = Character.Head
naeeym2.Enabled = true
local naeeym3 = script.glitchboard:Clone()
naeeym3.Parent = Character
naeeym3.StudsOffset = Vector3.new(0,3,0)
naeeym3.Adornee = Character.Head
naeeym3.Enabled = true
local tecks2 = naeeym2.TextLabel
tecks2.Text = ""
for i = 1,string.len(text),1 do
local heh = CreateSound("2469886818", Head, 5, 1)
tecks2.Text = string.sub(text,1,i)
if i ~= string.len(text) then
				local ADD = string.sub(text,i,i)
				if ADD == "." or ADD == "?" or ADD == "!" then
					wait(0.4)
				elseif ADD == "," then
					wait(0.2)
				else
				end
			end
wait(0.01)
end

wait(2)
naeeym2:Destroy()
naeeym3:Destroy()
end)
chat()
end
local skipnum = 1
local nochat = false
local MSG
function onChatted(msg)
if string.sub(string.lower(msg), 1, 3) == "/e " then
msg = string.sub(msg, 4)
nochat = true
wait(1)
nochat = false
end
if string.sub(string.lower(msg), 1, 5) == "skip/" then
MSG = string.sub(msg, 6)
if MSG == "0" then
	print("You can't do that.")
    else
	skipnum = MSG
	 dialogue = skipnum
	print(dialogue)
end
end
if nochat == false then
chatfunc("* "..msg)
end
end
Player.Chatted:connect(onChatted)
function WWeld(a, b, acf)
    local we = Instance.new("Weld", a)
    we.Part0 = a
    we.Part1 = b
if acf ~= nil then
    we.C0 = acf
end
return we
end

local Bbone = Instance.new("Part",Character)
  Bbone.CanCollide = false
  Bbone.Material = "SmoothPlastic"
  Bbone.BrickColor = BrickColor.new("White")
  Bbone.Anchored = false
  Bbone.Transparency = 1
local BoneHandle = WWeld(Bbone,Left_Arm,CFrame.new(0,-0.98,1)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)))
   local zxc = Instance.new("SpecialMesh",Bbone)
zxc.MeshType = "FileMesh"
zxc.Scale = Vector3.new(0.012, 0.012, 0.012)
zxc.MeshId = "http://www.roblox.com/asset/?id=921085633"

function blocked()
	Animations = true
coroutine.wrap(function()
for i = 1,30 do
Bbone.Transparency = Bbone.Transparency - 0.034
local fx = Instance.new("Part",Effects)
fx.Anchored = true
fx.Color = Color3.new(0,0.6,0.5)
fx.CanCollide = false
fx.FormFactor = 3
fx.Name = "Shockwave"
fx.Material = "Neon"
fx.Size = Vector3.new(1, 1, 1)
fx.Transparency = 0.35
fx.TopSurface = 0
fx.BottomSurface = 0
fx.CFrame = Bbone.CFrame
fx.CFrame = fx.CFrame * CFrame.new(0,0,0) * CFrame.Angles(math.rad(math.random(-3600,3600)/10),math.rad(math.random(-360,-360)/10),math.rad(math.random(-3600,3600)/10))
local fxm = Instance.new("SpecialMesh", fx)
fxm.Scale = Vector3.new(0,0,0)
fxm.Offset = Vector3.new(0,0,0)
fxm.MeshType = "Sphere"
spawn(function()
	for i = 1, 15, 1 do
		fxm.Scale = Vector3.new(0.25 - i*0.00416,.5  - i*0.0083 ,0.25 - i*0.00416)
		fx.CFrame = fx.CFrame * CFrame.new(0,0.5,0)
		fx.Transparency = i/15
		swait()
	end
	wait()
	fx:Destroy()
end)
end
end)()
	for i = 0,0.08,0.01 do
RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.5, 0.5 + math.sin(sine/7.5)/15, 0) * c_angles(math.rad(0),math.rad(0),math.rad(0)), 0.15)
LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.5, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(90),math.rad(-90),math.rad(0)), 0.15)
LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5, -1.05 - math.sin(sine/7.5)/5, 0) * c_angles(math.rad(0),math.rad(0),math.rad(-10)), 0.15)
RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5, -1.05 - math.sin(sine/7.5)/5 , 0) * c_angles(math.rad(0),math.rad(0),math.rad(10)), 0.15)
Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(0, -1 + math.sin(sine/7.5)/15, 0) * c_angles(math.rad(0), math.rad(0),math.rad(0)), 0.15)
Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0, 1.5 - math.sin(sine/15)/15, 0) * c_angles(math.rad(-10),math.rad(0), math.rad(0)), 0.15)
swait()
	end
	wait(0.5)
	Bbone.Transparency = 1
		Animations = false
end
function miss()
	Animations = true
	local number = math.random(1,3)
	if number == 1 then
		for i = 0,0.08,0.01 do
		RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(0),math.rad(0),math.rad(-120)), Sanim + 0.025)
		LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(0),math.rad(0),math.rad(120)), Sanim + 0.025)
		LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5 + math.sin(sine/15)/6, -1.05 - math.sin(sine/7.5)/5, 0) * c_angles(math.rad(0) - math.sin(sine/15)/5,math.rad(0),math.rad(-10)), Sanim)
		RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5 + math.sin(sine/15)/6, -1.05 - math.sin(sine/7.5)/5 , 0) * c_angles(math.rad(0) - math.sin(sine/15)/5,math.rad(0),math.rad(10)), Sanim)
		Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(-5 - math.sin(sine/15)/10, -0.95 + math.sin(sine/7.5)/5, -5) * c_angles(math.rad(17) + math.sin(sine/15)/10, math.rad(20),math.rad(0)), Sanim)
		Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0 - math.sin(sine/15)/6, 1.5, 0) * c_angles(math.rad(0) + math.sin(sine/7.5)/5,math.rad(-20), math.rad(0) + math.sin(sine/15)/4), Sanim)
         end
	     elseif number == 2 then
		 for i = 0,0.08,0.01 do
		RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(-20)), Sanim + 0.025)
		LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(20)), Sanim + 0.025)
		LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5 + math.sin(sine/15)/6, -1.05 - math.sin(sine/7.5)/5, 0) * c_angles(math.rad(0) - math.sin(sine/15)/5,math.rad(0),math.rad(-10)), Sanim)
		RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5 + math.sin(sine/15)/6, -1.05 - math.sin(sine/7.5)/5 , 0) * c_angles(math.rad(0) - math.sin(sine/15)/5,math.rad(0),math.rad(10)), Sanim)
		Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(-5 - math.sin(sine/15)/10, -0.95 + math.sin(sine/7.5)/5, -5) * c_angles(math.rad(17) + math.sin(sine/15)/10, math.rad(20),math.rad(0)), Sanim)
		Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0 - math.sin(sine/15)/6, 1.5, 0) * c_angles(math.rad(0) + math.sin(sine/7.5)/5,math.rad(-20), math.rad(0) + math.sin(sine/15)/4), Sanim)
         end
	     elseif number == 3 then
		 for i = 0,0.08,0.01 do
		RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(-20)), Sanim + 0.025)
		LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(20)), Sanim + 0.025)
		LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5 + math.sin(sine/15)/6, -1.05 - math.sin(sine/7.5)/5, 0) * c_angles(math.rad(0) - math.sin(sine/15)/5,math.rad(0),math.rad(-10)), Sanim)
		RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5 + math.sin(sine/15)/6, -1.05 - math.sin(sine/7.5)/5 , 0) * c_angles(math.rad(0) - math.sin(sine/15)/5,math.rad(0),math.rad(10)), Sanim)
		Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(5 - math.sin(sine/15)/10, -0.95 + math.sin(sine/7.5)/5, 5) * c_angles(math.rad(17) + math.sin(sine/15)/10, math.rad(-20),math.rad(0)), Sanim)
		Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0 - math.sin(sine/15)/6, 1.5, 0) * c_angles(math.rad(0) + math.sin(sine/7.5)/5,math.rad(20), math.rad(0) + math.sin(sine/15)/4), Sanim)
		 end
	end
	Animations = false
end
specialattack = false

function block()
	if blocking == true then
		talking = false
	else
		talking = true
	end
	blocking = true
		coroutine.resume(coroutine.create(function()
	if talking == true then
		if dialogue2 ~= 1 and dialogue2 ~= 3 and dialogue2 ~= 5 and dialogue2 ~= 8 and dialogue2 ~= 11 and dialogue2 ~= 13 and dialogue2 ~= 16 and dialogue2 ~= 19 and dialogue2 ~= 19 and dialogue2 ~= 22 and dialogue2 ~= 26 and dialogue2 ~= 33 and dialogue2 ~= 38 and dialogue2 ~= 41 and dialogue2 ~= 45 and dialogue2 ~= 47 and dialogue2 ~= 50 and dialogue2 ~= 55 and dialogue2 ~= 63 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 1 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 3 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 5 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 8 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 11 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 13 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 16 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 19 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 22 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 26 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 33 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 38 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 41 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 45 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 47 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 50 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 55 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		blocking = false
		elseif dialogue2 == 63 then
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(3)
		chatfunc(speech2[dialogue2])
		dialogue2 = dialogue2 + 1
		wait(5)
		canblock = false
		end
		end
		end))
		blocked()
end
function dodge()
	if dodging == true then
		talking = false
	else
		talking = true
	end
	dodging = true
		coroutine.resume(coroutine.create(function()
	if talking == true then
		if dialogue ~= 20 and dialogue ~= 27 and dialogue ~= 43 and dialogue ~= 44 and dialogue ~= 47 and dialogue ~= 50 then
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(5)
		dodging = false
		elseif dialogue == 20 then
			themeMoos:Pause()
			themeMoos2:Play()
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(4)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(6)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
	bosschatfunc("* Sans isn't sparing you this time.",BrickColor.new("Institutional white").Color,120)
	wait(5)
		dodging = false
		elseif dialogue == 27 then
			themeMoos2:Stop()
			themeMoos:Resume()
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(4)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(8)
		dodging = false
		elseif dialogue == 43 then
		script.textboard.TextLabel.TextColor3 = Color3.new(255,0,0)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		script.textboard.TextLabel.TextColor3 = Color3.new(255,255,255)
		wait(5)
		dodging = false
		elseif dialogue == 44 then
		script.textboard.TextLabel.TextColor3 = Color3.new(255,0,0)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(6)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(6)
		script.textboard.TextLabel.TextColor3 = Color3.new(255,255,255)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(5)
		dodging = false
		elseif dialogue == 47 then
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(4)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		script.textboard.TextLabel.TextColor3 = Color3.new(255,0,0)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		script.textboard.TextLabel.TextColor3 = Color3.new(255,255,255)
		wait(5)
		dodging = false
		elseif dialogue == 50 then
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		script.textboard.TextLabel.TextColor3 = Color3.new(255,0,0)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		script.textboard.TextLabel.TextColor3 = Color3.new(255,255,255)
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		specialattack = true
		wait(5)
		candodge = false
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		chatfunc(speech[dialogue])
		dialogue = dialogue + 1
		wait(3)
		end
	end
	end))
	miss()
end
mouse.Button1Down:connect(function()
Grab()
end)

mouse.Button1Up:connect(function()
grabbing = false
end)

mouse.KeyUp:connect(function(key)
if key == "f" then
rapid2 = false
end

if key == "r" then
rapid = false
end

if key == "q" and debounce == true then
rapid3 = false
end
end)

mouse.KeyDown:connect(function(key)
if key == "f" then
BoneObstacle()
end

if key == "e" then
teleport()
end

if key == "l" and Death == false then
Dead()
end

if key == "p" and Death2 == false then
Dead2()
end

if key == "z" then
Start()
end

if key == "r" then
BoneProjectile()
end

if key == "c" then
BoneRise()
end

if key == "x" then
idle = 2500
end

if key == "q" and debounce == true then
GBShoot()
end

if key == "g" and debounce == true then
RandomGBs()
end

if key == "v" and debounce == true and debouncing == false then
ArrangedGBs()
end
end)



coroutine.wrap(function()
while true do 
if currentAnim == "Idling" and attack == false and attack2 == false then
idle=idle+1
swait()
else
idle=idly
swait()
end
end
end)()
local candie = false
local Zzz = Instance.new("ParticleEmitter",Head)
Zzz.EmissionDirection = "Left"
Zzz.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.3,0),NumberSequenceKeypoint.new(1,1)})
Zzz.LightEmission = 1
Zzz.Rate = 1
Zzz.ZOffset = 1
Zzz.Lifetime = NumberRange.new(2)
Zzz.Speed = NumberRange.new(2)
Zzz.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.6, 0.3), NumberSequenceKeypoint.new(1, 0.2, 0.1)})
Zzz.Rotation = NumberRange.new(0, 0)
Zzz.RotSpeed = NumberRange.new(30, 30)
Zzz.Texture = "http://www.roblox.com/asset/?id=386098098"
Zzz.Color = ColorSequence.new(Color3.new(1,1,1),Color3.new(1,1,1))
Zzz.VelocitySpread = 360
Zzz.LockedToPart = false
Zzz.Acceleration = Vector3.new(0,5,0)
Zzz.Enabled = false
local Shields = Instance.new("Folder", Character)
Shields.Name = "workspace"
teleporting = false
restriction = false
coroutine.wrap(function()
while true and wait() do
if  dedebounce == false and attack == false then
if idle >= 2500  then
Sanim = 0.005
Expression.Texture = "rbxassetid://4484446057"
themeMoos.Volume = 0
if specialattack == true and candodge == false then
	specialattack = false
	Shields:FindFirstChild("Shield"):Destroy()
end
Zzz.Enabled = true
elseif idle >= 1500 and idle < 2500 and Death == false and Death2 == false then
Sanim = 0.01
themeMoos.Volume = 3
themeMoos.PlaybackSpeed = 0.5
Expression.Texture = "rbxassetid://4484447540"
elseif idle == idly and Death == false and Death2 == false then
Zzz.Enabled = false
if specialattack == false and candodge == false then
	specialattack = true
end
Expression.Texture = "rbxassetid://4484405390"
themeMoos.Volume = 5
Sanim = 0.025
themeMoos.PlaybackSpeed = 1
elseif idle >= 1500 and idle < 2500 and Death == true and Death2 == false then
Sanim = 0.01
themeMoos.Volume = 3
themeMoos.PlaybackSpeed = 0.5
Expression.Texture = "rbxassetid://1371827222"
elseif idle == idly and Death == true and Death2 == false then
Zzz.Enabled = false
Expression.Texture = "rbxassetid://4899271236"
themeMoos.Volume = 5
Sanim = 0.025
themeMoos.PlaybackSpeed = 1
elseif idle >= 1500 and idle < 2500 and Death2 == true then
Sanim = 0.01
themeMoos.Volume = 3
themeMoos.PlaybackSpeed = 0.5
Expression.Texture = "rbxassetid://1371827222"
elseif idle == idly and Death2 == true then
Zzz.Enabled = false
Expression.Texture = "rbxassetid://4239634623"
themeMoos.Volume = 5
Sanim = 0.025
themeMoos.PlaybackSpeed = 1
end
end
end
end)()
local respawning = false
local Deaths = 1
function refit()
	rootJoint.Parent = rootPart
	Neck.Parent = Torso
	Right_Shoulder.Parent = Torso
	Left_Shoulder.Parent = Torso
	Right_Hip.Parent = Torso
	Left_Hip.Parent = Torso
	rootPart.Parent = Character
	Left_Arm.Parent = Character
	Right_Arm.Parent = Character
	LA_Weld.Parent = Left_Arm
	RA_Weld.Parent = Right_Arm
	Torso_Weld.Parent = Torso
	Head_Weld.Parent = Head
	LL_Weld.Parent = Left_Leg
	RL_Weld.Parent = Right_Leg
	Right_Leg.Parent = Character
	Left_Leg.Parent = Character
	Torso.Parent = Character
	Head.Parent = Character
end

Humanoid.Died:Connect(function()
	if candie == false then
		if respawning == false then
		respawning = true
	Humanoid.Parent = nil
	refit()
	Humanoid.Parent = Character
	CreateSound("2783295579", Head, 7, 1)
	chatfunc("* Did you think I would go down that easily?")
	Deaths = Deaths + 1
	respawning = false
	end
	end
end)
local HARDMODE = false
function special()
	specialattack = true
while specialattack do
local Special = Instance.new ("MeshPart", Shields) Special.Name = "Special" Special.CanCollide = false Special.Transparency = 1 Special.Material = "Neon" Special.BrickColor = BrickColor.new("Really red") Special.Size = Vector3.new(12,12,12) Special.Massless = true Special.CFrame = Character.Torso.CFrame
local Wed = Instance.new("Weld", Special) Wed.Part0 = Special Wed.Part1 = Character.Torso
Special.Touched:connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") and hit.Parent ~= nil and hit.Parent.Name ~= Character.Name then
		if hit.Parent.HumanoidRootPart ~= false then
			Special:Remove()
				restriction = true
		teleporting = true
	hit.Parent.HumanoidRootPart.CFrame=rootPart.CFrame*CFrame.new(0,0,-25)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))
		CreateSound("446961725", Head, 7, 1)
	Humanoid.Health = Humanoid.MaxHealth
	idle=idly
	Expression.Texture = "rbxassetid://4484422735"
swait(15)
Expression.Texture = "rbxassetid://4484448817"
swait(25)
Expression.Texture = "rbxassetid://4484405390"
		end
	end
end)
            coroutine.resume(coroutine.create(function()
                wait(1)
                Special:remove()
            end))
      game:GetService("RunService").RenderStepped:wait()
end
end


game:GetService("RunService").Stepped:connect(function()
	Angle = (Angle % 100) + angleSpeed/10
	Axis = (Axis % 100) + axisSpeed/10
	local walkingMagnitude = Vector3.new(rootPart.Velocity.X, 0, rootPart.Velocity.Z).magnitude
	local jumpVel = Torso.Velocity.Y
	sine = change + sine

		for i,v in pairs(Character:GetChildren()) do
	if v:IsA('Accoutrement') then
		v:Destroy()
	end
end
if Deaths <= 100 then
	HARDMODE = true
end
if candodge == true and Humanoid.Health < Humanoid.MaxHealth then
	Humanoid.Health = Humanoid.MaxHealth
	dodge()
	idle=idly
end
if candodge == false and specialattack == true and Humanoid.Health < Humanoid.MaxHealth then
	Humanoid.Health = Humanoid.MaxHealth
end
if canblock == true and Humanoid.Health < Humanoid.MaxHealth then
	Humanoid.Health = Humanoid.MaxHealth
	block()
	idle=idly
end


if specialattack == true then
if Shields:FindFirstChild("Shield") == nil then
local Shield = Instance.new ("MeshPart", Shields) Shield.Name = "Shield" Shield.CanCollide = false Shield.Transparency = 1 Shield.Material = "Neon" Shield.BrickColor = BrickColor.new("Really red") Shield.Size = Vector3.new(12,12,12) Shield.Massless = true Shield.CFrame = Character.Torso.CFrame
local Wed = Instance.new("Weld", Shield) Wed.Part0 = Shield Wed.Part1 = Character.Torso
Shield.Touched:connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") and hit.Parent ~= nil and hit.Parent.Name ~= Character.Name then
		if hit.Parent.HumanoidRootPart ~= false then
			Shield:Destroy()
				restriction = true
		teleporting = true
	hit.Parent.HumanoidRootPart.CFrame=rootPart.CFrame*CFrame.new(0,0,-25)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))
		CreateSound("446961725", Head, 7, 1)
	Humanoid.Health = Humanoid.MaxHealth
	idle=idly
	Expression.Texture = "rbxassetid://4484422735"
swait(15)
Expression.Texture = "rbxassetid://4484448817"
swait(25)
Expression.Texture = "rbxassetid://4484405390"
		end
	end
  end)
end
if Shields:FindFirstChild("Shield2") == nil then
local Shield2 = Instance.new ("MeshPart", Shields) Shield2.Name = "Shield2" Shield2.CanCollide = false Shield2.Transparency = 1 Shield2.Material = "Neon" Shield2.BrickColor = BrickColor.new("Really red") Shield2.Size = Vector3.new(7,7,7) Shield2.Massless = true Shield2.CFrame = Character.Torso.CFrame
local Wed = Instance.new("Weld", Shield2) Wed.Part0 = Shield2 Wed.Part1 = Character.Torso
end
end


if Humanoid.Health < 100 and Death == false and Happened == false and candodge == false and specialattack == false then
	Happened = true
	Zzz.Enabled = false
	Dead()
end
if Humanoid.Health <= 150 and Death == true and Happened2 == false and canblock == false then
	Happened2 = true
	Dead2()
end
if Death == true then
			for _, c in pairs(Character:GetChildren()) do
		if c.ClassName == "Part" then
			if c.Transparency == 0 and c:FindFirstChild("Dust") == nil then
				particles(c)
			end
		end
		end
end
Left_Arm.BrickColor = BrickColor.new("Institutional white")
Right_Arm.BrickColor = BrickColor.new("Institutional white")
Left_Leg.BrickColor = BrickColor.new("Institutional white")
Right_Leg.BrickColor = BrickColor.new("Institutional white")
Torso.BrickColor = BrickColor.new("Institutional white")
Head.BrickColor = BrickColor.new("Institutional white")
Character['Body Colors'].HeadColor3=Color3.new(255,255,255)
Character['Body Colors'].TorsoColor3=Color3.new(255,255,255)
Character['Body Colors'].RightArmColor3=Color3.new(255,255,255)
Character['Body Colors'].LeftArmColor3=Color3.new(255,255,255)
Character['Body Colors'].RightLegColor3=Color3.new(255,255,255)
Character['Body Colors'].LeftLegColor3=Color3.new(255,255,255)
	if jumpVel > 1 then
		currentAnim = "Jumping"
	elseif Humanoid.Sit == true then
		currentAnim = "Seated"
	elseif jumpVel < -1 then
		currentAnim = "Falling"
	elseif walkingMagnitude < 2 then
		currentAnim = "Idling"
	elseif isSprinting == true then
		currentAnim = "Sprinting"
	elseif walkingMagnitude > 2 then
		currentAnim = "Walking"
	elseif isAttacking == true then
		currentAnim = "Attacking"
	end
	local WALKSPEEDVALUE = 6 / (Humanoid.WalkSpeed / 16)
local TiltVelocity = CFrame.new(rootPart.CFrame:vectorToObjectSpace(rootPart.Velocity/1.6))
	if currentAnim == "Jumping" and Animations == false then
		angleSpeed = 2
		axisSpeed = 2
		change = 0.5
		RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(-20)), 0.025)
		LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(20)), 0.025)
		LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5, -1, 0) * c_angles(math.rad(-15),math.rad(0),math.rad(0)), 0.15)
		RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5, -0.5, -0.5) * c_angles(math.rad(0),math.rad(0),math.rad(0)), 0.15)
		Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(0, -1, 0) * c_angles(math.rad(0), math.rad(0),math.rad(0)), 0.15)
		Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0, 1.5, 0) * c_angles(math.rad(20),math.rad(0), math.rad(0)), 0.15)
	elseif currentAnim == "Falling" and Animations == false then
		angleSpeed = 2
		axisSpeed = 2
		change = 0.5
		RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.5, 0.5, 0) * c_angles(math.rad(160),math.rad(0),math.rad(15)), 0.15)
		LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.5, 0.5, 0) * c_angles(math.rad(160),math.rad(0),math.rad(-15)), 0.15)
		LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5, -0.8, 0.2) * c_angles(math.rad(-20),math.rad(0),math.rad(0)), 0.15)
		RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5, -0.8, -0.5) * c_angles(math.rad(15),math.rad(0),math.rad(0)), 0.15)
		Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(0, -1, 0.5) * c_angles(math.rad(-15), math.rad(0),math.rad(0)), 0.15)
		Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0, 1.5, -0.3) * c_angles(math.rad(-20),math.rad(0), math.rad(0)), 0.15)
	elseif currentAnim == "Seated" and Animations == false then
		angleSpeed = 2
		axisSpeed = 2
		change = 0.5
		RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(-20)), Sanim + 0.025)
		LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(20)), Sanim + 0.025)
		LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5, -1, 0) * c_angles(math.rad(50) - math.sin(sine/7.5)/30,math.rad(0) + math.sin(sine/7.5)/30,math.rad(-20)), 0.15)
		RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5, -1, 0) * c_angles(math.rad(50) - math.sin(sine/7.5)/30,math.rad(0) - math.sin(sine/7.5)/30,math.rad(20)), 0.15)
		Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(0, -1, 0) * c_angles(math.rad(0) + math.sin(sine/7.5)/30, math.rad(0),math.rad(0)), 0.15)
		Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0, 1.5, 0) * c_angles(math.rad(0) + math.sin(sine/7.5)/15,math.rad(0), math.rad(0) + math.sin(sine/7.5)/30), 0.15)
	elseif currentAnim == "Idling" and Animations == false and Death == false then
		RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(-20)), Sanim + 0.025)
		LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(20)), Sanim + 0.025)
		LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5 + math.sin(sine/15)/6, -1.05 - math.sin(sine/7.5)/5, 0) * c_angles(math.rad(0) - math.sin(sine/15)/5,math.rad(0),math.rad(-10)), Sanim)
		RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5 + math.sin(sine/15)/6, -1.05 - math.sin(sine/7.5)/5 , 0) * c_angles(math.rad(0) - math.sin(sine/15)/5,math.rad(0),math.rad(10)), Sanim)
		Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(0 - math.sin(sine/15)/10, -0.95 + math.sin(sine/7.5)/5, 0) * c_angles(math.rad(0) + math.sin(sine/15)/10, math.rad(0),math.rad(0)), Sanim)
		Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0 - math.sin(sine/15)/6, 1.5, 0) * c_angles(math.rad(0) + math.sin(sine/7.5)/5,math.rad(0), math.rad(0) + math.sin(sine/15)/4), Sanim)
	elseif currentAnim == "Idling" and Animations == false and Death == true then
		RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(0)), Sanim + 0.025)
		LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(0)), Sanim + 0.025)
		LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5 + math.sin(sine/15)/6, -1.05 - math.sin(sine/7.5)/5, 0) * c_angles(math.rad(20) - math.sin(sine/15)/5,math.rad(0),math.rad(-10)), Sanim)
		RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5 + math.sin(sine/15)/6, -1.05 - math.sin(sine/7.5)/5 , 0) * c_angles(math.rad(20) - math.sin(sine/15)/5,math.rad(0),math.rad(10)), Sanim)
		Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(0 - math.sin(sine/15)/10, -0.95 + math.sin(sine/7.5)/5, 0) * c_angles(math.rad(-20) + math.sin(sine/15)/10, math.rad(0),math.rad(0)), Sanim)
		Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0 - math.sin(sine/15)/6, 1.5, 0) * c_angles(math.rad(0) + math.sin(sine/7.5)/5,math.rad(math.random(-15,10)), math.rad(math.random(-25,25)) + math.sin(sine/15)/4), Sanim)
	elseif currentAnim == "Walking" and Animations == false then
			angleSpeed = 1
			axisSpeed = 1
			Humanoid.WalkSpeed = 16
			RA_Weld.C0		= clerp(RA_Weld.C0, c_new(1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(-20)), 0.025)
			LA_Weld.C0		= clerp(LA_Weld.C0, c_new(-1.25, 0.3 + math.sin(sine/6)/5, 0) * c_angles(math.rad(23),math.rad(0),math.rad(20)), 0.025)
		--LL_Weld.C0		= clerp(LL_Weld.C0, c_new(-0.5, -1.15 + 0.5 * math.cos(sine/4)/3, -0.6 * math.cos(sine / 4) / 3) * c_angles(math.rad(-1 - 10 * math.cos(sine / 4)) + Left_Leg.RotVelocity.Y / 15 + math.sin(sine / 4) / 3, math.rad(0) - math.sin(sine/4)/6, math.rad(-3)), 0.1)
		--RL_Weld.C0 		= clerp(RL_Weld.C0, c_new(0.5, -1.15 - 0.5 * math.cos(sine/4)/3, 0.6 * math.cos(sine / 4) / 3) * c_angles( math.rad(-1 + 10 * math.cos(sine / 4)) - Right_Leg.RotVelocity.Y / 15 + -math.sin(sine / 4) / 3, math.rad(0) - math.sin(sine/4)/6, math.rad(3)), 0.1)
			RL_Weld.C0      = clerp(RL_Weld.C0, c_new(0.5, -0.9 - 0.5 * math.cos(sine / WALKSPEEDVALUE) / 2, -0.2 + 0.6 * math.cos(sine / WALKSPEEDVALUE) / 2)  * c_angles(math.rad(-15 - 10 * math.cos(sine / WALKSPEEDVALUE)) - Right_Leg.RotVelocity.Y / 75 + -math.sin(sine / WALKSPEEDVALUE) / 2.5 * -math.rad(TiltVelocity.z) * 10, math.rad(0 - 5 * math.cos(sine / WALKSPEEDVALUE)), math.rad(0)) * c_angles(math.rad(0 + 2 * math.cos(sine / WALKSPEEDVALUE)), math.rad(0), math.rad(0 - 25 * math.sin(sine / WALKSPEEDVALUE)*-math.rad(TiltVelocity.x)*5.5)), 0.3)
         	LL_Weld.C0      = clerp(LL_Weld.C0, c_new(-0.5, -0.9 + 0.5 * math.cos(sine / WALKSPEEDVALUE) / 2, -0.2 - 0.6 * math.cos(sine / WALKSPEEDVALUE) / 2) * c_angles(math.rad(-15 + 10 * math.cos(sine / WALKSPEEDVALUE)) + Left_Leg.RotVelocity.Y / -75 + math.sin(sine / WALKSPEEDVALUE) / 2.5 * -math.rad(TiltVelocity.z) * 10, math.rad(0 - 5 * math.cos(sine / WALKSPEEDVALUE)), math.rad(0)) * c_angles(math.rad(0 - 2 * math.cos(sine / WALKSPEEDVALUE)), math.rad(0), math.rad(0 - 25 * math.sin(sine / WALKSPEEDVALUE)*math.rad(TiltVelocity.x)*5.5)), 0.3)
			Torso_Weld.C0 	= clerp(Torso_Weld.C0, c_new(0, -1 + math.sin(sine/7.5)/15, 0) * c_angles(math.rad(0 - 2.5 * math.sin(sine / 8)), math.rad(0), math.sin((rootPart.RotVelocity.Y/15))/4), 0.15)
			Head_Weld.C0 	= clerp(Head_Weld.C0, c_new(0, 1.5 + math.sin(sine/7.5)/15, 0 + math.sin(sine/7.5)/15) * c_angles(math.rad(0) - math.sin(sine/7.5)/15,math.sin((rootPart.RotVelocity.Y/2.5))/2, math.sin((rootPart.RotVelocity.Y/15))/2), 0.15)	
	end
	end)