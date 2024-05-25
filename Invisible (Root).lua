local speaker = game.Players.LocalPlayer

local ch = speaker.Character
ch.Humanoid:Destroy()
Instance.new("Humanoid", ch)
local prt=Instance.new("Model")
prt.Parent = speaker.Character
local z1 = Instance.new("Part")
z1.Name="Torso"
z1.CanCollide = false
z1.Anchored = true
local z2 = Instance.new("Part")
z2.Name="Head"
z2.Parent = prt
z2.Anchored = true
z2.CanCollide = false
local z3 =Instance.new("Humanoid")
z3.Name="Humanoid"
z3.Parent = prt
z1.Position = Vector3.new(0,9999,0)
speaker.Character=prt
wait(3)
speaker.Character=ch
wait(3)
local Hum = Instance.new("Humanoid")
z2:Clone()
Hum.Parent = speaker.Character
local root =  speaker.Character.HumanoidRootPart
for i,v in pairs(speaker.Character:GetChildren()) do
	if v ~= root and  v.Name ~= "Humanoid" then
		v:Destroy()
	end
end
root.Transparency = 0
root.Color = Color3.new(1, 1, 1)