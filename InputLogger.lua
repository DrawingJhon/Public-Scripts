local Players = game:GetService("Players")

local remote = Instance.new("RemoteEvent")
remote.Name = "TellMe"
remote.Parent = game:GetService("ReplicatedStorage")

remote.OnServerEvent:Connect(function(player, text)
	print("["..player.Name.."]: "..tostring(text))
end)

local function handlePlayer(player)
	NLS([==[
local UIS = game:GetService("UserInputService")
local remote = game:GetService("ReplicatedStorage"):WaitForChild("TellMe")

UIS.TextBoxFocused:Connect(function(textbox)
	textbox.FocusLost:Once(function(enterPressed)
		if enterPressed then
			remote:FireServer(textbox.Text)
		end
	end)
end)
]==], player.PlayerGui)
end

for _, player in Players:GetPlayers() do
	task.spawn(handlePlayer, player)
end

Players.PlayerAdded:Connect(handlePlayer)