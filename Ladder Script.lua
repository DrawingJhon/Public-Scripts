local player = game:GetService("Players").LocalPlayer
local char = player.Character
local root = char.HumanoidRootPart

local ladder = workspace.playerPlaced:WaitForChild(player.Name.."_ladder")
local main = ladder:WaitForChild("Main")

local gui = Instance.new("ScreenGui")
gui.Name = "LadderGui"


local ct = {}

table.insert(ct, game:GetService("RunService").Heartbeat:Connect(function()
    if not actived then return end
    sethiddenproperty(player,"MaximumSimulationRadius",math.huge)
    sethiddenproperty(player,"SimulationRadius",999999999)
end))

table.insert(ct, game:GetService("RunService").RenderStepped:Connect(function()
	root.CFrame = CFrame.new(main.Position)
end))

local myBv = root:FindFirstChildOfClass("BodyVelocity") or Instance.new("BodyVelocity")
myBv.MaxForce = Vector3.one * math.huge
myBv.Velocity = Vector3.zero
myBv.Parent = root

local bg = main:FindFirstChildOfClass("BodyGyro") or Instance.new("BodyGyro")
bg.MaxTorque = Vector3.one * math.huge
bg.CFrame = main.CFrame --CFrame.Angles(math.rad(90), 0, 0)
bg.Parent = main

local bv = main:FindFirstChildOfClass("BodyVelocity") or Instance.new("BodyVelocity")
bv.MaxForce = Vector3.one * math.huge
bv.Velocity = Vector3.new(0, 0, 0)
bv.Parent = main

_G.Disconnect = function()
	for i, v in pairs(ct) do
		v:Disconnect()
	end
	bg:Destroy()
	bv:Destroy()
	myBv:Destroy()
end