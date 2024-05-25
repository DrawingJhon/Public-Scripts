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
part.Transparency = 1
local bv = Instance.new("BodyVelocity", part)
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = Vector3.new()

local function AddHat(obj, pos, rot)
	local handle = obj.Handle
	handle:BreakJoints()
	table.insert(parts, handle)
	local mesh = handle:FindFirstChildOfClass("SpecialMesh")
	if mesh then
		mesh:Destroy()
	end
	create(handle, part, pos, rot)
end

--AddHat(plr.Character.Hat1.Handle, Vector3.new(0, -1, -1.5))
--AddHat(plr.Character["Pal Hair"].Handle, Vector3.new(0, -1, -3.5))

local stud2 = 0
local stud1 = 0

for i, v in pairs(plr.Character:GetChildren()) do
	if v:IsA("Accessory") and v:FindFirstChild("Handle") then
		local handle = v.Handle
		if handle.Size == Vector3.new(1, 1, 2) then
			stud2 = stud2 + 1
			AddHat(v, Vector3.new(0, -1, 0.5 - 2 * stud2))
		end
	end
end

for i, v in pairs(plr.Character:GetChildren()) do
	if v:IsA("Accessory") and v:FindFirstChild("Handle") then
		local handle = v.Handle
		if handle.Size == Vector3.new(1, 1, 1) then
			stud1 = stud1 + 1
			AddHat(v, Vector3.new(0, -1, - stud2 * 2 - stud1))
		end
	end
end

local plrTarget = nil

local tool = Instance.new("Tool")
tool.Name = "Attach PP"
tool.RequiresHandle = false
tool.CanBeDropped = false
tool.Parent = plr.Backpack

tool.Activated:Connect(function()
	local hit = GetHit()
	local part = hit and hit.Instance
	local target = game:GetService("Players"):GetPlayerFromCharacter(part.Parent)
	if target then
		plrTarget = target
	end
end)

local rs = game:GetService("RunService").Heartbeat:Connect(function()
	local char = plrTarget and plrTarget.Character
	local root = char and char:findFirstChild("HumanoidRootPart")
	if root then
		part.CFrame = root.CFrame
	end
end)

local IsAlive = true

local died; died = plr.Character.Humanoid.Died:Connect(function()
	IsAlive = false
	netless:Disconnect()
	died:Disconnect()
	rs:Disconnect()
end)