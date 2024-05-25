--//Created by: JhonXD2006\\--

local model = Instance.new("Model", workspace)
model.Name = "SlidingDoor"
--
local Muro = Instance.new("Part", model)
Muro.Position = Vector3.new(-15.841, 5, -16.542)
Muro.Size = Vector3.new(2, 10, 10)
Muro.TopSurface = Enum.SurfaceType.Smooth
Muro.BottomSurface = Enum.SurfaceType.Smooth
Muro.Material = Enum.Material.Concrete
Muro.BrickColor = BrickColor.new(1001)
Muro.Anchored = true
Muro.Name = "Derecha"
--
local Muro1 = Instance.new("Part", model)
Muro1.Position = Vector3.new(-15.841, 5, 3.458)
Muro1.Size = Vector3.new(2, 10, 10)
Muro1.TopSurface = Enum.SurfaceType.Smooth
Muro1.BottomSurface = Enum.SurfaceType.Smooth
Muro1.Material = Enum.Material.Concrete
Muro1.BrickColor = BrickColor.new(1001)
Muro1.Anchored = true
Muro1.Name = "Izquierda"
--
local Muro2 = Instance.new("Part", model)
Muro2.Position = Vector3.new(-15.841, 9, -6.542)
Muro2.Size = Vector3.new(2, 2, 10)
Muro2.TopSurface = Enum.SurfaceType.Smooth
Muro2.BottomSurface = Enum.SurfaceType.Smooth
Muro2.Material = Enum.Material.Concrete
Muro2.BrickColor = BrickColor.new(1001)
Muro2.Anchored = true
Muro2.Name = "Arriba"
--
local Door1 = Instance.new("Part", model)
Door1.Name = "PuertaIzquierda"
Door1.Position = Vector3.new(-15.841, 4, -4.042)
Door1.Size = Vector3.new(1, 8, 5)
Door1.TopSurface = Enum.SurfaceType.Smooth
Door1.BottomSurface = Enum.SurfaceType.Smooth
Door1.Material = Enum.Material.ForceField
Door1.BrickColor = BrickColor.new(1001)
Door1.Anchored = true
--
local Door2 = Instance.new("Part", model)
Door2.Position = Vector3.new(-15.841, 4, -9.042)
Door2.Size = Vector3.new(1, 8, 5)
Door2.TopSurface = Enum.SurfaceType.Smooth
Door2.BottomSurface = Enum.SurfaceType.Smooth
Door2.Material = Enum.Material.ForceField
Door2.BrickColor = BrickColor.new(1001)
Door2.Anchored = true
Door2.Name = "PuertaDerecha"
--
local Button = Instance.new("Part", model)
Button.Position = Vector3.new(-14.791, 4, -13.042)
Button.Size = Vector3.new(0.1, 1, 1)
Button.TopSurface = Enum.SurfaceType.Smooth
Button.BottomSurface = Enum.SurfaceType.Smooth
Button.Material = Enum.Material.Concrete
Button.BrickColor = BrickColor.new(1020)
Button.Name = "OpenButton"
Button.Anchored = true
--
local Button1 = Instance.new("Part", model)
Button1.Position = Vector3.new(-14.791, 4, -14.042)
Button1.Size = Vector3.new(0.1, 1, 1)
Button1.TopSurface = Enum.SurfaceType.Smooth
Button1.BottomSurface = Enum.SurfaceType.Smooth
Button1.Material = Enum.Material.Concrete
Button1.BrickColor = BrickColor.new(1004)
Button1.Name = "CloseButton"
Button1.Anchored = true
--
local ClickOpenDetector = Instance.new("ClickDetector")
ClickOpenDetector.Parent = workspace.SlidingDoor.OpenButton
local ClickCloseDetector = Instance.new("ClickDetector")
ClickCloseDetector.Parent = workspace.SlidingDoor.CloseButton
for i, v in pairs(model:GetChildren()) do
	if v.Locked == false then
		v.Locked = true
	end
end

function OpenDoors()
	local TweenService = game:GetService("TweenService")
	local OpenInfo = TweenInfo.new(
		0.5,
		Enum.EasingStyle.Sine,
		Enum.EasingDirection.Out,
		0,
		false,
		0
	)
	local Open = {
		Position = Vector3.new(-15.841, 4, -14.042)
	}
	local Open1 = {
		Position = Vector3.new(-15.841, 4, 0.958)
	}
	local Tween = TweenService:Create(Door2, OpenInfo, Open)
	local Tween1 = TweenService:Create(Door1, OpenInfo, Open1)
	Tween:Play()
	Tween1:Play()
end
workspace.SlidingDoor.OpenButton.ClickDetector.MouseClick:connect(OpenDoors)

function CloseDoors()
	local TweenService = game:GetService("TweenService")
	local CloseInfo = TweenInfo.new(
		0.5,
		Enum.EasingStyle.Sine,
		Enum.EasingDirection.Out,
		0,
		false,
		0
	)
	local Close = {
		Position = Vector3.new(-15.841, 4, -4.042)
	}
	local Close1 = {
		Position = Vector3.new(-15.841, 4, -9.042)
	}
	local Tween2 = TweenService:Create(Door1, CloseInfo, Close)
	local Tween3 = TweenService:Create(Door2, CloseInfo, Close1)
	Tween2:Play()
	Tween3:Play()
end
workspace.SlidingDoor.CloseButton.ClickDetector.MouseClick:connect(CloseDoors)