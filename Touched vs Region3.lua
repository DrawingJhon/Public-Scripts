local Base = workspace.Base
local Color1 = BrickColor.new("Bright yellow")
local Color2 = BrickColor.new("Bright green")

local part = Instance.new("Part", script)
part.Position = Vector3.new(0, 1, 0)
part.Size = Vector3.new(5, 1, 5)
part.TopSurface = "Smooth"
part.BottomSurface = "Smooth"
part.Material = "Neon"
part.BrickColor = Color1
part.Anchored = true
local part2 = part:Clone()
part2.Parent = script
part2.Position = Vector3.new(10, 1, 0)

local IgnoreList = {part, Base}

part2.Touched:Connect(function(part)
	if table.find(IgnoreList, v) then return end
	part2.BrickColor = Color2
end)
part2.TouchEnded:Connect(function(part)
	if table.find(IgnoreList, v) then return end
	part2.BrickColor = Color1
end)
while true do
	game:GetService("RunService").Heartbeat:Wait()
	local pos1 = part.Position - (part.Size / 2 + Vector3.new(0.05, 0.05, 0.05))
	local pos2 = part.Position + (part.Size / 2 + Vector3.new(0.05, 0.05, 0.05))
	local region = Region3.new(pos1, pos2)
	local parts = workspace:findPartsInRegion3(region, nil, math.huge)
	local touched = false
	for i, v in pairs(parts) do
		if table.find(IgnoreList, v) then
		else
			touched = true
		end
	end
	if touched then
		part.BrickColor = Color2
	else
		part.BrickColor = Color1
	end
end