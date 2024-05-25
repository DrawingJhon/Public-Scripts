function givePet(player)
	if player then
		local char = player.Character
		if char then
			local pet = Instance.new("Part",workspace)
			pet.Size = Vector3.new(1.5, 1.5, 1.5)
			pet.TopSurface = Enum.SurfaceType.Smooth
			pet.BottomSurface = Enum.SurfaceType.Smooth
			pet.Material = Enum.Material.ForceField
			pet.Anchored = false
			pet.CanCollide = false
			pet.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(2, 2, 3))
			pet.Name = "Pet"

			local humRootPart = char.HumanoidRootPart
			pet.Parent = char
			local bodyPos = Instance.new("BodyPosition", pet)
			bodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

			local bodyGyro = Instance.new("BodyGyro", pet)
			bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			
			while wait() do
				local ps = humRootPart.CFrame * CFrame.new(Vector3.new(2, 2, 3))
				bodyPos.Position = ps.p
				bodyGyro.CFrame = humRootPart.CFrame
			end
		end
	end
end
game.Players.JhonXD2006.CharacterAdded:Connect(function()
	print("Player Added")
	givePet(game.Players.JhonXD2006)
end)
givePet(game.Players.JhonXD2006)