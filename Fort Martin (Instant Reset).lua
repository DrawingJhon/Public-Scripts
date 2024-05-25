local remote
for i, v in pairs(game.ReplicatedStorage:GetDescendants()) do
	if v:IsA("RemoteFunction") and v.Name:lower():match("respawn") then
		remote = v
	end
end

if _G.ResetChar then
	_G.ResetChar()
end

local lastCF
local function charAdded(char)
	local human = char:WaitForChild("Humanoid")
	local root = char:WaitForChild("HumanoidRootPart")
	
	if lastCF then
		spawn(function()
			root.CFrame = lastCF
		end)
	end
	
	human.Died:Connect(function()
		lastCF = root.CFrame * CFrame.new(0, 3, 0)
		task.wait(0.1)
		remote:InvokeServer()
	end)
end

local player = game.Players.LocalPlayer
if player.Character then
	charAdded(player.Character)
end

local c = player.CharacterAdded:Connect(charAdded)
local run = true

_G.ResetChar = function()
	c:Disconnect()
	run = false
end

local function getHuman()
	return player.Character and player.Character:FindFirstChildOfClass("Humanoid")
end

while run and task.wait(0.1) do
	local human = getHuman()
	if human and human.Health < 0.01 then
		remote:InvokeServer()
	end
end