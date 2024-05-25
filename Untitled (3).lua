--Roblox lua script for a disco light
-- this is my first roblox lua script created by dissandou91000
-- Make sure that "Disco" is a sphere

Disco = workspace.Part


light = Instance.new("PointLight")
light.Parent = Disco

while true do
	Disco.BrickColor = BrickColor.random()
	wait(0.3)
end