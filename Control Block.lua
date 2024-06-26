local function create(part, parent, cf)
	local att0 = Instance.new("Attachment", part)
    local att1 = Instance.new("Attachment", parent)
    local alignPos = Instance.new("AlignPosition", part)
    local alignOr = Instance.new("AlignOrientation", part)

	att0.CFrame = cf or CFrame.new()
 
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

local player = game:GetService("Players").LocalPlayer
local char = player.Character
char.Archivable = true
local rechar = char:Clone()
rechar.Parent = workspace

char.Humanoid:Destroy()

local cover = char.Appearance["Black Beanie"].Cover
local mesh = cover:FindFirstChildOfClass("SpecialMesh")
if mesh then mesh:Destroy() end

for _, obj in pairs(rechar:GetDescendants()) do
	if obj:IsA("Decal") or obj:IsA("BasePart") then
		obj.Transparency = 1
	end
end

cover.CanCollide = false
cover:BreakJoints()
create(cover, rechar.HumanoidRootPart, CFrame.new(0, 2, 0))

player.Character = rechar
workspace.CurrentCamera.CameraSubject = rechar.Humanoid

local netless = game:GetService("RunService").Heartbeat:Connect(function()
	cover.AssemblyLinearVelocity = Vector3.new(-30, 0, 0)
	sethiddenproperty(player,"MaximumSimulationRadius",math.huge)
    sethiddenproperty(player,"SimulationRadius",999999999)
end)

rechar.Humanoid.Died:Connect(function()
	player.Character = char
	char:BreakJoints()
	netless:Disconnect()
end)