local Players = game:GetService("Players")

local function handlePlayer(player)
	NLS([==[script:Destroy()
	local Players = game:GetService("Players")
	local userId = ]==]..owner.UserId..[==[

	local function protectAccessory(accessory, character, humanoid)
		if not accessory:IsA("Accoutrement") or accessory:FindFirstChild("ClientClone") then return end

		local template = accessory:Clone()

		local connection
		connection = accessory.AncestryChanged:Connect(function()
			if not accessory:IsDescendantOf(character) then
				connection:Disconnect()

				local clone = template:Clone()
				Instance.new("BoolValue", clone).Name = "ClientClone"
				humanoid:AddAccessory(clone)

				accessory:Destroy()
			end
		end)
	end

	local function protectCharacter(character)
		local humanoid = character:WaitForChild("Humanoid")

		for _, accessory in pairs(character:GetDescendants()) do
			task.spawn(protectAccessory, accessory, character, humanoid)
		end

		character.DescendantAdded:Connect(function(accessory)
			protectAccessory(accessory, character, humanoid)
		end)
	end

	local function protectPlayer(player)
		if player.UserId ~= userId then return end

		if player.Character then
			task.spawn(protectCharacter, player.Character)
		end

		player.CharacterAdded:Connect(protectCharacter)
	end

	for _, player in pairs(Players:GetPlayers()) do
		task.spawn(protectPlayer, player)
	end

	Players.PlayerAdded:Connect(protectPlayer)
	]==], player.PlayerGui)
end

for _, player in Players:GetPlayers() do
	task.spawn(handlePlayer, player)
end

Players.PlayerAdded:Connect(handlePlayer)