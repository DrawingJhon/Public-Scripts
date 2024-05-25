--//Tween service\\--
local function BackPart()
	--Part--
	Part = Instance.new("Part", workspace)
	Part.Position = Vector3.new(0, 17, 0)
	Part.Size = Vector3.new(4, 4, 4)
	Part.TopSurface = Enum.SurfaceType.Smooth
	Part.BottomSurface = Enum.SurfaceType.Smooth
	Part.Anchored = true
	Part.Material = Enum.Material.ForceField
	Part.BrickColor = BrickColor.new(0)
	Part.CanCollide = false
	Part.Name = "MyPart"
	
	--Variables--
	local TweenService = game:GetService("TweenService")
	local Part1 = Part
	
	local Info = TweenInfo.new(
		2.5,                       	--Duración (segundos)
		Enum.EasingStyle.Back,    	--Estilo de movimiento/
		Enum.EasingDirection.Out, 	--Estilo de dirección
		0,							--Cantidad de veces repetidas
		false,						--Reversa
		0							--Retraso (segundos)
	)
	local Goals = {
		Position = Vector3.new(0, 2, 0);
	}
	
	local MakePartBiggerTween = TweenService:Create(Part1, Info, Goals)
	MakePartBiggerTween:Play()
end
local Part
local MyPart = Instance.new("Part", workspace)
MyPart.Position = Vector3.new(0, 2, 0)
MyPart.Size = Vector3.new(4, 4, 4)
MyPart.Material = Enum.Material.ForceField
MyPart.TopSurface = Enum.SurfaceType.Smooth
MyPart.BottomSurface = Enum.SurfaceType.Smooth
MyPart.BrickColor = BrickColor.new(0)
MyPart.Anchored = true
MyPart.Name = "MyPart"
--[[
local loop
local comprobation = true

for i, v in pairs(game.Players:GetChildren()) do
	if v.Name == "JhonXD2006" then
		if comprobation == true then
			loop = true
			comprobation = false
		end
	else
		loop = false
		comprobation = true
	end
end]]
		
while wait(0.5) do
	if workspace:findFirstChild("MyPart") then
		exist = true
	else
		exist = false
	end
	if exist == false then
		BackPart()
		wait(2.25)
		if workspace:findFirstChild("MyPart") then
			workspace:WaitForChild("MyPart").CanCollide = true
		end
	end
end