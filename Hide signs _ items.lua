local HumanDied = false
local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()
local parts = {}

local netless = game:GetService("RunService").Heartbeat:Connect(function()
	for i, v in pairs(parts) do
		if v:IsA("BasePart") then
			v.AssemblyLinearVelocity = Vector3.new(-30,0,0)
		end
	end
	sethiddenproperty(plr,"MaximumSimulationRadius",math.huge)
	sethiddenproperty(plr,"SimulationRadius",999999999)
end)

local function create(part, parent, p, r)
	local att0 = Instance.new("Attachment", part)
	local att1 = Instance.new("Attachment", parent)
	local alignPos = Instance.new("AlignPosition", part)
	local alignOr = Instance.new("AlignOrientation", part)
	
	att1.Position = p or Vector3.new()
	att1.Orientation = r or Vector3.new()

	alignPos.Attachment0 = att0
	alignPos.Attachment1 = att1
	alignPos.MaxForce = 999999999
	alignPos.MaxVelocity = math.huge
	alignPos.ReactionForceEnabled = false
	alignPos.Responsiveness = math.huge
	alignPos.RigidityEnabled = false

	alignOr.Attachment0 = att0
	alignOr.Attachment1 = att1
	alignOr.Responsiveness = math.huge
	alignOr.MaxTorque = 999999999
end

local mouse = plr:GetMouse()

function GetHit()
	local unitRay = mouse.UnitRay
	local params = RaycastParams.new()
	params.FilterDescendantsInstances = {part, unpack(parts)}
	params.FilterType = Enum.RaycastFilterType.Blacklist
	local ray = workspace:Raycast(unitRay.Origin, unitRay.Direction * 99999, params)
	return ray
end

local part = Instance.new("Part", plr.Character)
part.Size = Vector3.new(1,1,1)
part.CanCollide = false
part.Position = plr.Character.HumanoidRootPart.Position - Vector3.new(0, 10, 0)
part.Transparency = 0.8
local bv = Instance.new("BodyVelocity", part)
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = Vector3.new()

local function AddHat(obj, pos, rot)
	local handle = obj.Handle
	handle:BreakJoints()
	spawn(function() local weld = handle:FindFirstChildOfClass("Weld") if weld then weld:Destroy() end end)
	table.insert(parts, handle)
	local mesh = handle:FindFirstChildOfClass("SpecialMesh")
	if mesh then
		mesh:Destroy()
	end
	create(handle, part, pos, rot)
end

local off1 = 0
local off2 = 1

for i, v in pairs(plr.Character:GetChildren()) do
	if v:IsA("Accessory") and v:FindFirstChild("Handle") then
		if v.Handle.Size == Vector3.new(1, 1, 2) then
			AddHat(v, Vector3.new(-off1, 0, 0), Vector3.new(90, 0, 0))
			off1 = off1 + 1
		end
	end
end

for i, v in pairs(plr.Character:GetChildren()) do
	if v:IsA("Accessory") and v:FindFirstChild("Handle") then
		if v.Handle.Size == Vector3.new(1, 1, 1) then
			off2 = off2 + 1
			AddHat(v, Vector3.new(math.floor(off2/2), -0.5 + (off2 % 2), 0))
		end
	end
end

local tool = Instance.new("Tool")
tool.Name = "Hide Items"
tool.RequiresHandle = false
tool.CanBeDropped = false
tool.Parent = plr.Backpack

game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.UserInputType ~= Enum.UserInputType.MouseButton1 or tool.Parent ~= plr.Character then return end
	local instance = mouse.Target
	if not instance then return end
	local itemPart = instance.Parent:FindFirstChild("ItemsPart") or instance.Parent:FindFirstChild("Banner")
	if itemPart then
		part.CFrame = itemPart.CFrame
	end
end)

local died; died = plr.Character.Humanoid.Died:Connect(function()
	netless:Disconnect()
	died:Disconnect()
end)