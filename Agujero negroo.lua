local ball
coroutine.resume(coroutine.create(function()
	ball = Instance.new("Part", workspace)
	ball.Position = Vector3.new(0, 30, 0)
	ball.Shape = "Ball"
	ball.Anchored = true
	ball.TopSurface = "Smooth"
	ball.BottomSurface = "Smooth"
	ball.Color = Color3.fromRGB(0, 0, 0)
	ball.CanCollide = false
	ball.Material = "Neon"
	for i = 1, 35, 0.1 do
		ball.Size = Vector3.new(i, i, i)
		wait()
	end
	local boom = Instance.new("Explosion", workspace)
	boom.BlastRadius = 100
	boom.Position = ball.Position
	for i = 35, 100, 0.1 do
		ball.Size = Vector3.new(i, i, i)
	end
end))

for i, part in pairs(workspace:GetDescendants()) do
	if part:IsA("BasePart") and part ~= ball and part.Name ~= "Base" then
		part.Anchored = false
		local bodypos = Instance.new("BodyPosition", part)
		bodypos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bodypos.Position = Vector3.new(0, 30, 0)
	end
end