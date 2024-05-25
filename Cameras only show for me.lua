script.Parent = game:GetService("ReplicatedStorage")

local players = game:GetService("Players")
local network = game:GetService("NetworkServer")

local model = Instance.new("Model")
model.Name = "Cameras"
model.Parent = script

local Cameras = {}

local function setup(plr)
	if plr == owner then return end

	local cam = Instance.new("Part")
	Cameras[plr.UserId] = cam
	cam.Name = plr.Name.."_Camera"
	cam.Anchored = true
	cam.Size = Vector3.new(1, 1, 2)
	cam.TopSurface = "Smooth"
	cam.BottomSurface = "Smooth"
	cam.FrontSurface = "Hinge"
	cam.Color = Color3.new(1,1,1)
	cam.Transparency = 0.3
	cam.CanCollide = false
	cam.Locked = true
	local bg = Instance.new("BillboardGui", cam)
	bg.Adornee = cam
	bg.AlwaysOnTop = true
	bg.DistanceUpperLimit = -1
	bg.MaxDistance = math.huge
	bg.Size = UDim2.new(3, 0, 1.5, 0)
	bg.StudsOffset = Vector3.new(0.5, 2.6, 0)
	local tb = Instance.new("TextLabel", bg)
	tb.BackgroundColor3 = Color3.new(1, 1, 1);
	tb.BackgroundTransparency = 1;
	tb.BorderColor3 = Color3.fromRGB(27, 42, 53);
	tb.BorderSizePixel = 1;
	tb.Position = UDim2.new(-0.17, -20, 0, 0);
	tb.Size = UDim2.new(1, 40, 0.9, -1);
	tb.Font = "SourceSansBold";
	tb.LineHeight = 1;
	tb.Text = plr.Name.."'s camera"
	tb.TextColor3 = Color3.new(1, 1, 1);
	tb.TextScaled = true;
	tb.TextStrokeColor3 = Color3.fromRGB(20, 20, 20);
	tb.TextStrokeTransparency = 0.5;
	tb.TextWrapped = true;
	tb.TextYAlignment = "Bottom";
	cam.Parent = model
	local sec = Instance.new("ScreenGui")
	sec.ResetOnSpawn = false
	sec.Name = "Camera Sender"
	sec.Parent = plr:findFirstChildOfClass("PlayerGui")
	local client = NLS([==[
	local remote = script:WaitForChild("CFrameSender")
	local obj = script:WaitForChild("Camera").Value
	obj:Destroy()
	local lastCF
	game:GetService("RunService").Stepped:Connect(function()
		local cam = workspace.CurrentCamera
		if cam and lastCF ~= cam.CFrame then
			lastCF = cam.CFrame
			remote:FireServer(cam.CFrame)
		end
	end)
	]==], sec)
	local remote = Instance.new("UnreliableRemoteEvent")
	remote.Name = "CFrameSender"
	remote.OnServerEvent:Connect(function(p, cf)
		if p == plr and typeof(cf) == "CFrame" then
			cam.CFrame = cf
		end
	end)
	local obj = Instance.new("ObjectValue")
	obj.Value = cam
	obj.Name = "Camera"
	obj.Parent = client
	remote.Parent = client

end

for i, v in pairs(players:GetPlayers()) do
	setup(v)
end
players.PlayerAdded:Connect(setup)

network.DescendantRemoving:Connect(function(client)
	pcall(function()
		local plr = client:GetPlayer()
		local cam = Cameras[plr.UserId]
		if cam then
			cam:Destroy()
			Cameras[plr.UserId] = nil
		end
	end)
end)

local protectedGui = Instance.new("ScreenGui")
protectedGui.ResetOnSpawn = false
protectedGui.Name = "PROTECTED"
protectedGui.Parent = owner.PlayerGui

local myScr = NLS([==[
wait()
script.Parent = workspace

local val = script:WaitForChild("ModVal").Value
val.Parent = script
]==], protectedGui)

local val = Instance.new("ObjectValue")
val.Name = "ModVal"
val.Value = model
val.Parent = myScr