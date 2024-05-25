local part = Instance.new("Part", workspace)
part.Anchored = true
part.Size = Vector3.new(1,1,1)
part.TopSurface = "Smooth"
part.BottomSurface = "Smooth"
part.CanCollide = false
part.Color = Color3.fromRGB(1, 0, 0)
part.Material = "Neon"
part.Shape = "Ball"
 
-- Create 2 attachments
local attachment0 = Instance.new("Attachment")
attachment0.Name = "Attachment0"
attachment0.Parent = part
attachment0.Position = Vector3.new(-1,0,0)
 
local attachment1 = Instance.new("Attachment")
attachment1.Name = "Attachment1"
attachment1.Parent = part
attachment1.Position = Vector3.new(1,0,0)
 
-- Create a new Trail
local trail = Instance.new("Trail")
trail.Parent = part
trail.Attachment0 = attachment0
trail.Attachment1 = attachment1
color1 = Color3.new(1, 0, 0)
color2 = Color3.new(255/255,255/255,255/255)
trail.Color = ColorSequence.new(color1, color2)

local deg = 0

while wait() do
	deg = deg + 1
	local p = Vector3.new(math.cos(tick()*5) * 10, 0, math.sin(tick()*5) * 4)
	part.Position = (CFrame.Angles(0, math.rad(deg), 0) * CFrame.new(p)).Position + owner.Character.HumanoidRootPart.Position
end