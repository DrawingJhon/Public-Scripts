local HumanDied = false
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
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

local part = Instance.new("Part", plr.Character)
part.CanCollide = false
part.Size = Vector3.new(1,1,1)
part.Position = plr.Character:GetPivot().Position + Vector3.new(0, 3, 0)
part.Transparency = 0.8
local bv = Instance.new("BodyVelocity", part)
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = Vector3.new()

local mouse = plr:GetMouse()

function GetHit()
	local unitRay = mouse.UnitRay
	local params = RaycastParams.new()
	params.FilterDescendantsInstances = {plr.Character, part, unpack(parts)}
	params.FilterType = Enum.RaycastFilterType.Blacklist
	local ray = workspace:Raycast(unitRay.Origin, unitRay.Direction * 99999, params)
	return ray
end

local objects = {}

local function AddHat(obj)
	obj:BreakJoints()
	table.insert(parts, obj)
		
	create(obj, part, Vector3.new(0, 0.5, 0))
end

if plr.Character:findFirstChild("Appearance") then
for i, obj in pairs(plr.Character.Appearance:GetChildren()) do
	if obj:FindFirstChild("Mesh") and obj:FindFirstChild("Head") then
		AddHat(obj.Mesh)
	end
end
end

for i, obj in pairs(plr.Character:GetChildren()) do
	if obj:IsA("Accoutrement") then
		--AddHat(obj.Handle)
	end
end

local rs = game:GetService("RunService").Heartbeat:Connect(function()
	local hit = GetHit()
	if hit then
		part.Position = hit.Position
	end
end)

local died; died = plr.Character.Humanoid.Died:Connect(function()
	netless:Disconnect()
	died:Disconnect()
	rs:Disconnect()
end)
