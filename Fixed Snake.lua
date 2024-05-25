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

speed = 1
sine = 1
srv = game:GetService('RunService')

local plr = game.Players.LocalPlayer
reanim = plr.Character

reanim.Animate.Disabled = true

for i, v in pairs(reanim.Humanoid:GetPlayingAnimationTracks()) do
	v:Stop()
end

for _, child in pairs(reanim:GetChildren()) do
	if child:IsA("Tool") then
		child.Parent = plr:FindFirstChildOfClass("Backpack")
	end
end

local parts = reanim:GetDescendants()
local actived = false

local netless = game:GetService("RunService").Heartbeat:Connect(function()
	if not actived then return end
    for i, v in pairs(parts) do
        if v:IsA("BasePart") then
            v.AssemblyLinearVelocity = Vector3.new(-30,0,0)
        end
    end
    sethiddenproperty(plr,"MaximumSimulationRadius",math.huge)
    sethiddenproperty(plr,"SimulationRadius",999999999)
end)

local noclip; noclip = game:GetService("RunService").Stepped:Connect(function()
	if not reanim:IsDescendantOf(workspace) then
		noclip:Disconnect()
		return
	end
	for i, v in pairs(parts) do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end
	end
end)

local uis = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer

local HumanDied = false

local model = Instance.new("Model", workspace)
local root = Instance.new("Part", model)
root.Name = "HumanoidRootPart"
root.Size = Vector3.new(2, 2, 1)
root.Position = reanim.HumanoidRootPart.Position
root.CanCollide = false
root.Transparency =  0.9
local torso = root:Clone()
torso.Name = "Torso"
torso.Transparency = 1
local weld = Instance.new("Weld", torso)
weld.Part0 = torso
weld.Part1 = root
weld.C0 = CFrame.new(0, -2, 0)
torso.Parent = model
torso.Massless = true
local rarm = Instance.new("Part", model)
rarm.Name = "Right Arm"
rarm.CanCollide = false
rarm.Transparency = 1
rarm.Massless = true
rarm.Size = Vector3.new(1, 2, 1)
local motor = Instance.new("Motor6D", torso)
motor.Part0 = torso
motor.Part1 = rarm
motor.C0 = CFrame.new(1, 1, 0)
motor.Name = "Right Shoulder"
local hum = Instance.new("Humanoid", model)
hum.HipHeight = 2
hum.AutoJumpEnabled = false

local cn; cn = hum.Died:Connect(function()
	print("Dead")
	plr.Character = reanim
	HumanDied = true
	model:Destroy()
	netless:Disconnect()
	plr.Character:BreakJoints()
	cn:Disconnect()
end)

reanim.Changed:Connect(function()
	if not reanim:IsDescendantOf(workspace) then
		HumanDied = true
		model:Destroy()
	end
end)

function create(weld)
	print(weld.Part1)
	local part = weld.Part1
	local att0 = Instance.new("Attachment", part)
	local att1 = Instance.new("Attachment", torso)
	local alignPos = Instance.new("AlignPosition", part)
	local alignOr = Instance.new("AlignOrientation", part)

	alignPos.Attachment0 = att0
    alignPos.Attachment1 = att1
    alignPos.MaxForce = 999999999
    alignPos.MaxVelocity = math.huge
    alignPos.ReactionForceEnabled = false
    alignPos.Responsiveness = math.huge
    alignPos.RigidityEnabled = false
	alignPos.Mode = "TwoAttachment"
 
    alignOr.Attachment0 = att0
    alignOr.Attachment1 = att1
    alignOr.Responsiveness = math.huge
    alignOr.MaxTorque = 999999999
	alignOr.Mode = "TwoAttachment"

	weld:Destroy()
	--table.insert(parts, part)

	return setmetatable({}, {
		__index = function(self, index)
			if index == "C1" then
				return att0.CFrame
			elseif index == "C0" then
				return att1.CFrame
			end
			return weld[index]
		end,
		__newindex = function(self, index, value)
			if index == "C1" then
				att0.CFrame = value
			elseif index == "C0" then
				att1.CFrame = value
			else
				weld[index] = value
			end
		end
	})
end

Root = reanim.HumanoidRootPart
Root.CanCollide = false

local lastPos = Root.Position

wait()

local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = Vector3.new()
bv.Parent = Root
--reanim:PivotTo(reanim:GetPivot() * CFrame.new(0, -10, 0))
Root.CFrame = CFrame.new(lastPos) * CFrame.new(0, -10, 0)

m=game.Players.LocalPlayer:GetMouse()
RJ = {C0 = CFrame.new(); C1 = CFrame.new()}
RS = create(reanim.Torso['Right Shoulder'])
LS = create(reanim.Torso['Left Shoulder'])
RH = create(reanim.Torso['Right Hip'])
LH = create(reanim.Torso['Left Hip'])
NECK = {C0 = CFrame.new(); C1 = CFrame.new()}
Root = reanim.HumanoidRootPart
NECK = reanim.Torso.Neck
NECK.C0 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
NECK.C1 = CF(0,-0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RJ.C1 = CF(0,-1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RJ.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))

root.Position = lastPos + Vector3.new(0, 3, 0)
player.Character = model
workspace.CurrentCamera.CameraSubject = hum

wait()

actived = true

local Root = root

coroutine.wrap(function()
while true do -- anim changer
if HumanDied then break end
sine = sine + speed
local rlegray = Ray.new(reanim["Right Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, char)
local llegray = Ray.new(reanim["Left Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, char)
local rightvector = (Root.Velocity * Root.CFrame.rightVector).X + (Root.Velocity * Root.CFrame.rightVector).Z
local lookvector = (Root.Velocity * Root.CFrame.lookVector).X + (Root.Velocity * Root.CFrame.lookVector).Z
if lookvector > hum.WalkSpeed then
lookvector = hum.WalkSpeed
end
if lookvector < -hum.WalkSpeed then
lookvector = -hum.WalkSpeed
end
if rightvector > hum.WalkSpeed then
rightvector = hum.WalkSpeed
end
if rightvector < -hum.WalkSpeed then
rightvector = -hum.WalkSpeed
end
local lookvel = lookvector / hum.WalkSpeed
local rightvel = rightvector / hum.WalkSpeed
if hum.Jump then -- jump
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),2.54+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),0+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.76+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2.83+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-4.44+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2)
elseif Root.Velocity.y < -1 and hum.Jump then -- fall
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),2.54+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),0+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.76+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2.83+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-4.44+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2)
elseif Root.Velocity.Magnitude < 2 then -- idle
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(120.21+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),1.47+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),2.9+0*math.cos(sine/10))*CFrame.Angles(math.rad(242.48+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+5.58*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-0.68+0*math.cos(sine/10),4.69+0*math.cos(sine/10))*CFrame.Angles(math.rad(219.55+13.23*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+59.08*math.cos(sine/10))),.2)
elseif Root.Velocity.Magnitude < 20 then -- walk
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(120.21+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),1.47+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),2.9+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+2*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),4.69+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+-2.06*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+28.51*math.cos(sine/10))),.2)
elseif Root.Velocity.Magnitude > 20 then -- run
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(120.21+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),1.47+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),2.9+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+2*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),4.69+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+-2.06*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+28.51*math.cos(sine/10))),.2)
end
srv.RenderStepped:Wait()
end
model:Destroy()
end)()
--Created using Nexo Animator V4