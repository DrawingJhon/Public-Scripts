script.Parent = owner.PlayerGui
NLS([[local Player = game:GetService("Players").LocalPlayer

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
local h,t = Mouse.Hit, Mouse.Target
while wait(1/30) do
    if h~=Mouse.Hit or t~=Mouse.Target then
        Event:FireServer({isMouse=true,Target=Mouse.Target,Hit=Mouse.Hit})
        h,t=Mouse.Hit,Mouse.Target
    end
end]], script)

local Player = owner --game.Players:WaitForChild(_G.target)
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
	
warn "Everything are inserted by me ONLY but there are original idea from those peep"
warn "Original Injustice by KillerZTH_1596"
print "Original HopeLess( by wanTH092"
warn "Original Voided by wanTH092/Kermat"
print "Original Superior by wanTH092/KillerZTH_1596"
warn "Original TomYum_Pandora by nameclan"
print "and of course Big credit to Shackluster for attack and mostly Stuff!!"
wait(0.2)

Player = Player
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
Character.Archivable = true
Player:ClearCharacterAppearance()

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
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
local Speed = 16
local SIZE = 1.4
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
local SINE = 0
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
local VALUE1 = false
local VALUE2 = false
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
local ATANIM = IT("Animation")
ATANIM.Name = "Attack Animation"
ATANIM.AnimationId = "http://www.roblox.com/asset/?id=74894663"
--ROBLOXIDLEANIMATION.Parent = Humanoid
local WEAPONGUI = IT("ScreenGui", PlayerGui)
WEAPONGUI.Name = "Weapon GUI"
local Weapon = IT("Model")
Weapon.Name = "Adds"
local Effects = IT("Folder", Weapon)
Effects.Name = "Effects"
local LostHope = IT("Model")
LostHope.Name = "Adds"
local Superior = IT("Model")
Superior.Name = "Adds"
local Injustice = IT("Model")
Injustice.Name = "Adds"
local InjusticeGun = IT("Model")
InjusticeGun.Name = "Adds"
local InjusticeGun2 = IT("Model")
InjusticeGun2.Name = "Adds"
local Voided = IT("Model")
Voided.Name = "Adds"
local TomYum = IT("Model")
TomYum.Name = "Adds"
local BlackMask = IT("Model")
BlackMask.Name = "Adds"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character.Animate
local UNANCHOR = true
local CLOCKLOOP = 0
local SONG = 1382488262
local CLOCKTARGET = nil
local CLOCKSPEED = 0
script.Parent = WEAPONGUI
local CLONE = Character:Clone()
CLONE.Parent = nil
Character.Archivable = false
local sick = Instance.new("Sound",Torso)
local MODE = "Main"
local HeadColor = C3(1,1,1)
local BodyColor = C3(0,0,0)
local VOLUME = 4
local PITCH = 1
local HITFLOOR = nil
local INTRO = false
local INSTANT = false

--//=================================\\
--//       MAKHAIL07 STUFF
--\\=================================//

local plr = Player
local char = plr.Character
local hum = char.Humanoid

-------------------------------------------------------
--Start Good Stuff--
-------------------------------------------------------
cam = game.Workspace.CurrentCamera
CF = CFrame.new
angles = CFrame.Angles
attack = false
Euler = CFrame.fromEulerAnglesXYZ
Rad = math.rad
IT = Instance.new
BrickC = BrickColor.new
Cos = math.cos
Acos = math.acos
Sin = math.sin
Asin = math.asin
Abs = math.abs
Mrandom = math.random
Floor = math.floor

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
	label.TextStrokeColor3 = C3(1,1,1)
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

local DECAL = IT("Decal")
function MakeRing()
	local RING = CreatePart(3, Effects, "Neon", 0, 1, BRICKC("Pearl"), "MagicRing", VT(0, 0, 0), true)
	local MSH = IT("BlockMesh", RING)
	local TOP = DECAL:Clone()
	local BOTTOM = DECAL:Clone()
	TOP.Parent = RING
	BOTTOM.Parent = RING
	TOP.Face = "Top"
	BOTTOM.Face = "Bottom"
	TOP.Texture = "http://www.roblox.com/asset/?id=273474310"
	BOTTOM.Texture = "http://www.roblox.com/asset/?id=273474310"
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
			repeat wait(1) until NEWSOUND.Playing == false
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
				repeat wait(1) until SOUND.Playing == false
				EFFECT:remove()
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

Debris = game:GetService("Debris")

function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos,EndPos).lookVector
	return Raycast(StartPos, DIRECTION, Distance, Ignore)
end

function turnto(position)
	RootPart.CFrame=CFrame.new(RootPart.CFrame.p,VT(position.X,RootPart.Position.Y,position.Z)) * CFrame.new(0, 0, 0)
end

function CreateRing2(SIZE,DOESROT,ROT,WAIT,CFRAME,COLOR,GROW)
	local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(COLOR), "Effect", VT(0,0,0))
	local mesh = IT("SpecialMesh",wave)
	mesh.MeshType = "FileMesh"
	mesh.MeshId = "http://www.roblox.com/asset/?id=3270017"
	mesh.Scale = SIZE
	mesh.Offset = VT(0,0,0)
	wave.CFrame = CFRAME
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, WAIT do
			Swait()
			mesh.Scale = mesh.Scale + GROW
			if DOESROT == true then
				wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0,ROT,0)
			end
			wave.Transparency = wave.Transparency + (0.5/WAIT)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

function MagicSphere2(SIZE,WAIT,CFRAME,COLOR,GROW)
	local wave = CreatePart(3, Effects, "Neon", 0, 0, BRICKC(COLOR), "Effect", VT(1,1,1), true)
	local mesh = IT("SpecialMesh",wave)
	mesh.MeshType = "Sphere"
	mesh.Scale = SIZE
	mesh.Offset = VT(0,0,0)
	wave.CFrame = CFRAME
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, WAIT do
			Swait()
			mesh.Scale = mesh.Scale + GROW
			wave.Transparency = wave.Transparency + (1/WAIT)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
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

function MagicSphere3(SIZE,WAIT,CFRAME,COLOR,GROW)
	local wave = CreatePart(3, Effects, "Neon", 0, 0.9, BRICKC(COLOR), "Effect", VT(1,1,1), true)
	local mesh = IT("SpecialMesh",wave)
	mesh.MeshType = "Sphere"
	mesh.Scale = SIZE
	mesh.Offset = VT(0,0,0)
	wave.CFrame = CFRAME
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, WAIT do
			Swait()
			mesh.Scale = mesh.Scale + GROW
			wave.Transparency = wave.Transparency + (0.1/WAIT)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
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


function CheckTableForString(Table, String)
	for i, v in pairs(Table) do
		if string.find(string.lower(String), string.lower(v)) then
			return true
		end
	end
	return false
end

function CheckIntangible(Hit)
	local ProjectileNames = {"Water", "Arrow", "Projectile", "Effect", "Rail", "Lightning", "Bullet"}
	if Hit and Hit.Parent then
		if ((not Hit.CanCollide or CheckTableForString(ProjectileNames, Hit.Name)) and not Hit.Parent:FindFirstChild("Humanoid")) then
			return true
		end
	end
	return false
end

function CastZapRay(StartPos, Vec, Length, Ignore, DelayIfHit)
	local Direction = CFrame.new(StartPos, Vec).lookVector
	local Ignore = ((type(Ignore) == "table" and Ignore) or {Ignore})
	local RayHit, RayPos, RayNormal = game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(StartPos, Direction * Length), Ignore)
	if RayHit and CheckIntangible(RayHit) then
		if DelayIfHit then
			wait()
		end
		RayHit, RayPos, RayNormal = CastZapRay((RayPos + (Vec * 0.01)), Vec, (Length - ((StartPos - RayPos).magnitude)), Ignore, DelayIfHit)
	end
	return RayHit, RayPos, RayNormal
end

function CreateSwirl(inair,size,doesrotate,rotatedirection,waitt,cframe,color)
	local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(color), "Effect", VT(0,0,0))
	local mesh = IT("SpecialMesh",wave)
	mesh.MeshType = "FileMesh"
	mesh.MeshId = "http://www.roblox.com/asset/?id=1051557"
	mesh.Scale = VT(size,size,size)
	wave.CFrame = cframe
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, waitt do
			Swait()
			mesh.Scale = mesh.Scale + VT(size/5,0,size/5)
			if doesrotate == true then
				wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0, rotatedirection, 0)
			end
			wave.Transparency = wave.Transparency + (0.5/waitt)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

--Lightning({Color = C3(1,1,1), Start = Torso.Position, End = Mouse.Hit.p, SegmentL = 2, Thickness = 0.1, DoesFade = false, Ignore = Character, MaxDist = 400, Branches = false})
function Lightning(Table)
	local Color = Table.Color or C3(1,1,1)
	local StartPos = Table.Start or Torso.Position
	local EndPos = Table.End or Mouse.Hit.p
	local SegmentLength = Table.SegmentL or 2
	local Thickness = Table.Thickness or 0.1
	local Dissapear = Table.DoesFade or false
	local Parent = Table.Ignore or Character
	local MaxDist = Table.MaxDist or 400
	local Branches = Table.Branches or false
	local HIT,HITPOS = CastProperRay(StartPos, EndPos, MaxDist, Parent)
	local DISTANCE = math.ceil((StartPos - HITPOS).Magnitude/SegmentLength)
	local LIGHTNINGMODEL = IT("Model",Effects)
	LIGHTNINGMODEL.Name = "Lightning"
	local LastBolt = nil
	for E = 1, DISTANCE do
		local ExtraSize = (DISTANCE-E)/15
		local PART = CreatePart(3, LIGHTNINGMODEL, "Neon", 0, 0, BRICKC("Pearl"), "LightningPart"..E, VT(Thickness+ExtraSize,SegmentLength,Thickness+ExtraSize))
		PART.Color = Color
		MakeForm(PART,"Cyl")
		if LastBolt == nil then
			PART.CFrame = CF(StartPos,HITPOS)*ANGLES(RAD(90),RAD(0),RAD(0))*CF(0,-PART.Size.Y/2,0)
		else
			PART.CFrame = CF(LastBolt.CFrame*CF(0,-LastBolt.Size.Y/2,0).p,CF(HITPOS)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))*CF(0,0,SegmentLength/3+(DISTANCE-E)).p)*ANGLES(RAD(90),RAD(0),RAD(0))*CF(0,-PART.Size.Y/2,0)
		end
		LastBolt = PART
		if Branches == true then
			local CHOICE = MRANDOM(1,7+((DISTANCE-E)*2))
			if CHOICE == 1 then
				local LASTBRANCH = nil
				for i = 1, MRANDOM(2,5) do
					local ExtraSize2 = ((DISTANCE-E)/25)/i
					local PART = CreatePart(3, LIGHTNINGMODEL, "Neon", 0, 0, BRICKC("Pearl"), "Branch"..E.."-"..i, VT(Thickness+ExtraSize2,SegmentLength,Thickness+ExtraSize2))
					PART.Color = Color
					MakeForm(PART,"Cyl")
					if LASTBRANCH == nil then
						PART.CFrame = CF(LastBolt.CFrame*CF(0,-LastBolt.Size.Y/2,0).p,LastBolt.CFrame*CF(0,-LastBolt.Size.Y/2,0)*ANGLES(RAD(0),RAD(0),RAD(MRANDOM(0,360)))*CF(0,Thickness*7,0)*CF(0,0,-1).p)*ANGLES(RAD(90),RAD(0),RAD(0))*CF(0,-PART.Size.Y/2,0)
					else
						PART.CFrame = CF(LASTBRANCH.CFrame*CF(0,-LASTBRANCH.Size.Y/2,0).p,LASTBRANCH.CFrame*CF(0,-LASTBRANCH.Size.Y/2,0)*ANGLES(RAD(0),RAD(0),RAD(MRANDOM(0,360)))*CF(0,Thickness*3,0)*CF(0,0,-1).p)*ANGLES(RAD(90),RAD(0),RAD(0))*CF(0,-PART.Size.Y/2,0)
					end
					LASTBRANCH = PART
				end
			end
		end
	end
	if Dissapear == true then
		coroutine.resume(coroutine.create(function()
			for i = 1, 10 do
				Swait()
				for _, c in pairs(LIGHTNINGMODEL:GetChildren()) do
					if c.ClassName == "Part" then
						c.Transparency = i/10
					end
				end
			end
			LIGHTNINGMODEL:remove()
		end))
	elseif Dissapear == false then
		Debris:AddItem(LIGHTNINGMODEL,0.1)
	end
	return {End = LastBolt.CFrame*CF(0,0,-LastBolt.Size.Z/2).p,LastBolt = LastBolt,Model = LIGHTNINGMODEL}
end

function SpawnTrail(FROM,TO,BIG)
	local TRAIL = CreatePart(3, Effects, "Neon", 0, 0.5, "New Yeller", "Trail", VT(0,0,0))
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

local EyeSizes={
	NumberSequenceKeypoint.new(0,2,0),
	NumberSequenceKeypoint.new(1,0,0)
}
local EyeTrans={
	NumberSequenceKeypoint.new(0,0.5,0),
	NumberSequenceKeypoint.new(1,1,0)
}
local PE=Instance.new("ParticleEmitter",nil)
PE.LightEmission=.8
PE.Color = ColorSequence.new(BRICKC("Bright yellow").Color,BRICKC("New Yeller").Color)
PE.Size=NumberSequence.new(EyeSizes)
PE.Transparency=NumberSequence.new(EyeTrans)
PE.Lifetime=NumberRange.new(0.35,1)
PE.Rotation=NumberRange.new(0,360)
PE.Rate=100
PE.VelocitySpread = 10000
PE.Acceleration = Vector3.new(0,85,0)
PE.Drag = 5
PE.Speed = NumberRange.new(0.1,5)
PE.Texture="http://www.roblox.com/asset/?id=1460745664"
PE.ZOffset = 0.5
PE.Name = "PE"
PE.Enabled = false
function Fire(art)
	local PARTICLES = PE:Clone()
	PARTICLES.Parent = art
	PARTICLES.Enabled = true
	return PARTICLES
end

function CreateWave(SIZE,WAIT,CFRAME,DOESROT,ROT,COLOR,GROW)
    local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(COLOR), "Effect", VT(0,0,0))
    local mesh = IT("SpecialMesh",wave)
    mesh.MeshType = "FileMesh"
    mesh.MeshId = "http://www.roblox.com/asset/?id=20329976"
    mesh.Scale = SIZE
    mesh.Offset = VT(0,0,-SIZE.X/8)
    wave.CFrame = CFRAME
    coroutine.resume(coroutine.create(function(PART)
        for i = 1, WAIT do
            Swait()
            mesh.Scale = mesh.Scale + GROW
            mesh.Offset = VT(0,0,-(mesh.Scale.X/8))
            if DOESROT == true then
                wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0,ROT,0)
            end
            wave.Transparency = wave.Transparency + (0.5/WAIT)
            if wave.Transparency > 0.99 then
                wave:remove()
            end
        end
    end))
end
 
function CreateWave2(SIZE,WAIT,CFRAME,DOESROT,ROT,COLOR,GROW)
    local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(COLOR), "Effect", VT(0,0,0))
    local mesh = IT("SpecialMesh",wave)
    mesh.MeshType = "FileMesh"
    mesh.MeshId = "http://www.roblox.com/asset/?id=20329976"
    mesh.Scale = SIZE
    --mesh.Offset = VT(0,0,-SIZE.X/8)
    wave.CFrame = CFRAME
    coroutine.resume(coroutine.create(function(PART)
        for i = 1, WAIT do
            Swait()
            mesh.Scale = mesh.Scale + GROW
            --mesh.Offset = VT(0,0,-(mesh.Scale.X/8))
            if DOESROT == true then
                wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0,ROT,0)
            end
            wave.Transparency = wave.Transparency + (0.5/WAIT)
            if wave.Transparency > 0.99 then
                wave:remove()
            end
        end
    end))
end

function Slice(SIZE,WAIT,CFRAME,COLOR,GROW)
    local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(COLOR), "Effect", VT(1,1,1), true)
    local mesh = CreateMesh("SpecialMesh", wave, "FileMesh", "448386996", "", VT(0,SIZE/10,SIZE/10), VT(0,0,0))
    wave.CFrame = CFRAME
    coroutine.resume(coroutine.create(function(PART)
        for i = 1, WAIT do
            Swait()
            mesh.Scale = mesh.Scale * GROW
            wave.Transparency = wave.Transparency + (0.5/WAIT)
            if wave.Transparency > 0.99 then
                wave:remove()
            end
        end
    end))
end

--//=================================\\
--||	     WEAPON CREATION
--\\=================================//

Humanoid.Parent = nil
RootPart.Size = RootPart.Size*SIZE
Torso.Size = Torso.Size*SIZE
RightArm.Size = RightArm.Size*SIZE
RightLeg.Size = RightLeg.Size*SIZE
LeftArm.Size = LeftArm.Size*SIZE
LeftLeg.Size = LeftLeg.Size*SIZE
RootJoint.C0 = ROOTC0 * CF(0 * SIZE, 0 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(0), RAD(0))
RootJoint.C1 = ROOTC0 * CF(0 * SIZE, 0 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(0), RAD(0))
Neck.C0 = NECKC0 * CF(0 * SIZE, 0 * SIZE, 0 + ((1 * SIZE) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0))
Neck.C1 = CF(0 * SIZE, -0.5 * SIZE, 0 * SIZE) * ANGLES(RAD(-90), RAD(0), RAD(180))
RightShoulder.C1 = CF(0 * SIZE, 0.5 * SIZE, -0.35 * SIZE)
LeftShoulder.C1 = CF(0 * SIZE, 0.5 * SIZE, -0.35 * SIZE)
RightHip.C0 = CF(1 * SIZE, -1 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0))
LeftHip.C0 = CF(-1 * SIZE, -1 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0))
RightHip.C1 = CF(0.5 * SIZE, 1 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0))
LeftHip.C1 = CF(-0.5 * SIZE, 1 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0))
Head.Size = Head.Size*SIZE
RootJoint.Parent = RootPart
Neck.Parent = Torso
RightShoulder.Parent = Torso
LeftShoulder.Parent = Torso
RightHip.Parent = Torso
LeftHip.Parent = Torso

Humanoid.DisplayDistanceType = "None"
local naeeym2 = IT("BillboardGui",Character)
naeeym2.AlwaysOnTop = true
naeeym2.Size = UDim2.new(5,35,2,15)
naeeym2.StudsOffset = Vector3.new(0,2,0)
naeeym2.MaxDistance = 75
naeeym2.Adornee = Character.Head
naeeym2.Name = "Name"
naeeym2.PlayerToHideFrom = Player
local tecks2 = IT("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.TextScaled = true
tecks2.BorderSizePixel = 0
tecks2.Text = " "
tecks2.Font = "Fantasy"
tecks2.TextSize = 30
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = C3(1,1,1)
tecks2.TextStrokeColor3 = C3(159/255, 111/255, 183/255)
tecks2.Size = UDim2.new(1,0,0.5,0)
tecks2.Parent = naeeym2
local top = Instance.new("Shirt")
top.ShirtTemplate = "rbxassetid://1533635803"
top.Parent = Character
top.Name = "Cloth"
local bottom = Instance.new("Pants")
bottom.PantsTemplate = "rbxassetid://1460022985"
bottom.Parent = Character
bottom.Name = "Cloth"

local PRT = CreatePart(3, LostHope, "Fabric", 0, 0, "Really black", "Hat", VT(1,1,1),false)
PRT.Color = C3(0,0,0)
CreateWeldOrSnapOrMotor("Weld", LostHope, Head, PRT, CF(0,0.72*SIZE,0.1) * ANGLES(RAD(15), RAD(0), RAD(0)), CF(0, 0, 0))
CreateMesh("SpecialMesh", PRT, "FileMesh", "26768040", "", VT(1,1,1)*SIZE, VT(0,0,0))
local PRT = CreatePart(3, LostHope, "Fabric", 0, 0, "Really black", "Detail", VT(1,1,1),false)
PRT.Color = C3(1,1,1)
CreateWeldOrSnapOrMotor("Weld", LostHope, Head, PRT, CF(0,0,-.5*SIZE), CF(0, 0, 0))
CreateMesh("SpecialMesh", PRT, "FileMesh", "13520257", "", VT(1,1,1)*SIZE, VT(0,0,0))
local PRT = CreatePart(3, TomYum, "Neon", 0, 0, "Really black", "Detail", VT(1,1.2,0.2),false)
PRT.Color = C3(159/255, 111/255, 183/255)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", TomYum, Head, PRT, CF(0,0,-.5*SIZE), CF(0, 0, 0))
local PRT = CreatePart(3, TomYum, "Neon", 0, 0, "Really black", "Detail", VT(0.5,0.4,0.5),false)
PRT.Color = C3(159/255, 111/255, 183/255)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", TomYum, Head, PRT, CF(0,-0.3,-.5*SIZE), CF(0, 0, 0))
local PRT = CreatePart(3, TomYum, "Neon", 0, 0, "Really black", "Detail", VT(0.5,0.3,0.3),false)
PRT.Color = C3(159/255, 111/255, 183/255)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", TomYum, Head, PRT, CF(0.25,0.25,-.5*SIZE), CF(0, 0, 0))
local PRT = CreatePart(3, TomYum, "Neon", 0, 0, "Really black", "Detail", VT(0.5,0.3,0.3),false)
PRT.Color = C3(159/255, 111/255, 183/255)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", TomYum, Head, PRT, CF(-0.25,0.25,-.5*SIZE), CF(0, 0, 0))
local PRT = CreatePart(3, TomYum, "Neon", 0, 0, "Really black", "Detail", VT(0.4,0.4,0.3),false)
PRT.Color = C3(159/255, 111/255, 183/255)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", TomYum, Head, PRT, CF(-0.17,-0.25,-.5*SIZE) * ANGLES(RAD(-15), RAD(15), RAD(0)), CF(0, 0, 0))
local PRT = CreatePart(3, TomYum, "Neon", 0, 0, "Really black", "Detail", VT(0.4,0.4,0.3),false)
PRT.Color = C3(159/255, 111/255, 183/255)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", TomYum, Head, PRT, CF(0.17,-0.25,-.5*SIZE) * ANGLES(RAD(-15), RAD(-15), RAD(0)), CF(0, 0, 0))

local LASTPART = Head
for i = 1, 24 do
	local MATH = (1-(i/30))
	if LASTPART == Head then
		local Horn = CreatePart(3, LostHope, "SmoothPlastic", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LostHope, LASTPART, Horn, CF(0.7, 0.3, -0.4) * ANGLES(RAD(-25), RAD(220), RAD(90)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3(1-((i*4-4)/255),1-((i*6-6)/255),1-((i*2-2)/255))
	else
		local Horn = CreatePart(3, LostHope, "SmoothPlastic", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LostHope, LASTPART, Horn, CF(0, Horn.Size.Y/2, 0) * ANGLES(RAD(5), RAD(3), RAD(0)), CF(0, -Horn.Size.Y/2, 0))
		LASTPART = Horn
		Horn.Color = C3(1-((i*4-4)/255),1-((i*6-6)/255),1-((i*2-2)/255))
	end
end
local LASTPART = Head
for i = 1, 24 do
	local MATH = (1-(i/30))
	if LASTPART == Head then
		local Horn = CreatePart(3, LostHope, "SmoothPlastic", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LostHope, LASTPART, Horn, CF(-0.7, 0.3, -0.4) * ANGLES(RAD(-25), RAD(-220), RAD(-90)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3(1-((i*4-4)/255),1-((i*6-6)/255),1-((i*2-2)/255))
	else
		local Horn = CreatePart(3, LostHope, "SmoothPlastic", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LostHope, LASTPART, Horn, CF(0, Horn.Size.Y/2, 0) * ANGLES(RAD(5), RAD(-3), RAD(0)), CF(0, -Horn.Size.Y/2, 0))
		LASTPART = Horn
		Horn.Color = C3(1-((i*4-4)/255),1-((i*6-6)/255),1-((i*2-2)/255))
	end
end
local LASTPART = Head
for i = 1, 8 do
	local MATH = (1-(i/14))
	if LASTPART == Head then
		local Horn = CreatePart(3, LostHope, "SmoothPlastic", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LostHope, LASTPART, Horn, CF(0.55, -0.3, -0.4) * ANGLES(RAD(-25), RAD(250), RAD(90)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3(1-((i*4-4)/255),1-((i*6-6)/255),1-((i*2-2)/255))
	else
		local Horn = CreatePart(3, LostHope, "SmoothPlastic", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LostHope, LASTPART, Horn, CF(0, Horn.Size.Y/2, 0) * ANGLES(RAD(10), RAD(3), RAD(0)), CF(0, -Horn.Size.Y/2, 0))
		LASTPART = Horn
		Horn.Color = C3(1-((i*4-4)/255),1-((i*6-6)/255),1-((i*2-2)/255))
	end
end
local LASTPART = Head
for i = 1, 8 do
	local MATH = (1-(i/14))
	if LASTPART == Head then
		local Horn = CreatePart(3, LostHope, "SmoothPlastic", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LostHope, LASTPART, Horn, CF(-0.55, -0.3, -0.4) * ANGLES(RAD(-25), RAD(-250), RAD(-90)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3(1-((i*4-4)/255),1-((i*6-6)/255),1-((i*2-2)/255))
	else
		local Horn = CreatePart(3, LostHope, "SmoothPlastic", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LostHope, LASTPART, Horn, CF(0, Horn.Size.Y/2, 0) * ANGLES(RAD(10), RAD(-3), RAD(0)), CF(0, -Horn.Size.Y/2, 0))
		LASTPART = Horn
		Horn.Color = C3(1-((i*4-4)/255),1-((i*6-6)/255),1-((i*2-2)/255))
	end
end


for _, c in pairs(Weapon:GetChildren()) do
	if c.ClassName == "Part" then
		c.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end


-- Mask(Black) --
local PRT = CreatePart(3, BlackMask, "Fabric", 0, 0, "Really black", "Hat", VT(1,1,1),false)
PRT.Color = C3(0,0,0)
CreateWeldOrSnapOrMotor("Weld", BlackMask, Head, PRT, CF(0,0.72*SIZE,0.1) * ANGLES(RAD(15), RAD(0), RAD(0)), CF(0, 0, 0))
CreateMesh("SpecialMesh", PRT, "FileMesh", "26768040", "", VT(1,1,1)*SIZE, VT(0,0,0))
local PRT = CreatePart(3, BlackMask, "Fabric", 0, 0, "Really black", "Detail", VT(1,1,1),false)
PRT.Color = C3(0,0,0)
CreateWeldOrSnapOrMotor("Weld", BlackMask, Head, PRT, CF(0,0,-.5*SIZE), CF(0, 0, 0))
CreateMesh("SpecialMesh", PRT, "FileMesh", "13520257", "", VT(1,1,1)*SIZE, VT(0,0,0))

-- SOUP FACE --
CreateWeldOrSnapOrMotor("Weld", Superior, Head, PRT, CF(0,0,-.5*SIZE), CF(0, 0, 0))
CreateMesh("SpecialMesh", PRT, "FileMesh", "13520257", "", VT(1,1,1)*SIZE, VT(0,0,0))
local PRT = CreatePart(3, Superior, "Neon", 0, 0, "Really black", "Detail", VT(1,1.2,0.2),false)
PRT.Color = C3(255/255, 0/255, 0/255)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", Superior, Head, PRT, CF(0,0,-.5*SIZE), CF(0, 0, 0))
local PRT = CreatePart(3, Superior, "Neon", 0, 0, "Really black", "Detail", VT(0.5,0.4,0.5),false)
PRT.Color = C3(255/255, 0/255, 0/255)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", Superior, Head, PRT, CF(0,-0.3,-.5*SIZE), CF(0, 0, 0))
local PRT = CreatePart(3, Superior, "Neon", 0, 0, "Really black", "Detail", VT(0.5,0.3,0.3),false)
PRT.Color = C3(255/255, 0/255, 0/255)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", Superior, Head, PRT, CF(0.25,0.25,-.5*SIZE), CF(0, 0, 0))
local PRT = CreatePart(3, Superior, "Neon", 0, 0, "Really black", "Detail", VT(0.5,0.3,0.3),false)
PRT.Color = C3(255/255, 0/255, 0/255)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", Superior, Head, PRT, CF(-0.25,0.25,-.5*SIZE), CF(0, 0, 0))
local PRT = CreatePart(3, Superior, "Neon", 0, 0, "Really black", "Detail", VT(0.4,0.4,0.3),false)
PRT.Color = C3(255/255, 0/255, 0/255)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", Superior, Head, PRT, CF(-0.17,-0.25,-.5*SIZE) * ANGLES(RAD(-15), RAD(15), RAD(0)), CF(0, 0, 0))
local PRT = CreatePart(3, Superior, "Neon", 0, 0, "Really black", "Detail", VT(0.4,0.4,0.3),false)
PRT.Color = C3(255/255, 0/255, 0/255)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", Superior, Head, PRT, CF(0.17,-0.25,-.5*SIZE) * ANGLES(RAD(-15), RAD(-15), RAD(0)), CF(0, 0, 0))

local LASTPART = Head
for i = 1, 24 do
	local MATH = (1-(i/30))
	if LASTPART == Head then
		local Horn = CreatePart(3, Superior, "Neon", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", Superior, LASTPART, Horn, CF(0.7, 0.3, -0.4) * ANGLES(RAD(-25), RAD(220), RAD(90)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/255,0,0)
	else
		local Horn = CreatePart(3, Superior, "Neon", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", Superior, LASTPART, Horn, CF(0, Horn.Size.Y/2, 0) * ANGLES(RAD(5), RAD(3), RAD(0)), CF(0, -Horn.Size.Y/2, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/255,0,0)
	end
end
local LASTPART = Head
for i = 1, 24 do
	local MATH = (1-(i/30))
	if LASTPART == Head then
		local Horn = CreatePart(3, Superior, "Neon", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", Superior, LASTPART, Horn, CF(-0.7, 0.3, -0.4) * ANGLES(RAD(-25), RAD(-220), RAD(-90)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/255,0,0)
	else
		local Horn = CreatePart(3, Superior, "Neon", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", Superior, LASTPART, Horn, CF(0, Horn.Size.Y/2, 0) * ANGLES(RAD(5), RAD(-3), RAD(0)), CF(0, -Horn.Size.Y/2, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/255,0,0)
	end
end
local LASTPART = Head
for i = 1, 8 do
	local MATH = (1-(i/14))
	if LASTPART == Head then
		local Horn = CreatePart(3, Superior, "Neon", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", Superior, LASTPART, Horn, CF(0.55, -0.3, -0.4) * ANGLES(RAD(-25), RAD(250), RAD(90)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/255,0,0)
	else
		local Horn = CreatePart(3, Superior, "Neon", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", Superior, LASTPART, Horn, CF(0, Horn.Size.Y/2, 0) * ANGLES(RAD(10), RAD(3), RAD(0)), CF(0, -Horn.Size.Y/2, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/255,0,0)
	end
end
local LASTPART = Head
for i = 1, 8 do
	local MATH = (1-(i/14))
	if LASTPART == Head then
		local Horn = CreatePart(3, Superior, "Neon", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", Superior, LASTPART, Horn, CF(-0.55, -0.3, -0.4) * ANGLES(RAD(-25), RAD(-250), RAD(-90)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/255,0,0)
	else
		local Horn = CreatePart(3, Superior, "Neon", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", Superior, LASTPART, Horn, CF(0, Horn.Size.Y/2, 0) * ANGLES(RAD(10), RAD(-3), RAD(0)), CF(0, -Horn.Size.Y/2, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/255,0,0)
	end
end

-- Clock --
local PRT = CreatePart(3, Superior, "Metal", 0, 0, "Mid gray", "Watch", VT(1.05,0.06,1.05)*SIZE,false)
CreateWeldOrSnapOrMotor("Weld", Superior, RightArm, PRT, CF(0,-0.5*SIZE,0) * ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
local PRT = CreatePart(3, Superior, "Metal", 0, 0, "Mid gray", "Watch", VT(0.5,0.1,0.5)*SIZE,false)
CreateWeldOrSnapOrMotor("Weld", Superior, RightArm, PRT, CF(0,-0.5*SIZE,0) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, -0.5*SIZE, 0))
MakeForm(PRT,"Cyl")
local PRT = CreatePart(3, Superior, "Neon", 0, 0, "Mid gray", "Watch", VT(0.45,0.11,0.45)*SIZE,false)
CreateWeldOrSnapOrMotor("Weld", Superior, RightArm, PRT, CF(0,-0.5*SIZE,0) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, -0.5*SIZE, 0))
MakeForm(PRT,"Cyl")
PRT.Color = C3(85/255, 0/255, 0/255)
local RING = CreatePart(3, Superior, "Metal", 0, 0, "Mid gray", "Watch", VT(0.055,0.15,0.055)*SIZE,false)
CreateWeldOrSnapOrMotor("Weld", Superior, RightArm, RING, CF(0,-0.5*SIZE,0) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, -0.5*SIZE, 0))
MakeForm(RING,"Cyl")
RING.Color = C3(0,0,0)
for i = 1, 12 do
	local PRT = CreatePart(3, Superior, "Metal", 0, 0, "Mid gray", "Watch", VT(0,0.15,0)*SIZE,false)
	PRT.Color = C3(0,0,0)
	local MSH = IT("BlockMesh",PRT)
	MSH.Scale = VT(0.6,1,1)
	CreateWeldOrSnapOrMotor("Weld", Superior, RightArm, PRT, CF(0,-0.5*SIZE,0) * ANGLES(RAD(90), RAD((360/12)*i), RAD(0)), CF(0, -0.49*SIZE, 0) * CF(0, 0, -0.2*SIZE))
end
local PRT = CreatePart(3, Superior, "Metal", 0, 0, "Mid gray", "Watch", VT(0,0.15,0.15)*SIZE,false)
PRT.Color = C3(0,0,0)
local MSH = IT("BlockMesh",PRT)
MSH.Scale = VT(0.4,1,1)
local WATCH1 = CreateWeldOrSnapOrMotor("Weld", Superior, RightArm, PRT, CF(0,-0.5*SIZE,0) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, -0.49*SIZE, 0) * CF(0, 0, -0.075*SIZE))
local PRT = CreatePart(3, Superior, "Metal", 0, 0, "Mid gray", "Watch", VT(0,0.15,0.15/1.5)*SIZE,false)
PRT.Color = C3(0,0,0)
local MSH = IT("BlockMesh",PRT)
MSH.Scale = VT(0.4,1,1)
local WATCH2 = CreateWeldOrSnapOrMotor("Weld", Superior, RightArm, PRT, CF(0,-0.5*SIZE,0) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, -0.49*SIZE, 0) * CF(0, 0, -(0.075/1.5)*SIZE))
coroutine.resume(coroutine.create(function()
	while true do
		Swait()
		CLOCKLOOP = CLOCKLOOP - 1*CLOCKSPEED
		WATCH1.C0 = Clerp(WATCH1.C0, CF(0,-0.5*SIZE,0) * ANGLES(RAD(90), RAD(CLOCKLOOP*5), RAD(0)), 1 / Animation_Speed)
		WATCH2.C0 = Clerp(WATCH2.C0, CF(0,-0.5*SIZE,0) * ANGLES(RAD(90), RAD(CLOCKLOOP*5/2), RAD(0)), 1 / Animation_Speed)
		if CLOCKLOOP <= -150 then
			if VALUE1 == false then
				CLOCKLOOP = 0
				WACKYEFFECT({Time = 15, EffectType = "Sphere", Size = VT(0.45,0.11,0.45)*SIZE, Size2 = VT(3,3,3), Transparency = 0, Transparency2 = 1, CFrame = RING.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(255/255, 0/255, 0/255), SoundID = 743521450, SoundPitch = 1.2, SoundVolume = 4})
				local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 25*SIZE, Character)
				ApplyAoE(HITPOS,10,10,30,10,false)
				WACKYEFFECT({Time = 15, EffectType = "Wave", Size = VT(0.45,0.11,0.45)*SIZE, Size2 = VT(15,2,15), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(155/255, 0/255, 0/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
				WACKYEFFECT({Time = 15, EffectType = "Wave", Size = VT(0.45,0.11,0.45)*SIZE, Size2 = VT(12,3,12), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(255/255, 0/255, 0/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
				if CLOCKTARGET ~= nil then
					CLOCKTARGET.Health = CLOCKTARGET.Health - 20
					if CLOCKTARGET.Torso ~= nil then
						CLOCKTARGET.Torso.CFrame = CLOCKTARGET.Torso.CFrame * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)))
					end
					if CLOCKTARGET.Health == 0 then
						CLOCKTARGET = nil
					end
				end
			end
		end
	end
end))

local PRT = CreatePart(3, Voided, "Neon", 0, 0, "Really black", "Detail", VT(1,1.2,0.2),false)
PRT.Color = C3(153,0,153)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", Voided, Head, PRT, CF(0,0,-.5*SIZE), CF(0, 0, 0))
local PRT = CreatePart(3, Voided, "Neon", 0, 0, "Really black", "Detail", VT(0.5,0.4,0.5),false)
PRT.Color = C3(153,0,153)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", Voided, Head, PRT, CF(0,-0.3,-.5*SIZE), CF(0, 0, 0))
local PRT = CreatePart(3, Voided, "Neon", 0, 0, "Really black", "Detail", VT(0.5,0.3,0.3),false)
PRT.Color = C3(153,0,153)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", Voided, Head, PRT, CF(0.25,0.25,-.5*SIZE), CF(0, 0, 0))
local PRT = CreatePart(3, Voided, "Neon", 0, 0, "Really black", "Detail", VT(0.5,0.3,0.3),false)
PRT.Color = C3(153,0,153)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", Voided, Head, PRT, CF(-0.25,0.25,-.5*SIZE), CF(0, 0, 0))
local PRT = CreatePart(3, Voided, "Neon", 0, 0, "Really black", "Detail", VT(0.4,0.4,0.3),false)
PRT.Color = C3(153,0,153)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", Voided, Head, PRT, CF(-0.17,-0.25,-.5*SIZE) * ANGLES(RAD(-15), RAD(15), RAD(0)), CF(0, 0, 0))
local PRT = CreatePart(3, Voided, "Neon", 0, 0, "Really black", "Detail", VT(0.4,0.4,0.3),false)
PRT.Color = C3(153,0,153)
MakeForm(PRT,"Ball")
CreateWeldOrSnapOrMotor("Weld", Voided, Head, PRT, CF(0.17,-0.25,-.5*SIZE) * ANGLES(RAD(-15), RAD(-15), RAD(0)), CF(0, 0, 0))


-- Horn(Voided) --

local LASTPART = Head
for i = 1, 24 do
	local MATH = (1-(i/30))
	if LASTPART == Head then
		local Horn = CreatePart(3, Voided, "Neon", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", Voided, LASTPART, Horn, CF(-0.7, 0.3, -0.4) * ANGLES(RAD(-25), RAD(-220), RAD(-90)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/153,0,153)
	else
		local Horn = CreatePart(3, Voided, "Neon", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", Voided, LASTPART, Horn, CF(0, Horn.Size.Y/2, 0) * ANGLES(RAD(5), RAD(-3), RAD(0)), CF(0, -Horn.Size.Y/2, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/153,0,153)
	end
end
local LASTPART = Head
for i = 1, 8 do
	local MATH = (1-(i/14))
	if LASTPART == Head then
		local Horn = CreatePart(3, Voided, "Neon", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", Voided, LASTPART, Horn, CF(-0.55, -0.3, -0.4) * ANGLES(RAD(-15), RAD(-250), RAD(-90)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/153,0,153)
	else
		local Horn = CreatePart(3, Voided, "Neon", 0, 0, "Dirt brown", "Detail", VT(0.25*MATH,0.15,0.25*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", Voided, LASTPART, Horn, CF(0, Horn.Size.Y/2, 0) * ANGLES(RAD(10), RAD(-3), RAD(0)), CF(0, -Horn.Size.Y/2, 0))
		LASTPART = Horn
		Horn.Color = C3((i*3-3)/153,0,153)
	end
end

-- Gauntlet(Voided) --



-- Injustice --
for i = 1, 16 do
	local FACE = CreatePart(3, Injustice, "Fabric", 0, 0+(i-1)/16.2, "Dark stone grey", "FaceGradient", VT(1.01*SIZE,0.65*SIZE,1.01*SIZE),false)
	FACE.Color = C3(0,0,0)
	Head:FindFirstChildOfClass("SpecialMesh"):Clone().Parent = FACE
	CreateWeldOrSnapOrMotor("Weld", Injustice, Head, FACE, CF(0,0.45-(i-1)/25,0), CF(0, 0, 0))
end
local EYE = CreatePart(3, Injustice, "Neon", 0, 0, "New Yeller", "Eyeball", VT(0.15*SIZE,0.15*SIZE,0.15*SIZE),false)
MakeForm(EYE,"Ball")
CreateWeldOrSnapOrMotor("Weld", Injustice, Head, EYE, CF(0.15,0.26,-0.55), CF(-0, 0, 0.27))
local EYE2 = CreatePart(3, Injustice, "Neon", 0, 0, "New Yeller", "Eyeball", VT(0.15*SIZE,0.15*SIZE,0.15*SIZE),false)
MakeForm(EYE2,"Ball")
CreateWeldOrSnapOrMotor("Weld", Injustice, Head, EYE2, CF(-0.15,0.26,-0.55), CF(0, 0, 0.27))
local HAT1 = CreatePart(3, Injustice, "Metal", 0, 0, "Really black", "Hat", VT(2*SIZE,0.2*SIZE,2*SIZE),false)
MakeForm(HAT1,"Cyl")
HATWELD = CreateWeldOrSnapOrMotor("Weld", Injustice, Head, HAT1, CF(0,1,0), CF(0, 0, 0))
local BELT = CreatePart(3, Injustice, "Metal", 0, 0, "Really black", "Hat", VT(2.01*SIZE,0.15*SIZE,2.01*SIZE),false)
BELT.Color = Color3.new(0,0,0)
MakeForm(BELT,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Injustice, HAT1, BELT, CF(0,0,0), CF(0, 0, 0))
local HAT2 = CreatePart(3, Injustice, "Metal", 0, 0, "Really black", "Hat", VT(1.3*SIZE,2.2*SIZE,1.3*SIZE),false)
MakeForm(HAT2,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Injustice, HAT1, HAT2, CF(0,1.1,0), CF(0, 0, 0))
local BELT = CreatePart(3, Injustice, "Metal", 0, 0, "Really black", "Hat", VT(1.31*SIZE,0.2*SIZE,1.31*SIZE),false)
BELT.Color = Color3.new(0,0,0)
MakeForm(BELT,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Injustice, HAT2, BELT, CF(0,0,0), CF(0, 0, 0))
local GEM = CreatePart(3, Injustice, "Neon", 0, 0, "New Yeller", "Gem", VT(0.25*SIZE,0.25*SIZE,0.1*SIZE),false)
MakeForm(GEM,"Ball")
CreateWeldOrSnapOrMotor("Weld", Injustice, HAT2, GEM, CF(0,0,-BELT.Size.X/2), CF(0, 0, 0))
local GEM = CreatePart(3, Injustice, "Neon", 0, 0, "New Yeller", "Gem", VT(0.25*SIZE,0.25*SIZE,0.1*SIZE),false)
MakeForm(GEM,"Ball")
CreateWeldOrSnapOrMotor("Weld", Injustice, HAT2, GEM, CF(0,0,BELT.Size.X/2), CF(0, 0, 0))
local GEM = CreatePart(3, Injustice, "Neon", 0, 0, "New Yeller", "Gem", VT(0.1*SIZE,0.25*SIZE,0.25*SIZE),false)
MakeForm(GEM,"Ball")
CreateWeldOrSnapOrMotor("Weld", Injustice, HAT2, GEM, CF(-BELT.Size.X/2,0,0), CF(0, 0, 0))
local GEM = CreatePart(3, Injustice, "Neon", 0, 0, "New Yeller", "Gem", VT(0.1*SIZE,0.25*SIZE,0.25*SIZE),false)
MakeForm(GEM,"Ball")
CreateWeldOrSnapOrMotor("Weld", Injustice, HAT2, GEM, CF(BELT.Size.X/2,0,0), CF(0, 0, 0))
local BELT = CreatePart(3, Injustice, "Neon", 0, 0, "Black", "Hat", VT(1.31*SIZE,0.1*SIZE,1.31*SIZE),false)
BELT.Color = Color3.new(0,0,0)
MakeForm(BELT,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Injustice, HAT2, BELT, CF(0,0.7,0), CF(0, 0, 0))
local BELT = CreatePart(3, Injustice, "Neon", 0, 0, "Black", "Hat", VT(1.31*SIZE,0.1*SIZE,1.31*SIZE),false)
BELT.Color = Color3.new(0,0,0)
MakeForm(BELT,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Injustice, HAT2, BELT, CF(0,-0.7,0), CF(0, 0, 0))
local BELT = CreatePart(3, Injustice, "Neon", 0, 0, "Black", "Hat", VT(1.31*SIZE,0.1*SIZE,1.31*SIZE),false)
BELT.Color = Color3.new(0,0,0)
MakeForm(BELT,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Injustice, HAT2, BELT, CF(0,0.35,0), CF(0, 0, 0))

-- IdleGun(Injustice) --

local Handle = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.2,0.6,0.2),false)
local LeftArmGrasp = CreateWeldOrSnapOrMotor("Weld", Handle, Torso, Handle, CF(-1.6, -0.6, 0.5) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0.21, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.2,0.5,0.2),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.3, 0.2) * ANGLES(RAD(0), RAD(180), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.2,0.3,0.2),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.4, 0) * ANGLES(RAD(0), RAD(0), RAD(180)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.3,0.3,0.3),false)
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.5, 0.2) * ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.3,0.5,0.5),false)
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.5) * ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.4,0.4,0.4),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.5) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
for i = 1, 8 do
	local Piece = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Eye", VT(0,0.35,0.41),false)
	CreateWeldOrSnapOrMotor("Weld", Handle, Part, Piece, CF(0, 0, 0) * ANGLES(RAD(0), RAD((360/8)*i), RAD(0)), CF(0, 0, 0))
end
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Eye", VT(0.38,0.41,0.38),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.5) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.37,0.5,0.37),false)
MakeForm(Part,"Ball")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.3) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.2,0.7,0.4),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.7, 0.5) * ANGLES(RAD(90), RAD(180), RAD(180)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.3,0.4,0.2),false)
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.7) * ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.35,0.35,0.35),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.7) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.5,0.1,0.5),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 1) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.5,0.1,0.45),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 1.1) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.2,0.5,0.2),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.55, 0.2) * ANGLES(RAD(-135), RAD(0), RAD(0)), CF(0, -0.3, 0))
local LASTPART = Handle
for i = 1, 10 do
	if LASTPART == Handle then
		local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "New Yeller", "Part", VT(0.1,0.2,0),false)
		LASTPART = Part
		CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.1, 0.2) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
	else
		local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "New Yeller", "Part", VT(0.1,0.05,0),false)
		CreateWeldOrSnapOrMotor("Weld", Handle, LASTPART, Part, CF(0, 0.025, 0) * ANGLES(RAD(8), RAD(0), RAD(0)), CF(0, -0.025, 0))
		LASTPART = Part
	end
end

local Barrel = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.15,2,0.15),false)
MakeForm(Barrel,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Barrel, CF(0, -0.6, 1.8) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0.25,1,0.25),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Barrel, Part, CF(0, -0.6, 0), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "Really black", "Part", VT(0,0.1,0.2),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle, Barrel, Part, CF(0, 0.945, 0.1) * ANGLES(RAD(180), RAD(0), RAD(0)), CF(0, 0, 0))
local Hole = CreatePart(3, InjusticeGun, "Metal", 0, 0, "New Yeller", "Eye", VT(0.125,0,0.125),false)
MakeForm(Hole,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle, Barrel, Hole, CF(0, 0.98, 0), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0, "New Yeller", "Part", VT(0,0,0),false)
local GEARWELD = CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.7), CF(0, 0, 0))
CreateMesh("SpecialMesh", Part, "FileMesh", 156292343, "", VT(0.8,0.8,1.5), VT(0,0,0.2))
local Part = CreatePart(3, InjusticeGun, "Metal", 0, 0.5, "New Yeller", "Eye", VT(0,0,0),false)
local GEARWELD2 = CreateWeldOrSnapOrMotor("Weld", Handle, Handle, Part, CF(0, -0.6, 0.7), CF(0, 0, 0))
CreateMesh("SpecialMesh", Part, "FileMesh", 156292343, "", VT(0.9,0.9,0.3), VT(0,0,0.2))
coroutine.resume(coroutine.create(function()
	while wait() do
		GEARWELD.C0 = GEARWELD.C0 * ANGLES(RAD(0), RAD(0), RAD(5))
		GEARWELD2.C0 = GEARWELD2.C0 * ANGLES(RAD(0), RAD(0), RAD(-5))
	end
end))
-- UsedGun(Injustice) --

local Handle2 = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.2,0.6,0.2),false)
local LeftArmGrasp = CreateWeldOrSnapOrMotor("Weld", Handle2, RightArm, Handle2, CF(0, -1, 0) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0.21, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.2,0.5,0.2),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.3, 0.2) * ANGLES(RAD(0), RAD(180), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.2,0.3,0.2),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.4, 0) * ANGLES(RAD(0), RAD(0), RAD(180)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.3,0.3,0.3),false)
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.5, 0.2) * ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.3,0.5,0.5),false)
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.6, 0.5) * ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.4,0.4,0.4),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.6, 0.5) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
for i = 1, 8 do
	local Piece = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Eye", VT(0,0.35,0.41),false)
	CreateWeldOrSnapOrMotor("Weld", Handle2, Part, Piece, CF(0, 0, 0) * ANGLES(RAD(0), RAD((360/8)*i), RAD(0)), CF(0, 0, 0))
end
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Eye", VT(0.38,0.41,0.38),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.6, 0.5) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.37,0.5,0.37),false)
MakeForm(Part,"Ball")
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.6, 0.3) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.2,0.7,0.4),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.7, 0.5) * ANGLES(RAD(90), RAD(180), RAD(180)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.3,0.4,0.2),false)
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.6, 0.7) * ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.35,0.35,0.35),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.6, 0.7) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.5,0.1,0.5),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.6, 1) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.5,0.1,0.45),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.6, 1.1) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.2,0.5,0.2),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.55, 0.2) * ANGLES(RAD(-135), RAD(0), RAD(0)), CF(0, -0.3, 0))
local LASTPART = Handle2
for i = 1, 10 do
	if LASTPART == Handle then
		local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "New Yeller", "Part", VT(0.1,0.2,0),false)
		LASTPART = Part
		CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.1, 0.2) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
	else
		local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "New Yeller", "Part", VT(0.1,0.05,0),false)
		CreateWeldOrSnapOrMotor("Weld", Handle2, LASTPART, Part, CF(0, 0.025, 0) * ANGLES(RAD(8), RAD(0), RAD(0)), CF(0, -0.025, 0))
		LASTPART = Part
	end
end

local Barrel2 = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.15,2,0.15),false)
MakeForm(Barrel,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Barrel2, CF(0, -0.6, 1.8) * ANGLES(RAD(90), RAD(0), RAD(0)), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0.25,1,0.25),false)
MakeForm(Part,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle2, Barrel2, Part, CF(0, -0.6, 0), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "Really black", "Part", VT(0,0.1,0.2),false)
MakeForm(Part,"Wedge")
CreateWeldOrSnapOrMotor("Weld", Handle2, Barrel2, Part, CF(0, 0.945, 0.1) * ANGLES(RAD(180), RAD(0), RAD(0)), CF(0, 0, 0))
local Hole2 = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "New Yeller", "Eye", VT(0.125,0,0.125),false)
MakeForm(Hole,"Cyl")
CreateWeldOrSnapOrMotor("Weld", Handle2, Barrel2, Hole2, CF(0, 0.98, 0), CF(0, 0, 0))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0, "New Yeller", "Part", VT(0,0,0),false)
local GEARWELD3 = CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.6, 0.7), CF(0, 0, 0))
CreateMesh("SpecialMesh", Part, "FileMesh", 156292343, "", VT(0.8,0.8,1.5), VT(0,0,0.2))
local Part = CreatePart(3, InjusticeGun2, "Metal", 0, 0.5, "New Yeller", "Eye", VT(0,0,0),false)
local GEARWELD4 = CreateWeldOrSnapOrMotor("Weld", Handle2, Handle2, Part, CF(0, -0.6, 0.7), CF(0, 0, 0))
CreateMesh("SpecialMesh", Part, "FileMesh", 156292343, "", VT(0.9,0.9,0.3), VT(0,0,0.2))
coroutine.resume(coroutine.create(function()
	while wait() do
		GEARWELD3.C0 = GEARWELD.C0 * ANGLES(RAD(0), RAD(0), RAD(5))
		GEARWELD4.C0 = GEARWELD2.C0 * ANGLES(RAD(0), RAD(0), RAD(-5))
	end
end))

for _, q in pairs(TomYum:GetChildren()) do
	if q.ClassName == "Part" then
		q.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end

for _, q in pairs(BlackMask:GetChildren()) do
	if q.ClassName == "Part" then
		q.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end

for _, q in pairs(Superior:GetChildren()) do
	if q.ClassName == "Part" then
		q.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end

for _, q in pairs(Voided:GetChildren()) do
	if q.ClassName == "Part" then
		q.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end

for _, b in pairs(Injustice:GetChildren()) do
	if b.ClassName == "Part" then
		b.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end

for _, b in pairs(InjusticeGun2:GetChildren()) do
	if b.ClassName == "Part" then
		b.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end

for _, b in pairs(InjusticeGun:GetChildren()) do
	if b.ClassName == "Part" then
		b.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end

for _, b in pairs(LostHope:GetChildren()) do
	if b.ClassName == "Part" then
		b.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end

Neck.Name = "Weld"
RootJoint.Name = "Weld"
RightShoulder.Name = "Weld"
LeftShoulder.Name = "Weld"
RightHip.Name = "Weld"
LeftHip.Name = "Weld"

local SKILLTEXTCOLOR = C3(255/255, 255/255, 255/255)
local SKILLFONT = "Fantasy"
local SKILLTEXTSIZE = 7

local FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0, 0, 0, 0), UD2(0.13, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "SNAP!!")
local FACEME = {"PLZZZZ","MAX-LOCAL DANG","HAHAHA","BY NAMECLAN??!","IWANNAEATTOMYUM","AM I PRETTY?","YA HAHAH","PANDORA EDIT??!!","I CAN'T DO IT ANYMORE","PLZ DON'T LEAK THIS","PLZ DON'T LEAK THIS","PLZ DON'T LEAK THIS","I WANT VOID WARDEN","PLZ LEAK NEPTUNIAN BUFFED","KERMAT SENT ME FRIEND-REQUEST!!","THAT IT?","WHAT ARE YOU!!","I HAVE PIIZA","IF YOU FOUND THIS COMMENT #V.3ISHERE","OMGGGGGG","IDK WHAT TO TYPE IN","RANDOM TEXT","BUTTOM TEXT","FONT TEXT","I LOVE UNDERTALE","I HATE UNDERTALE","ARE YOU SERIOUS?!","SHACKLUSTER IS BEST SCRIPTER","PLEASE REMOVE FE UPDATE!!!","PLEASE HELP ME RIOT FE UPDATE!!!","I BROKE UP WITH BEE AGHH","ARE YOU STILL READING THIS???","LEAK REAL GALAXY GLITCHER!!","VENGEFUL PLZ BACK TO FD SHOWCASE!!!","STOP IT!","I'M NOT GAEY","I'M GAEY","PEOPLE CALLED ME 'U-KE'","WHY I STILL TYPE THIS?","I HAVE ALOT OF HARD WORK YA KNOW?","I REQUEST NAME TO SHOWCASE WANTH092 PANDORA PLZ WAIT","FUCK YOU","BAD EDIT","DSJNIFSFNSNIJFSFJSNFSDJKFSKFSNDJ","COLLEGE SAINT PAUL SUCKS","THIS SCRIPT WAS MADE BY BAD EDIT GANG","SPECTRUM V7 WAS ACTUALLY GOOD FOR AN EDIT","AAAAAAAAAAAAAA","JAI CHIER DANS LE BAIN LES MECS","GROS PENIS","WHY AM I STILL ADDING TEXT TO THIS SHIT EDIT?","LOLOLLOLOLOLOLOOLLO","FRICK","PLS BRING SHACKLUSTER BACK","PLS BRING BACK NON-FE","TUSK IS FAT","ARCEUS IS GAY"}
local INSANITYGUIS = {}
for e = 1, 28 do
    for i = 1, 22 do
        local MURDERFRAME = FRAME:Clone()
        MURDERFRAME.Position = UD2(-0.05+i/30, 0, e/30, 0)
        MURDERFRAME.Parent = WEAPONGUI
        table.insert(INSANITYGUIS,MURDERFRAME)
    end
end
coroutine.resume(coroutine.create(function()
    while true do
        wait()
        coroutine.resume(coroutine.create(function()
            local COLOR = C3(MRANDOM(100,255)/255, 0, 187)
            local APPEARTEXT = FACEME[MRANDOM(1,#FACEME)]
            local SHOW = ""
            for i = 1,string.len(APPEARTEXT),1 do
                local STRING = string.sub(APPEARTEXT,i,i)
                if MRANDOM(1,5) == 1 then
                    SHOW = SHOW..string.lower(STRING)
                else
                    SHOW = SHOW..STRING
                end
            end
            local PARENT = INSANITYGUIS[MRANDOM(1,#INSANITYGUIS)]
            local TEXT = CreateLabel(PARENT, SHOW, COLOR, 6, SKILLFONT, 1, 2, 1, "THISISYOURFAULTH")
            if MODE == "TomYum" then
            for i = 0.7, 15 do
                Swait()
                TEXT.Rotation = MRANDOM(-15,15)
                TEXT.TextTransparency = TEXT.TextTransparency - 1/15
            end
            end
            if MODE == "TomYum" then
            for i = 0.7, 15 do
                Swait()
                TEXT.Rotation = MRANDOM(-15,15)
                TEXT.TextTransparency = TEXT.TextTransparency + 1/15
            end
            end
            TEXT:Remove()
        end))
    end
end))
FRAME:remove()


TomYum.Parent = nil
Weapon.Parent = Character
Humanoid.Parent = Character
LostHope.Parent = Character
Superior.Parent = nil
TomYum.Parent = nil
BlackMask.Parent = nil


Humanoid.Died:connect(function()
	ATTACK = true
end)

--//=================================\\
--||			ANIM(WARDEN)
--\\=================================//

function Pose(WhichPose,Speed,Time,Magic,Gyro,Tors)
	PLAYMAINANIM = false
	if WhichPose == "Cast1" then
		for i=0, Time, 0.1 / Animation_Speed do
			Swait()
			if Magic == true then
				WACKYEFFECT({Time = 15, EffectType = "Crystal", Size = VT(1,1,1)*1.5, Size2 = VT(0,4,0), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1,0)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Glass", Color = BRICKC"Lavender".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			end
			if Gyro ~= nil and Gyro ~= false then
				Gyro.cframe = CF(RootPart.Position,Mouse.Hit.p)
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE - 0.04 * SIN(SINE / 24)*SIZE, 0*SIZE + 0.04 * SIN(SINE / 12)*SIZE, 0*SIZE + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(25 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.65*SIZE + 0.15 * COS(SINE / 12) - 0.05 * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(125), RAD(0), RAD(45)) * RIGHTSHOULDERC0, Speed / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE + 0.15 * COS(SINE / 12) - 0.05 * COS(SINE / 12), 0.5*SIZE) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, Speed / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06*SIZE * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06*SIZE * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
        end
	elseif WhichPose == "Cast2" then
		for i=0, Time, 0.1 / Animation_Speed do
			Swait()
			if Magic == true then
				WACKYEFFECT({Time = 15, EffectType = "Crystal", Size = VT(1,1,1)*1.5, Size2 = VT(0,4,0), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1,0)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Glass", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			end
			if Gyro ~= nil and Gyro ~= false then
				Gyro.cframe = CF(RootPart.Position,Mouse.Hit.p)
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE - 0.04 * SIN(SINE / 24)*SIZE, 0*SIZE + 0.04 * SIN(SINE / 12)*SIZE, 0*SIZE + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(10 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.65 + 0.15 * COS(SINE / 12) - 0.05 * COS(SINE / 12), -0.5) * ANGLES(RAD(120), RAD(0), RAD(15)) * RIGHTSHOULDERC0, Speed / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE + 0.15 * COS(SINE / 12) - 0.05 * COS(SINE / 12), 0.5*SIZE) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, Speed / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06*SIZE * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06*SIZE * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	elseif WhichPose == "RightArmUp" then
		for i=0, Time, 0.1 / Animation_Speed do
			Swait()
			if Magic == true then
				WACKYEFFECT({Time = 15, EffectType = "Crystal", Size = VT(1,1,1)*1.5, Size2 = VT(0,4,0), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1,0)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Glass", Color = BRICKC"Lavender".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			end
			if Gyro ~= nil and Gyro ~= false then
				Gyro.cframe = CF(RootPart.Position,Mouse.Hit.p)
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(15)), Speed / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(-5 - 6.5 * SIN(SINE / 12)), RAD(0), RAD(-15)), Speed / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.65 + 0.15 * COS(SINE / 12) - 0.05 * COS(SINE / 12), -0.2) * ANGLES(RAD(125), RAD(0), RAD(25)) * RIGHTSHOULDERC0, Speed / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5 + 0.15 * COS(SINE / 12) - 0.05 * COS(SINE / 12), 0.5) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, Speed / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.5, -0.5) * ANGLES(RAD(0), RAD(65), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(-15)), Speed / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), Speed / Animation_Speed)
		end
	elseif WhichPose == "Taunt" then
		for i=0, Time, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), Speed / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(-5 - 6.5 * SIN(SINE / 12)), RAD(0), RAD(0)), Speed / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.5*SIZE + 0.15 * COS(SINE / 12) - 0.05 * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(175), RAD(0), RAD(-35)) * RIGHTSHOULDERC0, Speed / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE + 0.15 * COS(SINE / 12) - 0.05 * COS(SINE / 12), 0.5*SIZE) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, Speed / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), Speed / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), Speed / Animation_Speed)
		end
		HATWELD.Part0 = RightArm
		HATWELD.C0 = CF(0,-1.1,-0.4) * ANGLES(RAD(0), RAD(0), RAD(180)) * ANGLES(RAD(-20), RAD(0), RAD(0))
		CreateSound(221057812,Torso,10,1,false)
		for i=0, Time*2, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), Speed / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(35 - 6.5 * SIN(SINE / 12)), RAD(0), RAD(0)), Speed / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.5*SIZE + 0.15 * COS(SINE / 12) - 0.05 * COS(SINE / 12), 0.5*SIZE) * ANGLES(RAD(145), RAD(0), RAD(45)) * RIGHTSHOULDERC0, Speed / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE + 0.15 * COS(SINE / 12) - 0.05 * COS(SINE / 12), 0.5*SIZE) * ANGLES(RAD(5), RAD(25), RAD(-15)) * LEFTSHOULDERC0, Speed / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), Speed / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), Speed / Animation_Speed)
		end
		for i=0, Time, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), Speed / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(5), RAD(0), RAD(0)), Speed / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35*SIZE, 0.65*SIZE, -0.5*SIZE) * ANGLES(RAD(175), RAD(0), RAD(-35)) * RIGHTSHOULDERC0, Speed / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE + 0.15 * COS(SINE / 12) - 0.05 * COS(SINE / 12), 0.5*SIZE) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, Speed / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), Speed / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), Speed / Animation_Speed)
			HATWELD.C0 = Clerp(HATWELD.C0, CF(-0.5,-1.2,-0.3) * ANGLES(RAD(0), RAD(0), RAD(180)) * ANGLES(RAD(35), RAD(0), RAD(35)), Speed / Animation_Speed)
		end
		HATWELD.Part0 = Head
		HATWELD.C0 = CF(0,1,0)
	elseif WhichPose == "Prepare key" then
		for i=0, Time, 0.1 / Animation_Speed do
			Swait()
			if Gyro ~= nil and Gyro ~= false then
				Gyro.cframe = CF(RootPart.Position,Tors.Position)
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE, 0*SIZE, 0*SIZE + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(65)), Speed / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0*SIZE, 0*SIZE, 0*SIZE + ((1*SIZE) - 1*SIZE)) * ANGLES(RAD(5 - 6.5 * SIN(SINE / 12)), RAD(0), RAD(-65)), Speed / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE + 0.15*SIZE * COS(SINE / 12) - 0.05 * COS(SINE / 12), -0.25) * ANGLES(RAD(90), RAD(0), RAD(65)) * RIGHTSHOULDERC0, Speed / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE + 0.15*SIZE * COS(SINE / 12) - 0.05 * COS(SINE / 12), 0.5) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, Speed / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
	elseif WhichPose == "Turn key" then
		for i=0, Time, 0.1 / Animation_Speed do
			Swait()
			if Gyro ~= nil and Gyro ~= false then
				Gyro.cframe = CF(RootPart.Position,Tors.Position)
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE, 0*SIZE, 0*SIZE + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(75)), Speed / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0*SIZE, 0*SIZE, 0*SIZE + ((1*SIZE) - 1*SIZE)) * ANGLES(RAD(5 - 6.5 * SIN(SINE / 12)), RAD(0), RAD(-75)), Speed / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5*SIZE + 0.15*SIZE * COS(SINE / 12) - 0.05 * COS(SINE / 12), -0.25) * ANGLES(RAD(90), RAD(0), RAD(75)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * RIGHTSHOULDERC0, Speed / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE + 0.15*SIZE * COS(SINE / 12) - 0.05 * COS(SINE / 12), 0.5) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, Speed / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
	end
	PLAYMAINANIM = true
end

--//=================================\\
--||			DAMAGING
--\\=================================//

function killnearest(position,range,maxstrength,direction)
    for i,v in ipairs(workspace:GetChildren()) do
    local body = v:GetChildren()
        for part = 1, #body do
            if((body[part].ClassName == "Part" or body[part].ClassName == "MeshPart") and v ~= Character) then
                if(body[part].Position - position).Magnitude < range then
                    if v.ClassName == "Model" then
                        --v:BreakJoints()
                    end
                    local POS = position
                    coroutine.resume(coroutine.create(function()
                        body[part].Anchored = true
                        body[part].Parent = Effects
                        body[part].CanCollide = true
                        local SIZE = body[part].Size
                        body[part].Material = "Neon"
                        CreateSound("952306739", body[part], 2, MRANDOM(7, 12) / 10)
                        for i = 1, 75 do
                            Swait()
                            body[part].Color = C3(MRANDOM(0,100)/100,MRANDOM(0,100)/100,MRANDOM(0,100)/100)
                            body[part].Size = VT(SIZE.X+MRANDOM(-2,2),SIZE.Y+MRANDOM(-2,2),SIZE.Z+MRANDOM(-2,2))
                        end
                        coroutine.resume(coroutine.create(function()
                            while true do
                                Swait()
                                body[part].Color = C3(MRANDOM(0,100)/100,MRANDOM(0,100)/100,MRANDOM(0,100)/100)
                                body[part].Size = VT(SIZE.X+MRANDOM(-2,2),SIZE.Y+MRANDOM(-2,2),SIZE.Z+MRANDOM(-2,2))
                            end
                        end))
                        body[part].Anchored = false
                        body[part].Velocity = direction.lookVector*maxstrength
                    end))
                end
            end
        end
        if v.ClassName == "Part" then
            if v.Anchored == false and (v.Position - position).Magnitude < range then
                local POS = position
                coroutine.resume(coroutine.create(function()
                    v.Anchored = true
                    v.Parent = Effects
                    local SIZE = v.Size
                    v.Material = "Neon"
                    CreateSound("952306739", v, 2, MRANDOM(7, 12) / 10)
                    for i = 1, 75 do
                        Swait()
                        v.Color = C3(MRANDOM(0,100)/100,MRANDOM(0,100)/100,MRANDOM(0,100)/100)
                        v.Size = VT(SIZE.X+MRANDOM(-2,2),SIZE.Y+MRANDOM(-2,2),SIZE.Z+MRANDOM(-2,2))
                    end
                    coroutine.resume(coroutine.create(function()
                        while true do
                            Swait()
                            v.Color = C3(MRANDOM(0,100)/100,MRANDOM(0,100)/100,MRANDOM(0,100)/100)
                            v.Size = VT(SIZE.X+MRANDOM(-2,2),SIZE.Y+MRANDOM(-2,2),SIZE.Z+MRANDOM(-2,2))
                        end
                    end))
                    v.Anchored = false
                    v.Velocity = direction.lookVector*maxstrength
                end))
            end
        end
    end
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

function AoEDamage(position,radius,min,max,maxstrength,critrate,critmultiplier,BESERK)
	local dmg = math.random(10000,100000)
	for i,v in ipairs(workspace:GetChildren()) do
	if v:FindFirstChild("HitBy"..Player.Name) == nil then
		local body = v:GetChildren()
			for part = 1, #body do
				if(v:FindFirstChild("HitBy"..Player.Name) == nil and (body[part].ClassName == "Part" or body[part].ClassName == "MeshPart") and v ~= Character) then
					if(body[part].Position - position).Magnitude < radius then
						if v.ClassName == "Model" then
							if v:FindFirstChildOfClass("Humanoid") then
								ApplyDamage(v:FindFirstChildOfClass("Humanoid"),dmg,critrate,critmultiplier,BESERK)
								local bv = Instance.new("BodyVelocity") 
								bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
								bv.velocity = CF(position,body[part].Position).lookVector*maxstrength
								bv.Parent = body[part]
								Debris:AddItem(bv,0.2)
							end
						end
					end
				end
			end
		end
		if v:FindFirstChild("HitBy"..Player.Name) then
			v:FindFirstChild("HitBy"..Player.Name):remove()
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
			hum.CameraOffset = Vector3.new(Rad(Mrandom(-intensity, intensity)), Rad(Mrandom(-intensity, intensity)), Rad(Mrandom(-intensity, intensity)))
			cam.CFrame = cam.CFrame * CF(Rad(Mrandom(-intensity, intensity)), Rad(Mrandom(-intensity, intensity)), Rad(Mrandom(-intensity, intensity))) * Euler(Rad(Mrandom(-intensity, intensity)) * rotM, Rad(Mrandom(-intensity, intensity)) * rotM, Rad(Mrandom(-intensity, intensity)) * rotM)
		end
		hum.CameraOffset = Vector3.new(0, 0, 0)
	end))
end

function ApplyDamage(Humanoid,Damage,TorsoPart)
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

function ApplyAoE(POSITION,RANGE,MINDMG,MAXDMG,FLING,INSTAKILL)
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



function MagicSphere2(size,waitt,cframe,color)
	local wave = CreatePart(3, Effects, "Neon", 0, 1, BRICKC(color), "Effect", VT(1,1,1))
	local mesh = IT("SpecialMesh",wave)
	mesh.MeshType = "Sphere"
	mesh.Scale = VT(size,size,size)
	mesh.Offset = VT(0,0,0)
	wave.CFrame = cframe
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, waitt do
			Swait()
			mesh.Scale = mesh.Scale - VT(size/waitt,size/waitt,size/waitt)
			wave.Transparency = wave.Transparency - (1/waitt)
		end
		wave:remove()
	end))
end

function MagicSphere(size,waitt,cframe,color)
	local wave = CreatePart(3, Effects, "Neon", 0, 0, BRICKC(color), "Effect", VT(1,1,1))
	local mesh = IT("SpecialMesh",wave)
	mesh.MeshType = "Sphere"
	mesh.Scale = VT(size,size,size)
	mesh.Offset = VT(0,0,0)
	wave.CFrame = cframe
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, waitt do
			Swait()
			mesh.Scale = mesh.Scale + VT(size/5,size/5,size/5)
			wave.Transparency = wave.Transparency + (1/waitt)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

local asd = Instance.new("ParticleEmitter")
asd.Color = ColorSequence.new(Color3.new(0.5, 0.5, 0), Color3.new(.3, .3, 0))
asd.LightEmission = .1
asd.Texture = "http://www.roblox.com/asset/?ID=291880914"
aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.6),NumberSequenceKeypoint.new(1, 2)})
bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
asd.Transparency = bbb
asd.Size = aaa
asd.ZOffset = .9
asd.Acceleration = Vector3.new(0, -15, 0)
asd.LockedToPart = false
asd.EmissionDirection = "Back"
asd.Lifetime = NumberRange.new(1, 2)
asd.Rotation = NumberRange.new(-100, 100)
asd.RotSpeed = NumberRange.new(-100, 100)
asd.Speed = NumberRange.new(10)
asd.Enabled = false
asd.VelocitySpread = 999

function getbloody(victim,amount)
	local PART = CreatePart(3, Effects, "Metal", 0, 1, "Mid gray", "Blood", victim.Size)
	PART.CFrame = victim.CFrame
	local HITPLAYERSOUNDS = {"356551938","264486467"}
	Debris:AddItem(PART,5)
	CreateSound(HITPLAYERSOUNDS[MRANDOM(1, #HITPLAYERSOUNDS)], PART, 1, (math.random(8,12)/10))
	CreateSound(HITPLAYERSOUNDS[MRANDOM(1, #HITPLAYERSOUNDS)], PART, 1, (math.random(8,12)/10))
	CreateSound(HITPLAYERSOUNDS[MRANDOM(1, #HITPLAYERSOUNDS)], PART, 1, (math.random(8,12)/10))
	local prtcl = asd:Clone()
	prtcl.Parent = PART
	prtcl:Emit(amount*10)
end

function Kill(Char)
	local NewCharacter = IT("Model",Effects)
	NewCharacter.Name = "Ow im ded ;-;"
	for _, c in pairs(Char:GetDescendants()) do
		if c:IsA("BasePart") and c.Transparency == 0 then
			if c.Parent == Char then
				getbloody(c,5)
			end
			c:BreakJoints()
			c.Material = "Glass"
			c.Color = C3(0.5,0.5,0)
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

--//=================================\\
--||          SOME TAG EDIT
--\\=================================//

m = Player
char = m.Character
local txt = Instance.new("BillboardGui", char)
txt.Adornee = char.Head
txt.Name = "_status"
txt.Size = UDim2.new(2, 0, 1.2, 0)
txt.StudsOffset = Vector3.new(-9, 10, 0)
local text = Instance.new("TextLabel", txt)
text.Size = UDim2.new(10, 0, 7, 0)
text.FontSize = "Size24"
text.TextScaled = true
text.TextTransparency = 0
text.BackgroundTransparency = 1
text.TextTransparency = 0
text.TextStrokeTransparency = 0
text.Font = "Bodoni"
text.TextStrokeColor3 = Color3.new(255/255, 255/255, 255/255)
v = Instance.new("Part")
v.Name = "ColorBrick"
v.Parent = m.Character
v.FormFactor = "Symmetric"
v.Anchored = true
v.CanCollide = false
v.BottomSurface = "Smooth"
v.TopSurface = "Smooth"
v.Size = Vector3.new(10, 5, 3)
v.Transparency = 1
v.CFrame = char.Torso.CFrame
v.BrickColor = BrickColor.new("Really black")
v.Transparency = 1
v.Shape = "Block"
coroutine.resume(coroutine.create(function()
sick.TimePosition = 12
text.Text = "Switcher v.2"
end))

--//=================================\\
--||	     MODE SWITCHING
--\\=================================//

function Intro()
	ATTACK = true
	Rooted = true
coroutine.resume(coroutine.create(function()
	    wait(7)
	    top.ShirtTemplate = "rbxassetid://45695443"
        bottom.PantsTemplate = "rbxassetid://45696190"
        HeadColor = C3(0,0,0)
        BodyColor = C3(0,0,0)
        LostHope.Parent = nil
        Superior.Parent = Character
        Swait(30)
        Superior.Parent = nil
		Voided.Parent = Character
        top.ShirtTemplate = "rbxassetid://236410507"
        bottom.PantsTemplate = "rbxassetid://236412261"
        HeadColor = C3(0,0,0)
        BodyColor = C3(0,0,0)
        BlackMask.Parent = Character
        Swait(30)
        top.ShirtTemplate = "rbxassetid://338740550"
        bottom.PantsTemplate = "rbxassetid://338750779"
        HeadColor = C3(1,1,1)
        BodyColor = C3(1,1,1)
        MaskColor = C3(255,0,0)
        BlackMask.Parent = nil
		Voided.Parent = nil
		Injustice.Parent = Character
		InjusticeGun.Parent = Character
        Swait(30)
        top.ShirtTemplate = "rbxassetid://1533635803"
        bottom.PantsTemplate = "rbxassetid://1460022985"
        HeadColor = C3(1,1,1)
        BodyColor = C3(0,0,0)
		Injustice.Parent = nil
		InjusticeGun.Parent = nil
		TomYum.Parent = Character
		LostHope.Parent = Character
        Swait(30)
		TomYum.Parent = nil
		end))
	repeat 
		Swait() 
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-3.5 * COS(SINE / 12)), RAD(-45), RAD(12)) * ANGLES(RAD(-45 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.1 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.8 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(0), RAD(45), RAD(-12)) * ANGLES(RAD(-45 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.1 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(2.5 * COS(SINE / 12))), 0.8 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.1 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0 - 2.5 * COS(SINE / 12))), 0.8 / Animation_Speed)
	until sick.TimePosition > 14
	repeat 
		Swait()
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0 * SIZE, 0 * SIZE, -1 * SIZE) * ANGLES(RAD(45), RAD(0), RAD(0)), 0.2 / Animation_Speed/8)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0 * SIZE, 0 * SIZE, 0 + ((1 * SIZE) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * SIZE, 1 * SIZE, 1 * SIZE) * ANGLES(RAD(30), RAD(-690), RAD(2 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 24))) * RIGHTSHOULDERC0, 0.15 / Animation_Speed/8)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * SIZE, 0.5 * SIZE, 0 * SIZE) * ANGLES(RAD(90), RAD(25), RAD(45)) * LEFTSHOULDERC0, 0.15 / Animation_Speed/8)
			RightHip.C0 = Clerp(RightHip.C0, CF(1 * SIZE, -0.3 * SIZE, -1 * SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-20)), 0.2 / Animation_Speed/8)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1 * SIZE, -0.3 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(5), RAD(0)) * ANGLES(RAD(45), RAD(0), RAD(10)), 0.2 / Animation_Speed/8)
	until sick.TimePosition > 16
	repeat 
		Swait() 
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0 * SIZE, 0 * SIZE, -1 * SIZE) * ANGLES(RAD(45), RAD(0), RAD(0)), 0.2 / Animation_Speed*3)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0 * SIZE, 0 * SIZE, 0 + ((1 * SIZE) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
            RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 1*SIZE, -0.3*SIZE) * ANGLES(RAD(0.98), RAD(-119.59 + 2.5 * SIN(SINE / 25)), RAD(-175.39 + 2.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 0.2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * SIZE, 0.5 * SIZE, 0 * SIZE) * ANGLES(RAD(90), RAD(25), RAD(45)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1 * SIZE, -0.3 * SIZE, -1 * SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-20)), 0.2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1 * SIZE, -0.3 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(5), RAD(0)) * ANGLES(RAD(45), RAD(0), RAD(10)), 0.2 / Animation_Speed)
	until sick.TimePosition > 20.7
	tecks2.TextTransparency = 0
	text.Text = "HopeLess"
	TRANSFORMED = true
	ATTACK = false
	Rooted = false
	end
	
function InsaneCameraText()
	local FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0, 0, 0, 0), UD2(0.13, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "SNAP!!")
local FACEME = {"PLZZZZ","MAX-LOCAL DANG","HAHAHA","BY NAMECLAN??!","IWANNAEATTOMYUM","AM I PRETTY?","YA HAHAH","PANDORA EDIT??!!","I CAN'T DO IT ANYMORE","PLZ DON'T LEAK THIS","PLZ DON'T LEAK THIS","PLZ DON'T LEAK THIS","PLZ DON'T LEAK THIS","PLZ DON'T LEAK THIS","PLZ DON'T LEAK THIS","PLZ DON'T LEAK THIS","PLZ DON'T LEAK THIS","PLZ DON'T LEAK THIS"}
local INSANITYGUIS = {}
for e = 1, 28 do
    for i = 1, 22 do
        local MURDERFRAME = FRAME:Clone()
        MURDERFRAME.Position = UD2(-0.05+i/30, 0, e/30, 0)
        MURDERFRAME.Parent = WEAPONGUI
        table.insert(INSANITYGUIS,MURDERFRAME)
    end
end
coroutine.resume(coroutine.create(function()
    while true do
        wait()
        coroutine.resume(coroutine.create(function()
            local COLOR = C3(MRANDOM(100,255)/255,0,0)
            local APPEARTEXT = FACEME[MRANDOM(1,#FACEME)]
            local SHOW = ""
            for i = 1,string.len(APPEARTEXT),1 do
                local STRING = string.sub(APPEARTEXT,i,i)
                if MRANDOM(1,2) == 1 then
                    SHOW = SHOW..string.lower(STRING)
                else
                    SHOW = SHOW..STRING
                end
            end
            local PARENT = INSANITYGUIS[MRANDOM(1,#INSANITYGUIS)]
            local TEXT = CreateLabel(PARENT, SHOW, COLOR, 7, SKILLFONT, 1, 2, 1, "THISISYOURFAULTH")
            for i = 1, 15 do
                Swait()
                TEXT.Rotation = MRANDOM(-15,15)
                TEXT.TextTransparency = TEXT.TextTransparency - 1/15
            end
            for i = 1, 15 do
                Swait()
                TEXT.Rotation = MRANDOM(-15,15)
                TEXT.TextTransparency = TEXT.TextTransparency + 1/15
            end
            TEXT:Remove()
        end))
    end
end))
FRAME:remove()
end




function SuperiorForm()
	ATTACK = true
	Rooted = true
	local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 25*SIZE, Character)
	if MODE == "Main" then
		SONG = 1873219898
		VOLUME = 3
		PITCH = 0.96
		sick.TimePosition = 1
        top.ShirtTemplate = "rbxassetid://45695443"
        bottom.PantsTemplate = "rbxassetid://45696190"
        HeadColor = C3(0,0,0)
        BodyColor = C3(0,0,0)
        text.Text = "Superior"
        text.TextStrokeColor3 = Color3.new(255/255, 0/255, 0/255)
		-- Animation --
		coroutine.resume(coroutine.create(function()
		CameraEnshaking(5, 15)
		WACKYEFFECT({Time = 30, EffectType = "Sphere", Size = VT(75,75,75), Size2 = VT(0.5,0.5,0.5), Transparency = 0, Transparency2 = 0.6, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(255/255, 0/255, 0/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
		Swait(25)
        ApplyAoE(HITPOS,10,5,10,20,false)
        WACKYEFFECT({Time = 10, EffectType = "Wave", Size = VT(0.45,0.11,0.45)*SIZE, Size2 = VT(12,3,12), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(159/255, 0/255, 0/255), SoundID = 743521450, SoundPitch = 1, SoundVolume = 6})
        Swait(7.5)
        ApplyAoE(HITPOS,10,5,10,20,false)
        WACKYEFFECT({Time = 10, EffectType = "Wave", Size = VT(0.45,0.11,0.45)*SIZE, Size2 = VT(12,3,12), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(159/255, 0/255, 0/255), SoundID = 743521450, SoundPitch = 1, SoundVolume = 6})
        Swait(7.5)
        ApplyAoE(HITPOS,10,5,10,20,false)
        WACKYEFFECT({Time = 10, EffectType = "Wave", Size = VT(0.45,0.11,0.45)*SIZE, Size2 = VT(12,3,12), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(159/255, 0/255, 0/255), SoundID = 743521450, SoundPitch = 1, SoundVolume = 6})
        Swait(7.5)
        ApplyAoE(HITPOS,10,5,10,20,false)
        WACKYEFFECT({Time = 10, EffectType = "Wave", Size = VT(0.45,0.11,0.45)*SIZE, Size2 = VT(12,3,12), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(159/255, 0/255, 0/255), SoundID = 743521450, SoundPitch = 1, SoundVolume = 6})
        Swait(7.5)
        ApplyAoE(HITPOS,10,5,10,20,false)
        WACKYEFFECT({Time = 10, EffectType = "Wave", Size = VT(0.45,0.11,0.45)*SIZE, Size2 = VT(12,3,12), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(159/255, 0/255, 0/255), SoundID = 743521450, SoundPitch = 1, SoundVolume = 6})
        Swait(7.5)
        ApplyAoE(HITPOS,10,5,10,20,false)
        WACKYEFFECT({Time = 10, EffectType = "Wave", Size = VT(0.45,0.11,0.45)*SIZE, Size2 = VT(12,3,12), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(159/255, 0/255, 0/255), SoundID = 743521450, SoundPitch = 1, SoundVolume = 6})
        Swait(7.5)
        ApplyAoE(HITPOS,10,5,10,20,false)
        WACKYEFFECT({Time = 10, EffectType = "Wave", Size = VT(0.45,0.11,0.45)*SIZE, Size2 = VT(12,3,12), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(159/255, 0/255, 0/255), SoundID = 743521450, SoundPitch = 1, SoundVolume = 6})
        Swait(7.5)
        ApplyAoE(HITPOS,10,5,10,20,false)
        WACKYEFFECT({Time = 10, EffectType = "Wave", Size = VT(0.45,0.11,0.45)*SIZE, Size2 = VT(12,3,12), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(159/255, 0/255, 0/255), SoundID = 743521450, SoundPitch = 1, SoundVolume = 6})
        Swait(7.5)
        ApplyAoE(HITPOS,10,10,20,40,false)
        WACKYEFFECT({Time = 30, EffectType = "Wave", Size = VT(0.45,0.11,0.45)*SIZE, Size2 = VT(15,4.5,15), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(159/255, 0/255, 0/255), SoundID = 743521450, SoundPitch = 1, SoundVolume = 6})
		end))
		LostHope.Parent = nil
		Superior.Parent = Character
		BlackMask.Parent = Character
		for i=0, 1.5, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(80), RAD(75), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(0), RAD(-25)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		for i=0, 1.5, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(0), RAD(-25)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		MODE = "Superior"
		Speed = 20
		CLOCKSPEED = 2
	elseif MODE == "Superior" then
		CreateSound(147722227, Torso, 4, 1.3, false)
		SONG = 1382488262
		VOLUME = 4
		PITCH = 1
		sick.TimePosition = 20.7
		WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(500,0.11,500)*SIZE, Size2 = VT(0,0.11,0), Transparency = 1, Transparency2 = 0, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(159/255, 111/255, 183/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
		WACKYEFFECT({Time = 37.5, EffectType = "Sphere", Size = VT(0.5,0.5,0.5), Size2 = VT(75,75,75), Transparency = 0, Transparency2 = 0.5, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(159/255, 111/255, 183/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
        Swait(15)
        text.Text = "HopeLess"
        text.TextStrokeColor3 = Color3.new(255/255, 255/255, 255/255)
        HeadColor = C3(1,1,1)
        BodyColor = C3(0,0,0)
        MaskColor = C3(159/255, 111/255, 183/255)
        LostHope.Parent = Character
        top.ShirtTemplate = "rbxassetid://1533635803"
        bottom.PantsTemplate = "rbxassetid://1460022985"
		CLOCKSPEED = 0
		Speed = 16
		BlackMask.Parent = nil
		LostHope.Parent = Character
		Superior.Parent = nil
		MODE = "Main"
	end
	ATTACK = false
	Rooted = false
end

function VoidedForm()
	ATTACK = true
	Rooted = true
	local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 25*SIZE, Character)
	if MODE == "Main" then
		-- Animation --
		coroutine.resume(coroutine.create(function()
        WACKYEFFECT({Time = 50, EffectType = "Box", Size = VT(8.5,0,8.5), Size2 = VT(8.5,12.5,8.5), Transparency = 0.3, Transparency2 = 0, CFrame = RootPart.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(153, 0/255, 153), SoundID = nil, SoundPitch = 0.9, SoundVolume = 8})
        wait(0.8)
        WACKYEFFECT({Time = 60, EffectType = "Box", Size = VT(8.5,12.5,8.5), Size2 = VT(8.5,0,8.5), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(153, 0/255, 153), SoundID = nil, SoundPitch = 0.9, SoundVolume = 8})
		wait(0.7)
		LostHope.Parent = nil
		Voided.Parent = Character
        top.ShirtTemplate = "rbxassetid://236410507"
        bottom.PantsTemplate = "rbxassetid://236412261"
        HeadColor = C3(0,0,0)
        BodyColor = C3(0,0,0)
        text.Text = "Voided"
        text.TextStrokeColor3 = Color3.new(153/255, 0/255, 153/255)
        BlackMask.Parent = Character
        WACKYEFFECT({Time = 185, EffectType = "Box", Size = VT(12,0.22,12)*2, Size2 = VT(0,0.22,0), Transparency = 1, Transparency2 = 0, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(153, 0/255, 153), SoundID = 1820267018, SoundPitch = 0.9, SoundVolume = 8})
        SONG = 1494340971
        Swait(83)
        VOLUME = 5
		PITCH = 1
		sick.TimePosition = 125
        CameraEnshaking(2, 35)
        WACKYEFFECT({Time = 105, EffectType = "Block", Size = VT(0,0,0), Size2 = VT(70,70,70)*2, Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(153, 0/255, 153), SoundID = 144699494, SoundPitch = 1, SoundVolume = 15})
        ApplyAoE(HITPOS,50,25,75,30,false)
        WACKYEFFECT({Time = 80, EffectType = "Wave", Size = VT(0,0.11,0), Size2 = VT(500,0.11,500), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1, 1, 1), SoundID = nil, SoundPitch = 1, SoundVolume = 15})
        end))
		for i=0, 1.5, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(20), RAD(0), RAD(140)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-20), RAD(0), RAD(-140)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(-15), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(-15), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		for i=0, 3, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 9999 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(50), RAD(125)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(-50), RAD(-125)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.71) * ANGLES(RAD(0), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-25)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.4) * ANGLES(RAD(0), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(30)), 1 / Animation_Speed)
		end
		for i=0, 1.8, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.9 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(135), RAD(0), RAD(0)), 0.6 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(-35), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.15*SIZE, 0.4*SIZE, 0.5) * ANGLES(RAD(-50), RAD(0), RAD(-45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.95*SIZE, -0.85) * ANGLES(RAD(150), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), 0.09) * ANGLES(RAD(0), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.41) * ANGLES(RAD(0), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		MODE = "Voided"
		Speed = 35
		CLOCKSPEED = 0
	elseif MODE == "Voided" then
		CreateSound(147722227, Torso, 4, 1.3, false)
		SONG = 1382488262
		VOLUME = 4
		PITCH = 1
		sick.TimePosition = 20.7
		WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(500,0.11,500)*SIZE, Size2 = VT(0,0.11,0), Transparency = 1, Transparency2 = 0, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(159/255, 111/255, 183/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
		WACKYEFFECT({Time = 37.5, EffectType = "Sphere", Size = VT(0.5,0.5,0.5), Size2 = VT(75,75,75), Transparency = 0, Transparency2 = 0.5, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(159/255, 111/255, 183/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
        Swait(15)
        HeadColor = C3(1,1,1)
        BodyColor = C3(0,0,0)
        MaskColor = C3(159/255, 111/255, 183/255)
        text.Text = "HopeLess"
        text.TextStrokeColor3 = Color3.new(255/255, 255/255, 255/255)
        LostHope.Parent = Character
        top.ShirtTemplate = "rbxassetid://1533635803"
        bottom.PantsTemplate = "rbxassetid://1460022985"
		CLOCKSPEED = 0
		Speed = 16
		BlackMask.Parent = nil
		LostHope.Parent = Character
		Voided.Parent = nil
		MODE = "Main"
	end
	ATTACK = false
	Rooted = false
end

function InjusticeForm()
	ATTACK = true
	Rooted = true
	local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 25*SIZE, Character)
	if MODE == "Main" then
		SONG = 1092048938
		VOLUME = 4
		PITCH = 1.02
		sick.TimePosition = 0.2
		coroutine.resume(coroutine.create(function()
        WACKYEFFECT({Time = 60, EffectType = "Wave", Size = VT(12,0.55,12)*SIZE, Size2 = VT(12,0.55,12), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 0/255), SoundID = nil, SoundPitch = 1, SoundVolume = 6})
        Swait(10)
        WACKYEFFECT({Time = 60, EffectType = "Sphere", Size = VT(0.5,0.55,0.5), Size2 = VT(0.5,4,0.5), Transparency = 0, Transparency2 = 1, CFrame = Head.CFrame*CF(0.4, 0.2, -0.8), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 0/255), SoundID = 743521450, SoundPitch = 1.15, SoundVolume = 6})
        WACKYEFFECT({Time = 60, EffectType = "Sphere", Size = VT(0.55,0.5,0.5), Size2 = VT(4,0.5,0.5), Transparency = 0, Transparency2 = 1, CFrame = Head.CFrame*CF(0.4, 0.2, -0.8), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 0/255), SoundID = 743521450, SoundPitch = 0.95, SoundVolume = 6})
        Swait(57)
        WACKYEFFECT({Time = 150, EffectType = "Wave", Size = VT(12,0.55,12)*SIZE, Size2 = VT(12,0.55,12), Transparency = 1, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 0/255), SoundID = 1259054947, SoundPitch = 1, SoundVolume = 6})
        Swait(6.5)
        CameraEnshaking(1.5, 25)
        ApplyAoE(HITPOS,8,10,15,100,false)
        text.Text = "Injustice"
        text.TextStrokeColor3 = Color3.new(255/255, 255/255, 0/255)
        for i=0, 1, 0.1 / Animation_Speed do
		WACKYEFFECT({Time = 85, EffectType = "Crystal", Size = VT(8,8,8)*1.5, Size2 = VT(0,4,0), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1,0)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Glass", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
        end
		end))
		for i=0, 1.5, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0.5, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(20), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(20), RAD(0), RAD(-90)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(-15), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(-15), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		for i=0, 0.4, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0.5, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(50), RAD(90)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(-50), RAD(-90)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(-15), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(-15), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(10), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.2*SIZE, 0.5*SIZE, -0.7) * ANGLES(RAD(0), RAD(170), RAD(90)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.2*SIZE, 0.5*SIZE, -0.7) * ANGLES(RAD(0), RAD(-170), RAD(-90)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(10), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(10), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
        top.ShirtTemplate = "rbxassetid://338740550"
        bottom.PantsTemplate = "rbxassetid://338750779"
        HeadColor = C3(1,1,1)
        BodyColor = C3(1,1,1)
        MaskColor = C3(255,0,0)
		LostHope.Parent = nil
		Injustice.Parent = Character
		InjusticeGun.Parent = Character
		MODE = "Injustice"
		Speed = 15
		CLOCKSPEED = 0
	elseif MODE == "Injustice" then
		CreateSound(147722227, Torso, 4, 1.3, false)
		SIZE = 1.4
		SONG = 1382488262
		VOLUME = 4
		PITCH = 1
		sick.TimePosition = 20.7
		WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(500,0.11,500)*SIZE, Size2 = VT(0,0.11,0), Transparency = 1, Transparency2 = 0, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(159/255, 111/255, 183/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
		WACKYEFFECT({Time = 37.5, EffectType = "Sphere", Size = VT(0.5,0.5,0.5), Size2 = VT(75,75,75), Transparency = 0, Transparency2 = 0.5, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(159/255, 111/255, 183/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
        Swait(15)
        HeadColor = C3(1,1,1)
        BodyColor = C3(0,0,0)
        MaskColor = C3(159/255, 111/255, 183/255)
        text.Text = "HopeLess"
        text.TextStrokeColor3 = Color3.new(255/255, 255/255, 255/255)
        LostHope.Parent = Character
        top.ShirtTemplate = "rbxassetid://1533635803"
        bottom.PantsTemplate = "rbxassetid://1460022985"
		CLOCKSPEED = 0
		Speed = 16
		LostHope.Parent = Character
		Injustice.Parent = nil
		InjusticeGun.Parent = nil
		MODE = "Main"
	end
	ATTACK = false
	Rooted = false
end
	
function TomYumForm()
	ATTACK = true
	Rooted = true
	local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 25*SIZE, Character)
	if MODE == "Main" then
		SONG = 534861083
		VOLUME = 2
		PITCH = 1
		sick.TimePosition = 8
		coroutine.resume(coroutine.create(function()
	    Swait(75)
	    VOLUME = 5
		WACKYEFFECT({Time = 55, EffectType = "Sphere", Size = VT(0.55,0.55,0.55), Size2 = VT(55,55,55), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0, 0, 0), MoveToPos = nil, RotationX = 30, RotationY = 30, RotationZ = 30, Material = "Neon", Color = C3(130/255, 80/255, 160/255), SoundID = 743521450, SoundPitch = 0.95, SoundVolume = 6})
		WACKYEFFECT({Time = 70, EffectType = "Sphere", Size = VT(0.55,0.5,0.5), Size2 = VT(130,0.5,0.5), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0, 0, 0), MoveToPos = nil, RotationX = 30, RotationY = 30, RotationZ = 30, Material = "Neon", Color = C3(159/255, 111/255, 183/255), SoundID = 0, SoundPitch = 0.95, SoundVolume = 6})
		WACKYEFFECT({Time = 70, EffectType = "Sphere", Size = VT(0.5,0.5,0.55), Size2 = VT(0.5,0.5,130), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0, 0, 0), MoveToPos = nil, RotationX = 30, RotationY = 30, RotationZ = 30, Material = "Neon", Color = C3(159/255, 111/255, 183/255), SoundID = 0, SoundPitch = 0.95, SoundVolume = 6})
		WACKYEFFECT({Time = 70, EffectType = "Sphere", Size = VT(0.5,0.55,0.5), Size2 = VT(0.5,130,0.5), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0, 0, 0), MoveToPos = nil, RotationX = 30, RotationY = 30, RotationZ = 30, Material = "Neon", Color = C3(159/255, 111/255, 183/255), SoundID = 0, SoundPitch = 0.95, SoundVolume = 6})
		CameraEnshaking(5,15)
		ApplyAoE(HITPOS,20,20,35,50,false)
        text.Text = "Maniac-TomYum"
        text.TextStrokeColor3 = Color3.new(0/255, 0/255, 0/255)
		Swait(15)
		TomYum.Parent = Character
		end))
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(0), RAD(200)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(0), RAD(-200)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		CameraEnshaking(1,45)
		CreateSound(363808674, Torso, 6, 1, false)
		for i=0, 0.5, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(25)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-40), RAD(50), RAD(200)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(40), RAD(50), RAD(-200)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		CameraEnshaking(1,45)
		CreateSound(363808674, Torso, 6, 1, false)
		for i=0, 0.5, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(-25)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(40), RAD(-50), RAD(200)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-40), RAD(-50), RAD(-200)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		CreateSound(363808674, Torso, 6, 0.9, false)
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(-20), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(-35), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-40), RAD(0), RAD(40)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-40), RAD(0), RAD(-40)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(-20), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(-20), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		MODE = "TomYum"
		Speed = 15
		CLOCKSPEED = 0
	elseif MODE == "TomYum" then
		TomYum.Parent = nil
		CreateSound(147722227, Torso, 4, 1.3, false)
		SIZE = 1.4
		SONG = 1382488262
		VOLUME = 4
		PITCH = 1
		sick.TimePosition = 20.7
		WACKYEFFECT({Time = 50, EffectType = "Wave", Size = VT(500,0.11,500)*SIZE, Size2 = VT(0,0.11,0), Transparency = 1, Transparency2 = 0, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(159/255, 111/255, 183/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
		WACKYEFFECT({Time = 37.5, EffectType = "Sphere", Size = VT(0.5,0.5,0.5), Size2 = VT(75,75,75), Transparency = 0, Transparency2 = 0.5, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(159/255, 111/255, 183/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
        Swait(15)
        HeadColor = C3(1,1,1)
        BodyColor = C3(0,0,0)
        MaskColor = C3(159/255, 111/255, 183/255)
        text.Text = "HopeLess"
        text.TextStrokeColor3 = Color3.new(255/255, 255/255, 255/255)
        top.ShirtTemplate = "rbxassetid://1533635803"
        bottom.PantsTemplate = "rbxassetid://1460022985"
		CLOCKSPEED = 0
		Speed = 16
		MODE = "Main"
	end
	ATTACK = false
	Rooted = false
end
	
--//=================================\\
--||	ATTACK FUNCTIONS AND STUFF
--\\=================================//

function MagicMissiles()
	ATTACK = true
	Rooted = true
	local SELECTING = true
	local SPOTS = {}
	coroutine.resume(coroutine.create(function()
		local LOOP = 0
		repeat
			LOOP = LOOP + 1
			Swait()
			if LOOP >= 10 then
				LOOP = 0
				for i = 1, #SPOTS do
					if SPOTS[i] ~= nil then
						WACKYEFFECT({Time = 15, EffectType = "Wave", Size = VT(0,0,0)*SIZE, Size2 = VT(8,2,8), Transparency = 0, Transparency2 = 1, CFrame = SPOTS[i], MoveToPos = nil, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 255/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
						WACKYEFFECT({Time = 15, EffectType = "Wave", Size = VT(0,0,0)*SIZE, Size2 = VT(6,3,6), Transparency = 0, Transparency2 = 1, CFrame = SPOTS[i], MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 255/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
					end
				end
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(-25 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35*SIZE, 0.65*SIZE, 0*SIZE) * ANGLES(RAD(115), RAD(45), RAD(35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(85), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-85), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		until SELECTING == false
		Rooted = false
		repeat
			LOOP = LOOP + 1
			Swait()
			if LOOP >= 10 then
				LOOP = 0
				for i = 1, #SPOTS do
					if SPOTS[i] ~= nil then
						WACKYEFFECT({Time = 15, EffectType = "Wave", Size = VT(0,0,0)*SIZE, Size2 = VT(8,2,8), Transparency = 0, Transparency2 = 1, CFrame = SPOTS[i], MoveToPos = nil, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 255/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
						WACKYEFFECT({Time = 15, EffectType = "Wave", Size = VT(0,0,0)*SIZE, Size2 = VT(6,3,6), Transparency = 0, Transparency2 = 1, CFrame = SPOTS[i], MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 255/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
					end
				end
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(0 - 4 * SIN(SINE / 12)), RAD(25), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35*SIZE, 0.65*SIZE, 0*SIZE) * ANGLES(RAD(90), RAD(0), RAD(35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(85), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-85), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		until ATTACK == false
	end))
	repeat
		repeat Swait() until HOLD == true
			local DIST = (RootPart.Position - Mouse.Hit.p).Magnitude
			if DIST > 99999 then
				DIST = 99999
			end
			local RAY,RAYPOS = Raycast(RootPart.Position, (CF(RootPart.Position, Mouse.Hit.p)).lookVector, DIST, workspace)	
			local HITFLOOR,HITPOS,NORMAL = Raycast(RAYPOS+VT(0,1,0), (CF(RAYPOS, RAYPOS + VT(0, -1, 0))).lookVector, 25*SIZE, Character)	
			if HITFLOOR ~= nil then
				table.insert(SPOTS,CF(HITPOS,HITPOS+NORMAL) * ANGLES(RAD(90), RAD(0), RAD(0)))
				WACKYEFFECT({Time = 15, EffectType = "Wave", Size = VT(0,0,0)*SIZE, Size2 = VT(6,2,6), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1.2,0) * ANGLES(RAD(180), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 255/255), SoundID = 90655239, SoundPitch = 1, SoundVolume = 6})
				WACKYEFFECT({Time = 15, EffectType = "Wave", Size = VT(0,0,0)*SIZE, Size2 = VT(4,3,4), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1.2,0) * ANGLES(RAD(180), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 255/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
			end
		repeat Swait() until HOLD == false
	until #SPOTS == 1
	SELECTING = false
	for i = 1, #SPOTS do
		if SPOTS[i] ~= nil then
			local POS = SPOTS[i]
			coroutine.resume(coroutine.create(function()
				local MISSILE = IT("Model",Effects)
				MISSILE.Name = "Missile"
				local BASEPART = CreatePart(3, MISSILE, "Neon", 0, 1, "Miduim stone gray", "Part", VT(2,2,2))
				MakeForm(BASEPART,"Cyl")
				MISSILE.PrimaryPart = BASEPART
				BASEPART.CFrame = POS*CF(0,-30*3,0)
				local HEAD = CreatePart(3, MISSILE, "Neon", 0, 1, "Miduim stone gray", "Part", VT(2,4,2))
				MakeForm(HEAD,"Ball")
				HEAD.CFrame = BASEPART.CFrame*CF(0,1,0)
				local TAIL = CreatePart(3, MISSILE, "Neon", 0, 1, "Miduim stone gray", "Part", VT(2.5,0.1,2.5))
				MakeForm(TAIL,"Cyl")
				TAIL.CFrame = BASEPART.CFrame*CF(0,-1,0)
				for i = 1, 10 do
					Swait()
					for _, c in pairs(MISSILE:GetChildren()) do
						if c.ClassName == "Part" then
							c.Transparency = c.Transparency - 1/10
						end
					end
				end
				for i = 1, 15*1.5 do
					Swait()
					MISSILE:SetPrimaryPartCFrame(BASEPART.CFrame*CF(0,1.35*3,0))
				end
				ApplyAoE(BASEPART.CFrame.p,20,35,45,75,false)
				WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(0,0,0), Size2 = VT(75,1,75), Transparency = 0.5, Transparency2 = 1, CFrame = BASEPART.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 255/255), SoundID = nil, SoundPitch = 1.2, SoundVolume = 4})
				WACKYEFFECT({Time = 45, EffectType = "Sphere", Size = VT(0,0,0), Size2 = VT(35,35,35), Transparency = 0, Transparency2 = 1, CFrame = BASEPART.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 255/255), SoundID = 165970126, SoundPitch = MRANDOM(13,15)/10, SoundVolume = 4})
				WACKYEFFECT({Time = 45, EffectType = "Wave", Size = VT(0,0,0)*SIZE, Size2 = VT(22,2,22), Transparency = 0, Transparency2 = 1, CFrame = POS * ANGLES(RAD(180), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(155/255, 155/255, 155/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
				WACKYEFFECT({Time = 45, EffectType = "Wave", Size = VT(0,0,0)*SIZE, Size2 = VT(20,3,20), Transparency = 0, Transparency2 = 1, CFrame = POS * ANGLES(RAD(180), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Neon", Color = C3(155/255, 155/255, 155/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
				MISSILE:remove()
			end))
		end
	end
	wait(0.6)
	ATTACK = false
	Rooted = false
end

function TimesUp()
	CLOCKTARGET = nil
	if Mouse.Target.Parent ~= Character and Mouse.Target.Parent.Parent ~= Character and Mouse.Target.Parent:FindFirstChildOfClass("Humanoid") ~= nil then
		local HUM = Mouse.Target.Parent:FindFirstChildOfClass("Humanoid")
		local TORSO = HUM.Parent:FindFirstChild("Torso") or HUM.Parent:FindFirstChild("UpperTorso")
		if TORSO then
			ATTACK = true
			Rooted = false
			coroutine.resume(coroutine.create(function()
				repeat
					Swait()
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(25 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35*SIZE, 0.5*SIZE, -0.2*SIZE) * ANGLES(RAD(75), RAD(45), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				until ATTACK == false
			end))
			if Effects:FindFirstChild("NeonDoll") then
				repeat Swait() until Effects:FindFirstChild("NeonDoll") == nil
			end
			wait(0.5)
			local FAKECHARACTER = IT("Model",Effects)
			FAKECHARACTER.Name = "NeonDoll"
			local TORS = CreatePart(3, FAKECHARACTER, "Neon", 0, 1, "Really red", "Part", VT(0.3,0.3,0.15),false)
			CreateWeldOrSnapOrMotor("Weld", RING, RING, TORS, CF(0,0.6,0), CF(0,0,0))
			local LEG = CreatePart(3, FAKECHARACTER, "Neon", 0, 1, "Really red", "Part", VT(0.15,0.3,0.15),false)
			CreateWeldOrSnapOrMotor("Weld", TORS, TORS, LEG, CF(0.15/2,-0.15,0) * ANGLES(RAD(0), RAD(0), RAD(15)), CF(0,0.15,0))
			local LEG = CreatePart(3, FAKECHARACTER, "Neon", 0, 1, "Really red", "Part", VT(0.15,0.3,0.15),false)
			CreateWeldOrSnapOrMotor("Weld", TORS, TORS, LEG, CF(-0.15/2,-0.15,0) * ANGLES(RAD(0), RAD(0), RAD(-15)), CF(0,0.15,0))
			local ARM = CreatePart(3, FAKECHARACTER, "Neon", 0, 1, "Really red", "Part", VT(0.15,0.3,0.15),false)
			CreateWeldOrSnapOrMotor("Weld", TORS, TORS, ARM, CF(0.15,0.15/2,0) * ANGLES(RAD(0), RAD(0), RAD(90)), CF(0,0.15,0))
			local ARM = CreatePart(3, FAKECHARACTER, "Neon", 0, 1, "Really red", "Part", VT(0.15,0.3,0.15),false)
			CreateWeldOrSnapOrMotor("Weld", TORS, TORS, ARM, CF(-0.15,0.15/2,0) * ANGLES(RAD(0), RAD(0), RAD(-90)), CF(0,0.15,0))
			local HEAD = CreatePart(3, FAKECHARACTER, "Neon", 0, 1, "Really red", "Part", VT(0.15,0.15,0.15),false)
			CreateWeldOrSnapOrMotor("Weld", TORS, TORS, HEAD, CF(0,0.225,0), CF(0,0,0))
			CreateSound(201858045, TORS, 5, 0.4, false)
			for i = 1, 150 do
				Swait()
				CLOCKSPEED = 6
				for _, c in pairs(FAKECHARACTER:GetChildren()) do
					if c.ClassName == "Part" then
						c.Transparency = c.Transparency - 0.5/150
					end
				end
			end
			CLOCKTARGET = HUM
			coroutine.resume(coroutine.create(function()
				repeat Swait() CLOCKSPEED = 4 until CLOCKTARGET == nil
				for i = 1, 25 do
					Swait()
					for _, c in pairs(FAKECHARACTER:GetChildren()) do
						if c.ClassName == "Part" then
							c.Transparency = c.Transparency + 0.5/25
						end
					end
				end
				CLOCKSPEED = 2
				FAKECHARACTER:remove()
			end))
			wait(0.5)
			ATTACK = false
			Rooted = false
		end
	end
end

function ChainPunch()
	ATTACK = true
	Rooted = false
	local GYRO = IT("BodyGyro",RootPart)
	GYRO.D = 25
	GYRO.P = 2000
	GYRO.MaxTorque = VT(0,40000,0)
	GYRO.cframe = CF(RootPart.Position,Mouse.Hit.p)
	repeat
		Swait()
		GYRO.cframe = CF(RootPart.Position,Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(0 - 4 * SIN(SINE / 12)), RAD(25), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35*SIZE, 0.65*SIZE, 0*SIZE) * ANGLES(RAD(90), RAD(0), RAD(5)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(85), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-85), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
	until HOLD == true
	local POS = Mouse.Hit.p
	local CHAINS = false
	local CHAINLINKS = {}
	local A = IT("Attachment",RightArm)
	A.Position = VT(1,-1,0)*SIZE
	A.Orientation = VT(-90, -89.982, 0)
	local B = IT("Attachment",RightArm)
	B.Position = VT(-1,-1,0)*SIZE
	B.Orientation = VT(-90, 89.988, 0)
	local C = IT("Attachment",RightArm)
	C.Position = VT(0.5,-1.3,0)*SIZE
	C.Orientation = VT(-90, -89.982, 0)
	local D = IT("Attachment",RightArm)
	D.Position = VT(-0.5,-1.3,0)*SIZE
	D.Orientation = VT(-90, 89.988, 0)
	local LIGHT = IT("Attachment",RightArm)
	LIGHT.Position = VT(0,-1,0)*SIZE
	local LIGHT2 = IT("PointLight",LIGHT)
	LIGHT2.Range = 7
	LIGHT2.Brightness = 5
	LIGHT2.Color = SKILLTEXTCOLOR
	for i = 1, 2 do
		local TWIST = -2
		local START = A
		local END = B
		if i == 1 then
			START = B
			END = A
		end
		local ChainLink = IT("Beam",Torso)
		ChainLink.Texture = "rbxassetid://73042633"
		ChainLink.Color = ColorSequence.new(SKILLTEXTCOLOR)
		ChainLink.TextureSpeed = 1
		ChainLink.Width0 = 1
		ChainLink.Width1 = 1
		ChainLink.TextureLength = 2.5
		ChainLink.Attachment0 = START
		ChainLink.Attachment1 = END
		ChainLink.CurveSize0 = TWIST
		ChainLink.CurveSize1 = TWIST
		--ChainLink.FaceCamera = true
		ChainLink.Segments = 45
		ChainLink.Transparency = NumberSequence.new(1)
		table.insert(CHAINLINKS,ChainLink)
	end
	for i = 1, 2 do
		local TWIST = -1
		local START = C
		local END = D
		if i == 1 then
			START = D
			END = C
		end
		local ChainLink = IT("Beam",Torso)
		ChainLink.Texture = "rbxassetid://73042633"
		ChainLink.Color = ColorSequence.new(SKILLTEXTCOLOR)
		ChainLink.TextureSpeed = 1
		ChainLink.Width0 = 1
		ChainLink.Width1 = 1
		ChainLink.TextureLength = 5
		ChainLink.Attachment0 = START
		ChainLink.Attachment1 = END
		ChainLink.CurveSize0 = TWIST
		ChainLink.CurveSize1 = TWIST
		--ChainLink.FaceCamera = true
		ChainLink.Segments = 25
		ChainLink.LightEmission = 0.5
		ChainLink.Transparency = NumberSequence.new(1)
		table.insert(CHAINLINKS,ChainLink)
	end
	coroutine.resume(coroutine.create(function()
		repeat
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE, 0*SIZE, 0*SIZE + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(-45)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(45)), 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35*SIZE, 0.65*SIZE, 0.2*SIZE) * ANGLES(RAD(60), RAD(0), RAD(-25)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 1 / Animation_Speed)
		until CHAINS == true
		repeat
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE, 0*SIZE, 0*SIZE + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(45)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(-45)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35*SIZE, 0.65*SIZE, -0.2*SIZE) * ANGLES(RAD(90), RAD(0), RAD(45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 1 / Animation_Speed)
		until ATTACK == false
		for e = 1, 15 do
			Swait()
			for i = 1, #CHAINLINKS do
				CHAINLINKS[i].Transparency = NumberSequence.new((e/15))
			end
		end
		A:remove()
		B:remove()
		C:remove()
		D:remove()
	end))
	CreateSound(233856115, RightArm, 5, 1.2, false)
	for e = 1, 15 do
		Swait()
		for i = 1, #CHAINLINKS do
			CHAINLINKS[i].Transparency = NumberSequence.new(1-(e/15))
		end
	end
	CHAINS = true
	Rooted = true
	wait(0.25)
	local FIST = CreatePart(3, Effects, "Neon", 0, 0.5, "Midium stone gray", "Part", VT(2,2,2))
	FIST.Color = C3(1, 1, 1)
	FIST.CFrame = CF(RightArm.CFrame*CF(0,-1.3*SIZE,0).p,POS) * ANGLES(RAD(90), RAD(0), RAD(0)) 
	local LIGHT3 = IT("PointLight",FIST)
	LIGHT3.Range = 7
	LIGHT3.Brightness = 5
	LIGHT3.Color = SKILLTEXTCOLOR
	CreateMesh("SpecialMesh", FIST, "FileMesh", "90718752", "", VT(10,10,10), VT(0,0,0))
	local FISTA = IT("Attachment",FIST)
	FISTA.Position = VT(0.062, 0.977, 0)
	local ChainLink = IT("Beam",Torso)
	ChainLink.Texture = "rbxassetid://73042633"
	ChainLink.Color = ColorSequence.new(SKILLTEXTCOLOR)
	ChainLink.TextureSpeed = 0
	ChainLink.Width0 = 3
	ChainLink.Width1 = 3
	ChainLink.TextureLength = 12
	ChainLink.Attachment0 = LIGHT
	ChainLink.Attachment1 = FISTA
	ChainLink.FaceCamera = true
	ChainLink.Segments = 45
	ChainLink.LightEmission = 0.5
	ChainLink.Transparency = NumberSequence.new(0.25)
	local FISTSOUND = CreateSound(288641686, FIST, 5, 1.2, false)
	for i = 1, 85 do
		Swait()
		FIST.CFrame = FIST.CFrame*CF(0,-2,0)
		ChainLink.TextureLength = 12+(i*2)
		ApplyAoE(FIST.Position,10,15,25,100,false)
		WACKYEFFECT({Time = 5, EffectType = "Wave", Size = VT(5,0,5)*SIZE, Size2 = VT(15,1,15), Transparency = 0.5, Transparency2 = 1, CFrame = FIST.CFrame*CF(0,-1,0) * ANGLES(RAD(0), RAD(i*15), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 255/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
		local HITFLOOR = Raycast(FIST.Position, (CF(FIST.Position, FIST.CFrame*CF(0,-1,0).p)).lookVector, 2.1, Character)
		if HITFLOOR ~= nil then
			HITFLOOR:BreakJoints()
			coroutine.resume(coroutine.create(function()
				for i = 1, 15 do
					Swait()
					FISTSOUND.Volume = FISTSOUND.Volume - 0.15
					ApplyAoE(FIST.Position,10+(i*2),5,15,5,false)
					WACKYEFFECT({Time = 15, EffectType = "Wave", Size = VT(5,0,5)*SIZE, Size2 = VT(35,3,35), Transparency = 0.5, Transparency2 = 1, CFrame = FIST.CFrame * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 255/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
				end
			end))
			break
		end
	end
	coroutine.resume(coroutine.create(function()
		for i = 1, 50 do
			Swait()
			FIST.Transparency = FIST.Transparency + 0.5/50
			LIGHT3.Range = LIGHT3.Range - 7/50
		end
		FIST:remove()
	end))
	LIGHT:remove()
	GYRO:remove()
	ATTACK = false
	Rooted = false
end

function WarpMeteor()
	local DIST = (RootPart.Position - Mouse.Hit.p).Magnitude
	if DIST > 99999 then
		DIST = 99999
	end
	local RAY,RAYPOS = Raycast(RootPart.Position, (CF(RootPart.Position, Mouse.Hit.p)).lookVector, DIST, workspace)	
	local HITFLOOR,HITPOS,NORMAL = Raycast(RAYPOS+VT(0,45,0), (CF(RAYPOS, RAYPOS + VT(0, -1, 0))).lookVector, 75*SIZE, Character)
	if HITFLOOR then
		local POS = HITPOS	
		ATTACK = true
		Rooted = true
		local WARPED = false
		local SMASHED = false
		local HITFLOOR,HITPOS,NORMAL = Raycast(RootPart.Position+VT(0,1,0), (CF(RAYPOS, RAYPOS + VT(0, -1, 0))).lookVector, 25*SIZE, Character)
		coroutine.resume(coroutine.create(function()
			repeat
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(25 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(-25 + 2.5 * SIN(SINE / 12)), RAD(-55 + 2.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			until WARPED == true
			repeat
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(25 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(-25 + 2.5 * SIN(SINE / 12)), RAD(-55 + 2.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.5*SIZE + 0.06 * SIN(SINE / 24) - 0.1*SIZE * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.1*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			until SMASHED == true
			repeat
				Swait()
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0*SIZE, 0*SIZE, 0*SIZE) * ANGLES(RAD(90), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0*SIZE, 0*SIZE, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(-40), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0*SIZE) * ANGLES(RAD(170), RAD(-15), RAD(20)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0*SIZE) * ANGLES(RAD(170), RAD(15), RAD(-20)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, -0.3*SIZE) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-20)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, -0.3*SIZE) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
			until ATTACK == false
		end))
		VALUE1 = true
		CreateSound(233856115, Torso, 5, 1.6, false)
		for i = 1, 25 do
			Swait()
			for _, c in pairs(Character:GetChildren()) do
				if c.ClassName == "Part" then
					c.Transparency = c.Transparency + 1/25
				end
			end
			for _, c in pairs(Weapon:GetChildren()) do
				if c.ClassName == "Part" then
					c.Transparency = c.Transparency + 1/25
				end
			end
		end
		UNANCHOR = false
		RootPart.Anchored = true
		RootPart.Velocity = VT(0,0,0)
		local ROOTPOS = RootPart.Position
		RootPart.CFrame = CF(POS+VT(0,300,0),VT(ROOTPOS.X,POS.Y+300,ROOTPOS.Z))
		WARPED = true
		for i = 1, 25 do
			Swait()
			for _, c in pairs(Character:GetChildren()) do
				if c.ClassName == "Part" then
					c.Transparency = c.Transparency - 1/25
				end
			end
			for _, c in pairs(Weapon:GetChildren()) do
				if c.ClassName == "Part" then
					c.Transparency = c.Transparency - 1/25
				end
			end
		end
		local SHELL = CreatePart(3, Effects, "Neon", 0, 1, "Really white", "Part", VT(0,0,0))
		SHELL.CFrame = RootPart.CFrame
		MakeForm(SHELL,"Ball")
		CreateSound(402981977, SHELL, 5, 1.6, false)
		for i = 1, 10 do
			Swait()
			SHELL.Transparency = SHELL.Transparency - 1/10
			SHELL.Size = SHELL.Size + VT(0.6,0.6,0.6)*1.8
		end
		for i = 1, math.ceil(75/2) do
			Swait()
			RootPart.CFrame = RootPart.CFrame*CF(0,-3.5*2,0)
			SHELL.CFrame = CF(RootPart.Position)
			WACKYEFFECT({Time = 5, EffectType = "Sphere", Size = SHELL.Size, Size2 = VT(5,3,5), Transparency = 0.5, Transparency2 = 1, CFrame = SHELL.CFrame, MoveToPos = SHELL.Position+VT(0,15,0), RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = SHELL.Color, SoundID = nil, SoundPitch = 0.75, SoundVolume = 6})
		end
		RootPart.CFrame = CF(POS+VT(0,1,0),VT(ROOTPOS.X,HITPOS.Y+1,ROOTPOS.Z))
		SHELL.CFrame = CF(RootPart.Position)
		WACKYEFFECT({Time = 45, EffectType = "Sphere", Size = SHELL.Size, Size2 = VT(35,35,35)*4, Transparency = 0, Transparency2 = 1, CFrame = SHELL.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = SHELL.Color, SoundID = 165970126, SoundPitch = 0.75, SoundVolume = 6})
		WACKYEFFECT({Time = 55, EffectType = "Wave", Size = VT(SHELL.Size.X,5,SHELL.Size.Z), Size2 = VT(45,3,45)*3.8, Transparency = 0, Transparency2 = 1, CFrame = SHELL.CFrame, MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = SHELL.Color, SoundID = nil, SoundPitch = 0.75, SoundVolume = 6})
		WACKYEFFECT({Time = 55, EffectType = "Wave", Size = VT(SHELL.Size.X,5,SHELL.Size.Z), Size2 = VT(45,3,45)*4, Transparency = 0, Transparency2 = 1, CFrame = SHELL.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = SHELL.Color, SoundID = nil, SoundPitch = 0.75, SoundVolume = 6})
		for i = 1, 5 do
			WACKYEFFECT({Time = 35, EffectType = "Wave", Size = VT(5,0,5)*SIZE, Size2 = VT(35,3,35)*4, Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = C3(255/255, 255/255, 255/255), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
		end
		SHELL:remove()
		ApplyAoE(RootPart.Position,75,35,75,175,false)
		SMASHED = true
		wait(1)
		VALUE1 = false
		UNANCHOR = true
		ATTACK = false
		Rooted = false
	end
end

function PandorasBox()
	local HITFLOOR,HITPOS = Raycast(RootPart.CFrame*CF(0,0,-6.5).p, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4*SIZE, Character)
	if HITFLOOR ~= nil then
		ATTACK = true
		Rooted = true
		local RINGSPIN = true
		local CONSTRUCTING = true
		local RING = CreatePart(3, Effects, "Neon", 0, 1, "Really white", "Ring", VT(0,0,0))
		RING.Color = C3(1,1,1)
		MakeForm(RING,"Cyl")
		RING.CFrame = CF(HITPOS)
		CreateSound(402981977, RING, 5, 1.2, false)
		coroutine.resume(coroutine.create(function()
			repeat
				Swait()
				RING.CFrame = RING.CFrame * ANGLES(RAD(0), RAD(5), RAD(0))
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(-25 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35*SIZE, 0.65*SIZE, 0*SIZE) * ANGLES(RAD(115), RAD(45), RAD(35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			until CONSTRUCTING == false
			repeat 
				Swait() 
				RING.CFrame = RING.CFrame * ANGLES(RAD(0), RAD(5), RAD(0))
			until RINGSPIN == false
			for i = 1, 25 do
				Swait()
				RING.CFrame = RING.CFrame * ANGLES(RAD(0), RAD(5), RAD(0))
				RING.Size = RING.Size - VT(0.15,0,0.15)
				--DECAL.Transparency = DECAL.Transparency + 1/25
				RING.Transparency = RING.Transparency + 1/25
			end
			RING:remove()
		end))
		for i = 1, 15 do
			Swait()
			RING.Size = RING.Size + VT(0.75,0,0.75)
			RING.Transparency = RING.Transparency - 1/15
		end
		local BOXSPIN = true
		local PANDORASBOX = IT("Model",Effects)
		PANDORASBOX.Name = "Pandora's Box"
		local BOX = IT("Model",PANDORASBOX)
		BOX.Name = "Body"
		local LID = IT("Model",PANDORASBOX)
		LID.Name = "Lid"
		--BUILDING THE BOX--
			local BASE = CreatePart(3, BOX, "Neon", 0, 0, "Really white", "Black", VT(2,1.8,2))
			BASE.Color = C3(1,1,1)
			PANDORASBOX.PrimaryPart = BASE
			BASE.CFrame = CF(HITPOS+VT(0,-8,0),VT(RootPart.Position.X,HITPOS.Y-8,RootPart.Position.Z))
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Bright yellow", "Marble", VT(0.2,1.9,0.2))
			WOOD.CFrame = BASE.CFrame*CF(1,0,1)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Bright yellow", "Marble", VT(0.2,1.9,0.2))
			WOOD.CFrame = BASE.CFrame*CF(1,0,-1)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Bright yellow", "Marble", VT(0.2,1.9,0.2))
			WOOD.CFrame = BASE.CFrame*CF(-1,0,1)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Bright yellow", "Marble", VT(0.2,1.9,0.2))
			WOOD.CFrame = BASE.CFrame*CF(-1,0,-1)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Bright yellow", "Marble", VT(2.1,0.2,0.2))
			WOOD.CFrame = BASE.CFrame*CF(0,0.9,1)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Bright yellow", "Marble", VT(2.1,0.2,0.2))
			WOOD.CFrame = BASE.CFrame*CF(0,0.9,-1)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Bright yellow", "Marble", VT(0.2,0.2,2.1))
			WOOD.CFrame = BASE.CFrame*CF(1,0.9,0)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Bright yellow", "Marble", VT(0.2,0.2,2.1))
			WOOD.CFrame = BASE.CFrame*CF(-1,0.9,0)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Bright yellow", "Marble", VT(2.1,0.2,0.2))
			WOOD.CFrame = BASE.CFrame*CF(0,-0.9,1)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Bright yellow", "Marble", VT(2.1,0.2,0.2))
			WOOD.CFrame = BASE.CFrame*CF(0,-0.9,-1)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Bright yellow", "Marble", VT(0.2,0.2,2.1))
			WOOD.CFrame = BASE.CFrame*CF(1,-0.9,0)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Bright yellow", "Marble", VT(0.2,0.2,2.1))
			WOOD.CFrame = BASE.CFrame*CF(-1,-0.9,0)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Daisy orange", "Marble", VT(2.1,1.9,0.1))
			WOOD.CFrame = BASE.CFrame*CF(0,0,1)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Daisy orange", "Marble", VT(2.1,1.9,0.1))
			WOOD.CFrame = BASE.CFrame*CF(0,0,-1)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Daisy orange", "Marble", VT(0.1,1.9,2.1))
			WOOD.CFrame = BASE.CFrame*CF(1,0,0)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Daisy orange", "Marble", VT(0.1,1.9,2.1))
			WOOD.CFrame = BASE.CFrame*CF(-1,0,0)
			local WOOD = CreatePart(3, BOX, "Marble", 0, 0, "Daisy orange", "Marble", VT(2.1,0.1,2.1))
			WOOD.CFrame = BASE.CFrame*CF(0,-0.9,0)
			-------------
			local LIDPART = CreatePart(3, LID, "Marble", 0, 0, "Daisy orange", "Marble", VT(2.1,0.1,2.1))
			LIDPART.CFrame = BASE.CFrame*CF(0,1,0)
			LID.PrimaryPart = LIDPART
			local WOOD = CreatePart(3, LID, "Marble", 0, 0, "Bright yellow", "Marble", VT(2.1,0.2,0.2))
			WOOD.CFrame = LIDPART.CFrame*CF(0,0,-1)
			local WOOD = CreatePart(3, LID, "Marble", 0, 0, "Bright yellow", "Marble", VT(2.1,0.2,0.2))
			WOOD.CFrame = LIDPART.CFrame*CF(0,0,1)
			local WOOD = CreatePart(3, LID, "Marble", 0, 0, "Bright yellow", "Marble", VT(0.2,0.2,2.1))
			WOOD.CFrame = LIDPART.CFrame*CF(1,0,0)
			local WOOD = CreatePart(3, LID, "Marble", 0, 0, "Bright yellow", "Marble", VT(0.2,0.2,2.1))
			WOOD.CFrame = LIDPART.CFrame*CF(-1,0,0)
			local DECAL = IT("Decal",LIDPART)
			DECAL.Face = "Top"
			DECAL.Texture = "http://www.roblox.com/asset/?id=1501226061"
			DECAL.Color3 = C3(0,0,0)
		--BUILDING THE BOX--
		coroutine.resume(coroutine.create(function()
			repeat
				Swait()
				PANDORASBOX:SetPrimaryPartCFrame(BASE.CFrame * ANGLES(RAD(0), RAD(2.45), RAD(0)))
			until BOXSPIN == false
		end))
		for i = 1, 25 do
			Swait()
			PANDORASBOX:SetPrimaryPartCFrame(BASE.CFrame * CF(0,1.5-(i/12.5),0))
		end
		wait(0.5)
		BOXSPIN = false
		CONSTRUCTING = false	
		coroutine.resume(coroutine.create(function()
			WACKYEFFECT({Time = 45, EffectType = "Sphere", Size = LIDPART.Size, Size2 = VT(3,0,3)*4, Transparency = 0, Transparency2 = 1, CFrame = LIDPART.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = SKILLTEXTCOLOR, SoundID = 168586586, SoundPitch = 1.3, SoundVolume = 6})
			--[[for i = 1, 45 do
				Swait()
				LID:SetPrimaryPartCFrame(LIDPART.CFrame * CF(0,1.5-(i/12.5),0.5) * ANGLES(RAD(0.7), RAD(0), RAD(0)))
			end-
			LID:remove()]]--
			for _, c in pairs(LID:GetChildren()) do
				if c.ClassName == "Part" then
					c.Anchored = false
					c.CanCollide = true
					if c ~= LIDPART then
						weldBetween(LIDPART,c)
					end
				end
			end
			LIDPART.Velocity = CF(LIDPART.Position,LIDPART.CFrame*CF(15,25,0).p).lookVector*65
			Debris:AddItem(LID,15)
			wait(0.5)
			local RANDOMEFFECT = MRANDOM(1,4)
			if RANDOMEFFECT == 1 then
				for i = 1, 45 do
					wait((2-(i/15))/15)
					WACKYEFFECT({Time = 45, EffectType = "Sphere", Size = VT(0,0,0), Size2 = VT(1,1,1), Transparency = 0, Transparency2 = 1, CFrame = BASE.CFrame*CF(0,MRANDOM(12,15),0) * ANGLES(RAD(0), RAD(MRANDOM(0,360)), RAD(0))*CF(0,0,MRANDOM(1,5)), MoveToPos = BASE.Position, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = SKILLTEXTCOLOR, SoundID = nil, SoundPitch = 0.8, SoundVolume = 6})
				end	
				wait(1)
				WACKYEFFECT({Time = 45, EffectType = "Sphere", Size = VT(0,0,0), Size2 = VT(35,35,35)*12, Transparency = 0, Transparency2 = 1, CFrame = BASE.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BASE.Color, SoundID = 165970126, SoundPitch = 0.75, SoundVolume = 6})
				WACKYEFFECT({Time = 55, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(45,3,45)*10, Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = BASE.Color, SoundID = 469345336, SoundPitch = 0.75, SoundVolume = 6})
				WACKYEFFECT({Time = 55, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(45,3,45)*9, Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = BASE.Color, SoundID = nil, SoundPitch = 0.75, SoundVolume = 6})
				for i = 1, 5 do
					WACKYEFFECT({Time = 35, EffectType = "Wave", Size = VT(5,0,5)*SIZE, Size2 = VT(35,3,35)*12, Transparency = 0.5, Transparency2 = 1, CFrame = BASE.CFrame * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
				end
				ApplyAoE(BASE.Position,50,1,200,375,false)
				ApplyAoE(BASE.Position,250,35,75,175,false)
			elseif RANDOMEFFECT == 2 then
				local FIELD = CreatePart(3, Effects, "Neon", 0, 0, "Really white", "Field", VT(0.3,0.3,0.3))
				FIELD.CFrame = BASE.CFrame
				MakeForm(FIELD,"Ball")
				for i = 1, 50 do
					Swait()
					FIELD.Size = FIELD.Size + VT(0.01,0.01,0.01)
					FIELD.CFrame = FIELD.CFrame * CF(0,0.75-(i/45),0)
				end
				wait(0.2)
				local LOOP = CreateSound(1393698948, FIELD, 0, 1.2, true)
				coroutine.resume(coroutine.create(function()
					for i = 1, 75 do
						Swait()
						LOOP.Volume = LOOP.Volume + 10/75
						LOOP.Parent = FIELD
						local CHILDREN = workspace:GetDescendants()
						for index, CHILD in pairs(CHILDREN) do
							if CHILD.ClassName == "Model" and CHILD ~= Character and CHILD.Parent ~= Effects then
								local HUM = CHILD:FindFirstChildOfClass("Humanoid")
								if HUM then
									local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
									if TORSO then
										if (TORSO.Position - FIELD.Position).Magnitude <= FIELD.Size.X/2 then
											HUM.Health = HUM.Health - 0.1
											TORSO.Velocity = VT(0,5,0)
											HUM.PlatformStand = true
											if TORSO.RotVelocity.Magnitude < 15 then
										 		TORSO.RotVelocity = VT(MRANDOM(-45,45),MRANDOM(-45,45),MRANDOM(-45,45))
											end
										end
									end
								end
							end
						end
						FIELD.Size = FIELD.Size + VT(3,3,3)
						FIELD.Transparency = FIELD.Transparency + 0.8/75
					end
					for i = 1, 500 do
						Swait()
						LOOP.Parent = FIELD
						local CHILDREN = workspace:GetDescendants()
						for index, CHILD in pairs(CHILDREN) do
							if CHILD.ClassName == "Model" and CHILD ~= Character and CHILD.Parent ~= Effects then
								local HUM = CHILD:FindFirstChildOfClass("Humanoid")
								if HUM then
									local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
									if TORSO then
										if (TORSO.Position - FIELD.Position).Magnitude <= FIELD.Size.X/2 then
											TORSO.Velocity = VT(0,5,0)
											HUM.Health = HUM.Health - 0.1
											HUM.PlatformStand = true
											if TORSO.RotVelocity.Magnitude < 15 then
										 		TORSO.RotVelocity = VT(MRANDOM(-45,45),MRANDOM(-45,45),MRANDOM(-45,45))
											end
										end
									end
								end
							end
						end
					end
					for i = 1, 25 do
						Swait()
						LOOP.Volume = LOOP.Volume + 10/25
						LOOP.Parent = FIELD
						local CHILDREN = workspace:GetDescendants()
						for index, CHILD in pairs(CHILDREN) do
							if CHILD.ClassName == "Model" and CHILD ~= Character and CHILD.Parent ~= Effects then
								local HUM = CHILD:FindFirstChildOfClass("Humanoid")
								if HUM then
									local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
									if TORSO then
										if (TORSO.Position - FIELD.Position).Magnitude <= FIELD.Size.X/1.8 then
											TORSO.Velocity = VT(0,5,0)
											HUM.Health = HUM.Health - 0.1
											HUM.PlatformStand = false
											if TORSO.RotVelocity.Magnitude < 15 then
										 		TORSO.RotVelocity = VT(MRANDOM(-45,45),MRANDOM(-45,45),MRANDOM(-45,45))
											end
										end
									end
								end
							end
						end
						FIELD.Size = FIELD.Size - VT(3,3,3)
						FIELD.Transparency = FIELD.Transparency + 0.2/25
					end	
					FIELD:remove()
				end))
			elseif RANDOMEFFECT == 3 then
				for i = 1, 10 do
					wait(0.15)
					WACKYEFFECT({Time = 15, EffectType = "Sphere", Size = VT(0,0,0), Size2 = VT(3,8,3), Transparency = 0, Transparency2 = 1, CFrame = BASE.CFrame*CF(0,0.3,0), MoveToPos = BASE.Position+VT(0,6,0), RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = 90655239, SoundPitch = 0.8, SoundVolume = 6})
					coroutine.resume(coroutine.create(function()
						local MINION = CLONE:Clone()
						MINION.Parent = Effects
						MINION.Name = "Shadow"
						MINION.HumanoidRootPart.CFrame = BASE.CFrame*CF(0,5,0) * ANGLES(RAD(0), RAD(MRANDOM(0,360)), RAD(0))
						MINION.HumanoidRootPart.Velocity = CF(MINION.HumanoidRootPart.Position,MINION.HumanoidRootPart.CFrame*CF(0,8,-15).p).lookVector*MRANDOM(55,100)
						for _, c in pairs(MINION:GetChildren()) do
							if c.ClassName == "Part" then
								c.Material = "Neon"
								c.Color = C3(0,0,0)
								c.Transparency = 0.25
								if c.Name == "Head" then
									c:ClearAllChildren()
									local MSH = IT("BlockMesh",c)
									MSH.Scale = VT(0.5,1,1)
								end
							end
						end
						local TORSO = MINION.Torso
						local HUMAN = MINION.Humanoid
						HUMAN.WalkSpeed = 20
						HUMAN.MaxHealth = math.huge
						HUMAN.Health = math.huge
						HUMAN.DisplayDistanceType = "None"
						HUMAN.Died:connect(function()
							MINION:remove()
							--CreateSound(SHOUTS[MRANDOM(1,3)], TORSO, 3, 0.5, false)
						end)
						wait(1)
						local findNearestTorso = function(POS)
							local list = game.Workspace:GetDescendants()
							local torso = nil
							local dist = 500
							local temp = nil
							local human = nil
							local temp2 = nil
							for x = 1, #list do
								temp2 = list[x]
								if (temp2.className == "Model") and (temp2 ~= Character) and (temp2.Parent ~= Effects) then
									temp = temp2:findFirstChild("Torso") or temp2:findFirstChild("UpperTorso")
									human = temp2:findFirstChildOfClass("Humanoid")
									if (temp ~= nil) and (human ~= nil) and (human.Health > 0) then
										if (temp.Position - POS).magnitude < dist then
											torso = temp
											dist = (temp.Position - POS).magnitude
										end
									end
								end
							end
							return torso, dist
						end
						for i = 1, 40 do
							if HUMAN.Health == 0 then
								break
							end
							wait(0.3)
							local target,dist= findNearestTorso(TORSO.Position)
							if target then
								HUMAN:MoveTo(target.Position)
								if dist < 25 then
									CreateSound(348663022, TORSO, 10, 1, true)
									wait(2)
									--local ANIM = HUMAN:LoadAnimation(ATANIM)
									--ANIM:Play()
									--CreateSound(SHOUTS[MRANDOM(1,3)], TORSO, 1, 1, false)
									ApplyAoE(TORSO.Position,10,0,0,85,true)
									WACKYEFFECT({Time = 15, EffectType = "Sphere", Size = VT(5,5,5), Size2 = VT(25,25,25), Transparency = 0, Transparency2 = 1, CFrame = TORSO.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = SKILLTEXTCOLOR, SoundID = 201858087, SoundPitch = 0.8, SoundVolume = 10})
									for i = 1, 5 do
										WACKYEFFECT({Time = 75, EffectType = "Wave", Size = VT(5,0,5)*SIZE, Size2 = VT(15,1,15), Transparency = 0.5, Transparency2 = 1, CFrame = TORSO.CFrame * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = MRANDOM(-15,15)/7.5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
									end
									break
								end
							end
						end
						MINION:remove()
					end))
				end
			elseif RANDOMEFFECT == 4 then
				local FIELD = CreatePart(3, Effects, "Neon", 0, 0, "Really white", "Field", VT(0.3,0.3,0.3))
				FIELD.Color = C3(1,1,1)
				FIELD.CFrame = BASE.CFrame
				MakeForm(FIELD,"Ball")
				FIELD.CanCollide = true
				for i = 1, 50 do
					Swait()
					FIELD.Size = FIELD.Size + VT(0.01,0.01,0.01)
					FIELD.CFrame = FIELD.CFrame * CF(0,0.75-(i/45),0)
				end
				wait(0.2)
				local LOOP = CreateSound(487214658, FIELD, 0, 1, true)
				coroutine.resume(coroutine.create(function()
					local E = 0
					for i = 1, 75 do
						E = E + 1
						Swait()
						if E >= 35 then
							E = 0
							WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = FIELD.Size*30, Size2 = FIELD.Size, Transparency = 0.8, Transparency2 = 1, CFrame = FIELD.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BASE.Color, SoundID = nil, SoundPitch = 1, SoundVolume = 6})
						end
						LOOP.Volume = LOOP.Volume + 10/75
						LOOP.Parent = FIELD
						local CHILDREN = workspace:GetDescendants()
						for index, CHILD in pairs(CHILDREN) do
							if CHILD.ClassName == "Model" and CHILD ~= Character and CHILD.Parent ~= Effects then
								local HUM = CHILD:FindFirstChildOfClass("Humanoid")
								if HUM then
									local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
									if TORSO then
										if (TORSO.Position - FIELD.Position).Magnitude <= FIELD.Size.X*30 then
											for _, c in pairs(CHILD:GetChildren()) do
												if c:IsA("BasePart") then
													local bv = Instance.new("BodyVelocity") 
													bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
													bv.velocity = CF(FIELD.Position,c.Position).lookVector*-50
													bv.Parent = c
													Debris:AddItem(bv,0.05)
												end
											end
											HUM.Health = HUM.Health - 0.3
										end
									end
								end
							end
						end
						FIELD.Size = FIELD.Size + VT(0.3,0.3,0.3)/5
					end
					for i = 1, 180 do
						E = E + 1
						Swait()
						if E >= 35 then
							E = 0
							WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = FIELD.Size*30, Size2 = FIELD.Size, Transparency = 0.8, Transparency2 = 1, CFrame = FIELD.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BASE.Color, SoundID = nil, SoundPitch = 1, SoundVolume = 6})
						end
						LOOP.Parent = FIELD
						local CHILDREN = workspace:GetDescendants()
						for index, CHILD in pairs(CHILDREN) do
							if CHILD.ClassName == "Model" and CHILD ~= Character and CHILD.Parent ~= Effects then
								local HUM = CHILD:FindFirstChildOfClass("Humanoid")
								if HUM then
									local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
									if TORSO then
										if (TORSO.Position - FIELD.Position).Magnitude <= FIELD.Size.X*30 then
											for _, c in pairs(CHILD:GetChildren()) do
												if c:IsA("BasePart") then
													local bv = Instance.new("BodyVelocity") 
													bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
													bv.velocity = CF(FIELD.Position,c.Position).lookVector*-50
													bv.Parent = c
													Debris:AddItem(bv,0.05)
												end
											end
											HUM.Health = HUM.Health - 0.3
										end
									end
								end
							end
						end
					end
					ApplyAoE(FIELD.Position,40,15,20,375,false)
					WACKYEFFECT({Time = 45, EffectType = "Sphere", Size = FIELD.Size, Size2 = VT(35,35,35), Transparency = 0, Transparency2 = 1, CFrame = FIELD.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BASE.Color, SoundID = 231917744, SoundPitch = 1, SoundVolume = 6})
					for i = 1, 5 do
						WACKYEFFECT({Time = 35, EffectType = "Wave", Size = VT(5,0,5)*SIZE, Size2 = VT(35,3,35), Transparency = 0.5, Transparency2 = 1, CFrame = FIELD.CFrame * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = 0.5, SoundVolume = 6})
					end
					FIELD:remove()
				end))
			elseif RANDOMEFFECT == 5 then
			end
			wait(0.5)
			for i = 1, 25 do
				Swait()
				PANDORASBOX:SetPrimaryPartCFrame(BASE.CFrame * CF(0,-0.3,0))
			end
			PANDORASBOX:remove()
			RINGSPIN = false
		end))
		ATTACK = false
		Rooted = false
	end
end

function Taunt()
	ATTACK = true
	local LAUGH = nil
	coroutine.resume(coroutine.create(function()
		repeat
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(5), RAD(0), RAD(-45)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.15*SIZE, -0.5*SIZE) * ANGLES(RAD(170), RAD(-25), RAD(-15)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		until LAUGH ~= nil
		repeat
			Swait()
			LAUGH.Parent = Head
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0+(0.1*LAUGH.PlaybackLoudness/75) + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE+(0.1*LAUGH.PlaybackLoudness/75)) - 1)) * ANGLES(RAD(5), RAD(0), RAD(-45)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.15*SIZE+(0.1*LAUGH.PlaybackLoudness/75), -0.5*SIZE) * ANGLES(RAD(170), RAD(-25), RAD(-15)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE+(0.1*LAUGH.PlaybackLoudness/75), 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE-(0.1*LAUGH.PlaybackLoudness/75) + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE-(0.1*LAUGH.PlaybackLoudness/75) - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		until LAUGH.Playing == false
	ATTACK = false
	end))
	wait(0.1)
	LAUGH = CreateSound(525166232, Head, 10, 1, false)
end

function SuperiorLaugh()
	ATTACK = true
	local LAUGH = nil
	coroutine.resume(coroutine.create(function()
		repeat
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(5), RAD(0), RAD(-45)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.15*SIZE, -0.5*SIZE) * ANGLES(RAD(170), RAD(-25), RAD(-15)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		until LAUGH ~= nil
		repeat
			Swait()
			LAUGH.Parent = Head
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0+(0.1*LAUGH.PlaybackLoudness/75) + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE+(0.1*LAUGH.PlaybackLoudness/75)) - 1)) * ANGLES(RAD(5), RAD(0), RAD(-45)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.15*SIZE+(0.1*LAUGH.PlaybackLoudness/75), -0.5*SIZE) * ANGLES(RAD(170), RAD(-25), RAD(-15)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE+(0.1*LAUGH.PlaybackLoudness/75), 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE-(0.1*LAUGH.PlaybackLoudness/75) + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE-(0.1*LAUGH.PlaybackLoudness/75) - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		until LAUGH.Playing == false
	ATTACK = false
	end))
	wait(0.1)
	VOLUME = 2
	sick:Pause()
	LAUGH = CreateSound(333446256, Head, 10, 1, false)
	wait(8.5)
	VOLUME = 3
	sick:Resume()
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
		ApplyAoE(EMITPOS,20,35,75,25,false)
		WACKYEFFECT({EffectType = "Sphere", Size = VT(0,100000,0), Size2 = VT(20,100000,20), Transparency = 0, Transparency2 = 1, CFrame = CF(EMITPOS) * ANGLES(RAD(MRANDOM(-15,15)), RAD(0), RAD(MRANDOM(-15,15))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,1), SoundID = 419011114, SoundPitch = 1, SoundVolume = 5})
		WACKYEFFECT({EffectType = "Block", Size = VT(0,0,0), Size2 = VT(20,20,20)*2, Transparency = 0, Transparency2 = 1, CFrame = CF(EMITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,1), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
		WACKYEFFECT({EffectType = "Block", Size = VT(0,0,0), Size2 = VT(20,20,20)*1.5, Transparency = 0, Transparency2 = 1, CFrame = CF(EMITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,1), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
		for i = 1, 5 do
			local TOPOS = CF(EMITPOS)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))*CF(0,0,12)
			WACKYEFFECT({EffectType = "Slash", Size = VT(0,0,0), Size2 = VT(0.4,0,0.4), Transparency = 0, Transparency2 = 1, CFrame = CF(EMITPOS,TOPOS.p) * ANGLES(RAD(90), RAD(0), RAD(0)), MoveToPos = TOPOS.p, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,1), SoundID = 419011114, SoundPitch = 1, SoundVolume = 5})
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
			local FIRE = CreatePart(3, METEOR, "Neon", 0, 0, "Dark indigo", "Fire", VT(5.1,1,5.1)*SIZE)
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
			WACKYEFFECT({EffectType = "Block", Size = CENTER.Size, Size2 = VT(10,10,10)*4*SIZE, Transparency = 0, Transparency2 = 1, CFrame = CF(CENTER.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,1), SoundID = 130972023, SoundPitch = 1, SoundVolume = 5})
			WACKYEFFECT({EffectType = "Block", Size = CENTER.Size, Size2 = VT(10,10,10)*3*SIZE, Transparency = 0, Transparency2 = 1, CFrame = CF(CENTER.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,1), SoundID = 201858144, SoundPitch = 1, SoundVolume = 5})
			WACKYEFFECT({EffectType = "Sphere", Size = VT(SIZE*20,0,SIZE*20), Size2 = VT(0,SIZE*750,0), Transparency = 0, Transparency2 = 1, CFrame = CF(CENTER.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,1), SoundID = 130972023, SoundPitch = 1, SoundVolume = 5})
			ApplyAoE(CENTER.Position,30*SIZE,35,80,50,false)
		end
		METEOR:remove()
	end))
end

function Smite()
	ATTACK = true
	Rooted = true
	CreateSound(1368573150, RightArm, 3, 1.5)
	for i=0, 0.6, 0.1 / Animation_Speed do
		Swait()
		WACKYEFFECT({TIME = 15, EffectType = "Block", Size = VT(6,6,6)/6, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,1), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 1 + 0.5 * COS(SINE / 12)) * ANGLES(RAD(-25 - 3 * SIN(SINE / 12)), RAD(0), RAD(-25)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(23 - 3 * SIN(SINE / 12)), RAD(0), RAD(30)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75*SIZE, 0.5*SIZE, -1*SIZE) * ANGLES(RAD(70), RAD(0), RAD(-70)) * ANGLES(RAD(90), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.4 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE, 0.2*SIZE, -0.5*SIZE) * ANGLES(RAD(25), RAD(0), RAD(85)) * LEFTSHOULDERC0, 0.4 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.5*SIZE - 0.05*SIZE * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -0.8*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
	end
	local POWER = 0
	repeat 
		Swait() 
		WACKYEFFECT({EffectType = "Block", Size = VT(6,6,6)/6, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,1), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 1 + 0.5 * COS(SINE / 12)) * ANGLES(RAD(-25 - 3 * SIN(SINE / 12)), RAD(0), RAD(-25)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(23 - 3 * SIN(SINE / 12)), RAD(0), RAD(30)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE, 0.5*SIZE, -0.3*SIZE) * ANGLES(RAD(70), RAD(0), RAD(-70)) * ANGLES(RAD(110), RAD(40), RAD(30)) * RIGHTSHOULDERC0, 0.4 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE, 0.2*SIZE, -0.5*SIZE) * ANGLES(RAD(25), RAD(0), RAD(85)) * LEFTSHOULDERC0, 0.4 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.5*SIZE - 0.05*SIZE * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -0.8*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		POWER = POWER + 0.5 
		if POWER >= 85 then
			POWER = 85
		end
	until KEYHOLD == false
	if POWER < 0.6 then
		SpawnSmite(Mouse.Hit.p)
	else
		if POWER < 15 then
			POWER = 15
		end
		SpawnSmite(Mouse.Hit.p)
	end
	ATTACK = false
	Rooted = false
end

function Meteor()
	ATTACK = true
	Rooted = true
	CreateSound(1368573150, RightArm, 3, 1.5)
	for i=0, 0.6, 0.1 / Animation_Speed do
		Swait()
		WACKYEFFECT({TIME = 15, EffectType = "Block", Size = VT(7,7,7)/7, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,1), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 1 + 0.5 * COS(SINE / 12)) * ANGLES(RAD(-25 - 3 * SIN(SINE / 12)), RAD(0), RAD(-25)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(23 - 3 * SIN(SINE / 12)), RAD(0), RAD(30)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75*SIZE, 0.5*SIZE, -1*SIZE) * ANGLES(RAD(70), RAD(0), RAD(-70)) * ANGLES(RAD(90), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.4 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE, 0.2*SIZE, -0.5*SIZE) * ANGLES(RAD(25), RAD(0), RAD(85)) * LEFTSHOULDERC0, 0.4 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.5*SIZE - 0.05*SIZE * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -0.8*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
	end
	local POWER = 0
	repeat 
		Swait() 
		WACKYEFFECT({EffectType = "Block", Size = VT(7,7,7)/7, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,1), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
		WACKYEFFECT({EffectType = "Block", Size = VT(7,7,7)/7, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = LeftArm.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,1), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 1 + 0.5 * COS(SINE / 12)) * ANGLES(RAD(-25 - 3 * SIN(SINE / 12)), RAD(0), RAD(-25)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(23 - 3 * SIN(SINE / 12)), RAD(0), RAD(30)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE, 0.5*SIZE, -0.3*SIZE) * ANGLES(RAD(70), RAD(0), RAD(-70)) * ANGLES(RAD(110), RAD(40), RAD(30)) * RIGHTSHOULDERC0, 0.4 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3*SIZE, 0.5*SIZE, -0.3*SIZE) * ANGLES(RAD(90), RAD(40), RAD(-50)) * LEFTSHOULDERC0, 0.4 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.5*SIZE - 0.05*SIZE * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -0.8*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		POWER = POWER + 1 
		if POWER >= 85 then
			POWER = 85
		end
	until KEYHOLD == false
	if POWER < 0.8 then
		SpawnMeteor(Mouse.Hit.p,POWER/0.8)
	else
		if POWER < 20 then
			POWER = 20
		end
        SpawnMeteor(Mouse.Hit.p,POWER/20)
	end
	ATTACK = false
	Rooted = false
end

function Buzzsaw()
	ATTACK = true
	Rooted = false
	local ARMSPEED = 0.1
	local TARGET = nil
	local ROOT = nil
	local HUMAN = nil
	local DIST = 4
	local SAWBLADE = CreatePart(3, Weapon, "Glass", 0, 0.5, "Really red", "Part", VT(0,0,0),false)
	local WELD = CreateWeldOrSnapOrMotor("Weld", RightArm, RightArm, SAWBLADE, CF(0,-1,0) * ANGLES(RAD(0), RAD(90), RAD(0)), CF(0, 0, 0))
	local BLADE = true
	CreateMesh("SpecialMesh", SAWBLADE, "FileMesh", "74322089", "", VT(2,2,1), VT(0,0,0))
	coroutine.resume(coroutine.create(function()
		repeat
			Swait()
			WELD.C1 = WELD.C1 * ANGLES(RAD(0), RAD(0), RAD(25))
		until BLADE == false
		SAWBLADE:remove()
	end))
	CreateSound(1165167936, SAWBLADE, 2, 1, true)
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(45)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0.6 + ((0) - 0)) * ANGLES(RAD(0), RAD(0), RAD(-45)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6, 0.9, -0.5) * ANGLES(RAD(115), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.9, 0.7, 0.3) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1.5, -1.4, 0) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.5, -1.4, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	for i=0, 2, 0.1 / Animation_Speed do
		Swait()
		local CHILDREN = workspace:GetDescendants()
		for index, CHILD in pairs(CHILDREN) do
			if CHILD.ClassName == "Model" and CHILD ~= Character then
				local HUM = CHILD:FindFirstChildOfClass("Humanoid")
				if HUM then
					local TORSO = CHILD:FindFirstChild("HumanoidRootPart") or CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
					if TORSO and HUM.Health > 0 then
						if (TORSO.Position - RightArm.Position).Magnitude <= DIST then
							DIST = (TORSO.Position - RightArm.Position).Magnitude
							ROOT = TORSO
							HUMAN = HUM
							TARGET = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
						end
					end
				end
			end
		end
		if ROOT then
			break
		end
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(45)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0.6 + ((0) - 0)) * ANGLES(RAD(0), RAD(0), RAD(-45)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6, 0.9, -0.5) * ANGLES(RAD(15), RAD(0), RAD(25)) * ANGLES(RAD(0), RAD(-45), RAD(0)) * RIGHTSHOULDERC0, ARMSPEED / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.9, 0.7, 0.3) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1.5, -1.4, 0) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.5, -1.4, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	if ROOT then
		ARMSPEED = 0.01
		Rooted = true
		RootPart.CFrame = ROOT.CFrame*CF(0,0,2.5)
		repeat
			HUMAN.Health = HUMAN.Health - 1.2
			HUMAN.RootPart.CFrame = ROOT.CFrame*CF(0,0.02,0)
			Swait()
			ROOT.Anchored = true
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(1, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(45)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0.6 + ((0) - 0)) * ANGLES(RAD(0), RAD(0), RAD(-45)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6, -0.4, 0) * ANGLES(RAD(15), RAD(0), RAD(25)) * ANGLES(RAD(0), RAD(-45), RAD(0)) * RIGHTSHOULDERC0, ARMSPEED / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.9, 0.7, 0.3) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1.5, -1.4, 0) * ANGLES(RAD(0), RAD(70), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.5, -1.4, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		until RightArm.Position.Y < Torso.Position.Y-0.15 or HUMAN.Health == 0
		ROOT.Anchored = false
		if HUMAN.Health == 0 then
			if ROOT.Name ~= "Torso" then
				ROOT:remove()
			end
			if TARGET.Name == "Torso" then
				Ragdoll(HUMAN.Parent,Torso,true)
			elseif TARGET.Name == "UpperTorso" then
				R15Ragdoll(HUMAN.Parent,true)
			end
		end
	end
	BLADE = false
	ATTACK = false
	Rooted = false
	end
	
	function template()
		ATTACK = true
		Rooted = true
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.2*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(-25), RAD(-105)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.2*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(30), RAD(85)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		ATTACK = false
		Rooted = false
	end
	
	function SuperStomp()
		ATTACK = true
		Rooted = true
		local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 25*SIZE, Character)
		coroutine.resume(coroutine.create(function()
        Swait(65)
        CameraEnshaking(3,25)
        CreateSound(262562442,RightLeg,60,1,false)
        CreateFlyingDebree(HITFLOOR,CF(HITPOS),10,VT(5,5,5),4,125)
        WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(0,0.55,0)*SIZE, Size2 = VT(90,3,90), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(159/255, 0/255, 0/255), SoundID = nil, SoundPitch = 0.96, SoundVolume = 10})
        WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0,7.5,0)*SIZE, Size2 = VT(60,6.5,60), Transparency = 0, Transparency2 = 1, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(159/255, 0/255, 0/255), SoundID = nil, SoundPitch = 0.96, SoundVolume = 10})
        ApplyAoE(HITPOS,35,35,50,75,false)
		    	end))
		CreateSound(163619849,RightLeg,10,1,false)
		for i=0, 2, 0.1 / Animation_Speed do
			WACKYEFFECT({EffectType = "Block", Size = VT(2,2,2), Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = RightLeg.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(-15), RAD(0), RAD(40)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(-40)), 0.5 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.2*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(90), RAD(-45), RAD(-55)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.2*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(30), RAD(85)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.4*SIZE - 0.05 * COS(SINE / 12), -0.5) * ANGLES(RAD(0), RAD(75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(-15), RAD(-75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		end
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.5 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(10), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.2*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(105), RAD(-85)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.2*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(-105), RAD(85)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.7*SIZE - 0.05 * COS(SINE / 12), -0.4) * ANGLES(RAD(10), RAD(75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(20)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), 0.13) * ANGLES(RAD(0), RAD(-75), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(35)), 1 / Animation_Speed)
		end
		ATTACK = false
		Rooted = false
	end
	
function RavagingOverthrower()
	ATTACK = true
	Rooted = true
    coroutine.resume(coroutine.create(function()
	CreateSound("348663022", Torso, 5, 1)
	local StartPos = RootPart.CFrame * CF(0,15,0).p
	for i = 1, 5 do
		MagicSphere2(25,25,CF(StartPos),"Bright red")
		Swait(15)
	end
	local soundeffect = IT("Sound",Torso)
	soundeffect.SoundId = "rbxassetid://487186990"
	soundeffect.Looped = true
	soundeffect.Volume = 3
	soundeffect.Playing = true
	repeat
		turnto(Mouse.Hit.p)
		MagicSphere2(25,25,CF(StartPos),"Bright red")
		MagicSphere(25/10,25,CF(StartPos),"Bright red")
		local RayHit, RayPos, RayNormal = CastZapRay(StartPos, Mouse.Hit.p, 750, Character, false)
		local distance = (StartPos - RayPos).magnitude
		local RayBeam = IT("Part",Effects)
		RayBeam.Material = "Neon"
		RayBeam.Anchored = true
		RayBeam.BrickColor = BRICKC"Bright red"
		local mesh = IT("SpecialMesh",RayBeam)
		mesh.MeshType = "Cylinder"
		RayBeam.Size = Vector3.new(distance+10, 5, 5)
		RayBeam.CFrame = CFrame.new(StartPos, RayPos) * CFrame.new(0, 0, -distance/2) * ANGLES(RAD(0),RAD(90),RAD(0))
		MagicSphere(15,5,CF(RayPos),"Bright red")
		ApplyAoE(RayPos,15,1,2,25,false)
		Swait()
		if KEYHOLD == false then
			coroutine.resume(coroutine.create(function()
				Rooted = false
				MODE = "Superior"
				for i = 1, 5 do
					RayBeam.Transparency = RayBeam.Transparency + 1/5
					Swait()
				end
				RayBeam:remove()
			end))
		else
			RayBeam:remove()
		end
	until KEYHOLD == false
	soundeffect:remove()
end))
for i=0, 2, 0.1 / Animation_Speed do
		Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(-15 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35*SIZE, 0.65*SIZE, 0*SIZE) * ANGLES(RAD(135), RAD(0), RAD(35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
    end
    MODE = "Sun"
	ATTACK = false
end

function Earthquake()
	ATTACK = true
	Rooted = true
	local GYRO = IT("BodyGyro", RootPart)
	GYRO.D = 20
	GYRO.P = 4000
	GYRO.MaxTorque = VT(0, 40000, 0)
	local RING, MESH, DELET = MakeRing()
	local HITFLOOR, HITPOS = Raycast(RootPart.Position, CF(RootPart.Position, RootPart.Position + VT(0, -1, 0)).lookVector, 15, Character)
	RING.CFrame = CF(HITPOS)
	for i = 0, 0.6, 0.1 / Animation_Speed do
		GYRO.CFrame = CF(RootPart.Position, Mouse.Hit.p)
		Swait()
		MESH.Scale = MESH.Scale + VT(53, 0, 53)
		RING.CFrame = RING.CFrame * ANGLES(RAD(0), RAD(5), RAD(0))
		WACKYEFFECT({TIME = 15, EffectType = "Block", Size = VT(3,3,3)/3, Size2 = VT(1,1,1)/3, Transparency = 0.5, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1.3,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil, SoundPitch = 1, SoundVolume = 5})
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(-25 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6, 0.75, -0.5) * ANGLES(RAD(0), RAD(-45), RAD(12)) * ANGLES(RAD(125 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 2.5 / Animation_Speed)
	end
	local BLASTS = {468991944, 468991990}
	coroutine.resume(coroutine.create(function()
		local CFRAME = RootPart.CFrame
		for i = 1, 100 do
			CFRAME = CFRAME * CF(0, 0, -35)
			do
				local HITFLOOR, HITPOS = Raycast(CFRAME.p, CF(RootPart.Position, RootPart.Position + VT(0, -1, 0)).lookVector, 15, Character)
				if HITFLOOR then
					Swait()
					do
						local OFFSET = CFRAME * CF(MRANDOM(-25, 25), 0, 0)
						coroutine.resume(coroutine.create(function()
							local RING, MESH, DELET = MakeRing()
							RING.CFrame = CF(OFFSET.p.X, HITPOS.Y, OFFSET.p.Z)
							for i = 1, 25 do
								Swait()
								MESH.Scale = MESH.Scale + VT(42, 0, 42)
								RING.CFrame = RING.CFrame * ANGLES(RAD(0), RAD(5), RAD(0))
							end
							ApplyAoE(RING.Position,25,50,90,90,false)
							SHAKECAM(RING.Position, 80, 30, 15)
							local TURN = ANGLES(RAD(0), RAD(MRANDOM(0, 360)), RAD(0)) * ANGLES(RAD(MRANDOM(0, 25)), RAD(0), RAD(0))
							WACKYEFFECT({
								Time = 25,
								EffectType = "Sphere",
								Size = VT(22, 22, 22),
								Size2 = VT(85, 85, 85),
								Transparency = 0,
								Transparency2 = 1,
								CFrame = CF(RING.Position),
								MoveToPos = nil,
								RotationX = 0,
								RotationY = 0,
								RotationZ = 0,
								Material = "Neon",
								Color = C3(0, 0, 0),
								SoundID = BLASTS[MRANDOM(1, #BLASTS)],
								SoundPitch = MRANDOM(9, 12) / 10,
								SoundVolume = 10
							})
							for e = 1, 3 do
								WACKYEFFECT({
									EffectType = "Wave",
									Size = VT(25, 0, 25),
									Size2 = VT(40, 0, 40) + VT(e * 6, e / 5, e * 6),
									Transparency = 0,
									Transparency2 = 1,
									CFrame = CF(RING.Position) * ANGLES(RAD(0), RAD(72 * i), RAD(0)),
									MoveToPos = nil,
									RotationX = 0,
									RotationY = 3,
									RotationZ = 0,
									Material = "Neon",
									Color = C3(0, 0, 0),
									SoundID = nil,
									SoundPitch = nil,
									SoundVolume = nil
								})
								WACKYEFFECT({
									Time = 35,
									EffectType = "Sphere",
									Size = VT(22, 45, 22),
									Size2 = VT(25, 45 + e * 75, 25),
									Transparency = 0,
									Transparency2 = 1,
									CFrame = CF(RING.Position) * TURN,
									MoveToPos = nil,
									RotationX = 0,
									RotationY = 0,
									RotationZ = 0,
									Material = "Neon",
									Color = C3(0, 0, 0),
									SoundID = nil,
									SoundPitch = MRANDOM(9, 12) / 10,
									SoundVolume = 10
								})
							end
							wait(0.3)
							DELET()
						end))
					end
				end
			end
		end
	end))
	Rooted = false
	DELET()
	GYRO:remove()
	ATTACK = false
	Rooted = false
end

function Warp()
	ATTACK = true
	Rooted = true
	coroutine.resume(coroutine.create(function()
    Swait(38)
	WACKYEFFECT({Time = 50, EffectType = "Box", Size = VT(20,20,20)*SIZE, Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = Torso.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(153, 0/255, 153), SoundID = 289556450, SoundPitch = 0.96, SoundVolume = 10})
    end))
	for i=0, 0.5, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 1) * ANGLES(RAD(-15), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.15*SIZE, 0.5*SIZE, -0.8*SIZE) * ANGLES(RAD(90), RAD(0), RAD(-45)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.15*SIZE, 0.5*SIZE, -0.8*SIZE) * ANGLES(RAD(90), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
	end
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 10) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.15*SIZE, 0.5*SIZE, -0.8*SIZE) * ANGLES(RAD(90), RAD(0), RAD(-45)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.15*SIZE, 0.5*SIZE, -0.8*SIZE) * ANGLES(RAD(90), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
	end
	local ORIGIN = RootPart.Position
	RootPart.CFrame = CF(Mouse.Hit.p+VT(0,4,0),ORIGIN)
	for i=0, 0.3, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 1) * ANGLES(RAD(-15), RAD(0), RAD(-45)), 0.5 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.15, 0.5*SIZE, -0.8*SIZE) * ANGLES(RAD(90), RAD(0), RAD(-45)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.15, 0.5*SIZE, -0.8*SIZE) * ANGLES(RAD(90), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
	end
	RootPart.Anchored = false
	ATTACK = false
	Rooted = false
end

function Shriek()
	ATTACK = true
	Rooted = false
local TAUNTS = {"368794227","368794903","368794985"}
	local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 25*SIZE, Character)
	for i=0, 2.5, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0*SIZE + 0.05 * COS(SINE / 12)*SIZE) * ANGLES(RAD(15), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(160), RAD(45), RAD(12)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(160), RAD(-45), RAD(-12)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1.1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12)*SIZE, -0.4*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(-15), RAD(-15)), 0.15 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12)*SIZE, -0.4*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(15), RAD(-15)), 0.15 / Animation_Speed)
	end
	Rooted = true
	CreateSound(TAUNTS[MRANDOM(1,#TAUNTS)], Effects, 10, 1)
	for i=0, 4.5, 0.1 / Animation_Speed do
		Swait()
		ApplyAoE(HITPOS,38,.4,.7,5,false)
		MagicSphere3(VT(0,0,0),5,Head.CFrame,"Pearl",VT(15,15,15))
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, -0.4*SIZE, -0*SIZE + 0.05 * COS(SINE / 12)) * ANGLES(RAD(55), RAD(0), RAD(0)), 0.7 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(-35+MRANDOM(-5,5)), RAD(MRANDOM(-5,5)), RAD(MRANDOM(-5,1))), 1)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-15), RAD(45), RAD(12)) * RIGHTSHOULDERC0, 0.75 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-15), RAD(-45), RAD(-12)) * LEFTSHOULDERC0, 0.75 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1.1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12)*SIZE, -0.4*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(-15), RAD(15)), 0.75 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12)*SIZE, -0.4*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(15), RAD(-55)), 0.75 / Animation_Speed)
	end
	ATTACK = false
	Rooted = false
end

function Thunder()
	ATTACK = true
	Rooted = false
    local BOLTSOUNDS = {168586621,168586586,178452241}
	local GYRO = IT("BodyGyro",RootPart)
	GYRO.D = 750
	GYRO.P = 20000
	GYRO.MaxTorque = VT(0,40000000,0)
	CreateSound(469345336,Torso,3,2,false)
	Pose("Cast2",1.5,2,true,GYRO)
	coroutine.resume(coroutine.create(function()
		local FRAME = RootPart.CFrame
		for i = 1, 25 do
			local POS = FRAME*CF(MRANDOM(-17,17),0,-i*15)
			local LightningTable = Lightning({Color = C3(1,1,0), Start = POS*CF(0,85,0).p, End = POS*CF(0,-15,0).p, SegmentL = 3, Thickness = 0.4, DoesFade = true, Ignore = Character, MaxDist = 200, Branches = true})
			local Hitpos = LightningTable.End
			ApplyAoE(Hitpos,15,20,75,50,false)
			WACKYEFFECT({Time = 15, EffectType = "Sphere", Size = VT(1,1,1), Size2 = VT(1,1,1)*15, Transparency = 0, Transparency2 = 1, CFrame = CF(Hitpos)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = BOLTSOUNDS[MRANDOM(1,#BOLTSOUNDS)], SoundPitch = MRANDOM(8,12)/10, SoundVolume = 5})
			for i = 1, 4 do
				WACKYEFFECT({Time = 15, EffectType = "Sphere", Size = VT(1,1,1), Size2 = VT(0,75,0), Transparency = 0, Transparency2 = 1, CFrame = CF(Hitpos)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			end
			wait(0.05)
		end
	end))
	Pose("Cast2",1.5,0.7,true)
	GYRO:remove()
	ATTACK = false
	Rooted = false
end

function Hat()
	ATTACK = true
	Rooted = false
	Pose("Taunt",0.4,1.2,false)
	ATTACK = false
	Rooted = false
end

function Bullet()
	ATTACK = true
	Rooted = false
	InjusticeGun2.Parent = Character
	WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(5,5,5), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame =  Barrel.CFrame, ANGLES(RAD(0), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
	InjusticeGun.Parent = nil
	for i=0, 0.4, 0.1 / Animation_Speed do
		Swait()
		turnto(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(90)), 0.5 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0 * SIZE, 0 * SIZE, 0 + ((1 * SIZE) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.5 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(90), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.6*SIZE, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	repeat
		for i=0, 0.2, 0.1 / Animation_Speed do
			Swait()
			turnto(Mouse.Hit.p)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(40)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0.4) * ANGLES(RAD(-10), RAD(0), RAD(-32)), 0.5 / Animation_Speed)
            RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(90), RAD(0), RAD(40)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
            LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.6*SIZE, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		local HIT,POS = CastProperRay(Hole.Position, Mouse.Hit.p, 1000, Character)
		SpawnTrail(Hole2.Position,POS)
		ApplyAoE(POS,3,5,15,0,false)
		if HIT ~= nil then
			if HIT.Parent ~= workspace and HIT.Parent.ClassName ~= "Folder" then
			end
		end
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = Hole2.CFrame, MoveToPos = Hole2.CFrame*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = Hole2.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = 213603013, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = CF(POS,Hole2.Position) * ANGLES(RAD(-90), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
		WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = CF(POS,Hole2.Position) * ANGLES(RAD(-90), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
		for i=0, 0.3, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(40)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0.4) * ANGLES(RAD(5), RAD(0), RAD(-32)), 0.25 / Animation_Speed)
            RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(90), RAD(15), RAD(40)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
            LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.6*SIZE, 0) * ANGLES(RAD(-45), RAD(0), RAD(45)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	until KEYHOLD == false
	InjusticeGun2.Parent = nil
	InjusticeGun.Parent = Character
	WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(5,5,5), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame =  Barrel.CFrame, ANGLES(RAD(0), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
    WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(5,5,5), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame =  Barrel2.CFrame, ANGLES(RAD(0), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
	ATTACK = false
	Rooted = false
end

function Void_Pusher()
	local target = nil
	local targettorso = nil
	if Mouse.Target ~= nil then
		if Mouse.Target.Parent ~= Character and Mouse.Target.Parent.Parent ~= Character and Mouse.Target.Parent:FindFirstChildOfClass("Humanoid") ~= nil then
			target = Mouse.Target.Parent:FindFirstChildOfClass("Humanoid")
			targettorso = Mouse.Target.Parent:FindFirstChild("HumanoidRootPart") or Mouse.Target.Parent:FindFirstChild("Torso") or Mouse.Target.Parent:FindFirstChild("UpperTorso")
		end
	end
	if target ~= nil then
		VALUE1 = true
		targettorso.Anchored = true
		CreateSound("191456748", Head, 10, 0.85, false)
		local GYRO = IT("BodyGyro",RootPart)
		GYRO.D = 100
		GYRO.P = 2000
		GYRO.MaxTorque = VT(0,999999999999999999,0)
		GYRO.cframe = CF(RootPart.Position,targettorso.Position)
		wait(1)
		WACKYEFFECT({Time = 75, EffectType = "Ring", Size = VT(0.01,0.01,0.01), Size2 = VT(5,5,0.01), Transparency = 0.5, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,0,-2), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = 314970790, SoundPitch = 1, SoundVolume = 3})
		GYRO:remove()
		targettorso.CFrame = CF(targettorso.Position,RootPart.Position)
		targettorso.Anchored = false
		target.PlatformStand = true
		CreateSound("330010786", targettorso, 10, 1, false)
		local bv = Instance.new("BodyVelocity") 
		bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
		bv.velocity = CF(VT(RootPart.Position.X,targettorso.Position.Y-10,RootPart.Position.Z),targettorso.Position).lookVector*350
		bv.Parent = targettorso
		Debris:AddItem(bv,0.05)
		VALUE1 = false
			coroutine.resume(coroutine.create(function()
			for i=0, 1.5, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 1 + 0.5 * COS(SINE / 12)) * ANGLES(RAD(-25 - 3 * SIN(SINE / 12)), RAD(0), RAD(-25)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(23 - 3 * SIN(SINE / 12)), RAD(0), RAD(30)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE, 0.5*SIZE, -0.01*SIZE) * ANGLES(RAD(70), RAD(0), RAD(20)) * ANGLES(RAD(0), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE, 0.5*SIZE, -0.01*SIZE) * ANGLES(RAD(70), RAD(0), RAD(-20)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.5*SIZE - 0.05*SIZE * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -0.8*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
		end))
	end
end

function JusticeBeam()
	ATTACK = true
	Rooted = false
	coroutine.resume(coroutine.create(function()
	local AIMPOS = Mouse.Hit.p
	local AIM,AIMPOS = CastProperRay(AIMPOS+VT(0,1,0),AIMPOS,10000,Character)
		local RAYS = {}
		for i = 1, 4 do
			local RAY = CreatePart(3, Effects, "Neon", 0, 1, "New Yeller", "Ray", VT(15,2000,15))
			MakeForm(RAY,"Cyl")
			RAY.Mesh.Scale = VT(1,1.1,1)
			table.insert(RAYS,RAY)
		end
		CreateSound(348663022, Effects, 2, 1.2, false)
		for i = 1, 100 do
			Swait()
			for e = 1, #RAYS do
				if RAYS[e] ~= nil then
					local RAY = RAYS[e]
					RAY.CFrame = CF(AIMPOS+VT(0,1000,0))*ANGLES(RAD(0),RAD(90*e),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(50-(i/2)))*CF(0,-1000,0)
					RAY.Transparency = RAY.Transparency - 0.01
				end
			end
		end
		for i = 1, 20 do
			Swait()
			for e = 1, #RAYS do
				if RAYS[e] ~= nil then
					local RAY = RAYS[e]
					RAY.Mesh.Scale = RAY.Mesh.Scale - VT(1/20,0,1/20)
				end
			end
		end
		wait(0.3)
		for i = 1, 16 do
			local POS = CF(AIMPOS)*ANGLES(RAD(0),RAD(0,360),RAD(0))*CF(0,0,MRANDOM(0,5)).p
			SpawnTrail(POS+VT(0,200,0),POS)
		end
        WACKYEFFECT({Time = 20, EffectType = "Sphere", Size = VT(0,0.55,0), Size2 = VT(90,2,90), Transparency = 0, Transparency2 = 1, CFrame = CF(AIMPOS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		CreateDebreeRing(AIM,AIMPOS-VT(15,15,15),20,VT(5,5,5),5)
		CreateFlyingDebree(AIM,CF(AIMPOS),7,VT(3,3,3),5,185,false)
		CreateSound(130972023, Effects, 2, 1, false)
		ApplyAoE(AIMPOS,35,50,95,100,false)
	        end))
	        for i=0, 1.9, 0.1 / Animation_Speed do
		    WACKYEFFECT({Time = 20, EffectType = "Block", Size = VT(1.5,1.5,1.5), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = LeftArm.CFrame*CF(0,-1,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		    WACKYEFFECT({Time = 20, EffectType = "Block", Size = VT(1.5,1.5,1.5), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame*CF(0,-1,0), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		    Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(25 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.2*SIZE, -0.5*SIZE) * ANGLES(RAD(120), RAD(0 + 2.5 * SIN(SINE / 12)), RAD(25 + 2.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.2*SIZE, -0.5*SIZE) * ANGLES(RAD(120), RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-25 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
            end
	ATTACK = false
	Rooted = false
	end


function Bullet_Rain()
	ATTACK = true
	Rooted = true
    InjusticeGun2.Parent = Character
	WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(5,5,5), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame =  Barrel.CFrame, ANGLES(RAD(0), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
	InjusticeGun.Parent = nil
	for i=0, 0.6, 0.1 / Animation_Speed do
		Swait()
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE, 0.75*SIZE, -0.5*SIZE) * ANGLES(RAD(0), RAD(-25), RAD(12)) * ANGLES(RAD(125 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1.5 / Animation_Speed)
	end
	local DONE = false
	local GATE = nil
	local GATESPIN = true
	coroutine.resume(coroutine.create(function()
		repeat
			Swait()
			if GATE ~= nil then
				GATE.CFrame = GATE.CFrame * ANGLES(RAD(0), RAD(-5), RAD(0))
			end
		until GATESPIN == false
	end))
	coroutine.resume(coroutine.create(function()
		repeat
			Swait()
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0.01 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0.01, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE, 0.75*SIZE, -0.5*SIZE) * ANGLES(RAD(0), RAD(-180), RAD(12)) * ANGLES(RAD(175 - 2.5 * COS(SINE / 12) + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 2.5 / Animation_Speed)
		until DONE == true
		Swait(10)
		for i = 1, 75 do
			Swait(1.5)
			local FIRED = false
			local CHILDREN = workspace:GetDescendants()
			for index, CHILD in pairs(CHILDREN) do
				if CHILD.ClassName == "Model" and CHILD ~= Character then
					local HUM = CHILD:FindFirstChildOfClass("Humanoid")
					if HUM then
						local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
						if TORSO then
							if (TORSO.Position - GATE.Position).Magnitude <= GATE.Size.X/2.5 + TORSO.Size.Magnitude/5 then
								local HITFLOOR,HITPOS = Raycast(TORSO.Position, (CF(TORSO.Position, TORSO.Position + VT(0, -1, 0))).lookVector, 15, Character)
								local CFRAME = CF(HITPOS)*ANGLES(RAD(MRANDOM(-15,15)),RAD(MRANDOM(-15,15)),RAD(MRANDOM(-15,15)))
								WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = CFRAME, MoveToPos = CFRAME*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = 213603013, SoundPitch = 1.5, SoundVolume = 3})
								WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = CFRAME, MoveToPos = nil, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
								SpawnTrail(CFRAME.p,CFRAME*CF(0,1000,0).p)	
								ApplyAoE(CFRAME.p,3,0.25,1,2,false)	
								FIRED = true
								break
							end
						end
					end
				end
			end
			if FIRED == false then
				local CFRAME = GATE.CFrame*ANGLES(RAD(0),RAD(MRANDOM(0,360)),RAD(0))*CF(0,0,MRANDOM(2,math.ceil(GATE.Size.X/2.5)))*ANGLES(RAD(MRANDOM(-15,15)),RAD(MRANDOM(-15,15)),RAD(MRANDOM(-15,15)))
				WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(1,1.5,1), Transparency = 0, Transparency2 = 1, CFrame = CFRAME, MoveToPos = CFRAME*CF(0,0.5,0).p, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = 213603013, SoundPitch = 1.5, SoundVolume = 6})
				WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,0.5,2), Transparency = 0, Transparency2 = 1, CFrame = CFRAME, MoveToPos = nil, RotationX = 0, RotationY = -15, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
				SpawnTrail(CFRAME.p,CFRAME*CF(0,1000,0).p)
				local HITBOD = Raycast(CFRAME.p, (CF(CFRAME.p, CFRAME.p + VT(0, 1, 0))).lookVector, 1000, Character)
				if HITBOD ~= nil then
					if HITBOD.Parent:FindFirstChildOfClass("Humanoid") then
						ApplyAoE(HITBOD,3,0.25,1,0,false)
					end
				end
			end
		end
		for i = 1, 45 do
			Swait()
			GATE.Size = GATE.Size - VT(3,0,3)
		end
		GATESPIN = false
		GATE:remove()
		end))
	Swait(5)
	local HITFLOOR,HITPOS = Raycast(Mouse.Hit.p, (CF(Mouse.Hit.p, Mouse.Hit.p + VT(0, -1, 0))).lookVector, 15, Character)
	GATE = CreatePart(3, Effects, "Neon", 0, 1, "New Yeller", "Gate", VT(0,0,0))
	local DECAL = IT("Decal",GATE)
	DECAL.Texture = "http://www.roblox.com/asset/?id=0"
	DECAL.Face = "Top"
	GATE.CFrame = CF(HITPOS)
	CreateSound(160772554, GATE, 7, 1.3, false)
	for i = 1, 45 do
		Swait()
		GATE.Size = GATE.Size + VT(3,0,3)
	end
	CreateSound(145080998, Hole2, 7, 1, false)
	WACKYEFFECT({Time = 25, EffectType = "Wave", Size = VT(0.3,0,0.3), Size2 = VT(2,2,2), Transparency = 0, Transparency2 = 1, CFrame = Hole2.CFrame*CF(0,-1,0) * ANGLES(RAD(180), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	InjusticeGun.Parent = Character
	WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(5,5,5), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame =  Barrel.CFrame, ANGLES(RAD(0), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
    WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(5,5,5), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame =  Barrel2.CFrame, ANGLES(RAD(0), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 5, RotationZ = 0, Material = "Neon", Color = C3(1,1,0), SoundID = nil, SoundPitch = MRANDOM(8,11)/10, SoundVolume = 8})
	InjusticeGun2.Parent = nil
	ATTACK = false
	Rooted = false
	DONE = true
end

function Ring()
	ATTACK = true
	Rooted = false
	local GYRO = IT("BodyGyro",RootPart)
	GYRO.D = 750
	GYRO.P = 20000
	GYRO.MaxTorque = VT(0,40000000,0)
	local FIRE = IT("Model",Effects)
	FIRE.Name = "Fire"
	local MAIN = CreatePart(3, FIRE, "Neon", 0, 1, "New Yeller", "Center", VT(0,0,0))
	FIRE.PrimaryPart = MAIN
	local FIRES = {}
	for i = 1, 45 do
		local PRT = CreatePart(3, FIRE, "Neon", 0, 1, "New Yeller", "RingPart", VT(3,3,3))
		PRT.CFrame = MAIN.CFrame*ANGLES(RAD(0),RAD((360/45)*i),RAD(0))*CF(0,0,20)
		local F = Fire(PRT)
		table.insert(FIRES,F)
	end
	repeat
		FIRE:SetPrimaryPartCFrame(CF(Mouse.Hit.p))
		Pose("Cast1",1.5,0.01,false,GYRO)
	until HOLD == true
	coroutine.resume(coroutine.create(function()
		for i = 1, 4 do
			ApplyAoE(MAIN.Position,25,15,25,0,false)
			CreateSound(463598785,MAIN,3,1,false)
			for E = 1, #FIRES do
				if FIRES[E] ~= nil then
					FIRES[E].Acceleration = VT(0,300,0)
					FIRES[E].Lifetime=NumberRange.new(0.35,1.5)
				end
			end
			wait(0.3)
		end
		for E = 1, #FIRES do
			if FIRES[E] ~= nil then
				FIRES[E].Enabled = false
			end
		end
		Debris:AddItem(FIRE,5)
	end))
	CreateSound(215395388,RightArm,3,2,false)
	Pose("Cast2",1.5,0.5,true)
	GYRO:remove()
	ATTACK = false
	Rooted = false
end

function Grasp()
    ATTACK = true
    Rooted = false
    local HASGRABBED = false
    local WELD = nil
    local TORS = nil
    local hitting = RightArm.Touched:connect(function(hit)
        if hit.Parent:FindFirstChild("Humanoid") then
            if hit.Parent.Humanoid.Health ~= 0 then
                UNANCHOR = false
                TORS = hit.Parent:FindFirstChild("Torso") or hit.Parent:FindFirstChild("UpperTorso")
                TORS.Anchored = true
                TORS.CFrame = RightArm.CFrame * CF(0,-1.15,0) * ANGLES(RAD(90), RAD(0), RAD(0))
                WELD = weldBetween(RightArm,TORS)
                HASGRABBED = true
                Rooted = true
            end
        end
    end)
    for i=0, 1, 0.1 / Animation_Speed do
        Swait()
        if HASGRABBED == true then
            break
        end
        RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
        Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1))), 2 / Animation_Speed)
        RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE, 0.5*SIZE, -1*SIZE) * ANGLES(RAD(75 + 11 * COS(SINE / 1)), RAD(0), RAD(-12 + 11 * COS(SINE / 1))) * RIGHTSHOULDERC0, 2 / Animation_Speed)
        LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE, 0.5*SIZE, -1*SIZE) * ANGLES(RAD(75 + 11 * COS(SINE / 1)), RAD(0), RAD(-12 + 11 * COS(SINE / 1))) * LEFTSHOULDERC0, 2 / Animation_Speed)
        RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8 + 11 * COS(SINE / 1)), RAD(0), RAD(0 + 11 * COS(SINE / 1))), 2 / Animation_Speed)
        LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8 + 11 * COS(SINE / 1)), RAD(0), RAD(0 + 11 * COS(SINE / 1))), 2 / Animation_Speed)
    end
    hitting:disconnect()
    if HASGRABBED == true then
        TORS.Anchored = false
        RootPart.Anchored = true
        for i=0, 2, 0.1 / Animation_Speed do
            Swait()
            RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, -1.2) * ANGLES(RAD(65), RAD(0), RAD(0)), 0.2 / Animation_Speed)
            Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(0 + 11 * COS(SINE / 1)), RAD(0), RAD(0 + 11 * COS(SINE / 1))), 0.2 / Animation_Speed)
            RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-40 + 11 * COS(SINE / 1)), RAD(0), RAD(20 + 11 * COS(SINE / 1))) * RIGHTSHOULDERC0, 0.2 / Animation_Speed)
            LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-40 + 11 * COS(SINE / 1)), RAD(0), RAD(-20 + 11 * COS(SINE / 1))) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
            RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.3*SIZE, -1*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-20 + 11 * COS(SINE / 1))), 0.2 / Animation_Speed)
            LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -0.3*SIZE, -1*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
        end
        CreateWave(VT(3,1,3),65,CF(RootPart.Position)*CF(0,-3,0),false,2,"Pearl",VT(0.5,0.3,0.5))
        CreateWave(VT(3,1,3),65,CF(RootPart.Position)*CF(0,-3,0),true,2,"Pearl",VT(0.6,0.3,0.6))
        local SOUNDPART = CreatePart(3, Effects, "Neon", 0, 1, "Pearl", "Sound", VT(0,0,0))
        SOUNDPART.CFrame = RootPart.CFrame
        Debris:AddItem(SOUNDPART,5)
        CreateSound("1295446488", SOUNDPART, 2, 1)
        for i = 1, 15 do
            Slice(0.1,65,CF(RootPart.Position) * ANGLES(RAD(0), RAD(MRANDOM(-180,180)), RAD(90)),"Pearl", 1 + MRANDOM(1,30)/15)
        end
        for i=0, 2, 0.1 / Animation_Speed do
            Swait()
            RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 50000000) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
            Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(-20), RAD(0), RAD(0)), 0.2 / Animation_Speed)
            RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-40), RAD(0), RAD(20)) * RIGHTSHOULDERC0, 0.2 / Animation_Speed)
            LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-40), RAD(0), RAD(-20)) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
            RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, -0.3*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-20)), 0.2 / Animation_Speed)
            LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, -0.3*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(20)), 0.2 / Animation_Speed)
        end
        for i=0, 0.25, 0.1 / Animation_Speed do
            Swait()
            RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(90), RAD(0), RAD(0)), 3 / Animation_Speed)
            Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 3 / Animation_Speed)
            RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(90), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 3 / Animation_Speed)
            LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 3 / Animation_Speed)
            RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
            LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
        end
        if HITFLOOR ~= nil then
            CreateDebreeRing(HITFLOOR,CF(RootPart.Position)*CF(0,-3,0).p,15,VT(7,7,7),85)
        end
        CreateSound("414517163", Effects, 10, MRANDOM(7, 12) / 10)
        WELD:remove()
        for i = 1, 25 do
            Swait()
            ApplyAoE(RootPart.Position,55,2.5,5,20,false)
            CreateWave(VT(3,1,3),65,CF(RootPart.Position)*CF(0,-3,0),true,5,"Pearl",VT(0.3,3,0.3))
            CreateWave(VT(3,1,3),65,CF(RootPart.Position)*CF(0,-3,0),false,2,"Lavender",VT(1,0.4,1))
            CreateWave(VT(3,1,3),65,CF(RootPart.Position)*CF(0,-3,0),true,5,"Lavender",VT(2.3,0.3,2.3))
            Slice(0.1,65,CF(RootPart.Position) * ANGLES(RAD(MRANDOM(-180,180)), RAD(MRANDOM(-180,180)), RAD(MRANDOM(-180,180))),"Pearl", 1 + MRANDOM(1,30)/5)
            Slice(0.1,65,CF(RightArm.CFrame*CF(0,-1,0).p) * ANGLES(RAD(MRANDOM(-20,20)), RAD(MRANDOM(-180,180)), RAD(MRANDOM(-20,20))),"Lavender", 1 + MRANDOM(1,30)/15)
        end
    end
    UNANCHOR = true
    ATTACK = false
    Rooted = false
end

function Evening_Star()
	ATTACK = true
	Rooted = true
	coroutine.resume(coroutine.create(function()
    WACKYEFFECT({Time = 35, EffectType = "Sphere", Size = VT(50,50,50), Size2 = VT(0,0,0), Transparency = 0.2, Transparency2 = 1, CFrame = Torso.CFrame, ANGLES(RAD(0), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(153,0,153), SoundID = 588738949, SoundPitch = 1, SoundVolume = 5})
	Swait(30)
	WACKYEFFECT({Time = 35, EffectType = "Sphere", Size = VT(50,50,50), Size2 = VT(0,0,0), Transparency = 0.2, Transparency2 = 1, CFrame = Torso.CFrame, ANGLES(RAD(0), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(153,0,153), SoundID = 588739384, SoundPitch = 1, SoundVolume = 5})
	Swait(30)
    WACKYEFFECT({Time = 35, EffectType = "Sphere", Size = VT(50,50,50), Size2 = VT(0,0,0), Transparency = 0.2, Transparency2 = 1, CFrame = Torso.CFrame, ANGLES(RAD(0), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(153,0,153), SoundID = 588739712, SoundPitch = 1, SoundVolume = 5})
	Swait(30)
	WACKYEFFECT({Time = 55, EffectType = "Sphere", Size = VT(100,100,100), Size2 = VT(0,0,0), Transparency = 0.2, Transparency2 = 1, CFrame = Torso.CFrame, ANGLES(RAD(0), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(153,0,153), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	end))
	for i=0, 4.5, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 1  + 0.25 * COS(SINE / 12)) * ANGLES(RAD(25), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, -0.5*SIZE) * ANGLES(RAD(0), RAD(0), RAD(-85)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.15*SIZE, -0.5*SIZE) * ANGLES(RAD(-15), RAD(0), RAD(85)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.75*SIZE, -0.01*SIZE) * ANGLES(RAD(-2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -0.25*SIZE, -0.5*SIZE) * ANGLES(RAD(-2.5 * SIN(SINE / 12)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
	end	
	coroutine.resume(coroutine.create(function()
		Swait(15)
		local POS = Mouse.Hit.p
		local RAY = CreatePart(3, Effects, "Neon", 0, 0, "Dark indigo", "Strike", VT(0,2000,0))
		MakeForm(RAY,"Cyl")
		local SPHERE = CreatePart(3, Effects, "Neon", 0, 0, "Dark indigo", "Strike", VT(0,0,0))
		MakeForm(SPHERE,"Ball")
		local SHIELD = CreatePart(3, Effects, "Neon", 0, 0.5, "Really black", "Strike", VT(0,0,0))
		MakeForm(SHIELD,"Ball")
		SHIELD.CFrame = CF(POS)
		RAY.CFrame = CF(POS)
		SPHERE.CFrame = CF(POS)
		CreateSound(440145570, SPHERE, 10, 0.8, false)
		CreateSound(415700134, SPHERE, 10, 0.8, false)
		for i = 1, 200 do
			Swait()
			WACKYEFFECT({Time = 15, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(SPHERE.Size.X*1.2,5+(i),SPHERE.Size.X*1.2), Transparency = 0, Transparency2 = 1, CFrame = SPHERE.CFrame*ANGLES(RAD(0), RAD(i), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = i, RotationZ = 0, Material = "Neon", Color = C3(153,0,153), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			RAY.Size = RAY.Size + VT(0.5*1.18,0,0.5*1.18)
			SPHERE.Size = SPHERE.Size + VT(2.7*1.18,2.7*1.18,2.7*1.18)
			SHIELD.Size = SPHERE.Size + VT(4*1.18,4*1.18,4*1.18)
			ApplyAoE(SPHERE.Position,SPHERE.Size.X/2.7*1.3,0.25,1.5,0,false)
		end	
		for i = 1, 45 do
			Swait()
			RAY.Transparency = RAY.Transparency + 1/45
			SPHERE.Transparency = RAY.Transparency 
			SHIELD.Transparency = SPHERE.Transparency + 1/45
		end
		RAY:remove()
		SHIELD:remove()
		SPHERE:remove()
	end))
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 1  + 0.25 * COS(SINE / 12)) * ANGLES(RAD(-35), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(-15 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, -0.15*SIZE) * ANGLES(RAD(65), RAD(-45), RAD(85)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, -0.15*SIZE) * ANGLES(RAD(65), RAD(45), RAD(-85)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(-35-2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, -0.01*SIZE) * ANGLES(RAD(-35-2.5 * SIN(SINE / 12)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	ATTACK = false
	Rooted = false
end

function EarthBreak()
	ATTACK = true
	Rooted = true
	local CHARGE = false
	local BLASTS = {468991944, 468991990}
	coroutine.resume(coroutine.create(function()
		repeat
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.45 * COS(SINE / 12)) * ANGLES(RAD(-15 + 2.5 * SIN(SINE / 12)), RAD(0), RAD(5 + 1 * SIN(SINE / 12))), 0.1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + (1*SIZE - 1)) * ANGLES(RAD(-35 + 4.5 * SIN(SINE / 12)), RAD(0), RAD(-5 - 2.5 * SIN(SINE / 12))), 0.1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.15*SIZE, 0.5*SIZE + 0.25 * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(140 - 7.5 * SIN(SINE / 12)), RAD(-7.5 * SIN(SINE / 12)), RAD(-45 + 7.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 0.1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.15*SIZE, 0.5*SIZE + 0.25 * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(140 - 7.5 * SIN(SINE / 12)), RAD(7.5 * SIN(SINE / 12)), RAD(45 - 7.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 0.1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.15 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 7.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE + 0.25 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 7.5 * SIN(SINE / 12)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.1 / Animation_Speed)
		until CHARGE == true
		for i = 0, 0.4, 0.1 / Animation_Speed do
			Swait()
			WACKYEFFECT({
				Time = 15,
				EffectType = "Sphere",
				Size = VT(60, 60, 60),
				Size2 = VT(0, 0, 0),
				Transparency = 1,
				Transparency2 = 0.7,
				CFrame = CF(RootPart.Position),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = C3(1, 0, 1),
				SoundID = nil,
				SoundPitch = nil,
				SoundVolume = nil
			})
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 1 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(-25 + 2.5 * SIN(SINE / 6)), RAD(0), RAD(5 + 1 * SIN(SINE / 6))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + (1*SIZE - 1)) * ANGLES(RAD(0 + 4.5 * SIN(SINE / 12)), RAD(0), RAD(-5 - 2.5 * SIN(SINE / 12))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.15*SIZE, 0.5*SIZE + 0.25 * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(160 - 7.5 * SIN(SINE / 6)), RAD(-7.5 * SIN(SINE / 6)), RAD(-50 + 7.5 * SIN(SINE / 6))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.15*SIZE, 0.5*SIZE + 0.25 * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(160 - 7.5 * SIN(SINE / 6)), RAD(7.5 * SIN(SINE / 6)), RAD(50 - 7.5 * SIN(SINE / 6))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.15 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 7.5 * SIN(SINE / 6)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE + 0.25 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 7.5 * SIN(SINE / 6)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		coroutine.resume(coroutine.create(function()
			local POS = RootPart.Position
			wait(0.2)
			for i = 1, 5 do
				WACKYEFFECT({
					Time = 65,
					EffectType = "Sphere",
					Size = VT(2, 2, 2),
					Size2 = VT(0, 0, 500),
					Transparency = 1,
					Transparency2 = 0,
					CFrame = CF(POS),
					MoveToPos = nil,
					RotationX = MRANDOM(-2, 2),
					RotationY = MRANDOM(-12, 12),
					RotationZ = MRANDOM(-2, 2),
					Material = "Neon",
					Color = C3(1, 0, 1),
					SoundID = nil,
					SoundPitch = nil,
					SoundVolume = nil
				})
			end
			wait(1)
			SHAKECAM(POS, 9999999999, 25, 25)
			ApplyAoE(POS,168,25,50,250,false)
			WACKYEFFECT({
				Time = 85,
				EffectType = "Sphere",
				Size = VT(120, 120, 120),
				Size2 = VT(350, 350, 350),
				Transparency = 0,
				Transparency2 = 1,
				CFrame = CF(POS),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = C3(1, 0, 1),
				SoundID = nil,
				SoundPitch = 1,
				SoundVolume = 5
			})
			for i = 1, 20 do
				WACKYEFFECT({
					Time = 85,
					EffectType = "Sphere",
					Size = VT(120, 120, 120),
					Size2 = VT(120, 120, 144) + VT(i * 3, i * 3, i * 3),
					Transparency = 0.8,
					Transparency2 = 1,
					CFrame = CF(POS),
					MoveToPos = nil,
					RotationX = 0,
					RotationY = 0,
					RotationZ = 0,
					Material = "Neon",
					Color = C3(1, 0, 1),
					SoundID = nil,
					SoundPitch = 1,
					SoundVolume = 5
				})
				WACKYEFFECT({
					Time = 100,
					EffectType = "Wave",
					Size = VT(25, 2, 25),
					Size2 = VT(400, 0, 400) * 1.2,
					Transparency = 0,
					Transparency2 = 1,
					CFrame = CF(POS) * ANGLES(RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360))),
					MoveToPos = nil,
					RotationX = 0,
					RotationY = 0,
					RotationZ = 0,
					Material = "Neon",
					Color = C3(1, 0, 1),
					SoundID = nil,
					SoundPitch = nil,
					SoundVolume = nil
				})
			end
			local HITFLOOR, HITPOS = Raycast(POS, CF(RootPart.Position, RootPart.Position + VT(0, -1, 0)).lookVector, 150, Character)
			for i = 1, 5 do
				CreateSound(438666077, Effects, 15, 1 - i / 10, false)
				WACKYEFFECT({
					Time = 120,
					EffectType = "Wave",
					Size = VT(150, 2, 150),
					Size2 = VT(300 + i * 170, 0, 300 + i * 170) * 1.2,
					Transparency = 0,
					Transparency2 = 1,
					CFrame = CF(HITPOS) * ANGLES(RAD(0), RAD(MRANDOM(0, 360)), RAD(0)),
					MoveToPos = nil,
					RotationX = 0,
					RotationY = 0,
					RotationZ = 0,
					Material = "Neon",
					Color = C3(1, 0, 1),
					SoundID = nil,
					SoundPitch = nil,
					SoundVolume = nil
				})
			end
		end))
		for i = 0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.45 * COS(SINE / 12)) * ANGLES(RAD(7 + 2.5 * SIN(SINE / 12)), RAD(0), RAD(5 + 1 * SIN(SINE / 12))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + (1*SIZE - 1)) * ANGLES(RAD(25 + 4.5 * SIN(SINE / 12)), RAD(0), RAD(-5 - 2.5 * SIN(SINE / 12))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(45 - 7.5 * SIN(SINE / 12)), RAD(45 - 7.5 * SIN(SINE / 12)), RAD(12 + 7.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(45 - 7.5 * SIN(SINE / 12)), RAD(-45 + 7.5 * SIN(SINE / 12)), RAD(-12 - 7.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.15 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1))), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE + 0.25 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1))), 1 / Animation_Speed)
		end
		ATTACK = false
		Rooted = false
	end))
	for i = 0.55, 90 do
		wait(0.008)
		local POS = CF(RootPart.Position) * ANGLES(RAD(0), RAD(MRANDOM(0, 360)), RAD(0)) * CF(0, 0, MRANDOM(15, 250))
		local HITFLOOR, HITPOS = Raycast(POS.p, CF(RootPart.Position, RootPart.Position + VT(0, -1, 0)).lookVector, 150, Character)
		if HITFLOOR then
			ApplyAoE(HITPOS,35,5,10,75,false)
			local TURN = ANGLES(RAD(0), RAD(MRANDOM(0, 360)), RAD(0)) * ANGLES(RAD(MRANDOM(0, 25)), RAD(0), RAD(0))
			WACKYEFFECT({
				Time = 25,
				EffectType = "Sphere",
				Size = VT(22, 22, 22),
				Size2 = VT(85, 85, 85),
				Transparency = 0,
				Transparency2 = 1,
				CFrame = CF(HITPOS),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = C3(1, 0, 1),
				SoundID = BLASTS[MRANDOM(1, #BLASTS)],
				SoundPitch = MRANDOM(9, 12) / 10,
				SoundVolume = 5
			})
			for e = 1, 3 do
				WACKYEFFECT({
					EffectType = "Wave",
					Size = VT(25, 0, 25),
					Size2 = VT(40, 0, 40) + VT(e * 6, e / 5, e * 6),
					Transparency = 0,
					Transparency2 = 1,
					CFrame = CF(HITPOS) * ANGLES(RAD(0), RAD(72 * i), RAD(0)),
					MoveToPos = nil,
					RotationX = 0,
					RotationY = 3,
					RotationZ = 0,
					Material = "Neon",
					Color = C3(153, 0, 153),
					SoundID = nil,
					SoundPitch = nil,
					SoundVolume = nil
				})
				WACKYEFFECT({
					Time = 35,
					EffectType = "Sphere",
					Size = VT(22, 45, 22),
					Size2 = VT(25, 45 + e * 75, 25),
					Transparency = 0,
					Transparency2 = 1,
					CFrame = CF(HITPOS) * TURN,
					MoveToPos = nil,
					RotationX = 0,
					RotationY = 0,
					RotationZ = 0,
					Material = "Neon",
					Color = C3(1, 0, 1),
					SoundID = nil,
					SoundPitch = MRANDOM(9, 12) / 10,
					SoundVolume = 5
				})
			end
		end
	end
	CHARGE = true
end

function Maniac_Wave()
	local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 25*SIZE, Character)
	if HITFLOOR ~= nil then
		ATTACK = true
		Rooted = false
		local GYRO = IT("BodyGyro",RootPart)
		GYRO.D = 100
		GYRO.P = 2000
		GYRO.MaxTorque = VT(0,4000000,0)
		GYRO.cframe = CF(RootPart.Position,Mouse.Hit.p)
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			WACKYEFFECT({Time = 100, EffectType = "Skull", Size = VT(5,5,5), Size2 = VT(1.8,1.8,1.8), Transparency = 0.8, Transparency2 = 1, CFrame = LeftArm.CFrame*CF(0,-1,0)*ANGLES(RAD(90),RAD(0),RAD(90))*ANGLES(RAD(0),RAD(180),RAD(0)), MoveToPos = LeftArm.CFrame*CF(0,-1,0)*CF(MRANDOM(-15,15),MRANDOM(-15,15),MRANDOM(-15,15)).p, RotationX = MRANDOM(-25,25)/15, RotationY = MRANDOM(-25,25)/15, RotationZ = MRANDOM(-25,25)/15, Material = "Neon", Color = C3(1,0,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			GYRO.cframe = CF(RootPart.Position,Mouse.Hit.p)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(-90)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(90)), 0.5 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.5 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0.3*SIZE) * ANGLES(RAD(0), RAD(0), RAD(15)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(0), RAD(-90)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
		end
		GYRO:remove()
		coroutine.resume(coroutine.create(function()
			local PITS = {}
			local FRAME = RootPart.CFrame
			for i = 1, 120 do
				Swait()
				local CFRAME = FRAME*CF(MRANDOM(-10,10)/10,0,5-(i)).p
				local HITFLOOR,HITPOS,NORMAL = Raycast(CFRAME, (CF(CFRAME, CFRAME + VT(0, -1, 0))).lookVector, 25, Character)
				if HITFLOOR ~= nil then
					if MRANDOM(1, 2) == 1 then
						local ICICLE = IT("CornerWedgePart",Effects)
						ICICLE.Locked = true
						ICICLE.CanCollide = false
						ICICLE.Anchored = true
						ICICLE.BrickColor = BRICKC"Really black"
						ICICLE.Material = "Marble"
						ICICLE.Size = VT(i/10,i/2,i/10)
						ICICLE.CFrame = CF(HITPOS)*CF(MRANDOM(-i/10,i/10),0,MRANDOM(-i/10,i/10))*ANGLES(RAD(MRANDOM(-25,25)),RAD(MRANDOM(-180,180)),RAD(MRANDOM(-25,25)))
						table.insert(PITS,ICICLE)
						CreateSound("588693156", ICICLE, 3, MRANDOM(8,12)/10, false)
						ApplyAoE(ICICLE.Position,ICICLE.Size.X,12.5,30,25,false)
						WACKYEFFECT({EffectType = "Wave", Size = VT(ICICLE.Size.X*3,2,ICICLE.Size.X*3), Size2 = VT(0,6,0), Transparency = 1, Transparency2 = 0, CFrame = CF(HITPOS), MoveToPos = nil, RotationX = 0, RotationY = 15, RotationZ = 0, Material = "Fabric", Color = C3(1,0,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
					end
				else
					break
				end
			end
			wait(2)
			coroutine.resume(coroutine.create(function()
				for i = 1, 10 do
					Swait()
					for e=1,#PITS do
						if PITS[e]~=nil then
							local E = PITS[e]
							E.Transparency = E.Transparency + 0.1
						end
					end
				end
				for e=1,#PITS do
					if PITS[e]~=nil then
						local E = PITS[e]
						E:remove()
					end
				end
			end))
		end))
		ATTACK = false
		Rooted = false
	end
end

function CreatePart2(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
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

function CreateWave3(SIZE,WAIT,CFRAME,DOESROT,ROT,COLOR,GROW)
    local wave = CreatePart2(3, Effects, "Neon", 0, 0.5, BRICKC(COLOR), "Effect", VT(0,0,0))
    local mesh = IT("SpecialMesh",wave)
    mesh.MeshType = "FileMesh"
    mesh.MeshId = "http://www.roblox.com/asset/?id=20329976"
    mesh.Scale = SIZE
    mesh.Offset = VT(0,0,-SIZE.X/8)
    wave.CFrame = CFRAME
    coroutine.resume(coroutine.create(function(PART)
        for i = 1, WAIT do
            Swait()
            mesh.Scale = mesh.Scale + GROW
            mesh.Offset = VT(0,0,-(mesh.Scale.X/8))
            if DOESROT == true then
                wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0,ROT,0)
            end
            wave.Transparency = wave.Transparency + (0.5/WAIT)
            if wave.Transparency > 0.99 then
                wave:remove()
            end
        end
    end))
end

function CreateSwirl3(SIZE,WAIT,CFRAME,DOESROT,ROT,COLOR,GROW)
    local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(COLOR), "Effect", VT(0,0,0))
    local mesh = IT("SpecialMesh",wave)
    mesh.MeshType = "FileMesh"
    mesh.MeshId = "http://www.roblox.com/asset/?id=1051557"
    mesh.Scale = SIZE
    wave.CFrame = CFRAME
    coroutine.resume(coroutine.create(function(PART)
        for i = 1, WAIT do
            Swait()
            mesh.Scale = mesh.Scale + GROW
            mesh.Offset = VT(0,0,-(mesh.Scale.X/8))
            if DOESROT == true then
                wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0,ROT,0)
            end
            wave.Transparency = wave.Transparency + (0.5/WAIT)
            if wave.Transparency > 0.99 then
                wave:remove()
            end
        end
    end))
end

function MagicSphere4(SIZE,WAIT,CFRAME,COLOR,GROW)
    local wave = CreatePart(3, Effects, "Neon", 0, 0, BRICKC(COLOR), "Effect", VT(1,1,1), true)
    local mesh = IT("SpecialMesh",wave)
    mesh.MeshType = "Sphere"
    mesh.Scale = SIZE
    mesh.Offset = VT(0,0,0)
    wave.CFrame = CFRAME
    coroutine.resume(coroutine.create(function(PART)
        for i = 1, WAIT do
            Swait()
            mesh.Scale = mesh.Scale + GROW
            wave.Transparency = wave.Transparency + (1/WAIT)
            if wave.Transparency > 0.99 then
                wave:remove()
            end
        end
    end))
end

function GoldenPunch()
    ATTACK = true
    Rooted = false
    local SPEED = Speed
    Speed = 8
    CreateSound("169445572", RightArm, 10, 0.9)
    for i=0, 4, 0.1 / Animation_Speed do
        Swait()
        turnto(Mouse.Hit.p)
        MagicSphere4(VT(1,1,1),15,RightArm.CFrame * CF(MRANDOM(-3,3),MRANDOM(-3,3),MRANDOM(-3,3)),"Lavender",VT(-1/15,-1/15,-1/15))
        MagicSphere4(VT(2,2,2),15,RightArm.CFrame * CF(MRANDOM(-3,3),MRANDOM(-3,3),MRANDOM(-3,3)),"Hot pink",VT(-2/15,-2/15,-2/15))
        MagicSphere4(VT(1,1,1),15,LeftArm.CFrame * CF(MRANDOM(-3,3),MRANDOM(-3,3),MRANDOM(-3,3)),"Lavender",VT(-1/15,-1/15,-1/15))
        MagicSphere4(VT(2,2,2),15,LeftArm.CFrame * CF(MRANDOM(-3,3),MRANDOM(-3,3),MRANDOM(-3,3)),"Hot pink",VT(-2/15,-2/15,-2/15))
        RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 * SIZE, 0 * SIZE, -0.2 * SIZE + 0.05 * COS(SINE / 12) * SIZE) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
        Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0 * SIZE, 0 * SIZE, 0 + ((1.2 * SIZE) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1))), 0.2 / Animation_Speed)
        RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * SIZE, 0.5 * SIZE, 0 * SIZE) * ANGLES(RAD(90 + 11 * COS(SINE / 1)), RAD(-30 + 11 * COS(SINE / 1)), RAD(-65 + 11 * COS(SINE / 1))) * RIGHTSHOULDERC0, 3 / Animation_Speed)
        LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * SIZE, 0.5 * SIZE, 0 * SIZE) * ANGLES(RAD(90 + 11 * COS(SINE / 1)), RAD(30 + 11 * COS(SINE / 1)), RAD(65 + 11 * COS(SINE / 1))) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
        RightHip.C0 = Clerp(RightHip.C0, CF(1 * SIZE, -1 * SIZE, -0 * SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1))), 0.15 / Animation_Speed)
        LeftHip.C0 = Clerp(LeftHip.C0, CF(-1 * SIZE, -1 * SIZE, -0 * SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1))), 0.15 / Animation_Speed)
    end
    for i=0, 0.15, 0.1 / Animation_Speed do
        Swait()
        turnto(Mouse.Hit.p)
        RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 * SIZE, 0 * SIZE, -0.2 * SIZE + 0.05 * COS(SINE / 12) * SIZE) * ANGLES(RAD(0), RAD(0), RAD(65)), 1 / Animation_Speed)
        Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0 * SIZE, 0 * SIZE, 0 + ((1.2 * SIZE) - 1)) * ANGLES(RAD(25 + 11 * COS(SINE / 1)), RAD(0), RAD(35 + 11 * COS(SINE / 1))), 1 / Animation_Speed)
        RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * SIZE, 0.5 * SIZE, 0 * SIZE) * ANGLES(RAD(90 + 11 * COS(SINE / 1)), RAD(0), RAD(85 + 11 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
        LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * SIZE, 0.5 * SIZE, 0 * SIZE) * ANGLES(RAD(90 + 11 * COS(SINE / 1)), RAD(0), RAD(-85 + 11 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
        RightHip.C0 = Clerp(RightHip.C0, CF(1 * SIZE, -1 * SIZE, -0 * SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1))), 1 / Animation_Speed)
        LeftHip.C0 = Clerp(LeftHip.C0, CF(-1 * SIZE, -1 * SIZE, -0 * SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1))), 1 / Animation_Speed)
    end
    local PART = CreatePart2(3, Effects, "Neon", 0, 0.8, "Dark indigo", "Punch", VT(50,50,50),false)
    PART.CFrame = RootPart.CFrame * CF(0,0,-25)
    PART.Shape = "Ball"
    local bv = Instance.new("BodyVelocity")
    bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
    bv.velocity = RootPart.CFrame.lookVector*600
    bv.Parent = PART
    bv.Name = "PROJECTILEVELOCITY"
    CreateWave3(VT(1,5,1),55,RootPart.CFrame * CF(0,0,-6)*ANGLES(RAD(-90),RAD(0),RAD(0)),true,-1,"Lavender",VT(2.5,0.2,2.5))
    CreateWave3(VT(1,5,1),55,RootPart.CFrame * CF(0,0,-6)*ANGLES(RAD(-90),RAD(0),RAD(0)),true,1,"Lavender",VT(3,0.2,3))
    CreateSwirl3(VT(3,5,3),75,RootPart.CFrame * CF(0,0,-15)*ANGLES(RAD(-90),RAD(0),RAD(0)),true,-1,"Lavender",VT(2,0.6,2))
    CreateSwirl3(VT(3,5,3),75,RootPart.CFrame * CF(0,0,-15)*ANGLES(RAD(-90),RAD(0),RAD(0)),true,1,"Lavender",VT(2.2,0.6,2.2))
    CreateSound(414517163, Effects, 10, MRANDOM(7, 12) / 10)
    coroutine.resume(coroutine.create(function()
        for i = 1, 10 do
            Swait()
            PART.Transparency = PART.Transparency + 0.2/10
            PART.Size = PART.Size + VT(5,5,5)
            ApplyAoE(PART.Position,35,10,15,100,false)
        end
        PART:Destroy()
    end))
    for i=0, 1, 0.1 / Animation_Speed do
        Swait()
        RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 * SIZE, 0 * SIZE, -0.2 * SIZE + 0.05 * COS(SINE / 12) * SIZE) * ANGLES(RAD(15), RAD(0), RAD(95)), 2 / Animation_Speed)
        Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0 * SIZE, 0 * SIZE, 0 + ((1 * SIZE) - 1)) * ANGLES(RAD(25 + 11 * COS(SINE / 1)), RAD(0), RAD(35 + 11 * COS(SINE / 1))), 3 / Animation_Speed)
        RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * SIZE, 0.5 * SIZE, 0 * SIZE) * ANGLES(RAD(90 + 11 * COS(SINE / 1)), RAD(0), RAD(0 + 11 * COS(SINE / 1))) * RIGHTSHOULDERC0, 3 / Animation_Speed)
        LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * SIZE, 0.5 * SIZE, 0 * SIZE) * ANGLES(RAD(-70 + 11 * COS(SINE / 1)), RAD(0), RAD(-25 + 11 * COS(SINE / 1))) * LEFTSHOULDERC0, 3 / Animation_Speed)
        RightHip.C0 = Clerp(RightHip.C0, CF(1 * SIZE, -0.8 * SIZE, -0 * SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-15 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1))), 3 / Animation_Speed)
        LeftHip.C0 = Clerp(LeftHip.C0, CF(-1 * SIZE, -1 * SIZE, -0 * SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-5 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1))), 3 / Animation_Speed)
    end
    Speed = SPEED
    ATTACK = false
    Rooted = false
end

function VoidedTaunt()
ATTACK = true
Rooted = true
local LAUGHS = {834001699,834001752,834001797,834001828}
CreateSound(LAUGHS[MRANDOM(1,#LAUGHS)], Torso, 30, 1, false)
	coroutine.resume(coroutine.create(function()
        for i=0, 3, 0.1 / Animation_Speed do
            Swait()
            RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 1.5) * ANGLES(RAD(0), RAD(180), RAD(0)), 0.2 / Animation_Speed)
            Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(0 + 11 * COS(SINE / 1)), RAD(0), RAD(0 + 11 * COS(SINE / 1))), 0.2 / Animation_Speed)
            RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-40 + 11 * COS(SINE / 1)), RAD(0), RAD(20 + 11 * COS(SINE / 1))) * RIGHTSHOULDERC0, 0.2 / Animation_Speed)
            LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-40 + 11 * COS(SINE / 1)), RAD(0), RAD(-20 + 11 * COS(SINE / 1))) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
            RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-20 + 11 * COS(SINE / 1))), 0.2 / Animation_Speed)
            LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
        end
ATTACK = false
Rooted = false
end))
end

function TomYumTaunt()
	    ATTACK = true
	    Rooted = true
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(0), RAD(200)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(0), RAD(0), RAD(-200)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		CameraEnshaking(1,45)
		CreateSound(363808674, Torso, 6, 1, false)
		for i=0, 0.5, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(25)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-40), RAD(50), RAD(200)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(40), RAD(50), RAD(-200)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		CameraEnshaking(1,45)
		CreateSound(363808674, Torso, 6, 1, false)
		for i=0, 0.5, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(35), RAD(0), RAD(-25)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(40), RAD(-50), RAD(200)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3*SIZE, 0.5*SIZE, 0) * ANGLES(RAD(-40), RAD(-50), RAD(-200)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-83), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		ATTACK = false
		Rooted = false
end
--//=================================\\
--||	  ASSIGN THINGS TO KEYS
--\\=================================//

function MouseDown(Mouse)
	HOLD = true
	if ATTACK == false then
	end
end

function MouseUp(Mouse)
HOLD = false
end

function KeyDown(Key)
	KEYHOLD = true
	if Key == "q" and ATTACK == false then
		SuperiorForm()
	end
	
	if Key == "e" and ATTACK == false then
		VoidedForm()
	end

	if Key == "r" and ATTACK == false then
		TomYumForm()
	end
	
	if Key == "f" and ATTACK == false then
		InjusticeForm()
	end
	
	if Key == "z" and ATTACK == false then
		if MODE == "Main" then
		MagicMissiles()
		elseif MODE == "Superior" then
		SuperStomp()
		elseif MODE == "Voided" then
		Warp()
		elseif MODE == "Injustice" then
		Bullet()
		elseif MODE == "TomYum" then
		GoldenPunch()
	end
end

	if Key == "b" and ATTACK == false then
		if MODE == "Main" then
        
		elseif MODE == "Superior" then 
			TimesUp()
		elseif MODE == "Voided" then
			Void_Pusher()
		elseif MODE == "Injustice" then
		    Ring()
		elseif MODE == "TomYum" then
			Grasp()
		end
	end

	if Key == "c" and ATTACK == false then
		if MODE == "Main" then
		ChainPunch()
		elseif MODE == "Superior" then
		Buzzsaw()
		elseif MODE == "Voided" then
		Smite()
		elseif MODE == "Injustice" then
		JusticeBeam()
		elseif MODE == "TomYum" then
		Maniac_Wave()
		end
	end

	if Key == "v" and ATTACK == false then
		if MODE == "Main" then
		WarpMeteor()
		elseif MODE == "Superior" then
		RavagingOverthrower()
		elseif MODE == "Voided" then
		Meteor()
		elseif MODE == "TomYum" then
		Shriek()
		elseif MODE == "Injustice" then
		Thunder()
		end
	end

	if Key == "x" and ATTACK == false then
		if MODE == "Main" then
		PandorasBox()
		elseif MODE == "Superior" then
	    Earthquake()
		elseif MODE == "Voided" then
		Evening_Star()
		elseif MODE == "Injustice" then
		Bullet_Rain()
		elseif MODE == "TomYum" then
		EarthBreak()
		end
	end

	if Key == "t" and ATTACK == false then
		if MODE == "Main" then
		Taunt()
		elseif MODE == "Superior" then
	    SuperiorLaugh()
		elseif MODE == "Injustice" then
		Hat()
		elseif MODE == "Voided" then
		VoidedTaunt()
		elseif MODE == "TomYum" then
	    TomYumTaunt()
	   end
	end
end

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
		RootPart.Anchored = false
	end
	g = Character:GetChildren()
	for i = 1, #g do
		if g[i].ClassName == "Part" and g[i] ~= RootPart then
			g[i].Anchored = false
		end
	end
	g = Weapon:GetChildren()
	for i = 1, #g do
		if g[i].ClassName == "Part" then
			g[i].Anchored = false
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

while true do
	Swait()
	script.Parent = WEAPONGUI
	for _,v in next, Humanoid:GetPlayingAnimationTracks() do
	    v:Stop();
	end
	ANIMATE.Parent = nil
	SINE = SINE + CHANGE*1.5
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	local HITFLOOR = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4*SIZE, Character)
	local WALKSPEEDVALUE = 10 / (Humanoid.WalkSpeed / 16)
	if ANIM == "Walk" and TORSOVELOCITY > 1 then
		if MODE == "Main" then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, -0.15 * COS(SINE / (WALKSPEEDVALUE / 2))) * ANGLES(RAD(0), RAD(0) - RootPart.RotVelocity.Y / 75, RAD(0)), 2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(2.5 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0) - Head.RotVelocity.Y / 30), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5*SIZE, 0.875*SIZE - 0.125 * SIN(SINE / WALKSPEEDVALUE)*SIZE - 0.15 * COS(SINE / WALKSPEEDVALUE*2), 0 +0.5+ 0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0) - RightLeg.RotVelocity.Y / 75, RAD(0), RAD(25+80 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5*SIZE, 0.875*SIZE + 0.125 * SIN(SINE / WALKSPEEDVALUE)*SIZE - 0.15 * COS(SINE / WALKSPEEDVALUE*2), 0 +0.5+ -0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0) + LeftLeg.RotVelocity.Y / 75, RAD(0), RAD(-25+80 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		elseif MODE == "Superior" then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, -0.15 * COS(SINE / (WALKSPEEDVALUE / 2))) * ANGLES(RAD(0), RAD(0) - RootPart.RotVelocity.Y / 75, RAD(0)), 2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(2.5 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0) - Head.RotVelocity.Y / 30), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5*SIZE, 0.875*SIZE - 0.125 * SIN(SINE / WALKSPEEDVALUE)*SIZE - 0.15 * COS(SINE / WALKSPEEDVALUE*2), 0 +0.5+ 0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0) - RightLeg.RotVelocity.Y / 75, RAD(0), RAD(25+80 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5*SIZE, 0.875*SIZE + 0.125 * SIN(SINE / WALKSPEEDVALUE)*SIZE - 0.15 * COS(SINE / WALKSPEEDVALUE*2), 0 +0.5+ -0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0) + LeftLeg.RotVelocity.Y / 75, RAD(0), RAD(-25+80 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
        elseif MODE == "Voided" then
        RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0 * COS(SINE / (WALKSPEEDVALUE / 2)) * SIZE) * ANGLES(RAD(0), RAD(0) - RootPart.RotVelocity.Y / 75, RAD(0)), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
        Neck.C1 = Clerp(Neck.C1, CF(0 * SIZE, -0.5 * SIZE, 0 * SIZE) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(2.5 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0) - Head.RotVelocity.Y / 30), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		elseif MODE == "Injustice" then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, -0.15 * COS(SINE / (WALKSPEEDVALUE / 2))) * ANGLES(RAD(0), RAD(0) - RootPart.RotVelocity.Y / 75, RAD(0)), 2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(2.5 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0) - Head.RotVelocity.Y / 30), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5*SIZE, 0.875*SIZE - 0.125 * SIN(SINE / WALKSPEEDVALUE)*SIZE - 0.15 * COS(SINE / WALKSPEEDVALUE*2), 0 +0.5+ 0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(5) - RightLeg.RotVelocity.Y / 75, RAD(0), RAD(25+80 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5*SIZE, 0.875*SIZE + 0.125 * SIN(SINE / WALKSPEEDVALUE)*SIZE - 0.15 * COS(SINE / WALKSPEEDVALUE*2), 0 +0.5+ -0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(5) + LeftLeg.RotVelocity.Y / 75, RAD(0), RAD(-25+80 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		elseif MODE == "TomYum" then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, -0.15 * COS(SINE / (WALKSPEEDVALUE / 2))) * ANGLES(RAD(0), RAD(0) - RootPart.RotVelocity.Y / 75, RAD(0)), 2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(2.5 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0) - Head.RotVelocity.Y / 30), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5*SIZE, 0.875*SIZE - 0.125 * SIN(SINE / WALKSPEEDVALUE)*SIZE - 0.15 * COS(SINE / WALKSPEEDVALUE*2), 0 +0.5+ 0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(5) - RightLeg.RotVelocity.Y / 75, RAD(0), RAD(25+80 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5*SIZE, 0.875*SIZE + 0.125 * SIN(SINE / WALKSPEEDVALUE)*SIZE - 0.15 * COS(SINE / WALKSPEEDVALUE*2), 0 +0.5+ -0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(5) + LeftLeg.RotVelocity.Y / 75, RAD(0), RAD(-25+80 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		end
	elseif (ANIM ~= "Walk") or (TORSOVELOCITY < 1) then
        if MODE == "Main" then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5*SIZE, 1*SIZE, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5*SIZE, 1*SIZE, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
        elseif MODE == "Superior" then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5*SIZE, 1*SIZE, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5*SIZE, 1*SIZE, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
        elseif MODE == "Voided" then
	    RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
        Neck.C1 = Clerp(Neck.C1, CF(0 * SIZE, -0.5 * SIZE, 0 * SIZE) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
        elseif MODE == "Injustice" then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5*SIZE, 1*SIZE, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5*SIZE, 1*SIZE, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
        elseif MODE == "TomYum" then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5*SIZE, 1*SIZE, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5*SIZE, 1*SIZE, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)

	end
end
	if TORSOVERTICALVELOCITY > 1 and HITFLOOR == nil then
		ANIM = "Jump"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0*SIZE, 0*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0*SIZE, 0*SIZE, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(-20), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0*SIZE) * ANGLES(RAD(-40), RAD(0), RAD(20)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0*SIZE) * ANGLES(RAD(-40), RAD(0), RAD(-20)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, -0.3*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-20)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, -0.3*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(20)), 1 / Animation_Speed)
	    end
	elseif TORSOVERTICALVELOCITY < -1 and HITFLOOR == nil then
		ANIM = "Fall"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0*SIZE, 0*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0*SIZE, 0*SIZE, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(20), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(0), RAD(60)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(0), RAD(-60)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(20)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(10)), 1 / Animation_Speed)
		end
	elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
		ANIM = "Idle"
		if ATTACK == false then
			if MODE == "Main" then
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0.05*SIZE * COS(SINE / 12), 0*SIZE, 0*SIZE + 0.05 * SIN(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(10 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(-25)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.5*SIZE, 0.3*SIZE) * ANGLES(RAD(-45), RAD(0), RAD(-45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.3*SIZE) * ANGLES(RAD(-40), RAD(0), RAD(45)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE + 0.05 * COS(SINE / 12), -1*SIZE - 0.05 * SIN(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 0.15 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE + 0.05 * COS(SINE / 12), -1*SIZE - 0.05 * SIN(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 0.15 / Animation_Speed)
             elseif MODE == "Superior" then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(25 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
            RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 1*SIZE, -0.3*SIZE) * ANGLES(RAD(0.98), RAD(-119.59 + 2.5 * SIN(SINE / 25)), RAD(-175.39 + 2.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
            LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.3*SIZE) * ANGLES(RAD(9.71), RAD(3.14 - -2.5 * SIN(SINE / 12)), RAD(0.2 - -2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			elseif MODE == "Sun" then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(5 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35*SIZE, 0.65*SIZE, 0*SIZE) * ANGLES(RAD(90), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / 12)), RAD(55 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			elseif MODE == "Voided" then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 1 + 0.5 * COS(SINE / 12)) * ANGLES(RAD(-25 - 3 * SIN(SINE / 12)), RAD(0), RAD(-25)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(23 - 3 * SIN(SINE / 12)), RAD(0), RAD(30)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.75*SIZE, 0.5*SIZE, -1*SIZE) * ANGLES(RAD(70), RAD(0), RAD(-70)) * ANGLES(RAD(20), RAD(25), RAD(-15)) * RIGHTSHOULDERC0, 0.4 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE, 0.2*SIZE, -0.5*SIZE) * ANGLES(RAD(25), RAD(0), RAD(85)) * LEFTSHOULDERC0, 0.4 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.5*SIZE - 0.05*SIZE * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -0.8*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
            elseif MODE == "Injustice" then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(25 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.2*SIZE, -0.5*SIZE) * ANGLES(RAD(40), RAD(-20 + 2.5 * SIN(SINE / 12)), RAD(-85 + 2.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.2*SIZE, -0.5*SIZE) * ANGLES(RAD(40), RAD(20 - 2.5 * SIN(SINE / 12)), RAD(85 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-2 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-2 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
            elseif MODE == "TomYum" then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE, 0*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(15)) * ANGLES(RAD(15 + 3 * COS(SINE / 1)), RAD(0 + 3 * COS(SINE / 1)), RAD(0 + 3 * COS(SINE / 1))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 + 11 * COS(SINE / 1)), RAD(-15 + 11 * COS(SINE / 1))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.65*SIZE, 0*SIZE) * ANGLES(RAD(45 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1)), RAD(52 - 11 * COS(SINE / 1))) * ANGLES(RAD(0), RAD(-70), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.65*SIZE, 0*SIZE) * ANGLES(RAD(35 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1)), RAD(-42 + 11 * COS(SINE / 1))) * ANGLES(RAD(0), RAD(70), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1.02*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(20 + 11 * COS(SINE / 1)), RAD(55 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1))) * ANGLES(RAD(-3), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(10 + 11 * COS(SINE / 1)), RAD(-74 + 11 * COS(SINE / 1)), RAD(0 - 11 * COS(SINE / 1))) * ANGLES(RAD(-3), RAD(0), RAD(0)), 1 / Animation_Speed)
			if MRANDOM(1,20) == 1 then
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*2) - 1)) * ANGLES(RAD(MRANDOM(-30,30)), RAD(MRANDOM(-30,30)), RAD(MRANDOM(-30,30))), 1)
			end
         end
      end
	elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
		ANIM = "Walk"
		if ATTACK == false then
			if MODE == "Main" then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE, 0*SIZE, -0.1*SIZE) * ANGLES(RAD(5), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(15 - 1 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0)), 1/ Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.5*SIZE, 0.3*SIZE) * ANGLES(RAD(-45), RAD(0), RAD(-45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.3*SIZE) * ANGLES(RAD(-40), RAD(0), RAD(45)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE , -1*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
			elseif MODE == "Superior" then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE, 0*SIZE, -0.1*SIZE) * ANGLES(RAD(5), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.25*SIZE) - 1)) * ANGLES(RAD(15 - 1 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0)), 1/ Animation_Speed)
            RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 1*SIZE, -0.3*SIZE) * ANGLES(RAD(0.98), RAD(-119.59 + 2.5 * SIN(SINE / 25)), RAD(-175.39 + 2.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / WALKSPEEDVALUE)), RAD(55 - 2.5 * SIN(SINE / WALKSPEEDVALUE))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE , -1*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
			elseif MODE == "Voided" then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 1 + 0.5 * COS(SINE / 12)) * ANGLES(RAD(35), RAD(0), RAD(0)), 0.25 / Animation_Speed)
		    Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(-25), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.6*SIZE, -0.35*SIZE) * ANGLES(RAD(175), RAD(0 + 2.5 * SIN(SINE / WALKSPEEDVALUE)), RAD(-35 + 2.5 * SIN(SINE / WALKSPEEDVALUE))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.5*SIZE, 0.5*SIZE) * ANGLES(RAD(-35), RAD(25 - 2.5 * SIN(SINE / WALKSPEEDVALUE)), RAD(55 - 2.5 * SIN(SINE / WALKSPEEDVALUE))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -0.5*SIZE - 0.05*SIZE * COS(SINE / 12), -0.5*SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -0.8*SIZE - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
            elseif MODE == "Injustice" then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE, 0*SIZE, -0.1*SIZE) * ANGLES(RAD(5), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(15 - 1 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0)), 1/ Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25*SIZE, 0.2*SIZE, -0.5*SIZE) * ANGLES(RAD(45), RAD(-10 + 2.5 * SIN(SINE / 12)), RAD(-75 + 2.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25*SIZE, 0.2*SIZE, -0.4*SIZE) * ANGLES(RAD(50), RAD(10 - 2.5 * SIN(SINE / 12)), RAD(75 - 2.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE , -1*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, 0*SIZE) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
            elseif MODE == "TomYum" then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE, 0*SIZE, -0.1*SIZE) * ANGLES(RAD(15 + 3 * COS(SINE / 1)), RAD(0 + 3 * COS(SINE / 1)), RAD(-8*SIN(SINE/WALKSPEEDVALUE))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*SIZE) - 1)) * ANGLES(RAD(5), RAD(-2*SIN(SINE/WALKSPEEDVALUE)), RAD(8*SIN(SINE/WALKSPEEDVALUE))), 1/ Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE, 0.5*SIZE + 0.15 * COS(SINE/WALKSPEEDVALUE*2), 0.1*SIZE-0.3*SIN(SINE/WALKSPEEDVALUE)) * ANGLES(RAD(35), RAD(0), RAD(22 + 3* SIN(SINE/WALKSPEEDVALUE))) * ANGLES(RAD(0 + 11 * COS(SINE / 1)), RAD(-70 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE, 0.5*SIZE + 0.15 * COS(SINE/WALKSPEEDVALUE*2), 0.1*SIZE+0.3*SIN(SINE/WALKSPEEDVALUE)) * ANGLES(RAD(35), RAD(0), RAD(-22 - 3* SIN(SINE/WALKSPEEDVALUE))) * ANGLES(RAD(0 + 11 * COS(SINE / 1)), RAD(70 + 11 * COS(SINE / 1)), RAD(0 - 11 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE , -1*SIZE, 0*SIZE) * ANGLES(RAD(25), RAD(75), RAD(0)) * ANGLES(RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1)), RAD(-15 + 11 * COS(SINE / 1))), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE, 0*SIZE) * ANGLES(RAD(25), RAD(-75), RAD(0)) * ANGLES(RAD(0 + 11 * COS(SINE / 1)), RAD(0 + 11 * COS(SINE / 1)), RAD(15 - 11 * COS(SINE / 1))), 2 / Animation_Speed)
			if MRANDOM(1,15) == 1 then
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1*2) - 1)) * ANGLES(RAD(MRANDOM(-30,30)), RAD(MRANDOM(-30,30)), RAD(MRANDOM(-30,30))), 1)
			end
			end
       end
	end
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
	for _, c in pairs(Character:GetChildren()) do
		if c.ClassName == "Part" and c.Name ~= "Detail" then
			c.Material = "Fabric"
			if c:FindFirstChildOfClass("ParticleEmitter") then
				c:FindFirstChildOfClass("ParticleEmitter"):remove()
			end
			if c ~= Head then
				c.Color = BodyColor
			else
				c.Color = HeadColor
			end
			if c == Head then
				if c:FindFirstChild("face") then
					c.face:remove()
				end
			end
		elseif c.ClassName == "CharacterMesh" or c.ClassName == "Accessory" or c.Name == "Body Colors" then
			c:remove()
		elseif (c.ClassName == "Shirt" or c.ClassName == "Pants") and c.Name ~= "Cloth" then
			c:remove()
		end
		end
	
	sick.SoundId = "rbxassetid://"..SONG
	sick.Looped = true
	sick.Pitch = PITCH
	sick.Volume = VOLUME
	sick.Parent = Torso
	sick:Resume()
if INTRO == false and INSTANT == false then
        INTRO = true
        coroutine.resume(coroutine.create(function()
            sick:Play()
            sick:Resume()
            Intro()
        end))
    end
    if INSTANT == true then
        if TRANSFORMED == false then
            sick.TimePosition = 20.7
            sick:Play()
            sick:Resume()
        end
        TRANSFORMED = true
    end
    script.Parent = PlayerGui
    Character.Parent = workspace
    Humanoid.Parent = Character
end

	--sick.Playing = false
	Humanoid.Name = "Switcher = "..Player.Name
--//=================================\\
--\\=================================//





--//====================================================\\--
--||			  		 END OF SCRIPT
--\\====================================================//--