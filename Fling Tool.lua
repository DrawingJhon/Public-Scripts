local whitelist = {"PlayerModule"; "ChatScript"; "PlayerScriptsLoader"; "RbxCharacterSounds"; "BubbleChat";}

local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Removing anti-exploit stuff

for i, v in pairs(LocalPlayer.PlayerScripts:GetChildren()) do
	if not table.find(whitelist, v.Name) then
		v:Destroy()
	end
end

--

wait()

local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
local Part = Tool:FindFirstChild("Handle") or Tool:FindFirstChildOfClass("MeshPart")
Part:BreakJoints()

Tool.Parent = workspace

local bav = Instance.new("BodyAngularVelocity")
bav.MaxTorque = Vector3.new(1, 1, 1) * math.huge
bav.P = math.huge
bav.AngularVelocity = Vector3.new(0, 9e5, 0)
bav.Parent = Part

local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = Vector3.new()
bv.Parent = Part

local Control = Instance.new("Tool")
Control.Name = "Control Fling"
Control.RequiresHandle = false
Control.CanBeDropped = false
Control.Parent = LocalPlayer.Backpack

local heart = RunService.Heartbeat:Connect(function()
	Part.AssemblyLinearVelocity = Vector3.new(-30,0,0)
	sethiddenproperty(LocalPlayer,"MaximumSimulationRadius",math.huge)
	sethiddenproperty(LocalPlayer,"SimulationRadius",999999999)
end)

--[[local inputbegan = UIS.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 and Control.Parent == LocalPlayer.Character then
		Part.Position = Mouse.Hit.p
	end
end)]]

local function GetMouseHit()
	local unitRay = Mouse.UnitRay
	local raycastParams = RaycastParams.new()
	raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, Tool}
	raycastParams.FilterType = "Blacklist"
	return workspace:Raycast(unitRay.Origin, unitRay.Direction * 999999, raycastParams)
end

local step = RunService.Stepped:Connect(function()
	local ray = GetMouseHit()
	if Control.Parent == LocalPlayer.Character and ray and ray.Position then
		Part.Position = ray.Position
	end
	Part.CanCollide = false
end)

local changed = Tool.Changed:Connect(function()
	if not Tool:IsDescendantOf(workspace) then
		heart:Disconnect()
		step:Disconnect()
		changed:Disconnect()
		inputbegan:Disconnect()
	end
end)