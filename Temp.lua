local model = Instance.new("Model", script)
local mass = 1
local force = 50
local g = workspace.Gravity
local radians = math.rad(45)

local unitX = math.cos(radians)
local unitY = math.sin(radians)

local vX = force * unitX
local vY = force * unitY

local lastPoint = nil

local function makePointAt(x, y)
	if lastPoint then
		lastPoint.BrickColor = BrickColor.new("Gray")
		lastPoint.Size = Vector3.new(1, 1, 1)
	end
	local point = Instance.new("Part")
	point.BrickColor = BrickColor.new("Bright green")
	point.Anchored = true
	point.TopSurface, point.BottomSurface = "Smooth", "Smooth"
	point.Shape = "Ball"
	point.Size = Vector3.new(2, 2, 2)
	point.Position = Vector3.new(x, y + 5, 0)
	point.Parent = model
	if lastPoint then
		print((lastPoint.Position - point.Position).magnitude)
	end
	lastPoint = point
end

for t = 0.05, 3, 0.05 do
	task.wait(0.05)
	local pX = 0 + vX * t
	local pY = 0 + vY * t - 1/2 * g * (t^2)
	makePointAt(pX, pY)
end