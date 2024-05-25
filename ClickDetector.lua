local Part = Instance.new("Part", workspace)
Part.Position = Vector3.new(0, 1, 0)
Part.Anchored = true
Part.Name = "MyPart"
local ClickDetector = Instance.new("ClickDetector")
ClickDetector.Parent = Part

Part.Touched:connect(function(plr)
	local p = plr.Parent:findFirstChildWhichIsA("Humanoid")
	if p ~= nil then
		p.Health = p.Health - 100
	end
end)
ClickDetector.MouseClick:connect(function(plrh)
	plrh:LoadCharacter()
end)