--local camera = workspace.CurrentCamera

local part = Instance.new("Part", workspace)
part.Name = "CamPro"
part.Anchored = true
part.CanCollide = false
--[[local bodyPos = Instance.new("BodyPosition", part)
bodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
local bodyGyro = Instance.new("BodyGyro", part)
bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)]]

local remote = Instance.new("RemoteEvent", part)
remote.Name = "REE"
remote.OnServerEvent:Connect(function(plr, wht, data)
	if plr ~= owner then return end
	if wht == "cf" then
		--[[bodyPos.Position = Vector3.new(data.X, data.Y, data.Z)
		bodyGyro.CFrame = data]]
		part.CFrame = data
	end
end)

NLS([==[local part = workspace:WaitForChild("CamPro")
local remote = part:WaitForChild("REE")
local cam = workspace.CurrentCamera
game:GetService("RunService").RenderStepped:Connect(function()
	remote:FireServer("cf", cam.CFrame)
end)]==], owner.Character)