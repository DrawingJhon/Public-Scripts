local ON = false
workspace.Part1.Touched:Connect(function(hit)
	local humRootPart = hit.Parent:findFirstChild("HumanoidRootPart")
	if humRootPart ~= nil and ON == true then
		local en = humRootPart.Orientation
		--humRootPart.CFrame = workspace:findFirstChild("Part2").CFrame * CFrame.new(Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(en.X),math.rad(en.Y),math.rad(en.Z))
		humRootPart.Position = workspace:findFirstChild("Part2").Position + Vector3.new(0, 3, 0)
	end
end)
local TM = workspace:findFirstChild("TouchMe")
local cd = Instance.new("ClickDetector", TM)
cd.MouseClick:Connect(function()
	if ON == false then
		TM.BrickColor = BrickColor.new("Lime green")
		ON = true
	else
		TM.BrickColor = BrickColor.new("Really red")
		ON = false
	end
end)