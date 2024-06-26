local JailModel = workspace.JAIL
local JailCFrame = JailModel.JAILPART.CFrame
local JailSize = JailModel.JAILPART.Size

local JailBackup = JailModel:Clone()

local Players = game:GetService("Players")

function startup()
	local connection1, connection2, connection3 = nil, nil, nil

	local ignoreList = {}

	local function reset()
		connection1:Disconnect()
		connection2:Disconnect()
		connection3:Disconnect()
		
		pcall(function()
			JailModel:Destroy()
		end)

		local clone = JailBackup:Clone()

		JailModel = clone
		JailCFrame = clone.JAILPART.CFrame
		JailSize = clone.JAILPART.Size
		
		clone.Parent = workspace

		startup()
	end

	connection1 = JailModel.DescendantRemoving:Connect(function(child)
		if ignoreList[child] then
			ignoreList[child] = nil
			return
		end
		reset()
	end)
	connection2 = JailModel:GetPropertyChangedSignal("Parent"):Connect(reset)
	connection3 = JailModel.DescendantAdded:Connect(function(child)
		ignoreList[child] = true
	end)
end

startup()

local jailCommand = ".jail "
local unjailCommand = ".unjail "

function getPlayers(name)
	local players = {}

	if name == "all" then
		return Players:GetPlayers()
	elseif name == "me" then
		return {Players:GetPlayerByUserId(owner.UserId)}
	elseif name ~= "" then
		local usedDisplay = false
		for i, v in pairs(Players:GetPlayers()) do
			if v.DisplayName:sub(1, #name):lower() == name:lower() then
				usedDisplay = true
				table.insert(players, v)
			end
		end
		if not usedDisplay then
			for i, v in pairs(Players:GetPlayers()) do
				if v.Name:sub(1, #name):lower() == name:lower() then
					table.insert(players, v)
				end
			end
		end
	end
	return players
end

local InJailUsers = {}

function handleChat(message)
	if message:lower():sub(1, #jailCommand) == jailCommand:lower() then
		local name = message:sub(#jailCommand + 1)
		for i, v in pairs(getPlayers(name)) do
			print("Jailed "..v.Name)
			InJailUsers[v.UserId] = true
		end
	end

	if message:lower():sub(1, #unjailCommand) == unjailCommand:lower() then
		local name = message:sub(#unjailCommand + 1)
		for i, v in pairs(getPlayers(name)) do
			print("Unjailed "..v.Name)
			local wasJailed = InJailUsers[v.UserId]
			InJailUsers[v.UserId] = nil
			if wasJailed then
				v:LoadCharacter()
			end
		end
	end
end

owner.Chatted:Connect(handleChat)

Players.PlayerAdded:Connect(function(player)
	if player.UserId == owner.UserId then
		player.Chatted:Connect(handleChat)
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	local parts = workspace:GetPartBoundsInBox(JailCFrame, JailSize)

	for _, player in pairs(Players:GetPlayers()) do
		if not InJailUsers[player.UserId] then continue end
		task.spawn(function()
			local character = player.Character
			if not character then return end
			local head = character:FindFirstChild("Head")
			if not head or not head:IsA("BasePart") then return end

			if not table.find(parts, head) then
				character:PivotTo(JailCFrame)
			end
		end)
	end

	for _, part in pairs(JailModel:GetChildren()) do
		if part:IsA("BasePart") then
			part.Locked = true
		end
	end

	pcall(function() JailModel.JAILPART.CanCollide = false end)
end)