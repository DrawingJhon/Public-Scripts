for _, target in game:GetService("Players"):GetPlayers() do
local tool = Instance.new("Tool")
tool.Name = target.Name.." walk controller"
tool.RequiresHandle = false
tool.CanBeDropped = false

local scr = NLS([[local tool = script.Parent
local remote = tool:WaitForChild("Remote")
local target = tool:WaitForChild("Target").Value

tool.Activated:Connect(function()
	local stop = false

	tool.Deactivated:Once(function()
		stop = true
	end)

	while not stop do
		remote:FireServer(owner:GetMouse().Hit.Position)
		task.wait(0.1)
	end
end)
]], tool)

local remote = Instance.new("RemoteEvent")
remote.Name = "Remote"
remote.OnServerEvent:Connect(function(player, pos)
	if player ~= owner then return end
	
	target.Character.Humanoid:MoveTo(pos)
end)

remote.Parent = tool

local val = Instance.new("ObjectValue")
val.Value = target
val.Name = "Target"
val.Parent = tool

tool.Parent = owner.Backpack
end