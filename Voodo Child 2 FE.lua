print("when finishing this i was lazy lol")
-----------------------
--[[ Name : Voodoo Child ]]--
-------------------------------------------------------
--A script By Creterisk

--Discord Creterisk#2958 

--NOTE THIS SCRIPT WAS PURELY MADE FROM MY FUCKING IMAGINATION
--IF IT HAPPENS TO LOOK LIKE ANOTHER SCRIPT
--DONT CALL IT A FUCKING BOOTLEG THANK YOU AND ENJOY THE SCRIPT
--YOU FUCKING SKIDS,
--For Those who log/decompile this, If you sell or trade this,
--and I find out who you are, i will take massive action.
warn("iTs iMpOsSiBlE tO sEpArAtE tHe TrUtH fRoM tHe FaLsE")
-------------------------------------------------------

local FavIDs = {
	340106355, --Nefl Crystals
	927529620, --Dimension
	876981900, --Fantasy
	398987889, --Ordinary Days
	1117396305, --Oh wait, it's you.
	885996042, --Action Winter Journey
	919231299, --Sprawling Idiot Effigy
	743466274, --Good Day Sunshine
	727411183, --Knife Fight
	1402748531, --The Earth Is Counting On You!
	595230126, --Robot Language
	478890315 --Death Road to Canada: Rotten Shotgun
	}



--[[
SUBJECT NAME : Micheal Lahen
SUBJECT INFO :
He has some kind of doll around him at all time, he doesn't talk much, but when he does he tends to harm others. It is because of a witch that he escaped, and IT IS also because of that witch that he kills.
He seems to have a horn of some kind, which appeared when he transformed into his "voodoo form" as we call it... Seems it controls his brain, and emotions by consequences.
There is absolutely nothing we can do to save him,
He'd have to kill himself, or we'd have to kill him.
He is a threat to humanity.
SUBJECT STATUS : KILL ON SIGHT! NO HESITATION!
...Nothing can save him...
]]--
--The reality of my life isn't real but a Universe -Creterisk
wait(0.2)
local plr = game:service'Players'.
print('Local User is '..plr.Name..', Mister, You will not regret this~')
print('Voodoo Child Loaded')
print[[
	No please not again, the curse haunts me
	I cannot control my actions or care for others harm,
	because of that damn horn. If it were to be removed I'd die, but...
	The witch says if I do her deeds she will free me, but...
	I cannot do these deeds as my body forcefully moves away from my objective.
	Please, PLEASE, HELP ME.
	I DON'T WANT TO BE ALONE AGAIN I JUST WISH TO SEE MY FAMILY, PLEASE!

	I.. can't.. I just can't.. the witch is too powerful.. send.. help.. | ???
]]
local char = plr.Character
local hum = char.Humanoid
local hed = char.Head
local root = char.HumanoidRootPart
local rootj = root.RootJoint
local tors = char.Torso
local ra = char["Right Arm"]
local la = char["Left Arm"]
local rl = char["Right Leg"]
local ll = char["Left Leg"]
local neck = tors["Neck"]
local mouse = plr:GetMouse()
local RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
local RHCF = CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
local LHCF = CFrame.fromEulerAnglesXYZ(0, -1.6, 0)
local maincolor = BrickColor.new("Institutional white")

function Anchor()
ra.Anchored = true
la.Anchored = true
tors.Anchored = true
ll.Anchored = true
rl.Anchored = true
hed.Anchored = true
end

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
-------------------------------------------------------
--End Good Stuff--
-------------------------------------------------------
necko = CF(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
RSH, LSH = nil, nil 
RW = Instance.new("Weld") 
LW = Instance.new("Weld")
RH = tors["Right Hip"]
LH = tors["Left Hip"]
RSH = tors["Right Shoulder"] 
LSH = tors["Left Shoulder"] 
RSH.Parent = nil 
LSH.Parent = nil 
RW.Name = "RW"
RW.Part0 = tors 
RW.C0 = CF(1.5, 0.5, 0)
RW.C1 = CF(0, 0.5, 0) 
RW.Part1 = ra
RW.Parent = tors 
LW.Name = "LW"
LW.Part0 = tors 
LW.C0 = CF(-1.5, 0.5, 0)
LW.C1 = CF(0, 0.5, 0) 
LW.Part1 = la
LW.Parent = tors
Effects = {}
-------------------------------------------------------
--Start HeartBeat--
-------------------------------------------------------
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"
script:WaitForChild("Heartbeat")

frame = 1 / 60
tf = 0
allowframeloss = false
tossremainder = false


lastframe = tick()
script.Heartbeat:Fire()


game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.Heartbeat:Fire()
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
-------------------------------------------------------
--End HeartBeat--
-------------------------------------------------------

function CreateSound(ID, PARENT, VOLUME, PITCH)
    local NSound = nil
    coroutine.resume(coroutine.create(function()
        NSound = Instance.new("Sound", PARENT)
        NSound.Volume = VOLUME
        NSound.Pitch = PITCH
        NSound.SoundId = "http://www.roblox.com/asset/?id="..ID
        swait()
        NSound:play()
        game:GetService("Debris"):AddItem(NSound, 10)
    end))
    return NSound
end

--Very lazi from here to below except the animations but who cares /shrug
function chatfunc(text)
local chat = coroutine.wrap(function()
if char:FindFirstChild("TalkingBillBoard")~= nil then
char:FindFirstChild("TalkingBillBoard"):destroy()
end
local naeeym2 = Instance.new("BillboardGui",char)
naeeym2.Size = UDim2.new(0,100,0,40)
naeeym2.StudsOffset = Vector3.new(0,3,0)
naeeym2.Adornee = char.Head
naeeym2.Name = "TalkingBillBoard"
local tecks2 = Instance.new("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.BorderSizePixel = 0
tecks2.Text = ""
tecks2.Font = "Fantasy"
tecks2.TextSize = 30
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = Color3.new(255,0,0)
tecks2.TextStrokeColor3 = Color3.new(0,0,0)
tecks2.Size = UDim2.new(1,0,0.5,0)
local tecks3 = Instance.new("TextLabel",naeeym2)
tecks3.BackgroundTransparency = 1
tecks3.BorderSizePixel = 0
tecks3.Text = ""
tecks3.Font = "Fantasy"
tecks3.TextSize = 30
tecks3.TextStrokeTransparency = 0
tecks3.TextColor3 = Color3.new(255,0,0)
tecks3.TextStrokeColor3 = Color3.new(0,0,0)
tecks3.Size = UDim2.new(1,0,0.5,0)
coroutine.resume(coroutine.create(function()
    while tecks3 ~= nil do
        swait()
        tecks3.Position = UDim2.new(math.random(-.2,.2),math.random(-3,3),.05,math.random(-3,3))   
        tecks3.Rotation = math.random(-3,3)
        tecks3.TextColor3 = Color3.new(math.random(0, 255)/255,0,0)
        tecks3.TextStrokeColor3 = Color3.new(math.random(0, 255)/255,0,0)
    end
end))
for i = 1,string.len(text),1 do
tecks2.Text = string.sub(text,1,i)
tecks3.Text = string.sub(text,1,i)
wait(0.01)
end
wait(2)
for i = 1, 50 do
swait()
tecks2.Position = tecks2.Position - UDim2.new(math.random(-.4,.4),math.random(-10,10),.05,math.random(-10,10))
tecks2.Rotation = tecks2.Rotation - 2
tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks2.TextTransparency = tecks2.TextTransparency + .04
tecks3.Position = tecks2.Position - UDim2.new(math.random(-.4,.4),math.random(-10,10),.05,math.random(-10,10))
tecks3.Rotation = tecks2.Rotation + 2
tecks3.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks3.TextTransparency = tecks2.TextTransparency + .04
end
naeeym2:Destroy()
end)
chat()
end
function onChatted(msg)
chatfunc(msg)
end
--plr.Chatted:connect(onChatted)

GlowParticle = Instance.new("ParticleEmitter",ra)
GlowParticle.LightEmission = 0
GlowParticle.Color = ColorSequence.new(Color3.new(0,0,0),Color3.new(0,0,0))
GlowParticle.Size = NumberSequence.new(0,0.6)
GlowParticle.Rotation = NumberRange.new(0, 360)
GlowParticle.Texture = "http://www.roblox.com/asset/?id=1523916715"
GlowParticle.Transparency = NumberSequence.new(0,1)
GlowParticle.LockedToPart = true
GlowParticle.Lifetime = NumberRange.new(1)
GlowParticle.Rate = 999
GlowParticle.Speed = NumberRange.new(0)
GlowParticle.VelocitySpread = 500

function TargetSelect(person)
local dd=coroutine.wrap(function()
if targetted ~= person then
targetted = person
GlowParticle.Enabled = true
end
end)
dd()
end

if targetted == nil then
GlowParticle.Enabled = false
end
-------------------------------------------------------
--Start Important Functions--
-------------------------------------------------------
function swait(num)
	if num == 0 or num == nil then
		game:service("RunService").Stepped:wait(0)
	else
		for i = 0, num do
			game:service("RunService").Stepped:wait(0)
		end
	end
end
function thread(f)
	coroutine.resume(coroutine.create(f))
end
function clerp(a, b, t)
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
			local theta = math.acos(cosTheta)
			local invSinTheta = 1 / Sin(theta)
			startInterp = Sin((1 - t) * theta) * invSinTheta
			finishInterp = Sin(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	elseif 1 + cosTheta > 1.0E-4 then
		local theta = math.acos(-cosTheta)
		local invSinTheta = 1 / Sin(theta)
		startInterp = Sin((t - 1) * theta) * invSinTheta
		finishInterp = Sin(t * theta) * invSinTheta
	else
		startInterp = t - 1
		finishInterp = t
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end
function rayCast(Position, Direction, Range, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore)
end
local RbxUtility = LoadLibrary("RbxUtility")
local Create = RbxUtility.Create

-------------------------------------------------------
--Start Damage Function--
-------------------------------------------------------
function Damage(Part, hit, minim, maxim, knockback, Type, Property, Delay, HitSound, HitPitch)
	if hit.Parent == nil then
		return
	end
	local h = hit.Parent:FindFirstChildOfClass("Humanoid")
	for _, v in pairs(hit.Parent:children()) do
		if v:IsA("Humanoid") then
			h = v
		end
	end
         if h ~= nil and hit.Parent.Name ~= char.Name and hit.Parent:FindFirstChild("UpperTorso") ~= nil then
	
         hit.Parent:FindFirstChild("Head"):BreakJoints()
         end

	if h ~= nil and hit.Parent.Name ~= char.Name and hit.Parent:FindFirstChild("Torso") ~= nil then
		if hit.Parent:findFirstChild("DebounceHit") ~= nil then
			if hit.Parent.DebounceHit.Value == true then
				return
			end
		end
         if insta == true then
         hit.Parent:FindFirstChild("Head"):BreakJoints()
         end
		local c = Create("ObjectValue"){
			Name = "creator",
			Value = game:service("Players").LocalPlayer,
			Parent = h,
		}
		game:GetService("Debris"):AddItem(c, .5)
		if HitSound ~= nil and HitPitch ~= nil then
			CFuncs.Sound.Create(HitSound, hit, 1, HitPitch) 
		end
		local Damage = math.random(minim, maxim)
		local blocked = false
		local block = hit.Parent:findFirstChild("Block")
		if block ~= nil then
			if block.className == "IntValue" then
				if block.Value > 0 then
					blocked = true
					block.Value = block.Value - 1
					print(block.Value)
				end
			end
		end
		if blocked == false then
			h.Health = h.Health - Damage
			ShowDamage((Part.CFrame * CFrame.new(0, 0, (Part.Size.Z / 2)).p + Vector3.new(0, 1.5, 0)), -Damage, 1.5, tors.BrickColor.Color)
		else
			h.Health = h.Health - (Damage / 2)
			ShowDamage((Part.CFrame * CFrame.new(0, 0, (Part.Size.Z / 2)).p + Vector3.new(0, 1.5, 0)), -Damage, 1.5, tors.BrickColor.Color)
		end
		if Type == "Knockdown" then
			local hum = hit.Parent.Humanoid
			hum.PlatformStand = true
			coroutine.resume(coroutine.create(function(HHumanoid)
				swait(1)
				HHumanoid.PlatformStand = false
			end), hum)
			local angle = (hit.Position - (Property.Position + Vector3.new(0, 0, 0))).unit
			local bodvol = Create("BodyVelocity"){
				velocity = angle * knockback,
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			local rl = Create("BodyAngularVelocity"){
				P = 3000,
				maxTorque = Vector3.new(500000, 500000, 500000) * 50000000000000,
				angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodvol, .5)
			game:GetService("Debris"):AddItem(rl, .5)
		elseif Type == "Normal" then
			local vp = Create("BodyVelocity"){
				P = 500,
				maxForce = Vector3.new(math.huge, 0, math.huge),
				velocity = Property.CFrame.lookVector * knockback + Property.Velocity / 1.05,
			}
			if knockback > 0 then
				vp.Parent = hit.Parent.Torso
			end
			game:GetService("Debris"):AddItem(vp, .5)
		elseif Type == "Up" then
			local bodyVelocity = Create("BodyVelocity"){
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodyVelocity, .5)
		elseif Type == "DarkUp" then
			coroutine.resume(coroutine.create(function()
				for i = 0, 1, 0.1 do
					swait()
					Effects.Block.Create(BrickColor.new("Black"), hit.Parent.Torso.CFrame, 5, 5, 5, 1, 1, 1, .08, 1)
				end
			end))
			local bodyVelocity = Create("BodyVelocity"){
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodyVelocity, 1)
		elseif Type == "Snare" then
			local bp = Create("BodyPosition"){
				P = 2000,
				D = 100,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso,
			}
			game:GetService("Debris"):AddItem(bp, 1)
		elseif Type == "Freeze" then
			local BodPos = Create("BodyPosition"){
				P = 50000,
				D = 1000,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso,
			}
			local BodGy = Create("BodyGyro") {
				maxTorque = Vector3.new(4e+005, 4e+005, 4e+005) * math.huge ,
				P = 20e+003,
				Parent = hit.Parent.Torso,
				cframe = hit.Parent.Torso.CFrame,
			}
			hit.Parent.Torso.Anchored = true
			coroutine.resume(coroutine.create(function(Part) 
				swait(1.5)
				Part.Anchored = false
			end), hit.Parent.Torso)
			game:GetService("Debris"):AddItem(BodPos, 3)
			game:GetService("Debris"):AddItem(BodGy, 3)
		end
		local debounce = Create("BoolValue"){
			Name = "DebounceHit",
			Parent = hit.Parent,
			Value = true,
		}
		game:GetService("Debris"):AddItem(debounce, Delay)
		c = Create("ObjectValue"){
			Name = "creator",
			Value = Player,
			Parent = h,
		}
		game:GetService("Debris"):AddItem(c, .5)
	end
end
-------------------------------------------------------
--End Damage Function--
-------------------------------------------------------

-------------------------------------------------------
--Start Damage Function Customization--
-------------------------------------------------------
function ShowDamage(Pos, Text, Time, Color)
	local Rate = (1 / 30)
	local Pos = (Pos or Vector3.new(0, 0, 0))
	local Text = (Text or "")
	local Time = (Time or 2)
	local Color = (Color or Color3.new(1, 0, 1))
	local EffectPart = CFuncs.Part.Create(workspace, "SmoothPlastic", 0, 1, BrickColor.new(Color), "Effect", Vector3.new(0, 0, 0))
	EffectPart.Anchored = true
	local BillboardGui = Create("BillboardGui"){
		Size = UDim2.new(3, 0, 3, 0),
		Adornee = EffectPart,
		Parent = EffectPart,
	}
	local TextLabel = Create("TextLabel"){
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Text = Text,
		Font = "Bodoni",
		TextColor3 = Color,
		TextScaled = true,
		TextStrokeColor3 = Color3.fromRGB(0,0,0),
		Parent = BillboardGui,
	}
	game.Debris:AddItem(EffectPart, (Time))
	EffectPart.Parent = game:GetService("Workspace")
	delay(0, function()
		local Frames = (Time / Rate)
		for Frame = 1, Frames do
			wait(Rate)
			local Percent = (Frame / Frames)
			EffectPart.CFrame = CFrame.new(Pos) + Vector3.new(0, Percent, 0)
			TextLabel.TextTransparency = Percent
		end
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end)
end
-------------------------------------------------------
--End Damage Function Customization--
-------------------------------------------------------

function MagniDamage(Part, magni, mindam, maxdam, knock, Type)
  for _, c in pairs(workspace:children()) do
    local hum = c:findFirstChild("Humanoid")
    if hum ~= nil then
      local head = c:findFirstChild("Head")
      if head ~= nil then
        local targ = head.Position - Part.Position
        local mag = targ.magnitude
        if magni >= mag and c.Name ~= plr.Name then
          Damage(head, head, mindam, maxdam, knock, Type, root, 0.1, "http://www.roblox.com/asset/?id=0", 1.2)
        end
      end
    end
  end
end


CFuncs = {
	Part = {
		Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
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
			RemoveOutlines(Part)
			return Part
		end
	},
	Mesh = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
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
	},
	Mesh = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
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
	},
	Weld = {
		Create = function(Parent, Part0, Part1, C0, C1)
			local Weld = Create("Weld")({
				Parent = Parent,
				Part0 = Part0,
				Part1 = Part1,
				C0 = C0,
				C1 = C1
			})
			return Weld
		end
	},
	Sound = {
		Create = function(id, par, vol, pit)
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound")({
					Volume = vol,
					Pitch = pit or 1,
					SoundId = id,
					Parent = par or workspace
				})
				wait()
				S:play()
				game:GetService("Debris"):AddItem(S, 6)
			end))
		end
	},
	ParticleEmitter = {
		Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
			local fp = Create("ParticleEmitter")({
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
				VelocitySpread = VelocitySpread
			})
			return fp
		end
	}
}
function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
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
function CreatePart(FormFactor, Parent, Material, Reflectance, Transparency, BColor, Name, Size)
	local Part = Create("Part")({
		formFactor = FormFactor,
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
	RemoveOutlines(Part)
	return Part
end
function CreateMesh(Mesh, Part, MeshType, MeshId, OffSet, Scale)
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


-------------------------------------------------------
--Start Effect Function--
-------------------------------------------------------
EffectModel = Instance.new("Model", char)
Effects = {
  Block = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Type)
      local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      game:GetService("Debris"):AddItem(prt, 10)
      if Type == 1 or Type == nil then
        table.insert(Effects, {
          prt,
          "Block1",
          delay,
          x3,
          y3,
          z3,
          msh
        })
      elseif Type == 2 then
        table.insert(Effects, {
          prt,
          "Block2",
          delay,
          x3,
          y3,
          z3,
          msh
        })
      else
        table.insert(Effects, {
          prt,
          "Block3",
          delay,
          x3,
          y3,
          z3,
          msh
        })
      end
    end
  },
  Sphere = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
      local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Cylinder",
        delay,
        x3,
        y3,
        z3,
        msh
      })
    end
  },
  Cylinder = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
      local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Cylinder",
        delay,
        x3,
        y3,
        z3,
        msh
      })
    end
  },
  Wave = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
      local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://20329976", Vector3.new(0, 0, 0), Vector3.new(x1 / 60, y1 / 60, z1 / 60))
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Cylinder",
        delay,
        x3 / 60,
        y3 / 60,
        z3 / 60,
        msh
      })
    end
  },
  Ring = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
      local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://3270017", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Cylinder",
        delay,
        x3,
        y3,
        z3,
        msh
      })
    end
  },
  Break = {
    Create = function(brickcolor, cframe, x1, y1, z1)
      local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
      prt.Anchored = true
      prt.CFrame = cframe * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
      local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      local num = math.random(10, 50) / 1000
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Shatter",
        num,
        prt.CFrame,
        math.random() - math.random(),
        0,
        math.random(50, 100) / 100
      })
    end
  },
Spiral = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
      local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://1051557", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Cylinder",
        delay,
        x3,
        y3,
        z3,
        msh
      })
    end
  },
Push = {
    Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
      local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
      prt.Anchored = true
      prt.CFrame = cframe
      local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://437347603", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
      game:GetService("Debris"):AddItem(prt, 10)
      table.insert(Effects, {
        prt,
        "Cylinder",
        delay,
        x3,
        y3,
        z3,
        msh
      })
    end
  }
}
function part(formfactor ,parent, reflectance, transparency, brickcolor, name, size)
	local fp = IT("Part")
	fp.formFactor = formfactor 
	fp.Parent = parent
	fp.Reflectance = reflectance
	fp.Transparency = transparency
	fp.CanCollide = false 
	fp.Locked = true
	fp.BrickColor = brickcolor
	fp.Name = name
	fp.Size = size
	fp.Position = tors.Position 
	RemoveOutlines(fp)
	fp.Material = "SmoothPlastic"
	fp:BreakJoints()
	return fp 
end 
 
function mesh(Mesh,part,meshtype,meshid,offset,scale)
	local mesh = IT(Mesh) 
	mesh.Parent = part
	if Mesh == "SpecialMesh" then
		mesh.MeshType = meshtype
	if meshid ~= "nil" then
		mesh.MeshId = "http://www.roblox.com/asset/?id="..meshid
		end
	end
	mesh.Offset = offset
	mesh.Scale = scale
	return mesh
end

function Magic(bonuspeed, type, pos, scale, value, color, MType)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = MType
	rngm.Scale = scale
	local scaler2 = 1
	if type == "Add" then
		scaler2 = 1 * value
	elseif type == "Divide" then
		scaler2 = 1 / value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0, 10 / bonuspeed, 0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01 * value / bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01 / value * bonuspeed
			end
			rng.Transparency = rng.Transparency + 0.01 * bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2 * bonuspeed, scaler2 * bonuspeed, scaler2 * bonuspeed)
		end
		rng:Destroy()
	end))
end

function Eviscerate(dude)
	if dude.Name ~= char then
		local bgf = IT("BodyGyro", dude.Head)
		bgf.CFrame = bgf.CFrame * CFrame.fromEulerAnglesXYZ(Rad(-90), 0, 0)
		local val = IT("BoolValue", dude)
		val.Name = "IsHit"
		local ds = coroutine.wrap(function()
			dude:WaitForChild("Head"):BreakJoints()
			wait(0.5)
			target = nil
			coroutine.resume(coroutine.create(function()
				for i, v in pairs(dude:GetChildren()) do
					if v:IsA("Accessory") then
						v:Destroy()
					end
					if v:IsA("Humanoid") then
						v:Destroy()
					end
					if v:IsA("CharacterMesh") then
						v:Destroy()
					end
					if v:IsA("Model") then
						v:Destroy()
					end
					if v:IsA("Part") or v:IsA("MeshPart") then
						for x, o in pairs(v:GetChildren()) do
							if o:IsA("Decal") then
								o:Destroy()
							end
						end
						coroutine.resume(coroutine.create(function()
							v.Material = "Neon"
							v.CanCollide = false
							local PartEmmit1 = IT("ParticleEmitter", v)
							PartEmmit1.LightEmission = 1
							PartEmmit1.Texture = "rbxassetid://284205403"
							PartEmmit1.Color = ColorSequence.new(maincolor.Color)
							PartEmmit1.Rate = 150
							PartEmmit1.Lifetime = NumberRange.new(1)
							PartEmmit1.Size = NumberSequence.new({
								NumberSequenceKeypoint.new(0, 0.75, 0),
								NumberSequenceKeypoint.new(1, 0, 0)
							})
							PartEmmit1.Transparency = NumberSequence.new({
								NumberSequenceKeypoint.new(0, 0, 0),
								NumberSequenceKeypoint.new(1, 1, 0)
							})
							PartEmmit1.Speed = NumberRange.new(0, 0)
							PartEmmit1.VelocitySpread = 30000
							PartEmmit1.Rotation = NumberRange.new(-500, 500)
							PartEmmit1.RotSpeed = NumberRange.new(-500, 500)
							local BodPoss = IT("BodyPosition", v)
							BodPoss.P = 3000
							BodPoss.D = 1000
							BodPoss.maxForce = Vector3.new(50000000000, 50000000000, 50000000000)
							BodPoss.position = v.Position + Vector3.new(Mrandom(-15, 15), Mrandom(-15, 15), Mrandom(-15, 15))
							v.Color = maincolor.Color
							coroutine.resume(coroutine.create(function()
								for i = 0, 49 do
									swait(1)
									v.Transparency = v.Transparency + 0.08
								end
								wait(0.5)
								PartEmmit1.Enabled = false
								wait(3)
								v:Destroy()
								dude:Destroy()
							end))
						end))
					end
				end
			end))
		end)
		ds()
	end
end

function FindNearestHead(Position, Distance, SinglePlayer)
	if SinglePlayer then
		return Distance > (SinglePlayer.Torso.CFrame.p - Position).magnitude
	end
	local List = {}
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA("Model") and v:findFirstChild("Head") and v ~= char and Distance >= (v.Head.Position - Position).magnitude then
			table.insert(List, v)
		end
	end
	return List
end

function Aura(bonuspeed, FastSpeed, type, pos, x1, y1, z1, value, color, outerpos, MType)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	rng.CFrame = rng.CFrame + rng.CFrame.lookVector * outerpos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = MType
	rngm.Scale = Vector3.new(x1, y1, z1)
	local scaler2 = 1
	local speeder = FastSpeed
	if type == "Add" then
		scaler2 = 1 * value
	elseif type == "Divide" then
		scaler2 = 1 / value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0, 10 / bonuspeed, 0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01 * value / bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01 / value * bonuspeed
			end
			speeder = speeder - 0.01 * FastSpeed * bonuspeed
			rng.CFrame = rng.CFrame + rng.CFrame.lookVector * speeder * bonuspeed
			rng.Transparency = rng.Transparency + 0.01 * bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2 * bonuspeed, scaler2 * bonuspeed, 0)
		end
		rng:Destroy()
	end))
end

function SoulSteal(dude)
if dude.Name ~= char then
local bgf = IT("BodyGyro", dude.Head)
bgf.CFrame = bgf.CFrame * CFrame.fromEulerAnglesXYZ(Rad(-90), 0, 0)
local val = IT("BoolValue", dude)
val.Name = "IsHit"
local torso = (dude:FindFirstChild'Head' or dude:FindFirstChild'Torso' or dude:FindFirstChild'UpperTorso' or dude:FindFirstChild'LowerTorso' or dude:FindFirstChild'HumanoidRootPart')
local soulst = coroutine.wrap(function()
local soul = Instance.new("Part",dude)
soul.Size = Vector3.new(1,1,1)
soul.CanCollide = false
soul.Anchored = false
soul.Position = torso.Position
soul.Transparency = 1
local PartEmmit1 = IT("ParticleEmitter", soul)
PartEmmit1.LightEmission = 1
PartEmmit1.Texture = "rbxassetid://569507414"
PartEmmit1.Color = ColorSequence.new(maincolor.Color)
PartEmmit1.Rate = 250
PartEmmit1.Lifetime = NumberRange.new(1.6)
PartEmmit1.Size = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1, 0),
	NumberSequenceKeypoint.new(1, 0, 0)
})
PartEmmit1.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0, 0),
	NumberSequenceKeypoint.new(1, 1, 0)
})
PartEmmit1.Speed = NumberRange.new(0, 0)
PartEmmit1.VelocitySpread = 30000
PartEmmit1.Rotation = NumberRange.new(-360, 360)
PartEmmit1.RotSpeed = NumberRange.new(-360, 360)
local BodPoss = IT("BodyPosition", soul)
BodPoss.P = 3000
BodPoss.D = 1000
BodPoss.maxForce = Vector3.new(50000000000, 50000000000, 50000000000)
BodPoss.position = torso.Position + Vector3.new(Mrandom(-15, 15), Mrandom(-15, 15), Mrandom(-15, 15))
wait(1.6)
soul.Touched:connect(function(hit)
	if hit.Parent == char then
	soul:Destroy()
	end
end)
wait(1.2)
while soul do
	swait()
	PartEmmit1.Color = ColorSequence.new(maincolor.Color)
	BodPoss.Position = tors.Position
end
end)
	soulst()
	end
end
function FaceMouse()
local	Cam = workspace.CurrentCamera
	return {
		CFrame.new(char.Torso.Position, Vector3.new(mouse.Hit.p.x, char.Torso.Position.y, mouse.Hit.p.z)),
		Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)
	}
end
-------------------------------------------------------
--End Effect Function--
-------------------------------------------------------
function Cso(ID, PARENT, VOLUME, PITCH)
	local NSound = nil
	coroutine.resume(coroutine.create(function()
		NSound = IT("Sound", PARENT)
		NSound.Volume = VOLUME
		NSound.Pitch = PITCH
		NSound.SoundId = "http://www.roblox.com/asset/?id="..ID
		swait()
		NSound:play()
		game:GetService("Debris"):AddItem(NSound, 10)
	end))
	return NSound
end
function CameraEnshaking(Length, Intensity)
	coroutine.resume(coroutine.create(function()
		local intensity = 1 * Intensity
		local rotM = 0.01 * Intensity
		for i = 0, Length, 0.1 do
			swait()
			intensity = intensity - 0.05 * Intensity / Length
			rotM = rotM - 5.0E-4 * Intensity / Length
			hum.CameraOffset = Vector3.new(Rad(Mrandom(-intensity, intensity)), Rad(Mrandom(-intensity, intensity)), Rad(Mrandom(-intensity, intensity)))
			cam.CFrame = cam.CFrame * CF(Rad(Mrandom(-intensity, intensity)), Rad(Mrandom(-intensity, intensity)), Rad(Mrandom(-intensity, intensity))) * Euler(Rad(Mrandom(-intensity, intensity)) * rotM, Rad(Mrandom(-intensity, intensity)) * rotM, Rad(Mrandom(-intensity, intensity)) * rotM)
		end
		hum.CameraOffset = Vector3.new(0, 0, 0)
	end))
end
-------------------------------------------------------
--End Important Functions--
-------------------------------------------------------




New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end
	
Doll = New("Model",char,"Doll",{})
Handle = New("Part",Doll,"Handle",{BrickColor = BrickColor.new("Beige"),FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.755005181, 0.52783519, 0.664805532),CFrame = CFrame.new(17.7066402, 4.04866695, 4.38868618, -0.408491671, 0.666965187, -0.623126268, 0.353551745, 0.745008111, 0.565648913, 0.841502249, 0.0107554942, -0.540138841),Color = Color3.new(0.792157, 0.74902, 0.639216),})
Mesh = New("CylinderMesh",Handle,"Mesh",{})
Decal = New("Decal",Handle,"Decal",{Face = Enum.NormalId.Back,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Handle,"Decal",{Face = Enum.NormalId.Left,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Handle,"Decal",{Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Handle,"Decal",{Face = Enum.NormalId.Right,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Handle,"Decal",{Face = Enum.NormalId.Top,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Handle,"Decal",{Face = Enum.NormalId.Bottom,Texture = "http://www.roblox.com/asset/?id=512493661",})
Part = New("Part",Doll,"Part",{BrickColor = BrickColor.new("Beige"),FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.354117572, 0.611353397, 0.337414026),CFrame = CFrame.new(17.8601875, 3.91987228, 3.94369364, 0.725253046, -0.0676794797, 0.685131192, -0.652452052, -0.385200739, 0.652613878, 0.219753951, -0.920328677, -0.3235268),Color = Color3.new(0.792157, 0.74902, 0.639216),})
Mesh = New("CylinderMesh",Part,"Mesh",{})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Back,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Left,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Right,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Top,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Bottom,Texture = "http://www.roblox.com/asset/?id=512493661",})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.725257337, -0.652455866, 0.219753742, -0.0676780641, -0.385204077, -0.920336843, 0.685135007, 0.652616382, -0.323529661),C1 = CFrame.new(-0.482725382, 0.00167179108, 0.0718259811, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})
Part = New("Part",Doll,"Part",{BrickColor = BrickColor.new("Beige"),Shape = Enum.PartType.Ball,Size = Vector3.new(0.357458174, 0.357458174, 0.357458174),CFrame = CFrame.new(17.834486, 3.79168725, 3.64936543, 0.0676793754, -0.685130835, 0.725253344, 0.385200799, -0.652614176, -0.652451873, 0.920328736, 0.323526919, 0.219753981),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.792157, 0.74902, 0.639216),})
Decal = New("Decal",Part,"Decal",{Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Top,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Left,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Back,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Right,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Bottom,Texture = "http://www.roblox.com/asset/?id=512493661",})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.0676779449, 0.385204136, 0.920336902, -0.685134649, -0.65261662, 0.32352975, 0.725257695, -0.652455688, 0.219753742),C1 = CFrame.new(-0.765227079, -0.114135742, 0.174312592, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})
Part = New("Part",Doll,"Part",{BrickColor = BrickColor.new("Beige"),FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.354117572, 0.611353397, 0.337414026),CFrame = CFrame.new(17.469902, 4.25766516, 4.74769306, 0.445832253, 0.789082885, 0.422561586, -0.410611928, -0.239177942, 0.879868925, 0.795366764, -0.565779567, 0.217372388),Color = Color3.new(0.792157, 0.74902, 0.639216),})
Mesh = New("CylinderMesh",Part,"Mesh",{})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Back,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Left,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Right,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Top,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Bottom,Texture = "http://www.roblox.com/asset/?id=512493661",})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.445833862, -0.410613358, 0.795372128, 0.789088428, -0.239180744, -0.565785825, 0.422562867, 0.879873633, 0.217374772),C1 = CFrame.new(0.472706556, 0.0016708374, 0.0718240738, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})
Part = New("Part",Doll,"Part",{BrickColor = BrickColor.new("Beige"),Shape = Enum.PartType.Ball,Size = Vector3.new(0.357458174, 0.357458174, 0.357458174),CFrame = CFrame.new(17.1839867, 3.98582673, 3.75731707, 0.429396152, -0.706048965, 0.563108683, -0.389012426, -0.70731467, -0.590215027, 0.815025091, 0.0343795903, -0.578376234),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.792157, 0.74902, 0.639216),})
Decal = New("Decal",Part,"Decal",{Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Top,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Left,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Back,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Right,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Bottom,Texture = "http://www.roblox.com/asset/?id=512493661",})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.429397583, -0.389013648, 0.815030634, -0.706052482, -0.707317889, 0.0343799815, 0.563113213, -0.590219498, -0.57838279),C1 = CFrame.new(-0.340019703, -0.402200699, 0.631163597, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})
Part = New("Part",Doll,"Part",{BrickColor = BrickColor.new("Beige"),FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.354117572, 0.611353397, 0.337414026),CFrame = CFrame.new(17.3263435, 3.86502314, 4.01973581, 0.563109279, -0.429397821, 0.706047297, -0.590211987, 0.389013797, 0.707316399, -0.578378439, -0.815023482, -0.0343782082),Color = Color3.new(0.792157, 0.74902, 0.639216),})
Mesh = New("CylinderMesh",Part,"Mesh",{})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Back,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Left,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Right,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Top,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Bottom,Texture = "http://www.roblox.com/asset/?id=512493661",})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.563113868, -0.590216458, -0.578384995, -0.429399252, 0.389015079, -0.815029025, 0.706050813, 0.707319558, -0.0343785957),C1 = CFrame.new(-0.220053911, -0.394431114, 0.332381248, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})
Part = New("Part",Doll,"Part",{BrickColor = BrickColor.new("Beige"),FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.354117572, 0.611353397, 0.337414026),CFrame = CFrame.new(17.1463699, 4.02708626, 4.39648008, 0.0949088037, -0.73499012, 0.671386242, -0.165235519, 0.653441608, 0.738708198, -0.981658518, -0.181056261, -0.0594294369),Color = Color3.new(0.792157, 0.74902, 0.639216),})
Mesh = New("CylinderMesh",Part,"Mesh",{})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Back,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Left,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Right,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Top,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Bottom,Texture = "http://www.roblox.com/asset/?id=512493661",})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.0949110687, -0.165237904, -0.981667101, -0.734994531, 0.653445482, -0.181055605, 0.67138958, 0.738711536, -0.0594298989),C1 = CFrame.new(0.227796555, -0.389676094, 0.33270359, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})
Part = New("Part",Doll,"Part",{BrickColor = BrickColor.new("Beige"),Shape = Enum.PartType.Ball,Size = Vector3.new(0.357458174, 0.357458174, 0.357458174),CFrame = CFrame.new(16.9056702, 4.23298216, 4.33822775, 0.734989643, -0.671386659, 0.0949084461, -0.65344131, -0.738707781, -0.165238559, 0.18105793, 0.0594319291, -0.981658101),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.792157, 0.74902, 0.639216),})
Decal = New("Decal",Part,"Decal",{Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Top,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Left,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Back,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Right,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Bottom,Texture = "http://www.roblox.com/asset/?id=512493661",})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.734994054, -0.653445184, 0.181057304, -0.671389878, -0.738711119, 0.0594324097, 0.0949106514, -0.165240943, -0.981666625),C1 = CFrame.new(0.349896908, -0.397447586, 0.630620956, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})
Part = New("Part",Doll,"Part",{BrickColor = BrickColor.new("Beige"),Shape = Enum.PartType.Ball,Size = Vector3.new(0.668146014, 0.668146014, 0.668146014),CFrame = CFrame.new(17.5317345, 3.8532939, 4.38586617, -0.408485681, -0.666960537, 0.62312144, 0.353546619, -0.745002985, -0.565644801, 0.841490149, -0.01075528, 0.540134549),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.792157, 0.74902, 0.639216),})
Decal = New("Decal",Part,"Decal",{Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Top,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Left,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Back,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Right,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Bottom,Texture = "http://www.roblox.com/asset/?id=512493661",})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -0.408489615, 0.353550047, 0.841498256, -0.666963577, -0.745006442, -0.0107553881, 0.623124659, -0.565647602, 0.540137351),C1 = CFrame.new(2.38418579e-07, -0.262242317, -9.53674316e-07, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})
Part = New("Part",Doll,"Part",{BrickColor = BrickColor.new("Beige"),Shape = Enum.PartType.Ball,Size = Vector3.new(0.357458174, 0.357458174, 0.357458174),CFrame = CFrame.new(17.2187252, 4.32988024, 4.93205738, 0.445832521, -0.422561586, 0.789083481, -0.410612077, -0.879869342, -0.239178166, 0.795367122, -0.217372417, -0.565779924),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.792157, 0.74902, 0.639216),})
Decal = New("Decal",Part,"Decal",{Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Top,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Left,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Back,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Right,Texture = "http://www.roblox.com/asset/?id=512493661",})
Decal = New("Decal",Part,"Decal",{Face = Enum.NormalId.Bottom,Texture = "http://www.roblox.com/asset/?id=512493661",})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.4458341, -0.410613567, 0.795372486, -0.422562897, -0.879873991, -0.217374831, 0.789088964, -0.239180893, -0.565786123),C1 = CFrame.new(0.755987883, -0.110072136, 0.169605255, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})
Part = New("Part",Doll,"Part",{FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(0.668145955, 0.668145835, 0.668145955),CFrame = CFrame.new(18.08988, 4.4767499, 4.39486742, 0.408485681, 0.666960537, 0.62312144, -0.353546619, 0.745002985, -0.565644801, -0.841490149, 0.01075528, 0.540134549),CanCollide = false,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,})
Mesh = New("SpecialMesh",Part,"Mesh",{Scale = Vector3.new(0.267258376, 0.267258346, 0.267258376),MeshId = "rbxassetid://511959728",TextureId = "rbxassetid://511959832",MeshType = Enum.MeshType.FileMesh,})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.408489615, -0.353550047, -0.841498256, 0.666963577, 0.745006442, 0.0107553881, 0.623124659, -0.565647602, 0.540137351),C1 = CFrame.new(7.15255737e-07, 0.574602127, -9.53674316e-07, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})
ConeMesh = New("Part",Doll,"ConeMesh",{Material = Enum.Material.SmoothPlastic,Elasticity = 0,FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(0.200000003, 0.334072918, 0.200000003),CFrame = CFrame.new(17.9875202, 4.01644802, 3.77061558, -0.0676794201, -0.685131192, -0.725253105, -0.385200799, -0.652613878, 0.652452171, -0.920328856, 0.3235268, -0.219753891),CanCollide = false,})
Mesh = New("SpecialMesh",ConeMesh,"Mesh",{Scale = Vector3.new(0.0100221895, 0.334072918, 0.0100221895),MeshId = "http://www.roblox.com/asset/?id=1033714",MeshType = Enum.MeshType.FileMesh,})
mot = New("Motor",ConeMesh,"mot",{Part0 = ConeMesh,Part1 = Handle,C0 = CFrame.new(0, 0, 0, -0.0676780194, -0.385204077, -0.920336962, -0.685135007, -0.652616382, 0.323529661, -0.725257397, 0.652455926, -0.219753653),C1 = CFrame.new(-0.646242142, 0.156686783, 0.14059639, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})
ConeMesh = New("Part",Doll,"ConeMesh",{Material = Enum.Material.SmoothPlastic,Elasticity = 0,FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(0.200000003, 0.334072918, 0.200000003),CFrame = CFrame.new(17.5272255, 4.25228214, 4.19855928, 0.0679666698, 0.36827448, 0.927217185, -0.212974086, -0.902587652, 0.374107033, 0.974675775, -0.222893685, 0.017090857),CanCollide = false,})
Mesh = New("SpecialMesh",ConeMesh,"Mesh",{Scale = Vector3.new(0.0100221895, 0.334072918, 0.0100221895),MeshId = "http://www.roblox.com/asset/?id=1033714",MeshType = Enum.MeshType.FileMesh,})
mot = New("Motor",ConeMesh,"mot",{Part0 = ConeMesh,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.0679656863, -0.212973878, 0.974683523, 0.368277669, -0.902593136, -0.22289744, 0.927222073, 0.374108285, 0.0170900673),C1 = CFrame.new(-0.0147144794, 0.0299873352, 0.329668999, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})
Part = New("Part",Doll,"Part",{BrickColor = BrickColor.new("Crimson"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Ball,Size = Vector3.new(0.200000003, 0.200000003, 0.200000003),CFrame = CFrame.new(18.0725803, 4.09775925, 3.73087263, 0.0676794201, 0.685131252, -0.725253105, 0.385200679, 0.652613938, 0.652452171, 0.920328856, -0.32352671, -0.219753891),CanCollide = false,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.768628, 0.156863, 0.109804),})
Mesh = New("SpecialMesh",Part,"Mesh",{Scale = Vector3.new(0.334072977, 0.334072918, 0.334072977),MeshType = Enum.MeshType.Sphere,})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.0676779896, 0.385204017, 0.920336962, 0.685135067, 0.652616382, -0.323529571, -0.725257397, 0.652455926, -0.219753653),C1 = CFrame.new(-0.685684681, 0.273569107, 0.155054092, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})
Part = New("Part",Doll,"Part",{BrickColor = BrickColor.new("Crimson"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Ball,Size = Vector3.new(0.200000003, 0.200000003, 0.200000003),CFrame = CFrame.new(17.4762096, 4.37637663, 4.2292285, 0.0679666698, 0.927216947, -0.368275285, -0.212974086, 0.374107838, 0.902587295, 0.974675775, 0.0170910954, 0.222893804),CanCollide = false,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.768628, 0.156863, 0.109804),})
Mesh = New("SpecialMesh",Part,"Mesh",{Scale = Vector3.new(0.334072977, 0.334072918, 0.334072977),MeshType = Enum.MeshType.Sphere,})
mot = New("Motor",Part,"mot",{Part0 = Part,Part1 = Handle,C0 = CFrame.new(0, 0, 0, 0.0679656863, -0.212973878, 0.974683523, 0.927221835, 0.374109089, 0.0170903057, -0.368278474, 0.902592778, 0.22289747),C1 = CFrame.new(0.0758080482, 0.0887422562, 0.4150877, -0.408491671, 0.353551745, 0.841502249, 0.666965187, 0.745008111, 0.0107554942, -0.623126268, 0.565648913, -0.540138841),})

--lazi xd
Needle = New("Model",char,"Needle",{})
Handle2 = New("Part",Needle,"Handle2",{FormFactor = Enum.FormFactor.Plate,Size = Vector3.new(1, 2.4000001, 1),CFrame = CFrame.new(16.3492584, 4.78270006, 4.07852173, 0.0870969296, 0.578728557, -0.810855865, 0.54097569, -0.710955501, -0.449318945, -0.836516261, -0.399518967, -0.375000119),BackSurface = Enum.SurfaceType.Weld,BottomSurface = Enum.SurfaceType.Weld,FrontSurface = Enum.SurfaceType.Weld,LeftSurface = Enum.SurfaceType.Weld,RightSurface = Enum.SurfaceType.Weld,TopSurface = Enum.SurfaceType.Weld,})
Mesh = New("SpecialMesh",Handle2,"Mesh",{Scale = Vector3.new(0.100000001, 0.800000012, 0.100000001),MeshId = "http://www.roblox.com/asset/?id=1082802",MeshType = Enum.MeshType.FileMesh,})


for _, v in pairs(Doll:GetChildren()) do
    if v:IsA'BasePart' then
    v.CanCollide = false
	end
end

for _, v in pairs(Needle:GetChildren()) do
    if v:IsA'BasePart' then
    v.CanCollide = false
	end
end


local NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance,parent)
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
end
local HW = NewInstance('Weld',char,{Part0=ra,Part1=Handle,C0 = CFrame.new(-.2,-.8,-.4)*CFrame.Angles(math.rad(-30),math.rad(220),math.rad(65))})

local HW2 = NewInstance('Weld',char,{Part0=la,Part1=Handle2,C0 = CFrame.new(0,-1,0)*CFrame.Angles(math.rad(0),math.rad(125),math.rad(90))})

-------------------------------------------------------
--Start Customization--
-------------------------------------------------------
local Player_Size = 1
if Player_Size ~= 1 then
root.Size = root.Size * Player_Size
tors.Size = tors.Size * Player_Size
hed.Size = hed.Size * Player_Size
ra.Size = ra.Size * Player_Size
la.Size = la.Size * Player_Size
rl.Size = rl.Size * Player_Size
ll.Size = ll.Size * Player_Size
----------------------------------------------------------------------------------
rootj.Parent = root
neck.Parent = tors
RW.Parent = tors
LW.Parent = tors
RH.Parent = tors
LH.Parent = tors
----------------------------------------------------------------------------------
rootj.C0 = RootCF * CF(0 * Player_Size, 0 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(0), Rad(0))
rootj.C1 = RootCF * CF(0 * Player_Size, 0 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(0), Rad(0))
neck.C0 = necko * CF(0 * Player_Size, 0 * Player_Size, 0 + ((1 * Player_Size) - 1)) * angles(Rad(0), Rad(0), Rad(0))
neck.C1 = CF(0 * Player_Size, -0.5 * Player_Size, 0 * Player_Size) * angles(Rad(-90), Rad(0), Rad(180))
RW.C0 = CF(1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(0), Rad(0)) --* RIGHTSHOULDERC0
LW.C0 = CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(0), Rad(0)) --* LEFTSHOULDERC0
----------------------------------------------------------------------------------
RH.C0 = CF(1 * Player_Size, -1 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(90), Rad(0)) * angles(Rad(0), Rad(0), Rad(0))
LH.C0 = CF(-1 * Player_Size, -1 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(-90), Rad(0)) * angles(Rad(0), Rad(0), Rad(0))
RH.C1 = CF(0.5 * Player_Size, 1 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(90), Rad(0)) * angles(Rad(0), Rad(0), Rad(0))
LH.C1 = CF(-0.5 * Player_Size, 1 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(-90), Rad(0)) * angles(Rad(0), Rad(0), Rad(0))
--hat.Parent = Character
end
----------------------------------------------------------------------------------
local SONG = 486598641
local SONG2 = 0
local Music = Instance.new("Sound",tors)
Music.Volume = 5
Music.Looped = true
Music.Pitch = 1 --Pitcher
----------------------------------------------------------------------------------
local equipped = false
local idle = 0
local change = 1
local val = 0
local toim = 0
local idleanim = 0.4
local sine = 0
local Sit = 1
----------------------------------------------------------------------------------
hum.WalkSpeed = 8
hum.JumpPower = 57
hum.Animator.Parent = nil
hed.face.Texture = "rbxassetid://138140944"
----------------------------------------------------------------------------------
for i = 1, 35 do
	local FACE = CreatePart(3, char, "Fabric", 0, 0+(i-1)/35.2, "Dark stone grey", "FaceGradient", Vector3.new(1.01,0.5,1.01),false)
	FACE.Color = Color3.new(0,0,0)
	hed:FindFirstChildOfClass("SpecialMesh"):Clone().Parent = FACE
	CreateWeldOrSnapOrMotor("Weld", hed, hed, FACE, CF(0,0.35-(i-1)/75,0), CF(0, 0, 0))
end
local LASTPART = hed
for i = 1, 42 do
	local MATH = (1-(i/30))
	if LASTPART == hed then
		local Horn = CreatePart(3, char, "SmoothPlastic", 0, 0, "Dirt brown", "Horn", Vector3.new(0.15*MATH,0.15,0.15*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LASTPART, LASTPART, Horn, CF(0.3, 0.7, -0.35) * angles(Rad(25), Rad(15), Rad(-15)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = Color3.new((i*2-2)/140,0,0)
	else
		local Horn = CreatePart(3, char, "SmoothPlastic", 0, 0, "Dirt brown", "Horn", Vector3.new(0.15*MATH,0.15,0.15*MATH),false)
		CreateWeldOrSnapOrMotor("Weld", LASTPART, LASTPART, Horn, CF(0, Horn.Size.Y/1.8, 0) * angles(Rad(6), Rad(-0.3), Rad(0)), CF(0, 0, 0))
		LASTPART = Horn
		Horn.Color = Color3.new((i*2-4)/140,0,0)
	end
end

-------------------------------------------------------
--End Customization--
-------------------------------------------------------


-------------------------------------------------------
--Start Attacks N Stuff--
-------------------------------------------------------

function dmg(dude)
if dude.Name ~= char then
dude:FindFirstChildOfClass("Humanoid").PlatformStand = true
local bgf = Instance.new("BodyGyro",dude.Head)
bgf.CFrame = bgf.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(-90),0,0)
local val = Instance.new("BoolValue",dude)
val.Name = "IsHit"
local torsy = dude:FindFirstChild("UpperTorso") or dude:FindFirstChild("Torso")
local partasdeff = Instance.new("ParticleEmitter",torsy)
partasdeff.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(.5, 0, 0))
partasdeff.LightEmission = .1
partasdeff.Size = NumberSequence.new(0.2)
partasdeff.Texture = "rbxassetid://771221224"
aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2),NumberSequenceKeypoint.new(1, 5)})
bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
partasdeff.Transparency = bbb
partasdeff.Size = aaa
partasdeff.ZOffset = .9
partasdeff.Acceleration = Vector3.new(0, -5, 0)
partasdeff.LockedToPart = false
partasdeff.EmissionDirection = "Back"
partasdeff.Lifetime = NumberRange.new(1, 2)
partasdeff.Rate = 1000
partasdeff.Rotation = NumberRange.new(-100, 100)
partasdeff.RotSpeed = NumberRange.new(-100, 100)
partasdeff.Speed = NumberRange.new(6)
partasdeff.VelocitySpread = 10000
partasdeff.Enabled=false
partasdeff:Emit(30)
coroutine.wrap(function()
targetted = nil
swait(30)
dude:BreakJoints()
Effects.Sphere.Create(BrickColor.new("Crimson"), dude.Torso.CFrame, 30, 30, 30, .5, .5, .5, 0.04)
swait(5)
dude:FindFirstChildOfClass("Humanoid"):Destroy()
for i=0,1,.05 do
for a,v in pairs(dude:GetChildren()) do
if v:IsA("BasePart") then
v.Transparency = 1
end
end
swait()
end
for a,v in pairs(dude:GetChildren()) do
if v:IsA("BasePart") and v:FindFirstChild("ParticleEmitter") then
v.ParticleEmitter.Enabled = false
end
game:service'Debris':AddItem(v,2)
end
end)()
end
end

--lazi
function kdown(dd)
if dd.Name ~= char then
dd.Humanoid.PlatformStand = true
local bgf = Instance.new("BodyGyro",dd.Head)
bgf.CFrame = bgf.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(-90),0,0)
local val = Instance.new("BoolValue",dd)
val.Name = "IsHit"
end
end

function mdmg(Part, Magnitude)--, MinimumDamage, MaximumDamage, KnockBack, Type, HitSound, HitPitch)
    --local buddy
	for _, c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Torso")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if mag <= Magnitude and c.Name ~= plr.Name then 
				if c.Name ~= char then
				if c.Name ~= "Creterisk" and c.Name ~= "Nebula_Zorua" and c.Name ~= "KillerDarkness0105" and c.Name ~= "XXUNORIBOASXX" then
			local asd = Instance.new("ParticleEmitter",c.Torso)
			asd.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(.5, 0, 0))
			asd.LightEmission = .1
			asd.Size = NumberSequence.new(0.2)
			asd.Texture = "http://www.roblox.com/asset/?ID=771221224"
			aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2),NumberSequenceKeypoint.new(1, 5)})
			bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
			asd.Transparency = bbb
			asd.Size = aaa
			asd.ZOffset = .9
			asd.Acceleration = Vector3.new(0, -5, 0)
			asd.LockedToPart = false
			asd.EmissionDirection = "Back"
			asd.Lifetime = NumberRange.new(1, 2)
			asd.Rate = 1000
			asd.Rotation = NumberRange.new(-100, 100)
			asd.RotSpeed = NumberRange.new(-100, 100)
			asd.Speed = NumberRange.new(6)
			asd.VelocitySpread = 10000
			asd.Enabled=true
					--Damage(head, head, MinimumDamage, MaximumDamage, KnockBack, Type, RootPart, .1, "rbxassetid://" .. HitSound, HitPitch)
					dmg(c)
					CFuncs["Sound"].Create("http://www.roblox.com/asset/?id=206082273", c.Torso, 1.2, .8)
					coroutine.wrap(function()
					wait(.2)
					asd.Enabled = false
					wait(2)
					asd:Remove()
					end)()
				       else
        CFuncs["Sound"].Create("http://www.roblox.com/asset/?id=240429289", c.Torso, 1.5, math.random(1,1.3))		
        Effects.Sphere.Create(BrickColor.new("Crimson"), c.Torso.CFrame, 30, 30, 30, .5, .5, .5, 0.04)

					end
				end
			end
		end
	end
	end
end

local sine=0
function targett()
if mouse.Target.Parent ~= char and mouse.Target.Parent.Parent ~= char and mouse.Target.Parent:FindFirstChild("Humanoid") ~= nil then
TargetSelect(mouse.Target.Parent)
CreateSound("743521450", char, 1, .8)
end
end

function HAAH()
	attack = true
	hum.WalkSpeed = 0
	Cso("300208779", hed, 10, 1)
	for i = 0,9,0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 2)) * angles(Rad(-30), Rad(0), Rad(0)), 0.15)
		tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-30 - 2.5 * Sin(sine / 2)), Rad(0), Rad(0)), 0.3)
		if Mrandom(1,15) == 1 then
		tors.Neck.C0 = clerp(tors.Neck.C0, necko * CF(0, 0, 0 + ((1) - 1)) * angles(Rad(Mrandom(-15,15)), Rad(Mrandom(-15,15)), Rad(Mrandom(-15,15))), 1)
		end
		RH.C0 = clerp(RH.C0, CF(1, -1 - 0.1 * Cos(sine / 2), 0.025 * Cos(sine / 2)) * RHCF * angles(Rad(-4.5 - 7.5 * Sin(sine / 2)), Rad(0), Rad(-30)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1, -1 - 0.1 * Cos(sine / 2), 0.025 * Cos(sine / 2)) * LHCF * angles(Rad(-6.5 - 7.5 * Sin(sine / 2)), Rad(0), Rad(30)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 2), 0.025 * Cos(sine / 2)) * angles(Rad(-35 - 7.5 * Sin(sine / 2)), Rad(0), Rad(15 - 7.5 * Sin(sine / 2))), 0.1)
		LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 2), 0.025 * Cos(sine / 2)) * angles(Rad(-35 - 7.5 * Sin(sine / 2)), Rad(0), Rad(-15 - 7.5 * Sin(sine / 2))), 0.1)
	end
	attack = false
	hum.WalkSpeed = 10
end

function doot_n_die()
    attack = true
    hum.WalkSpeed = 0
    if targetted.Name ~= "Creterisk" and targetted.Name ~= "XXUNORIBOASXX" and targetted.Name ~= "Nebula_Zorua" and targetted.Name ~= "KillerDarkness0105" then
        local torsy = targetted:FindFirstChild("UpperTorso") or targetted:FindFirstChild("Torso")
            local partasdeff = Instance.new("ParticleEmitter",torsy)
            partasdeff.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(.5, 0, 0))
            partasdeff.LightEmission = .1
            partasdeff.Size = NumberSequence.new(0.2)
            partasdeff.Texture = "http://www.roblox.com/asset/?ID=771221224"
            aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2),NumberSequenceKeypoint.new(1, 5)})
            bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
            partasdeff.Transparency = bbb
            partasdeff.Size = aaa
            partasdeff.ZOffset = .9
            partasdeff.Acceleration = Vector3.new(0, -5, 0)
            partasdeff.LockedToPart = false
            partasdeff.EmissionDirection = "Back"
            partasdeff.Lifetime = NumberRange.new(1, 2)
            partasdeff.Rate = 1000
            partasdeff.Rotation = NumberRange.new(-100, 100)
            partasdeff.RotSpeed = NumberRange.new(-100, 100)
            partasdeff.Speed = NumberRange.new(6)
            partasdeff.VelocitySpread = 10000
            partasdeff.Enabled=false
    for i = 0, 2.4, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(10), Rad(0), Rad(0)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(15), Rad(0), Rad(-25)), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.2 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.4, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(-15)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30),  -.3 + 0.025 * Cos(sine / 20)) * angles(Rad(175), Rad(0), Rad(20)), 0.1)
    end
    for i = 0, 1.4, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(10), Rad(0), Rad(0)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-15), Rad(0), Rad(-25)), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-50,50)), Rad(Mrandom(-50,50)), Rad(Mrandom(-50,50))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.2 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.4, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(85), Rad(0), Rad(-15)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30),  -.3 + 0.025 * Cos(sine / 20)) * angles(Rad(175), Rad(0), Rad(20)), 0.1)
    end
    dmg(targetted)
    partasdeff.Enabled=true
CreateSound("429400881", torsy, 10, .8)
    for i = 0, 1.4, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(10), Rad(0), Rad(0)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(15), Rad(0), Rad(-25)), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.2 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.4, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(-15)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-.4, 0.5 + 0.05 * Sin(sine / 30),  -.3 + 0.025 * Cos(sine / 20)) * angles(Rad(75), Rad(0), Rad(65)), 0.1)
    end
    partasdeff.Enabled=false
    for i = 0, 1.4, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(10), Rad(0), Rad(0)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-15), Rad(0), Rad(-25)), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.2 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.4, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(-15)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30),  -.3 + 0.025 * Cos(sine / 20)) * angles(Rad(175), Rad(0), Rad(20)), 0.1)
        end
    attack = false
    hum.WalkSpeed = 8
    elseif targetted.Name == "Creterisk" then
    for i = 0, 2.4, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(10), Rad(0), Rad(0)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(15), Rad(0), Rad(-25)), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.2 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.4, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(-15)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30),  -.3 + 0.025 * Cos(sine / 20)) * angles(Rad(175), Rad(0), Rad(20)), 0.1)
    end
    for i = 0, 2.4, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(10), Rad(0), Rad(0)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(15), Rad(0), Rad(-25 * Cos(sine / 20))), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.2 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.4, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(-15)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30),  -.3 + 0.025 * Cos(sine / 20)) * angles(Rad(0), Rad(0), Rad(-10)), 0.1)
    end
    coroutine.wrap(function()
    wait(2)
    --partasdeff:Remove()
    end)()
    local sel = Mrandom(1,3)
    if sel == 1 then   
    chatfunc("Damn, I am dumb.")
    elseif sel == 2 then   
    chatfunc("CREATOR, HELP ME.")
    elseif sel == 3 then
    chatfunc("Senpai, notice me.")
    end
    wait(2)
    hum.WalkSpeed = 8
    attack = false
    elseif targetted.Name == "XXUNORIBOASXX" then
        for i = 0, 2.4, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(10), Rad(0), Rad(0)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(15), Rad(0), Rad(-25)), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.2 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.4, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(-15)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30),  -.3 + 0.025 * Cos(sine / 20)) * angles(Rad(175), Rad(0), Rad(20)), 0.1)
    end
        for i = 0, 2.4, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(10), Rad(0), Rad(0)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(15), Rad(0), Rad(-25 * Cos(sine / 20))), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.2 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.4, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(-15)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30),  -.3 + 0.025 * Cos(sine / 20)) * angles(Rad(0), Rad(0), Rad(-10)), 0.1)
    end
    coroutine.wrap(function()
    wait(2)
    --partasdeff:Remove()
    end)()
    local sel = Mrandom(1,3)
    if sel == 1 then   
    chatfunc("HEHEHEHEHEHEHE")
    elseif sel == 2 then   
    chatfunc("ducc.")
    elseif sel == 3 then
    chatfunc("Excuse me what?")
    end
    wait(2)
    hum.WalkSpeed = 8
    attack = false
    elseif targetted.Name == "Nebula_Zorua" then
        for i = 0, 2.4, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(10), Rad(0), Rad(0)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(15), Rad(0), Rad(-25)), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.2 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.4, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(-15)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30),  -.3 + 0.025 * Cos(sine / 20)) * angles(Rad(175), Rad(0), Rad(20)), 0.1)
    end
        for i = 0, 2.4, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(10), Rad(0), Rad(0)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(15), Rad(0), Rad(-25 * Cos(sine / 20))), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.2 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.4, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(-15)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30),  -.3 + 0.025 * Cos(sine / 20)) * angles(Rad(0), Rad(0), Rad(-10)), 0.1)
    end
    coroutine.wrap(function()
    wait(2)
    --partasdeff:Remove()
    end)()
    local sel = Mrandom(1,3)
    if sel == 1 then   
    chatfunc("floof.")
    elseif sel == 2 then   
    chatfunc("Wh-what?")
    elseif sel == 3 then
    chatfunc("I have mistaken..")
    end
    wait(2)
    hum.WalkSpeed = 8
    attack = false
    elseif targetted.Name == "KillerDarkness0105" then
        for i = 0, 2.4, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(10), Rad(0), Rad(0)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(15), Rad(0), Rad(-25)), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.2 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.4, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(-15)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30),  -.3 + 0.025 * Cos(sine / 20)) * angles(Rad(175), Rad(0), Rad(20)), 0.1)
    end
        for i = 0, 2.4, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(10), Rad(0), Rad(0)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(15), Rad(0), Rad(-25 * Cos(sine / 20))), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), -.2 + 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.4, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(-15)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30),  -.3 + 0.025 * Cos(sine / 20)) * angles(Rad(0), Rad(0), Rad(-10)), 0.1)
    end
    coroutine.wrap(function()
    wait(2)
    --partasdeff:Remove()
    end)()
    local sel = Mrandom(1,3)
    if sel == 1 then   
    chatfunc("Gale Fighter was a nice script, after all.")
    elseif sel == 2 then   
    chatfunc("Ding dong, bing bong.")
    elseif sel == 3 then
    chatfunc("hehe.. hehehe..")
    end
    wait(2)
    hum.WalkSpeed = 8
    attack = false
    end
end
 
function doot_die_pls()
    attack = true
    hum.WalkSpeed = 0
    local torsy = targetted:FindFirstChild("UpperTorso") or targetted:FindFirstChild("Torso")
    for i = 0, 2, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(10), Rad(0), Rad(25)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(0), Rad(0), Rad(0)), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-10)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(10)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(0), Rad(0), Rad(-10)), 0.1)
        end
    coroutine.resume(coroutine.create(function()
        for i = 1,10 do
            swait()
        local Pully = Create("BodyPosition")({
            P = 9000,
            D = 1000,
            maxForce = Vector3.new(math.huge, math.huge, math.huge),
            position = ra.Position - ra.CFrame.lookVector * 6,
            Parent = torsy
          })
          game:GetService("Debris"):AddItem(Pully, 0.2)
          wait()
        end
    end))
    CreateSound("541909814", torsy, 10, 1)
    CreateSound("131228548", hed, 10, 1)
    for i = 0, 2.2, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(0), Rad(0), Rad(-35)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(0), Rad(0), Rad(35)), 0.3)
        if Mrandom(1,15) == 1 then
            tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20)), Rad(Mrandom(-20,20))), 0.3)
        end
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(17), Rad(-10)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(-0)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(90), Rad(0), Rad(5)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(40), Rad(0), Rad(-5)), 0.1)
        end
    attack = false
    hum.WalkSpeed = 8
end
 
code = 1678 --jk it doesnt work

function abc()
    thing = true
    chatfunc("WHY...")
    wait(0.85)
    chatfunc("WHY?!")
    wait(1)
    chatfunc("WHY MUST MY LIFE BE LIKE THIS?! I can't.. take it anymore...")
    wait(1)
    Music:Stop()
    attack = true
    hum.WalkSpeed = 0
    hum.JumpPower = 0
    for i = 0,6,0.1 do
	swait()
	rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1) * angles(Rad(0), Rad(0), Rad(0)), 0.15)
	tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(0), Rad(0), Rad(0)), 0.3)
	RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 , 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(0)), 0.15)
	LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 , 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(0)), 0.15)
	RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(0), Rad(0), Rad(5)), 0.1)
	LW.C0 = clerp(LW.C0, CF(-1.3, 0.8 + 0.05 * Sin(sine / 30), -0.025 * Cos(sine / 20)) * angles(Rad(140), Rad(0), Rad(15)), 0.1)
    end
    CreateSound("1093102664", hed, 10, 1)
    for _, v in pairs(Needle:GetChildren()) do
    if v:IsA'BasePart' then
     v:Remove()
    end
    end
    for i = 0,4,0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1) * angles(Rad(5), Rad(0), Rad(0)), 0.15)
        tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(5), Rad(0), Rad(0)), 0.4)
        RH.C0 = clerp(RH.C0, CF(1, -0.9 - 0.1 , 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-2.5), Rad(0), Rad(0)), 0.15)
        LH.C0 = clerp(LH.C0, CF(-1, -0.9 - 0.1 , 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-2.5), Rad(0), Rad(0)), 0.15)
        RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(0), Rad(0), Rad(5)), 0.1)
        LW.C0 = clerp(LW.C0, CF(-1.3, 0.8 + 0.05 * Sin(sine / 30), -0.025 * Cos(sine / 20)) * angles(Rad(40), Rad(0), Rad(40)), 0.4)
    end
    for i = 0,6,0.1 do
        swait()
	rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -1.4 + 0.1 * Cos(sine / 20)) * angles(Rad(45), Rad(0), Rad(0)), 0.15)
	tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(35), Rad(0), Rad(0)), 0.3)
	RH.C0 = clerp(RH.C0, CF(1, .4 - 0.1 * Cos(sine / 20), -.6 + 0.025 * Cos(sine / 20)) * RHCF * angles(Rad(-5), Rad(0), Rad(45)), 0.15)
	LH.C0 = clerp(LH.C0, CF(-1, -0.6 - 0.1 * Cos(sine / 20), 0.025 * Cos(sine / 20)) * LHCF * angles(Rad(-5), Rad(0), Rad(-0)), 0.15)
	RW.C0 = clerp(RW.C0, CF(1.5, 0.1 + 0.05 * Sin(sine / 30), -.4 + 0.025 * Cos(sine / 20)) * angles(Rad(65), Rad(0), Rad(25)), 0.1)
	LW.C0 = clerp(LW.C0, CF(-1.5, 0.1 + 0.05 * Sin(sine / 30), -.4 + 0.025 * Cos(sine / 20)) * angles(Rad(65), Rad(0), Rad(-25)), 0.1)
    end
    for i = 0,6,0.1 do
	swait()
	rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -3 + 0.1) * angles(Rad(90), Rad(0), Rad(0)), 0.15)
	tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-30 - 2.5 * Sin(sine / 20)), Rad(0), Rad(0)), 0.3)
	RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(0), Rad(80), Rad(0)) * angles(Rad(-6.5), Rad(0), Rad(0)), 0.08)
	LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(0), Rad(-80), Rad(0)) * angles(Rad(-6.5), Rad(0), Rad(0)), 0.08)
	RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 20), 0.025 * Cos(sine / 20)) * angles(Rad(200), Rad(0), Rad(25 - 2.5 * Sin(sine / 20))), 0.1)
	LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.02 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(20), Rad(0 - 4.5 * Sin(sine / 20)), Rad(-13)), 0.1)
   end
Anchor()
    wait(2)
   chatfunc("I hope I never see you again..")
   wait(1)
   dmg(char)
print("It seems you've died! CONGRATS!")
    for _, v in pairs(Doll:GetChildren()) do
    if v:IsA'BasePart' then
    v:Remove()
    end
    end
thing = false
end

csosoundyi = Instance.new("Sound", hed)
csosoundyi.SoundId = "rbxassetid://178038408"
csosoundyi.Volume = 10
csosoundyi.Pitch = 1

function HAAH()
	attack = true
	hum.WalkSpeed = 0
	csosoundyi:Play()
	repeat
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 2)) * angles(Rad(-30), Rad(0), Rad(0)), 0.15)
		tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-30 - 2.5 * Sin(sine / 2)), Rad(0), Rad(0)), 0.3)
		if Mrandom(1,15) == 1 then
		tors.Neck.C0 = clerp(tors.Neck.C0, necko * CF(0, 0, 0 + ((1) - 1)) * angles(Rad(Mrandom(-15,15)), Rad(Mrandom(-15,15)), Rad(Mrandom(-15,15))), 1)
		end
		RH.C0 = clerp(RH.C0, CF(1, -1 - 0.1 * Cos(sine / 2), 0.025 * Cos(sine / 2)) * RHCF * angles(Rad(-4.5 - 7.5 * Sin(sine / 2)), Rad(0), Rad(-30)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1, -1 - 0.1 * Cos(sine / 2), 0.025 * Cos(sine / 2)) * LHCF * angles(Rad(-6.5 - 7.5 * Sin(sine / 2)), Rad(0), Rad(30)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 2), 0.025 * Cos(sine / 2)) * angles(Rad(-35 - 7.5 * Sin(sine / 2)), Rad(0), Rad(15 - 7.5 * Sin(sine / 2))), 0.1)
		LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 2), 0.025 * Cos(sine / 2)) * angles(Rad(-35 - 7.5 * Sin(sine / 2)), Rad(0), Rad(-15 - 7.5 * Sin(sine / 2))), 0.1)
	until csosoundyi.Playing == false
	attack = false
	hum.WalkSpeed = 10
end

thing = false

mouse.Button1Down:connect(function()
    if attack == false and targetted ~= nil and thing == false then
        doot_n_die()
	GlowParticle.Enabled = false
    end
end)

mouse.KeyDown:connect(function(key)
if attack == false then
    if key == 'q' and thing == false then
        targett()
    elseif key == 'x' and targetted ~= nil and thing == false then
        doot_die_pls()
    elseif key == 'r' and targetted ~= nil and thing == false then
        CreateSound("174271590", hed, .4, math.random(5, 15) / 5)
        root.CFrame = targetted.Head.CFrame * CFrame.new(0, 0, 6)
    elseif key == 'p' then
        abc()
    elseif key == 't' and thing == false then
	HAAH()
        end
    end
end)

-------------------------------------------------------
--End Attacks N Stuff--
-------------------------------------------------------


 






-------------------------------------------------------
--Start Animations--
-------------------------------------------------------
print("By Makhail07, FINISHED BY XXUNORIBOASXX >:D")
Music.SoundId = "rbxassetid://"..SONG
Music.Looped = true
Music.Pitch = 1
Music.Volume = 2
Music.Parent = char
Music:Resume()
--AAAAAAAAAAAAAAAA
while true do
	swait()
	sine = sine + change
	local torvel = (root.Velocity * Vector3.new(1, 0, 1)).magnitude
	local velderp = root.Velocity.y
	hitfloor, posfloor = rayCast(root.Position, CFrame.new(root.Position, root.Position - Vector3.new(0, 1, 0)).lookVector, 4* Player_Size, char)
	if equipped == true or equipped == false then
		if attack == false then
			idle = idle + 1
		else
			idle = 0
		end
		if 1 < root.Velocity.y and hitfloor == nil then
			Anim = "Jump"
			if attack == false then
				rootj.C0 = clerp(rootj.C0, RootCF * CF(0* Player_Size, 0* Player_Size, -0.1 + 0.1 * Cos(sine / 20)* Player_Size) * angles(Rad(10), Rad(0), Rad(0)), 0.15)
				neck.C0 = clerp(neck.C0, necko* CF(0, 0, 0 + ((1* Player_Size) - 1)) * angles(Rad(-10 - 2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
				RH.C0 = clerp(RH.C0, CF(1* Player_Size, -.2 - 0.1 * Cos(sine / 20), -.3* Player_Size) * RHCF * angles(Rad(-2.5), Rad(0), Rad(0)), 0.15)
				LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.9 - 0.1 * Cos(sine / 20), 0* Player_Size) * LHCF * angles(Rad(-2.5), Rad(0), Rad(0)), 0.15)
				RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.02 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(0), Rad(-.6), Rad(13 + 4.5 * Sin(sine / 20))), 0.1)
				LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.02 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(0), Rad(-.6), Rad(-13 - 4.5 * Sin(sine / 20))), 0.1)
			end
		elseif -1 > root.Velocity.y and hitfloor == nil then
			Anim = "Fall"
			if attack == false then
				rootj.C0 = clerp(rootj.C0, RootCF * CF(0* Player_Size, 0* Player_Size, -0.1 + 0.1 * Cos(sine / 20)* Player_Size) * angles(Rad(-10), Rad(0), Rad(0)), 0.15)
				neck.C0 = clerp(neck.C0, necko* CF(0, 0, 0 + ((1* Player_Size) - 1)) * angles(Rad(35 - 2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
				RH.C0 = clerp(RH.C0, CF(1* Player_Size, -1 - 0.1 * Cos(sine / 20)* Player_Size, -.3* Player_Size) * RHCF * angles(Rad(-3.5), Rad(0), Rad(0)), 0.15)
				LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -.8 - 0.1 * Cos(sine / 20)* Player_Size, -.3* Player_Size) * LHCF * angles(Rad(-8.5), Rad(0), Rad(0)), 0.15)
				RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.02 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(0), Rad(-.6), Rad(165 + 4.5 * Sin(sine / 20))), 0.1)
				LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.02 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(0), Rad(-.6), Rad(-165 - 4.5 * Sin(sine / 20))), 0.1)
			end
		elseif torvel < 1 and hitfloor ~= nil then
			Anim = "Idle"
			change = 1
			if attack == false then
				HeadTwitch = false
				rootj.C0 = clerp(rootj.C0, RootCF * CF(0* Player_Size, 0* Player_Size, -0.1 + 0.1* Player_Size * Cos(sine / 20)) * angles(Rad(20), Rad(0), Rad(0)), 0.15)
				tors.Neck.C0 = clerp(tors.Neck.C0, necko* CF(0, 0, 0 + ((1* Player_Size) - 1)) * angles(Rad(25 - 2.5 * Sin(sine / 30)), Rad(0), Rad(-20 + 2 * Cos(sine / .25))), 0.3)
				RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, -0.1* Player_Size) * angles(Rad(0), Rad(85), Rad(0)) * angles(Rad(-9.5), Rad(0), Rad(20)), 0.15)
				LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, -0.1* Player_Size) * angles(Rad(0), Rad(-85), Rad(0)) * angles(Rad(-9.5), Rad(0), Rad(-20)), 0.15)
				RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.02 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(75), Rad(5), Rad(13)), 0.1)
				LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.02 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(20), Rad(0 - 4.5 * Sin(sine / 20)), Rad(-13)), 0.1)
				if HeadTwitch == false and Mrandom(1, 25) == 1 then
					tors.Neck.C0 = clerp(tors.Neck.C0, necko* CF(0, 0, 0 + ((1* Player_Size) - 1)) * angles(Rad(Mrandom(-90, 90)), Rad(Mrandom(-90, 90)), Rad(Mrandom(-90, 90))), 0.15)
				end
			end
		elseif torvel < 50 and hitfloor ~= nil then
			Anim = "Walk"
			change = 1
			if attack == false then
				rootj.C0 = clerp(rootj.C0, RootCF * CF(0* Player_Size, 0* Player_Size, -0.175 + 0.025 * Cos(sine / 3.5) + -Sin(sine / 3.5) / 7* Player_Size) * angles(Rad(3 - 2.5 * Cos(sine / 3.5)), Rad(0) - root.RotVelocity.Y / 75, Rad(8 * Cos(sine / 7))), 0.15)
				tors.Neck.C0 = clerp(tors.Neck.C0, necko* CF(0, 0, 0 + ((1* Player_Size) - 1)) * angles(Rad(25 - 2.5 * Sin(sine / 7)), Rad(0), Rad(0) - hed.RotVelocity.Y / 15), 0.3)
				RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.8 - 0.5 * Cos(sine / 7) / 2* Player_Size, 0.6 * Cos(sine / 7) / 2* Player_Size)  * angles(Rad(-10 - 25 * Cos(sine / 7)) - rl.RotVelocity.Y / 75 + -Sin(sine / 7) / 2.5, Rad(90 - 10 * Cos(sine / 7)), Rad(0)) * angles(Rad(0 + 2 * Cos(sine / 7)), Rad(0), Rad(0)), 0.3)
         		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.8 + 0.5 * Cos(sine / 7) / 2* Player_Size, -0.6 * Cos(sine / 7) / 2* Player_Size) * angles(Rad(-10 + 25 * Cos(sine / 7)) + ll.RotVelocity.Y / 75 + Sin(sine / 7) / 2.5, Rad(-90 - 10 * Cos(sine / 7)), Rad(0)) * angles(Rad(0 - 2 * Cos(sine / 7)), Rad(0), Rad(0)), 0.3)
				RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.05 * Sin(sine / 7)* Player_Size, 0* Player_Size) * angles(Rad(75)  , Rad(8 * Cos(sine / 7)), Rad(6) - ra.RotVelocity.Y / 75), 0.1)
				LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.05 * Sin(sine / 7)* Player_Size, 0* Player_Size) * angles(Rad(-37)  * Cos(sine / 7) , Rad(8 * Cos(sine / 7)) ,	Rad(-6) + la.RotVelocity.Y / 75), 0.1)
			end
		end
	end
	if 0 < #Effects then
		for e = 1, #Effects do
			if Effects[e] ~= nil then
				local Thing = Effects[e]
				if Thing ~= nil then
					local Part = Thing[1]
					local Mode = Thing[2]
					local Delay = Thing[3]
					local IncX = Thing[4]
					local IncY = Thing[5]
					local IncZ = Thing[6]
					if 1 >= Thing[1].Transparency then
						if Thing[2] == "Block1" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block2" then
							Thing[1].CFrame = Thing[1].CFrame + Vector3.new(0, 0, 0)
							local Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block3" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50)) + Vector3.new(0, 0.15, 0)
							local Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Cylinder" then
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Blood" then
							local Mesh = Thing[7]
							Thing[1].CFrame = Thing[1].CFrame * Vector3.new(0, 0.5, 0)
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Elec" then
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[7], Thing[8], Thing[9])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Disappear" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Shatter" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							Thing[4] = Thing[4] * CFrame.new(0, Thing[7], 0)
							Thing[1].CFrame = Thing[4] * CFrame.fromEulerAnglesXYZ(Thing[6], 0, 0)
							Thing[6] = Thing[6] + Thing[5]
						end
					else
						Part.Parent = nil
						table.remove(Effects, e)
					end
				end
			end
		end
	end
end
--[[
	A bit of lore for those who are wondering :
	
	Micheal (Voodoo Child) was born in a lone village with his sister, father, and mother
	his mother died when he was age 6 and felt that it was his fault she died, as though it was not.
	The village whereabouts was in a forest that some named "The Dead Woods" for whoever went in there,
	never came back.
	A few years past after the death and funeral of his mother, his sister caught a deadly disease, the guilt he felt
	like he did from his mother came upon him once again, for this time was his fault, as they were playing near the oaks of hell,
	which can give others an un-curable sickness or instant death, his sister got the worse fate.
	The only cure known is to get herbs from the witch of the dead woods and do her deeds, but as others know
	those who enter never return, but he was a brave boy and set out to find the witch, his father worried forced him not to go,
	But during the night he snuck out of his home and went...
	His adventure began but not for long as he already saw a hut above, he knocks on the door and waits for a respond,
	nothing.
	After some time the door finally opened and there she was the horrible wrinkle faced creature, he spoke
	"Ma-May I have some of your herbs so I may heal my sister?"
	The witch replied, "Yes you may my little child, but only on one condition, you must do 5 ta-" Micheal cuts her off.
	"I DON'T WANT TO DO ANY TASK I JUST WISH TO SAVE MY SISTER, so please only this once?"
	The witches anger grew, she's never been interrupted, and she knew what she must do.
	"YOU DARE CUT OFF THE SACRED WORDS OF ME? I SHALL CURSE YOU WITH THE SOULS OF THE INNOCENT!" She screamed.
	Micheal terrified, a storm brew, and the witches words could be heard from echoes from every angle, lightning strikes trees and rain pours down,
	covering his head, closing his eyes, and putting himself into a ball, after time everything stopped.
	He looked up cautiously, looking around up and finally down, he sees a pin, and a doll. He bends down and grabs them both,
	looking at them he remembers that he didn't get any herbs but he didn't have enough time he quickly ran back to the village and put both the pin and doll into his pockets...
	
	He was already to late. His sister passed away he bent to his knees and cried, some sang and others left and cried.
	He pulled the doll and pin, from his pocket and laid it on her body and went to his room.
	Moving he gets pinned and looks behind him, the doll and pin... he was terrified, he couldn't say a word and couldn't scream, he passes out.
	Waking up he notices his home and village into shambles, dead ones laying everywhere.
	T O B E C O N T I N U E D !
also there's a code in the script which i have hidden, if you say it in chat it'll say something
--]]
-------------------------------------------------------
--End Animations And Script--
-------------------------------------------------------