local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
local TweenService = game:GetService("TweenService")

local block = Instance.new("Part", workspace)
block.Anchored = true
block.Size = Vector3.new(4, 4, 4)
block.TopSurface = "Smooth"
block.BottomSurface = "Smooth"
block.BrickColor = BrickColor.new("Bright green")
block.Material = "Grass"
block.CanCollide = false
block.Transparency = 0.5

function round(pos, offset)
	local result = {}
	for i, val in pairs{X=pos.X;Y=pos.Y;Z=pos.Z} do
		local def = val - (val%offset)
		result[i] = def
	end
	local finalPos = Vector3.new(result.X, result.Y, result.Z)
	return finalPos + (Vector3.new(offset,offset,offset)/2)
end

local lastPos = Vector3.new()
local tween

local offset = 4
local REACH = 100

while wait() do
	local unitRay = mouse.UnitRay

	local castParams = RaycastParams.new()
	castParams.FilterDescendantsInstances = { player.Character , block}

	-- automatically ignores the player's character
	
	local result = Workspace:Raycast(
		unitRay.Origin, unitRay.Direction * REACH,
		castParams
	)

	if result then
		local newPos = round(result.Position + result.Normal * 1.5, offset)
		if (lastPos-newPos).magnitude > .5 and tween then
			tween:Cancel()
		end
		lastPos = newPos
		tween = TweenService:Create(block, TweenInfo.new(0.1), {Position = newPos})
		tween:Play()
	end
end