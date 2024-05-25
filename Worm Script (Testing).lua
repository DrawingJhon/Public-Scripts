HumanDied = false for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do if v:IsA("BasePart") then  _G.netless=game:GetService("RunService").Heartbeat:connect(function() v.AssemblyLinearVelocity = Vector3.new(-30,0,0) sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge) sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",999999999) end) end end  local plr = game.Players.LocalPlayer local char = plr.Character local srv = game:GetService('RunService') local ct = {}  char.Archivable = true local reanim = char:Clone() reanim.Name = 'Nexo '..plr.Name..'' fl=Instance.new('Folder',char) fl.Name ='Nexo' reanim.Animate.Disabled=true char.HumanoidRootPart:Destroy() char.Humanoid:ChangeState(16)  for i,v in next, char.Humanoid:GetPlayingAnimationTracks() do v:Stop() end char.Animate:Remove()  function create(part, parent, p, r) Instance.new("Attachment",part) Instance.new("AlignPosition",part) Instance.new("AlignOrientation",part) Instance.new("Attachment",parent) part.Attachment.Name = part.Name parent.Attachment.Name = part.Name part.AlignPosition.Attachment0 = part[part.Name] part.AlignOrientation.Attachment0 = part[part.Name] part.AlignPosition.Attachment1 = parent[part.Name] part.AlignOrientation.Attachment1 = parent[part.Name] parent[part.Name].Position = p or Vector3.new() part[part.Name].Orientation = r or Vector3.new() part.AlignPosition.MaxForce = 999999999 part.AlignPosition.MaxVelocity = math.huge part.AlignPosition.ReactionForceEnabled = false part.AlignPosition.Responsiveness = math.huge part.AlignOrientation.Responsiveness = math.huge part.AlignPosition.RigidityEnabled = false part.AlignOrientation.MaxTorque = 999999999 end  for i,v in next, char:GetDescendants() do if v:IsA('Accessory') then v.Handle:BreakJoints() create(v.Handle,reanim[v.Name].Handle) end end  char.Torso['Left Shoulder']:Destroy() char.Torso['Right Shoulder']:Destroy() char.Torso['Left Hip']:Destroy() char.Torso['Right Hip']:Destroy()  create(char['Torso'],reanim['Torso']) create(char['Left Arm'],reanim['Left Arm']) create(char['Right Arm'],reanim['Right Arm']) create(char['Left Leg'],reanim['Left Leg']) create(char['Right Leg'],reanim['Right Leg'])  for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') or v:IsA('Decal') then v.Transparency = 1 end end  reanim.Parent = fl  for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.RenderStepped:Connect(function() v.CanCollide = false end)) end end  for i,v in next, char:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.RenderStepped:Connect(function() v.CanCollide = false end)) end end  for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.Stepped:Connect(function() v.CanCollide = false end)) end end  for i,v in next, char:GetDescendants() do if v:IsA('BasePart') then table.insert(ct,srv.Stepped:Connect(function() v.CanCollide = false end)) end end  table.insert(ct,reanim.Humanoid.Died:Connect(function() plr.Character = char char:BreakJoints() reanim:Destroy() game.Players:Chat('-gr') _G.netless:Disconnect() HumanDied = true for _,v in pairs(ct) do v:Disconnect() end end))  plr.Character = reanim workspace.CurrentCamera.CameraSubject = reanim.Humanoid

local uis = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer
local char = player.Character
local root = char.HumanoidRootPart

local lastPos = root.Position

local function Align(part0, part1, cf0, cf1)
	cf0 = cf0 or CFrame.new()
	cf1 = cf1 or CFrame.new()
	local att0 = Instance.new("Attachment", part0)
	att0.CFrame = cf0
	local att1 = Instance.new("Attachment", part1)
	att1.CFrame = cf1
	local AlignPos = Instance.new("AlignPosition", part0)
	AlignPos.Parent.CanCollide = false
	AlignPos.ApplyAtCenterOfMass = true
	AlignPos.MaxForce = 67752
	AlignPos.MaxVelocity = math.huge/9e110
	AlignPos.ReactionForceEnabled = false
	AlignPos.Responsiveness = 200
	AlignPos.RigidityEnabled = false
	AlignPos.Attachment0 = att0
	AlignPos.Attachment1 = att1
	local AO = Instance.new("AlignOrientation", part0)
	AO.Attachment0 = att0
	AO.Attachment1 = att1
	AO.ReactionTorqueEnabled = false
	AO.PrimaryAxisOnly = false
	AO.MaxTorque = 9999999
	AO.MaxAngularVelocity = math.huge
	AO.Responsiveness = 200
	part0.CanCollide = false
	part0:BreakJoints()
	return setmetatable({}, {
		__index = function(self, index)
			if index == "C0" then
				return att0.CFrame * cf0:Inverse()
			end
			if index == "C1" then
				return att1.CFrame * cf1:Inverse()
			end
		end,
		__newindex = function(self, key, value)
			if key == "C0" then
				att0.CFrame = cf0 * value
			end
			if key == "C1" then
				att1.CFrame = cf1 * value
			end
		end,
	})
end

char:PivotTo(char:GetPivot() * CFrame.new(0, -20, 0))
root.Anchored = true

wait()

local model = Instance.new("Model", workspace)
local torso = Instance.new("Part", model)
torso.Name = "HumanoidRootPart"
torso.Size = Vector3.new(2, 2, 1)
torso.Position = lastPos + Vector3.new(0, 3, 0)
torso.CanCollide = false
torso.Transparency =  0.9
local hum = Instance.new("Humanoid", model)
hum.HipHeight = 2
hum.AutoJumpEnabled = false
player.Character = model
workspace.CurrentCamera.CameraSubject = hum

local arm1 = Align(char["Left Arm"], torso, nil, CFrame.new(0, -2.5, 0) * CFrame.Angles(math.rad(90), 0, 0))
local arm2 = Align(char["Right Arm"], char["Left Arm"], nil, CFrame.new(0, 2, 0))
local arm3 = Align(char["Left Leg"], char["Right Arm"], nil, CFrame.new(0, 2, 0))
local arm4 = Align(char["Right Leg"], char["Left Leg"], nil, CFrame.new(0, 2, 0))

repeat wait() until not char:IsDescendantOf(workspace)
model:Destroy()

while true do
	if not char:IsDescendantOf(workspace) then
		model:Destroy()
		break
	end
	torso.CanCollide = false
end

--[[while true do
	if not char:IsDescendantOf(workspace) then
		model:Destroy()
		break
	end
	
	local rad = math.sin(tick()) * math.rad(90)
	
	arm2.C1 = CFrame.new(math.sin(tick()) * 2, math.min(math.cos(tick()), 0) * 0.5, 0) * CFrame.Angles(0, 0, rad)
	game:GetService("RunService").Heartbeat:Wait()
end
]]

--[[local hb; hb = game:GetService("RunService").Heartbeat:Connect(function()
	if not char.Parent then hb:Disconnect() model:Destroy() return end
	local point = torso.CFrame * CFrame.Angles(math.rad(90), 0, 0)
	arm1.CFrame = point
	arm2.CFrame = point * CFrame.new(0,2,0)
	arm3.CFrame = point * CFrame.new(0,4,0)
	arm4.CFrame = point * CFrame.new(0,6,0)
end)]]