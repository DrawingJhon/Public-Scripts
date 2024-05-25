local beta_control = false

local speed = 1
local sine = 1
local srv = game:GetService('RunService')

local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character.Humanoid
local torso = character.Torso
character.HumanoidRootPart:Destroy()

pcall(function()
	character.Animate.Disabled = true
end)

for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
	track:Stop()
end

humanoid:ChangeState(16)

for _, child in pairs(character:GetChildren()) do
	if child:IsA("Tool") then
		child.Parent = player:FindFirstChildOfClass("Backpack")
	end
end

local parts = character:GetDescendants()
local actived = false

local netless = game:GetService("RunService").Heartbeat:Connect(function()
	if not actived then return end
	for i, v in pairs(parts) do
		if v:IsA("BasePart") then
			v.AssemblyLinearVelocity = Vector3.new(-30,0,0)
		end
	end
	sethiddenproperty(player,"MaximumSimulationRadius",math.huge)
	sethiddenproperty(player,"SimulationRadius",999999999)
end)

local lastPos = torso.Position

local noclip; noclip = game:GetService("RunService").Stepped:Connect(function()
	if not character:IsDescendantOf(workspace) then
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

local second_char = Instance.new("Model", workspace)
local second_root = Instance.new("Part", second_char)
second_root.Name = "HumanoidRootPart"
second_root.Size = Vector3.new(2, 2, 1)
second_root.Position = torso.Position
second_root.CanCollide = false
second_root.Transparency =  0.9
local second_torso = second_root:Clone()
second_torso.Name = "Torso"
second_torso.Transparency = 1
local weld = Instance.new("Weld", second_torso)
weld.Part0 = second_torso
weld.Part1 = second_root
weld.C0 = CFrame.new(0, 1, 0)
second_torso.Parent = second_char
second_torso.Massless = true
local second_rarm = Instance.new("Part", second_char)
second_rarm.Name = "Right Arm"
second_rarm.CanCollide = false
second_rarm.Transparency = 1
second_rarm.Massless = true
second_rarm.Size = Vector3.new(1, 2, 1)
local motor = Instance.new("Motor6D", second_torso)
motor.Part0 = second_torso
motor.Part1 = second_rarm
motor.C0 = CFrame.new(1, 1, 0)
motor.Name = "Right Shoulder"
local second_humanoid = Instance.new("Humanoid", second_char)
second_humanoid.HipHeight = 2
second_humanoid.AutoJumpEnabled = false

local cn; cn = second_humanoid.Died:Connect(function()
	player.Character = character
	HumanDied = true
	second_char:Destroy()
	netless:Disconnect()	
	--root:ClearAllChildren()
	--root.CFrame = CFrame.new(0, workspace.FallenPartsDestroyHeight + 5, 0)
	character:BreakJoints()
	cn:Disconnect()
end)

character.Changed:Connect(function()
	if not character:IsDescendantOf(workspace) then
		HumanDied = true
		second_char:Destroy()
	end
end)

function create(weld)
	local part = weld.Part1
	local att0 = Instance.new("Attachment", part)
	local att1 = Instance.new("Attachment", second_torso)
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

wait()

local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = Vector3.new()
bv.Parent = torso
torso.CanCollide = false

spawn(function()
	torso.CFrame = CFrame.new(lastPos) * CFrame.new(0, -10, 0)
end)

m=game.Players.LocalPlayer:GetMouse()
RJ = {C0 = CFrame.new(); C1 = CFrame.new()}
RS = create(character.Torso['Right Shoulder'])
LS = create(character.Torso['Left Shoulder'])
RH = create(character.Torso['Right Hip'])
LH = create(character.Torso['Left Hip'])
ROOT = second_root
NECK = {C0 = CFrame.new(); C1 = CFrame.new()}
NECK.C0 = CFrame.new(0,1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
NECK.C1 = CFrame.new(0,-0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
RJ.C1 = CFrame.new(0,-1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
RJ.C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
RS.C1 = CFrame.new(0,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
LS.C1 = CFrame.new(0,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
RH.C1 = CFrame.new(0,1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
LH.C1 = CFrame.new(0,1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
RH.C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
LH.C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
RS.C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
LS.C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))

--second_root.Position = lastPos + Vector3.new(0, 3, 0)

if not beta_control then
	player.Character = second_char
else
	local mover; mover = game:GetService("RunService").RenderStepped:Connect(function()
		if not character:IsDescendantOf(workspace) or humanoid.Health <= 0 then
			mover:Disconnect()
			return
		end
		
		pcall(function()
			second_humanoid:Move(humanoid.MoveDirection)
			second_humanoid.Jump = humanoid.Jump
		end)
	end)
end
	
workspace.CurrentCamera.CameraSubject = second_humanoid

wait()

actived = true

coroutine.wrap(function()
	while true do -- anim changer
		if HumanDied then break end
		sine = sine + speed
		if second_humanoid.Jump then -- jump
			NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),2.54+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),0+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.76+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2.83+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-4.44+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2)
		elseif ROOT.Velocity.y < -1 and second_humanoid.Jump then -- fall
			NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),2.54+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),0+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.76+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2.83+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-4.44+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2)
		elseif ROOT.Velocity.Magnitude < 2 then -- idle
			NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(120.21+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),1.47+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),2.9+0*math.cos(sine/10))*CFrame.Angles(math.rad(242.48+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+5.58*math.cos(sine/10))),.2) 
			LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-0.68+0*math.cos(sine/10),4.69+0*math.cos(sine/10))*CFrame.Angles(math.rad(219.55+13.23*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+59.08*math.cos(sine/10))),.2)
		elseif ROOT.Velocity.Magnitude < 20 then -- walk
			NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(120.21+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),1.47+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),2.9+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+2*math.cos(sine/10))),.2) 
			LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),4.69+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+-2.06*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+28.51*math.cos(sine/10))),.2)
		elseif ROOT.Velocity.Magnitude > 20 then -- run
			NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RS.C0=RS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),0.93+0*math.cos(sine/10))*CFrame.Angles(math.rad(120.21+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			LS.C0=LS.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),1.47+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
			RH.C0=RH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),2.9+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+2*math.cos(sine/10))),.2) 
			LH.C0=LH.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1.5+0*math.cos(sine/10),4.69+0*math.cos(sine/10))*CFrame.Angles(math.rad(270+-2.06*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+28.51*math.cos(sine/10))),.2)
		end
		
		srv.RenderStepped:Wait()
	end
	second_char:Destroy()
end)()
--Created using Nexo Animator V4