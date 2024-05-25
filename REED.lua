local ls = NLS([==[local remote = script:WaitForChild("Rewmote")
local FakeChar = remote.OnClientEvent:Wait()
owner.Character.Archivable = true
local char = owner.Character:Clone()
char.Parent = workspace
owner.Character = char
local reAnimate = char:findFirstChild("Animate")
reAnimate:Clone().Parent = char
reAnimate:Destroy()
local parts = {}
for i, v in pairs(char:GetChildren()) do
	if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
		table.insert(parts, v)
		v.Transparency = 1
		if v:findFirstChild("face") then
			v.face.Transparency = 1
		end
	end
end
for i, part in pairs(FakeChar:GetChildren()) do
	local bodyPos = Instance.new("BodyPosition", part)
	bodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bodyPos.P = 111111
	bodyPos.D = 1000
	local gyro = Instance.new("BodyGyro", part)
	gyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	gyro.P = 111111
	gyro.D = 1000
end
char:findFirstChildOfClass("Humanoid"):RemoveAccessories()
game:GetService("RunService").RenderStepped:Connect(function()
	for i, part in pairs(FakeChar:GetChildren()) do
		local Part = char:findFirstChild(part.Name)
		part:WaitForChild("BodyPosition").Position = Part.Position
		part:WaitForChild("BodyGyro").CFrame = CFrame.Angles(Part.CFrame:ToEulerAnglesXYZ())
	end
	remote:FireServer()
end)
workspace.CurrentCamera.CameraSubject = char:findFirstChildOfClass("Humanoid")
]==], owner:findFirstChildOfClass("PlayerGui"))

local model = Instance.new("Model", workspace)
local Character = owner.Character
for i, v in pairs(Character:GetChildren()) do
	if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
		local part = Instance.new("Part", model)
		part.Size = v.Size
		part.CanCollide = false
		part.Material = "ForceField"
		part.TopSurface = "Smooth"
		part.BottomSurface = "Smooth"
		part.BrickColor = BrickColor.new("Really red")
		part.Name = v.Name
		part:SetNetworkOwner(owner)
	end
end
local remote = Instance.new("RemoteEvent", ls)
remote.Name = "Rewmote"
remote:FireClient(owner, model)
remote.OnServerEvent:Connect(function(plr)
	if plr ~= owner then return end
	pcall(function()
		Character:findFirstChild("HumanoidRootPart").CFrame = CFrame.new(10000, 10000, 100000)
	end)
end)