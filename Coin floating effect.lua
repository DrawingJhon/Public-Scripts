local model = Instance.new("Model", workspace)
model.Name = "Coin"
local hum = Instance.new("Humanoid", model)
hum.Name = "NameTag"
local coin = Instance.new("Part", model)
coin.Anchored = false
coin.Name = "Head"
coin.Shape = "Cylinder"
coin.Position = Vector3.new(0, 2.5, 0)
coin.Size = Vector3.new(0.5, 3, 3)
coin.CanCollide = false
coin.BrickColor = BrickColor.new("Bright yellow")
coin.TopSurface = "Smooth"
coin.BottomSurface = "Smooth"
local sound = Instance.new("Sound", coin)
sound.SoundId = "rbxassetid://131323304"
sound.EmitterSize = 5
local bodypos = Instance.new("BodyPosition", coin)
bodypos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bodypos.Position = coin.Position
local ang = Instance.new("BodyAngularVelocity", coin)
ang.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)

local db = false
coin.Touched:Connect(function(hit)
	local isPlayer = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
	if not isPlayer or db then return end
	db = true
	sound:Play()
	for i = 0, 1, 0.1 do
		coin.Transparency = i
		wait()
	end
	coin:Remove()
end)

local firstP = coin.Position.Y
local tw = game:GetService("TweenService")
while true do
	local info = TweenInfo.new(0.7)
	local p = tw:Create(bodypos, info, {Position = Vector3.new(0, firstP + 0.5, 0)})
	local p2 = tw:Create(bodypos, info, {Position = Vector3.new(0, firstP - 0.5, 0)})
	p:Play()
	wait(1)
	p2:Play()
	wait(1)
end