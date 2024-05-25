wait()
local Player = game.Players.LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Char.Humanoid
local Enabled = true
local Mouse = Player:GetMouse()
local x = math.random(-100,100)/100
local y = math.random(-100,100)/100
local z = math.random(-100,100)/100
Mouse.Button1Down:connect(function()
if not Enabled then return end
Enabled = false
for i = 1, 20 do
	Humanoid.CameraOffset = Vector3.new(x,y,z)
	print(i)
	wait()
end
Humanoid.CameraOffset = Vector3.new(0,0,0)
Enabled = true
end)