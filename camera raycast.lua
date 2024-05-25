local function show(ray)
	local origin = ray.Origin
	local direction = ray.Direction
	local position = (CFrame.new(origin) * CFrame.lookAt(Vector3.new(), direction) * CFrame.new(0, 0, -direction.magnitude)).Position
	local distance = (origin - position).Magnitude
	local cf = CFrame.lookAt(origin, position)
	local p = Instance.new("Part")
	p.Anchored = true
	p.CanCollide = false
	p.BrickColor = BrickColor.new("Really red")
	p.Size = Vector3.new(0.05, 0.05, distance)
	p.CFrame = cf*CFrame.new(0, 0, -distance/2)
	p.Material = "SmoothPlastic"
	p.Transparency = 0.3
	p.Parent = workspace.Base
	return cf.Position, (cf * CFrame.new(0, 0, -distance)).Position
end

local function concat(v1, v2)
	show(Ray.new(v1, CFrame.lookAt(v1, v2).lookVector * (v1 - v2).magnitude))
end

local function camRay(n1, n2)
	local camera = workspace.CurrentCamera
	local length = 60
	local unitRay = camera:ScreenPointToRay(n1, n2)
	local ray = Ray.new(unitRay.Origin, unitRay.Direction * length)
	return show(ray)
end

local inset = game:GetService("GuiService"):GetGuiInset()
local vt = workspace.CurrentCamera.ViewportSize
local min0, max0 = camRay(-inset.X, -inset.Y)
local min1, max1 = camRay(vt.x, -inset.Y)
local min2, max2 = camRay(vt.x, vt.y)
local min3, max3 = camRay(-inset.X, vt.y)
concat(min0, min1)
concat(min1, min2)
concat(min2, min3)
concat(min3, min0)
concat(max0, max1)
concat(max1, max2)
concat(max2, max3)
concat(max3, max0)
