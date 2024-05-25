local player = game:GetService("Players").LocalPlayer
local uis = game:GetService("UserInputService")
local teleport = false
local position

local cTemp

local function moveCharacter(character)
	character:MoveTo(position)
	if cTemp then
		cTemp:Disconnect()
	end
	cTemp = game:GetService("RunService").Stepped:Connect(function()
		if (teleport) then
			character:MoveTo(position)
		else
			cTemp:Disconnect()
		end
	end)
end

local c1, c2, c3

c1 = player:GetMouse().KeyDown:Connect(function(key)
	if key == "f" then
		if teleport then
			teleport = false
		else
			position = player:GetMouse().Hit.Position
			moveCharacter(player.Character)
			teleport = true;
		end
	end
end)

c2 = player.Chatted:Connect(function(msg)
	if msg:lower() == "/e killtp" then
		c1:Disconnect()
		c2:Disconnect()
		cTemp:Disconnect()
		--c3:Disconnect()
		warn("Killing teleport")
	end
end)

local function getRoot(character)
	return character:findFirstChild("HumanoidRootPart")
end

--[[c3 = game:GetService("RunService").Stepped:Connect(function()
	pcall(function()
		if teleport then
			getRoot(player.Character).CFrame = CFrame.new(position)
		end
	end)
end)]]

player.CharacterAdded:Connect(function(character)
	moveCharacter(character)
end)