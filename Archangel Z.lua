if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end

local Player,game,owner = owner,game

do print("FE Compatibility code V3 by Desered_ROBLOX")local RealPlayer=Player;script.Parent=RealPlayer.Character;local a=function(b)b[1].f[b[2]]=nil end;local c={__index={disconnect=a,Disconnect=a}}local d={__index={Connect=function(b,e)local f=tostring(math.random(0,10000))while b.f[f]do f=tostring(math.random(0,10000))end;b.f[f]=e;return setmetatable({b,f},c)end}}d.__index.connect=d.__index.Connect;local function g()return setmetatable({f={}},d)end;local h={Hit=CFrame.new(),KeyUp=g(),KeyDown=g(),Button1Up=g(),Button1Down=g(),Button2Up=g(),Button2Down=g()}h.keyUp=h.KeyUp;h.keyDown=h.KeyDown;local i={InputBegan=g(),InputEnded=g()}local CAS={Actions={},BindAction=function(self,j,k,l,...)CAS.Actions[j]=k and{Name=j,Function=k,Keys={...}}or nil end}CAS.UnbindAction=CAS.BindAction;local function m(self,n,...)for o,e in pairs(self[n].f)do e(...)end end;h.T=m;i.T=m;local p=Instance.new("RemoteEvent")p.Name="UserInput_Event"p.OnServerEvent:Connect(function(q,r)if q~=RealPlayer then return end;h.Target=r.e;h.Hit=r.d;if not r.f then local s=r.c==Enum.UserInputState.Begin;if r.b==Enum.UserInputType.MouseButton1 then return h:T(s and"Button1Down"or"Button1Up")end;if r.b==Enum.UserInputType.MouseButton2 then return h:T(s and"Button2Down"or"Button2Up")end;for o,t in pairs(CAS.Actions)do for o,u in pairs(t.Keys)do if u==r.a then t.Function(t.Name,r.c,r)end end end;h:T(s and"KeyDown"or"KeyUp",r.a.Name:lower())i:T(s and"InputBegan"or"InputEnded",r,false)end end)p.Parent=NLS([==[local a=script:WaitForChild("UserInput_Event")local b=owner:GetMouse()local c=game:GetService("UserInputService")local d=function(e,f)if f then return end;a:FireServer({a=e.KeyCode,b=e.UserInputType,c=e.UserInputState,d=b.Hit,e=b.Target})end;c.InputBegan:Connect(d)c.InputEnded:Connect(d)local g,h;local i=game:GetService("RunService").Heartbeat;while true do if g~=b.Hit or h~=b.Target then g,h=b.Hit,b.Target;a:FireServer({f=1,Target=h,d=g})end;for j=1,2 do i:Wait()end end]==],script)local v=game;local w={__index=function(self,u)local x=rawget(self,"_RealService")if x then return typeof(x[u])=="function"and function(o,...)return x[u](x,...)end or x[u]end end,__newindex=function(self,u,y)local x=rawget(self,"_RealService")if x then x[u]=y end end}local function z(t,A)t._RealService=typeof(A)=="string"and v:GetService(A)or A;return setmetatable(t,w)end;local B={GetService=function(self,x)return rawget(self,x)or v:GetService(x)end,Players=z({LocalPlayer=z({GetMouse=function(self)return h end},Player)},"Players"),UserInputService=z(i,"UserInputService"),ContextActionService=z(CAS,"ContextActionService"),RunService=z({_btrs={},RenderStepped=v:GetService("RunService").Heartbeat,BindToRenderStep=function(self,j,o,k)self._btrs[j]=self.Heartbeat:Connect(k)end,UnbindFromRenderStep=function(self,j)self._btrs[j]:Disconnect()end},"RunService")}rawset(B.Players,"localPlayer",B.Players.LocalPlayer)B.service=B.GetService;z(B,game)game,owner=B,B.Players.LocalPlayer end

--fixed by allahuahkbar
--made by shackluster

--//                     			\\--
--||            MADE BY SHACKLUSTER        ||--
--||            FIXED BY ALLAHUAHKBAR      ||--
--||            ARCHANGEL    		       ||--
--\\                     			//--

--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
function NS(...)
	local tab = {...}
	local fat = {}
	for i = 1, #tab do
		local v = tab[i]
		table.insert(fat,NumberSequenceKeypoint.new(v[1],v[2]))
	end
	return NumberSequence.new(fat);	
end

cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
ParticleEmitter0 = Instance.new("ParticleEmitter")
ParticleEmitter1 = Instance.new("ParticleEmitter")
ParticleEmitter2 = Instance.new("ParticleEmitter")
ParticleEmitter0.Name = "Flames"
ParticleEmitter0.Parent = mas
ParticleEmitter0.Speed = NumberRange.new(0, 15)
ParticleEmitter0.Rotation = NumberRange.new(0, 360)
ParticleEmitter0.Enabled = false
ParticleEmitter0.LightEmission = 1
ParticleEmitter0.LightInfluence = 1
ParticleEmitter0.Transparency = NumberSequence.new(1,0)
ParticleEmitter0.ZOffset = 1
ParticleEmitter0.Size = NumberSequence.new(10,0)
ParticleEmitter0.EmissionDirection = Enum.NormalId.Back
ParticleEmitter0.Lifetime = NumberRange.new(0, 2)
ParticleEmitter0.Rate = 9999
ParticleEmitter0.RotSpeed = NumberRange.new(-25, 25)
ParticleEmitter0.SpreadAngle = Vector2.new(25, 25)
ParticleEmitter0.VelocitySpread = 25
ParticleEmitter0.Texture = "rbxasset://textures/particles/sparkles_main.dds"
ParticleEmitter1.Name = "Death"
ParticleEmitter1.Parent = mas
ParticleEmitter1.Rotation = NumberRange.new(0, 360)
ParticleEmitter1.Enabled = false
ParticleEmitter1.LightEmission = 0.75
ParticleEmitter1.Texture = "rbxasset://textures/particles/sparkles_main.dds"
ParticleEmitter1.Transparency = NS({0,0.47540986537933},{.168,0.37704920768738},{.457,0.25683063268661},{.803,0.4426229596138},{.948,0.62841534614563},{1,1})
ParticleEmitter1.ZOffset = 0.5
ParticleEmitter1.Size = NS({0,1},{.656,1.8032789230347},{.843,1.4207655191422},{1,0})
ParticleEmitter1.Acceleration = Vector3.new(0, 35, 0)
ParticleEmitter1.Drag = 5
ParticleEmitter1.EmissionDirection = Enum.NormalId.Right
ParticleEmitter1.Lifetime = NumberRange.new(0, 1)
ParticleEmitter1.Rate = 999
ParticleEmitter1.RotSpeed = NumberRange.new(-56, 56)
ParticleEmitter1.SpreadAngle = Vector2.new(360, 360)
ParticleEmitter1.VelocitySpread = 360
ParticleEmitter2.Name = "Wing"
ParticleEmitter2.Parent = mas
ParticleEmitter2.Rotation = NumberRange.new(0, 360)
ParticleEmitter2.Enabled = false
ParticleEmitter2.LightEmission = 1
ParticleEmitter2.Texture = "rbxasset://textures/particles/explosion01_implosion_main.dds"
ParticleEmitter2.Size = NS({0,0.05464494228363},{.193,1.0382515192032},{.352,1.3661205768585},{1,0})
ParticleEmitter2.Acceleration = Vector3.new(0, -7, 15)
ParticleEmitter2.Lifetime = NumberRange.new(0.80000001192093, 0.80000001192093)
ParticleEmitter2.LockedToPart = true
ParticleEmitter2.Rate = 300

for i,v in pairs(mas:GetChildren()) do
	v.Parent = script
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end


New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end




wait(0.2)
Player = game:GetService("Players").LocalPlayer
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
for _, v in next, Humanoid:GetPlayingAnimationTracks() do
	v:Stop()
end
Mouse = Player:GetMouse()
RootPart = Character.HumanoidRootPart
Torso = Character.Torso
Head = Character.Head
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart.RootJoint
Neck = Torso.Neck
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
local sick = Instance.new("Sound", Character)
wait(1)
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
Animation_Speed = 3
Frame_Speed = 0.016666666666666666
local Speed = 70
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
local WEAPONGUI = IT("ScreenGui", PlayerGui)
WEAPONGUI.Name = "Weapon GUI"
local Effects = IT("Folder", Character)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character.Animate
local UNANCHOR = true
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
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id=" .. MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id=" .. TEXTUREID
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
local weldBetween = function(a, b)
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
		if m00 < m11 then
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
			local recip = 0.5 / s
			return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
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
	local startInterp, finishInterp
	if cosTheta >= 1.0E-4 then
		if 1 - cosTheta > 1.0E-4 then
			local theta = ACOS(cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((1 - t) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	elseif 1 + cosTheta > 1.0E-4 then
		local theta = ACOS(-cosTheta)
		local invSinTheta = 1 / SIN(theta)
		startInterp = SIN((t - 1) * theta) * invSinTheta
		finishInterp = SIN(t * theta) * invSinTheta
	else
		startInterp = t - 1
		finishInterp = t
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end
function Clerp(a, b, t)
	local qa = {
		QuaternionFromCFrame(a)
	}
	local qb = {
		QuaternionFromCFrame(b)
	}
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
	local NEWSOUND
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.EmitterSize = VOLUME * 3
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id=" .. ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat
				wait(1)
			until NEWSOUND.Playing == false
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end
function CFrameFromTopBack(at, top, back)
	local right = top:Cross(back)
	return CF(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end
function WACKYEFFECT(Table)
	local TYPE = Table.EffectType or "Sphere"
	local SIZE = Table.Size or VT(1, 1, 1)
	local ENDSIZE = Table.Size2 or VT(0, 0, 0)
	local TRANSPARENCY = Table.Transparency or 0
	local ENDTRANSPARENCY = Table.Transparency2 or 1
	local CFRAME = Table.CFrame or Torso.CFrame
	local MOVEDIRECTION = Table.MoveToPos or nil
	local ROTATION1 = Table.RotationX or 0
	local ROTATION2 = Table.RotationY or 0
	local ROTATION3 = Table.RotationZ or 0
	local MATERIAL = Table.Material or "Neon"
	local COLOR = Table.Color or C3(1, 1, 1)
	local TIME = Table.Time or 45
	local SOUNDID = Table.SoundID or nil
	local SOUNDPITCH = Table.SoundPitch or nil
	local SOUNDVOLUME = Table.SoundVolume or nil
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1, 1, 1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0, 0, 0))
		elseif TYPE == "Block" then
			MSH = IT("BlockMesh", EFFECT)
			MSH.Scale = VT(SIZE.X, SIZE.X, SIZE.X)
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0, 0, -SIZE.X / 8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X, SIZE.X, 0.1), VT(0, 0, 0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X / 10, 0, SIZE.X / 10), VT(0, 0, 0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X / 10, 0, SIZE.X / 10), VT(0, 0, 0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "1051557", "", SIZE, VT(0, 0, 0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0, 0, 0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0, 0, 0))
		end
		if MSH ~= nil then
			local MOVESPEED
			if MOVEDIRECTION ~= nil then
				MOVESPEED = (CFRAME.p - MOVEDIRECTION).Magnitude / TIME
			end
			local GROWTH = SIZE - ENDSIZE
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME * ANGLES(RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)))
			else
				EFFECT.CFrame = CFRAME
			end
			for LOOP = 1, TIME + 1 do
				Swait()
				MSH.Scale = MSH.Scale - GROWTH / TIME
				if TYPE == "Wave" then
					MSH.Offset = VT(0, 0, -MSH.Scale.X / 8)
				end
				EFFECT.Transparency = EFFECT.Transparency - TRANS / TIME
				if TYPE == "Block" then
					EFFECT.CFrame = CFRAME * ANGLES(RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)))
				else
					EFFECT.CFrame = EFFECT.CFrame * ANGLES(RAD(ROTATION1), RAD(ROTATION2), RAD(ROTATION3))
				end
				if MOVEDIRECTION ~= nil then
					local ORI = EFFECT.Orientation
					EFFECT.CFrame = CF(EFFECT.Position, MOVEDIRECTION) * CF(0, 0, -MOVESPEED)
					EFFECT.Orientation = ORI
				end
			end
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat
					Swait()
				until SOUND.Playing == false
				EFFECT:remove()
			end
		elseif PLAYSSOUND == false then
			EFFECT:remove()
		else
			repeat
				Swait()
			until SOUND.Playing == false
			EFFECT:remove()
		end
	end))
end
function MakeForm(PART, TYPE)
	if TYPE == "Cyl" then
		local MSH = IT("CylinderMesh", PART)
	elseif TYPE == "Ball" then
		local MSH = IT("SpecialMesh", PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = IT("SpecialMesh", PART)
		MSH.MeshType = "Wedge"
	end
end
Debris = game:GetService("Debris")
function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos, EndPos).lookVector
	return Raycast(StartPos, DIRECTION, Distance, Ignore)
end
function turnto(position)
	RootPart.CFrame = CFrame.new(RootPart.CFrame.p, VT(position.X, RootPart.Position.Y, position.Z)) * CFrame.new(0, 0, 0)
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

local SKILLTEXTCOLOR = C3(0, 0, 0)
local SKILLFONT = "SciFi"
local SKILLTEXTSIZE = 7
local WING = Instance.new("Attachment")
local WING1 = WING:Clone()
local WING2 = WING:Clone()
WING1.Parent = Torso
WING2.Parent = Torso
WING1.Position = VT(-1, 0.6, 1)
WING2.Position = VT(1, 0.6, 1)
WING1.Orientation = VT(0, 0, 0)
WING2.Orientation = VT(0, 0, 0)
local WINGS = {}
for i = 1, 5 do
	local PARTICLES = script.Wing:Clone()
	PARTICLES.Parent = WING1
	PARTICLES.Enabled = true
	PARTICLES.Acceleration = VT(-i * 10, -5 - i * 1.5, 15)
	table.insert(WINGS, {
		PARTICLES,
		VT(-i * 30, 0, 25)
	})
end
for i = 1, 5 do
	local PARTICLES = script.Wing:Clone()
	PARTICLES.Parent = WING2
	PARTICLES.Enabled = true
	PARTICLES.Acceleration = VT(i * 10, -5 - i * 1.5, 15)
	table.insert(WINGS, {
		PARTICLES,
		VT(i * 30, 0, 25)
	})
end

Base = New("Part",Head,"Base",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.SmoothPlastic,Transparency = 1,Transparency = 1,Size = Vector3.new(2, 1, 1),CFrame = CFrame.new(4.56395578, 30.9732971, 96.5572357, -1, 0, -3.7252903e-09, 0, 1, 0, -3.7252903e-09, 0, -1.00000012),CanCollide = false,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0,0,0),})
Mesh = New("SpecialMesh",Base,"Mesh",{Scale = Vector3.new(1,1,1),})
Hood = New("Part",Head,"Hood",{Size = Vector3.new(2.04900002, 2.18899989, 1.97500002),CFrame = CFrame.new(4.59299994, 31.1469994, 96.4520035, -0.99907124, -0.00109502568, 0.043075189, -0.00244226633, 0.999509037, -0.0312363114, -0.0430198386, -0.0313125029, -0.998583436),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,})
Mesh = New("SpecialMesh",Hood,"Mesh",{MeshId = "rbxassetid://93129244",TextureId = "rbxassetid://94020325",MeshType = Enum.MeshType.FileMesh,})
mot = New("Motor",Hood,"mot",{Part0 = Hood,Part1 = Base,C0 = CFrame.new(0, 0, 0, -0.99907124, -0.00244226633, -0.0430198386, -0.00109502568, 0.999509037, -0.0313125029, 0.043075189, -0.0312363114, -0.998583436),C1 = CFrame.new(-0.0290441513, 0.17370224, 0.105232239, -1, 0, 0, 0, 1, 0, 0, 0, -1),})

CreateWeldOrSnapOrMotor('Weld', Head, Head, Base, CF(), CF())

Head.Color = C3(0,0,0)

local DParticles = script.Death
DParticles:remove()
DParticles.Name = "ArchangelDeathParticles"
local BODY = {}
for _, c in pairs(Character:GetDescendants()) do
	if c:IsA("BasePart") and c.Name ~= "Handle" then
		if c ~= RootPart and c ~= Torso and c ~= Head and c ~= RightArm and c ~= LeftArm and c ~= RightLeg and c ~= LeftLeg then
			c.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
		end
		table.insert(BODY, {
			c,
			c.Parent,
			c.Material,
			c.Color,
			c.Transparency
		})
	elseif c:IsA("JointInstance") then
		table.insert(BODY, {
			c,
			c.Parent,
			nil,
			nil,
			nil
		})
	end
end
for e = 1, #BODY do
	if BODY[e] ~= nil then
		do
			local STUFF = BODY[e]
			local PART = STUFF[1]
			local PARENT = STUFF[2]
			local MATERIAL = STUFF[3]
			local COLOR = STUFF[4]
			local TRANSPARENCY = STUFF[5]
			if PART.ClassName == "Part" and PART ~= RootPart then
				PART.Material = MATERIAL
				PART.Color = COLOR
				PART.Transparency = TRANSPARENCY
			end
			PART.AncestryChanged:Connect(function()
				PART.Parent = PARENT
			end)
		end
	end
end
function refit()
	Character.Parent = workspace
	for e = 1, #BODY do
		if BODY[e] ~= nil then
			local STUFF = BODY[e]
			local PART = STUFF[1]
			local PARENT = STUFF[2]
			local MATERIAL = STUFF[3]
			local COLOR = STUFF[4]
			local TRANSPARENCY = STUFF[5]
			if PART:IsA("BasePart") and PART ~= RootPart then
				PART.Material = MATERIAL
				PART.Color = COLOR
				PART.Transparency = TRANSPARENCY
			end
			if PART.Parent ~= PARENT then
				Humanoid:remove()
				PART.Parent = PARENT
				Humanoid = IT("Humanoid", Character)
			end
		end
	end
end
Humanoid.Died:connect(function()
	refit()
end)


local SKILLTEXTCOLOR = C3(1, 1, 1)
local SKILLFONT = "Fantasy"
local SKILLTEXTSIZE = 3
local ATTACKS = {
	"Z - Holy Smite",
	"B - Divine Ravage",
	"C - Divine Earthquake",
	"V - Beam of Light",
	"X - Divine Nova"
}
for i = 1, #ATTACKS do
	local SKILLFRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.74, 0, 0.97 - 0.02 * i, 0), UD2(0.26, 0, 0.07, 0), C3(0, 0, 0), C3(0, 0, 0), "Skill Frame")
	local SKILLTEXT = CreateLabel(SKILLFRAME, "[" .. ATTACKS[i] .. "]", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0, "Skill text")
	SKILLTEXT.TextXAlignment = "Right"
end

function ApplyAoE(POSITION, RANGE)
	local PARTS = {}
	for index, CHILD in pairs(workspace:GetPartBoundsInRadius(POSITION, RANGE)) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO and HUM.Health > 0 then
					CHILD:BreakJoints()
					for index, PART in pairs(CHILD:GetChildren()) do
						if PART:IsA("BasePart") and PART.Name ~= "HumanoidRootPart" then
							local P = DParticles:Clone()
							P.Parent = PART
							P.Enabled = true
							P.Color = ColorSequence.new(PART.Color, C3(1, 1, 1))
							PART.Anchored = true
							table.insert(PARTS, {PART, P})
						end
					end
				end
			end
		elseif CHILD:IsA("BasePart") and CHILD.Parent.Parent ~= Character and CHILD.Parent:FindFirstChildOfClass("Humanoid") == nil and CHILD:FindFirstChild("ewdfrfgrwefd") == nil and CHILD.Size.Magnitude < RANGE * 2 and CHILD.Size.Magnitude < 200 and RANGE > (CHILD.Position - POSITION).Magnitude then
			local FOLDER = IT("Folder", CHILD)
			FOLDER.Name = "ewdfrfgrwefd"
			local P = DParticles:Clone()
			P.Parent = CHILD
			P.Enabled = true
			CHILD:BreakJoints()
			CHILD.CanCollide = false
			CHILD.Anchored = true
			P.Rate = math.ceil(CHILD.Size.Magnitude / 2)
			P.Color = ColorSequence.new(CHILD.Color, C3(1, 1, 1))
			table.insert(PARTS, {CHILD, P})
		end
	end
	coroutine.resume(coroutine.create(function()
		if #PARTS > 0 then
			for i = 1, 85 do
				Swait()
				for E = 1, #PARTS do
					local F = PARTS[E]
					local A = F[1]
					local B = F[2]
					A.Transparency = A.Transparency + 0.011764705882352941
					B.Rate = math.ceil(B.Rate * 1.2)
					for index, E in pairs(A:GetChildren()) do
						if E:IsA("Decal") or E:IsA("Texture") then
							E.Transparency = E.Transparency + 0.011764705882352941
						elseif E:IsA("JointInstance") then
							E:remove()
						elseif E:IsA("Light") or E:IsA("ParticleEmitter") and E ~= B and E.Name ~= "ArchangelDeathParticles" or E:IsA("Fire") or E:IsA("Sparkles") or E:IsA("Smoke") then
							E.Enabled = false
						end
					end
				end
			end
			for E = 1, #PARTS do
				local F = PARTS[E]
				local A = F[1]
				local B = F[2]
				B.Enabled = false
				Debris:AddItem(A, 3)
			end
		end
	end))
end
function Smite()
	local RING, MESH, DELET = MakeRing()
	local POS = Mouse.Hit.p
	RING.CFrame = CF(Mouse.Hit.p + VT(MRANDOM(-25, 25), 200, MRANDOM(-25, 25)), Mouse.Hit.p) * ANGLES(RAD(90), RAD(0), RAD(0))
	for i = 1, 45 do
		Swait()
		MESH.Scale = MESH.Scale + VT(12, 0, 12)
		RING.CFrame = RING.CFrame * ANGLES(RAD(0), RAD(5), RAD(0))
	end
	local HITFLOOR, HITPOS = Raycast(RING.Position, CF(RING.Position, RING.CFrame * CF(0, -1, 0).p).lookVector, 500, Character)
	if HITFLOOR then
		local BEAM = CreatePart(3, Effects, "Neon", 0, 0, BRICKC("Pearl"), "Beam", VT(0, 0, 0), true)
		MakeForm(BEAM, "Cyl")
		local DIST = (RING.Position - HITPOS).Magnitude
		BEAM.Size = VT(0, DIST, 0)
		BEAM.CFrame = CF(RING.Position, HITPOS) * CF(0, 0, -DIST / 2) * ANGLES(RAD(90), RAD(0), RAD(0))
		for i = 1, 5 do
			WACKYEFFECT({
				EffectType = "Wave",
				Size = VT(25, 0, 25),
				Size2 = VT(40, 0, 40) + VT(i * 6, i / 5, i * 6),
				Transparency = 0,
				Transparency2 = 1,
				CFrame = CF(HITPOS) * ANGLES(RAD(0), RAD(72 * i), RAD(0)),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 3,
				RotationZ = 0,
				Material = "Neon",
				Color = C3(1, 1, 1),
				SoundID = nil,
				SoundPitch = nil,
				SoundVolume = nil
			})
			WACKYEFFECT({
				EffectType = "Round Slash",
				Size = VT(3, 0, 3) / 13,
				Size2 = (VT(3, 0, 3) + VT(i, 0, i)) / 5,
				Transparency = 0,
				Transparency2 = 1,
				CFrame = CF(HITPOS) * ANGLES(RAD(0), RAD(MRANDOM(0, 360)), RAD(0)) * ANGLES(RAD(MRANDOM(-35, 35)), RAD(0), RAD(MRANDOM(-35, 35))),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = C3(1, 1, 1),
				SoundID = nil,
				SoundPitch = nil,
				SoundVolume = nil
			})
			WACKYEFFECT({
				Time = 35,
				EffectType = "Sphere",
				Size = VT(22, 22, 22),
				Size2 = VT(45, 45, 45) + VT(i * 5, i * 5, i * 5),
				Transparency = 0,
				Transparency2 = 1,
				CFrame = CF(HITPOS),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = C3(1, 1, 1),
				SoundID = 459523898,
				SoundPitch = MRANDOM(9, 12) / 10,
				SoundVolume = 10
			})
		end
		SHAKECAM(HITPOS, 100, 8, 15)
		ApplyAoE(HITPOS, 50)
		for i = 1, 25 do
			Swait()
			BEAM.Size = BEAM.Size + VT(0.5, 0, 0.5)
			BEAM.Transparency = BEAM.Transparency + 0.04
		end
		BEAM:remove()
	end
	wait(0.2)
	DELET()
end
function Ravage()
	ATTACK = true
	Rooted = false
	local RING, MESH, DELET = MakeRing()
	RING.Anchored = false
	RING.CFrame = RightArm.CFrame * CF(0, -1.3, 0)
	local WELD = weldBetween(RightArm, RING)
	local GYRO = IT("BodyGyro", RootPart)
	GYRO.D = 20
	GYRO.P = 4000
	GYRO.MaxTorque = VT(0, 40000, 0)
	coroutine.resume(coroutine.create(function()
		repeat
			GYRO.CFrame = CF(RootPart.Position, Mouse.Hit.p)
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.45 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(90)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0 + 4.5 * SIN(SINE / 12)), RAD(0), RAD(-90)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(0 - 7.5 * SIN(SINE / 12)), RAD(0 + 7.5 * SIN(SINE / 12)), RAD(-12 - 7.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.15 * COS(SINE / 12), -0.01) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.5 + 0.25 * COS(SINE / 12), -0.5) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		until ATTACK == false
		GYRO:remove()
	end))
	CreateSound(459523787, RING, 8, 1, false)
	for i = 1, 45 do
		Swait()
		MESH.Scale = MESH.Scale + VT(13, 0, 13)
		WELD.C0 = WELD.C0 * ANGLES(RAD(0), RAD(5), RAD(0))
	end
	wait(0.3)
	repeat
		for i = 1, 25 do
			Swait()
			WACKYEFFECT({
				Time = 15,
				EffectType = "Sphere",
				Size = VT(4, 4, 4),
				Size2 = VT(0, 0, 0),
				Transparency = 1,
				Transparency2 = 0,
				CFrame = CF(RING.Position) * ANGLES(RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360))) * CF(0, 0, 35),
				MoveToPos = RING.Position,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = C3(1, 1, 1),
				SoundID = nil,
				SoundPitch = nil,
				SoundVolume = nil
			})
		end
		WACKYEFFECT({
			Time = 35,
			EffectType = "Sphere",
			Size = VT(25, 2, 25),
			Size2 = VT(35, 5, 35),
			Transparency = 0,
			Transparency2 = 1,
			CFrame = RING.CFrame,
			MoveToPos = nil,
			RotationX = 0,
			RotationY = 0,
			RotationZ = 0,
			Material = "Neon",
			Color = C3(1, 1, 1),
			SoundID = 459523898,
			SoundPitch = MRANDOM(9, 12) / 10,
			SoundVolume = 10
		})
		coroutine.resume(coroutine.create(function()
			local PROJECTILE = CreatePart(3, Effects, "Neon", 0, 0, BRICKC("Pearl"), "Beam", VT(12, 12, 12), true)
			MakeForm(PROJECTILE, "Ball")
			PROJECTILE.CFrame = RootPart.CFrame * CF(0, 0, -10)
			local FIRE = script.Flames:Clone()
			FIRE.Parent = PROJECTILE
			FIRE.Enabled = true
			local SPEED = -0.2
			for i = 1, 1000 do
				Swait()
				SPEED = SPEED - 0.01
				local HIT = Raycast(PROJECTILE.Position, PROJECTILE.CFrame.lookVector, 6 + SPEED / 5, Character)
				if HIT then
					do
						local POS = PROJECTILE.Position
						ApplyAoE(POS, 100)
						SHAKECAM(POS, 150, 12, 15)
						coroutine.resume(coroutine.create(function()
							for i = 1, 5 do
								Swait()
								WACKYEFFECT({
									Time = 85,
									EffectType = "Wave",
									Size = VT(25, 0, 25),
									Size2 = VT(40, 0, 40) + VT(i * 6, i / 5, i * 6) * 15,
									Transparency = 0,
									Transparency2 = 1,
									CFrame = CF(POS) * ANGLES(RAD(0), RAD(72 * i), RAD(0)) * ANGLES(RAD(MRANDOM(-35, 35)), RAD(0), RAD(MRANDOM(-35, 35))),
									MoveToPos = nil,
									RotationX = 0,
									RotationY = 3,
									RotationZ = 0,
									Material = "Neon",
									Color = C3(1, 1, 1),
									SoundID = nil,
									SoundPitch = nil,
									SoundVolume = nil
								})
								WACKYEFFECT({
									Time = 85,
									EffectType = "Round Slash",
									Size = VT(3, 0, 3) / 13,
									Size2 = (VT(3, 0, 3) + VT(i, 0, i)) * 2,
									Transparency = 0,
									Transparency2 = 1,
									CFrame = CF(POS) * ANGLES(RAD(0), RAD(MRANDOM(0, 360)), RAD(0)) * ANGLES(RAD(MRANDOM(-35, 35)), RAD(0), RAD(MRANDOM(-35, 35))),
									MoveToPos = nil,
									RotationX = 0,
									RotationY = 0,
									RotationZ = 0,
									Material = "Neon",
									Color = C3(1, 1, 1),
									SoundID = nil,
									SoundPitch = nil,
									SoundVolume = nil
								})
								WACKYEFFECT({
									Time = 75,
									EffectType = "Sphere",
									Size = VT(22, 22, 22),
									Size2 = VT(45, 45, 45) + VT(i * 5, i * 5, i * 5) * 7,
									Transparency = 0,
									Transparency2 = 1,
									CFrame = CF(POS),
									MoveToPos = nil,
									RotationX = 0,
									RotationY = 0,
									RotationZ = 0,
									Material = "Neon",
									Color = C3(1, 1, 1),
									SoundID = 533636431,
									SoundPitch = MRANDOM(9, 12) / 10,
									SoundVolume = 10
								})
							end
						end))
						break
					end
				else
					PROJECTILE.CFrame = PROJECTILE.CFrame * CF(0, 0, SPEED)
					for index, CHILD in pairs(workspace:GetPartBoundsInRadius(PROJECTILE.Position, 150)) do
						if CHILD.ClassName == "Model" and CHILD ~= Character then
							local HUM = CHILD:FindFirstChildOfClass("Humanoid")
							if HUM then
								local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
								if TORSO and 0 < HUM.Health then
									PROJECTILE.CFrame = Clerp(PROJECTILE.CFrame, CF(PROJECTILE.Position, TORSO.Position), 0.08)
								end
							end
						end
					end
				end
			end
			FIRE.Enabled = false
			PROJECTILE.Transparency = 1
			Debris:AddItem(PROJECTILE, 5)
		end))
	until KEYHOLD == false
	wait(0.1)
	RING.Anchored = true
	WELD:remove()
	DELET()
	ATTACK = false
	Rooted = false
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
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.45 * COS(SINE / 12)) * ANGLES(RAD(7 + 2.5 * SIN(SINE / 12)), RAD(0), RAD(-45)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(15 + 4.5 * SIN(SINE / 12)), RAD(0), RAD(45)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(-25 - 7.5 * SIN(SINE / 12)), RAD(0 - 7.5 * SIN(SINE / 12)), RAD(12 + 7.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(0 - 7.5 * SIN(SINE / 12)), RAD(0 + 7.5 * SIN(SINE / 12)), RAD(-12 - 7.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.15 * COS(SINE / 12), -0.01) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.5 + 0.25 * COS(SINE / 12), -0.5) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
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
							ApplyAoE(RING.Position, 65)
							SHAKECAM(RING.Position, 80, 12, 15)
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
								Color = C3(1, 1, 1),
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
									Color = C3(1, 1, 1),
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
									Color = C3(1, 1, 1),
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
	for i = 0, 0.2, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.45 * COS(SINE / 12)) * ANGLES(RAD(7 + 2.5 * SIN(SINE / 12)), RAD(0), RAD(75)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0 + 4.5 * SIN(SINE / 12)), RAD(0), RAD(-75)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25, 0.5 + 0.25 * COS(SINE / 12), -0.5) * ANGLES(RAD(145 - 7.5 * SIN(SINE / 12)), RAD(-35 - 7.5 * SIN(SINE / 12)), RAD(12 + 7.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(0 - 7.5 * SIN(SINE / 12)), RAD(0 + 7.5 * SIN(SINE / 12)), RAD(-12 - 7.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.15 * COS(SINE / 12), -0.01) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.5 + 0.25 * COS(SINE / 12), -0.5) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	DELET()
	GYRO:remove()
	ATTACK = false
	Rooted = false
end
function Beam()
	ATTACK = true
	Rooted = false
	local GYRO = IT("BodyGyro", RootPart)
	GYRO.D = 20
	GYRO.P = 4000
	GYRO.MaxTorque = VT(0, 40000, 0)
	local RING, MESH, DELET = MakeRing()
	local POS = RootPart.Position + VT(0, 25, 0)
	RING.CFrame = CF(POS, Mouse.Hit.p) * ANGLES(RAD(90), RAD(0), RAD(0))
	CreateSound(459523787, RING, 8, 1, false)
	local BLASTS = {468991944, 468991990}
	coroutine.resume(coroutine.create(function()
		local E = 0
		repeat
			E = E + 5
			GYRO.CFrame = CF(RootPart.Position, Mouse.Hit.p)
			Swait()
			RING.CFrame = CF(POS, Mouse.Hit.p) * ANGLES(RAD(90), RAD(E), RAD(0))
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.45 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(90)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0 + 4.5 * SIN(SINE / 12)), RAD(0), RAD(-90)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(0 - 7.5 * SIN(SINE / 12)), RAD(0 + 7.5 * SIN(SINE / 12)), RAD(-12 - 7.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.15 * COS(SINE / 12), -0.01) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.5 + 0.25 * COS(SINE / 12), -0.5) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		until ATTACK == false
		GYRO:remove()
		DELET()
	end))
	for i = 1, 50 do
		Swait()
		MESH.Scale = MESH.Scale + VT(22, 0, 22)
	end
	for i = 1, 25 do
		Swait()
		WACKYEFFECT({
			Time = 15,
			EffectType = "Sphere",
			Size = VT(4, 4, 4),
			Size2 = VT(0, 0, 0),
			Transparency = 1,
			Transparency2 = 0,
			CFrame = CF(RING.Position) * ANGLES(RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360))) * CF(0, 0, 35),
			MoveToPos = RING.Position,
			RotationX = 0,
			RotationY = 0,
			RotationZ = 0,
			Material = "Neon",
			Color = C3(1, 1, 1),
			SoundID = nil,
			SoundPitch = nil,
			SoundVolume = nil
		})
	end
	local LOOP = 0
	local BEAM = CreatePart(3, Effects, "Neon", 0, 0, BRICKC("Pearl"), "Beam", VT(0, 0, 0), true)
	MakeForm(BEAM, "Cyl")
	CreateSound(BLASTS[MRANDOM(1, #BLASTS)], RING, 5, MRANDOM(9, 11) / 10, false)
	repeat
		local DISTANCE = (RING.Position - Mouse.Hit.p).Magnitude
		if DISTANCE < 2000 then
			BEAM.Size = VT(10 + 2 * COS(SINE / 4), DISTANCE, 10 + 2 * COS(SINE / 4))
			BEAM.CFrame = CF(RING.Position, Mouse.Hit.p) * CF(0, 0, -DISTANCE / 2) * ANGLES(RAD(90), RAD(0), RAD(0))
			ApplyAoE(Mouse.Hit.p, 35)
			WACKYEFFECT({
				Time = 35,
				EffectType = "Sphere",
				Size = VT(10 + 2 * COS(SINE / 4), 10 + 2 * COS(SINE / 4), 10 + 2 * COS(SINE / 4)) * 2,
				Size2 = VT(5, 75, 5),
				Transparency = 0,
				Transparency2 = 1,
				CFrame = CF(Mouse.Hit.p) * ANGLES(RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360))),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = C3(1, 1, 1),
				SoundID = nil,
				SoundPitch = MRANDOM(9, 12) / 10,
				SoundVolume = 10
			})
			Swait()
			LOOP = LOOP + 1
		end
	until KEYHOLD == false and LOOP >= 35 or DISTANCE >= 2000
	coroutine.resume(coroutine.create(function()
		for i = 1, 15 do
			Swait()
			BEAM.Size = BEAM.Size - VT(0.2, 0, 0.2)
			BEAM.Transparency = BEAM.Transparency + 0.06666666666666667
		end
		BEAM:remove()
	end))
	ATTACK = false
	Rooted = false
end
function Nuke()
	ATTACK = true
	Rooted = true
	local CHARGE = false
	local BLASTS = {468991944, 468991990}
	coroutine.resume(coroutine.create(function()
		repeat
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.45 * COS(SINE / 12)) * ANGLES(RAD(-15 + 2.5 * SIN(SINE / 12)), RAD(0), RAD(5 + 1 * SIN(SINE / 12))), 0.1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(-35 + 4.5 * SIN(SINE / 12)), RAD(0), RAD(-5 - 2.5 * SIN(SINE / 12))), 0.1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.15, 0.5 + 0.25 * COS(SINE / 12), -0.5) * ANGLES(RAD(140 - 7.5 * SIN(SINE / 12)), RAD(-7.5 * SIN(SINE / 12)), RAD(-45 + 7.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 0.1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.15, 0.5 + 0.25 * COS(SINE / 12), -0.5) * ANGLES(RAD(140 - 7.5 * SIN(SINE / 12)), RAD(7.5 * SIN(SINE / 12)), RAD(45 - 7.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 0.1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.15 * COS(SINE / 12), -0.01) * ANGLES(RAD(25 - 7.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.5 + 0.25 * COS(SINE / 12), -0.5) * ANGLES(RAD(25 - 7.5 * SIN(SINE / 12)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.1 / Animation_Speed)
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
				Color = C3(1, 1, 1),
				SoundID = nil,
				SoundPitch = nil,
				SoundVolume = nil
			})
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.45 * COS(SINE / 12)) * ANGLES(RAD(-25 + 2.5 * SIN(SINE / 12)), RAD(0), RAD(5 + 1 * SIN(SINE / 12))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0 + 4.5 * SIN(SINE / 12)), RAD(0), RAD(-5 - 2.5 * SIN(SINE / 12))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.15, 0.5 + 0.25 * COS(SINE / 12), -0.5) * ANGLES(RAD(160 - 7.5 * SIN(SINE / 12)), RAD(-7.5 * SIN(SINE / 12)), RAD(-50 + 7.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.15, 0.5 + 0.25 * COS(SINE / 12), -0.5) * ANGLES(RAD(160 - 7.5 * SIN(SINE / 12)), RAD(7.5 * SIN(SINE / 12)), RAD(50 - 7.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.15 * COS(SINE / 12), -0.01) * ANGLES(RAD(35 - 7.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.5 + 0.25 * COS(SINE / 12), -0.5) * ANGLES(RAD(35 - 7.5 * SIN(SINE / 12)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
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
					Color = C3(1, 1, 1),
					SoundID = nil,
					SoundPitch = nil,
					SoundVolume = nil
				})
			end
			wait(1)
			SHAKECAM(POS, 9999999999, 25, 25)
			ApplyAoE(POS, 450)
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
				Color = C3(1, 1, 1),
				SoundID = nil,
				SoundPitch = 1,
				SoundVolume = 10
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
					Color = C3(1, 1, 1),
					SoundID = nil,
					SoundPitch = 1,
					SoundVolume = 10
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
					Color = C3(1, 1, 1),
					SoundID = nil,
					SoundPitch = nil,
					SoundVolume = nil
				})
			end
			local HITFLOOR, HITPOS = Raycast(POS, CF(RootPart.Position, RootPart.Position + VT(0, -1, 0)).lookVector, 150, Character)
			for i = 1, 5 do
				CreateSound(438666077, Effects, 15, 1 - i / 15, false)
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
					Color = C3(1, 1, 1),
					SoundID = nil,
					SoundPitch = nil,
					SoundVolume = nil
				})
			end
		end))
		for i = 0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.45 * COS(SINE / 12)) * ANGLES(RAD(7 + 2.5 * SIN(SINE / 12)), RAD(0), RAD(5 + 1 * SIN(SINE / 12))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(25 + 4.5 * SIN(SINE / 12)), RAD(0), RAD(-5 - 2.5 * SIN(SINE / 12))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(45 - 7.5 * SIN(SINE / 12)), RAD(45 - 7.5 * SIN(SINE / 12)), RAD(12 + 7.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(45 - 7.5 * SIN(SINE / 12)), RAD(-45 + 7.5 * SIN(SINE / 12)), RAD(-12 - 7.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.15 * COS(SINE / 12), -0.01) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.5 + 0.25 * COS(SINE / 12), -0.5) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		ATTACK = false
		Rooted = false
	end))
	for i = 1, 30 do
		wait(0.01)
		local POS = CF(RootPart.Position) * ANGLES(RAD(0), RAD(MRANDOM(0, 360)), RAD(0)) * CF(0, 0, MRANDOM(10, 150))
		local HITFLOOR, HITPOS = Raycast(POS.p, CF(RootPart.Position, RootPart.Position + VT(0, -1, 0)).lookVector, 150, Character)
		if HITFLOOR then
			ApplyAoE(HITPOS, 65)
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
				Color = C3(1, 1, 1),
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
					CFrame = CF(HITPOS) * ANGLES(RAD(0), RAD(72 * i), RAD(0)),
					MoveToPos = nil,
					RotationX = 0,
					RotationY = 3,
					RotationZ = 0,
					Material = "Neon",
					Color = C3(1, 1, 1),
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
					Color = C3(1, 1, 1),
					SoundID = nil,
					SoundPitch = MRANDOM(9, 12) / 10,
					SoundVolume = 10
				})
			end
		end
	end
	CHARGE = true
end
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
		Smite()
	end
	if Key == "b" and ATTACK == false then
		Ravage()
	end
	if Key == "c" and ATTACK == false then
		Earthquake()
	end
	if Key == "v" and ATTACK == false then
		Beam()
	end
	if Key == "x" and ATTACK == false then
		Nuke()
	end
end
function KeyUp(Key)
	if Key ~= "w" and Key ~= "s" and Key ~= "a" and Key ~= "d" then
		KEYHOLD = false
	end
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
function unanchor()
	for _, c in pairs(Character:GetChildren()) do
		if c:IsA("BasePart") and c ~= RootPart then
			c.Anchored = false
		end
	end
	if UNANCHOR == true then
		RootPart.Anchored = false
	else
		RootPart.Anchored = true
	end
end
Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and Disable_Jump == true then
		Humanoid.Jump = false
	end
end)
while true do
	Swait()
	Humanoid.HipHeight = 7
	script.Parent = WEAPONGUI
	ANIMATE.Parent = nil
	for _, v in next, Humanoid:GetPlayingAnimationTracks() do
		v:Stop()
	end
	SINE = SINE + CHANGE / 2
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	if ATTACK == false then
		if TORSOVELOCITY < 1 then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.45 * COS(SINE / 12)) * ANGLES(RAD(7 + 2.5 * SIN(SINE / 12)), RAD(0), RAD(5 + 1 * SIN(SINE / 12))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(0 + 4.5 * SIN(SINE / 12)), RAD(0), RAD(-5 - 2.5 * SIN(SINE / 12))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(0 - 7.5 * SIN(SINE / 12)), RAD(0 - 7.5 * SIN(SINE / 12)), RAD(12 + 7.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(0 - 7.5 * SIN(SINE / 12)), RAD(0 + 7.5 * SIN(SINE / 12)), RAD(-12 - 7.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.15 * COS(SINE / 12), -0.01) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.5 + 0.25 * COS(SINE / 12), -0.5) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		elseif TORSOVELOCITY > 1 then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(25 + 2.5 * SIN(SINE / 12)), RAD(0), RAD(5 + 2.5 * SIN(SINE / 12))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(-25 + 4.5 * SIN(SINE / 12)), RAD(0), RAD(-5 - 2.5 * SIN(SINE / 12))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(-25), RAD(0 - 7.5 * SIN(SINE / 12)), RAD(25 + 7.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 + 0.25 * COS(SINE / 12), 0) * ANGLES(RAD(-25), RAD(0 + 7.5 * SIN(SINE / 12)), RAD(-25 - 7.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.01) * ANGLES(RAD(-25 - 7.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 5.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.5, -0.5) * ANGLES(RAD(-7.5 * SIN(SINE / 12)), RAD(-90), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	end
	for WING = 1, #WINGS do
		local STUFF = WINGS[WING]
		local FEATHERS = STUFF[1]
		local ACCEL = STUFF[2]
		FEATHERS.Acceleration = ACCEL + VT(0, 35 * SIN(SINE / 12), 0)
	end
	unanchor()
	Humanoid.MaxHealth = 3000000
	Humanoid.Health = 3000000
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
	for _, c in pairs(Character:GetChildren()) do
		if c.ClassName == "Accessory" or c.Name == "Body Colors" then
			local hand = c:FindFirstChild'Handle'
			if(hand)then
				hand.Parent = Character
				weldBetween(hand,Head)
			end
			c:destroy()
		end
	end
	sick.Playing = true
	sick.SoundId = "rbxassetid://1073318933"
	sick.Looped = true
	sick.Pitch = 1
	sick.Volume = 3
	if sick.Parent ~= Character then
		sick = IT("Sound", Character)
	end
	Head.Color = C3(0,0,0)
	pcall(function() Head:FindFirstChildOfClass'Decal':destroy() end)
	ApplyAoE(Torso.Position, 12)
	refit()
end