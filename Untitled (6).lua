script.Parent = owner.PlayerGui

local remote = Instance.new("RemoteEvent", script)
remote.Name = "test"

local part = Instance.new("Part", workspace)
part.Anchored = true
part.Shape = "Cylinder"
part.Rotation = Vector3.new(0, 0, 90)
part.Position = Vector3.new(0, 0.2, 0)
part.Size = Vector3.new(0.2, 1, 1)
part.TopSurface = "Smooth"
part.BottomSurface = "Smooth"
part.BrickColor = BrickColor.new("Really red")
part.Material = "Neon"

local part2 = Instance.new("Part",workspace)
part2.Anchored = true
part2.Shape = "Cylinder"
part2.Rotation = Vector3.new(0, 0, 90)
part2.Position = Vector3.new(0, 0.1, 0)
part2.Size = Vector3.new(0.1, 1, 1)
part2.BrickColor = BrickColor.new(0, 0, 0)
part2.Material = "Neon"

remote.OnServerEvent:Connect(function(plr, wht, data)
	if plr ~= owner then return end
	if wht == "vol" then
		part.Size = Vector3.new(0.2, data/10, data/10)
		part2.Size = Vector3.new(0.1, data/9, data/9)
	end
end)

NLS([[local remote = script.Parent:WaitForChild("test")
local audio = workspace:WaitForChild("Admin_sound")
while true do
	remote:FireServer("vol", audio.PlaybackLoudness)
	wait()
end]], script)