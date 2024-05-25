	local model = Instance.new("Model", workspace)
model.Name = "Button"
local p = Instance.new("Part", model)
p.Anchored = true
p.TopSurface = Enum.SurfaceType.Smooth
p.BottomSurface = Enum.SurfaceType.Smooth
p.Position = Vector3.new(3.65, 1.6, 14.35)
p.Size = Vector3.new(0.9, 3.2, 0.9)
p.BrickColor = BrickColor.new("Ghost grey")
local p2 = Instance.new("Part", model)
p2.Anchored = true
p2.TopSurface = Enum.SurfaceType.Smooth
p2.BottomSurface = Enum.SurfaceType.Smooth
p2.Position = Vector3.new(3.57, 3.175, 14.35)
p2.Size = Vector3.new(1.5, 0.5, 1.5)
p2.Rotation = Vector3.new(0, 0, 30)
p2.BrickColor = BrickColor.new("Ghost grey")
local boton = Instance.new("Part", model)
boton.Anchored = true
boton.TopSurface = Enum.SurfaceType.Smooth
boton.BottomSurface = Enum.SurfaceType.Smooth
boton.Position = Vector3.new(3.37, 3.521, 14.35)
boton.Size = Vector3.new(1.1, 0.3, 1.1)
boton.Rotation = Vector3.new(0, 0, 30)
boton.BrickColor = BrickColor.new("Cyan")
boton.Name = "supButton"
local clickDetector = Instance.new("ClickDetector")
clickDetector.Parent = boton
local function localPos(changePart, x, y, z)
	local new_cframe = changePart.CFrame * CFrame.new(Vector3.new(x, y, z))
	changePart.CFrame = new_cframe
end
local touched = false

clickDetector.MouseClick:Connect(function(plr)
	if touched == false then
		local num = math.random(1,3)
		touched = true
		print(plr.Name.." touched the button")
		localPos(boton, 0, -0.2, 0)
		clickDetector.MaxActivationDistance = 0
		if plr.Character and num == 1 then
			if plr.Character:findFirstChild("HumanoidRootPart") ~= nil then
				local explo = Instance.new("Explosion",workspace)
				explo.Position = plr.Character:findFirstChild("HumanoidRootPart").Position
			end
		end
		if num == 2 then
			if plr.Character then
				for i, v in pairs(plr.Character:GetChildren()) do
					if v.ClassName == "Accessory" then
						v:Destroy()
					end
				end
			end
		end
		if num == 3 then
			if plr.Character then
				for i, v in pairs(plr.Character:GetChildren()) do
					if v.ClassName == "Shirt" or v.ClassName == "Pants" then
						v:Destroy()
					end
				end
			end
		end
		wait(3)
		localPos(boton, 0, 0.2, 0)
		clickDetector.MaxActivationDistance = 32
		touched = false
	end
end)