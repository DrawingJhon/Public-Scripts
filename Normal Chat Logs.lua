warn"The Chat logs is activated!"
local Players = game:GetService("Players")
local http = ""
local s = ""
local realPlayer = owner
local function onChatted(plr)
	plr.Chatted:connect(function(msg)
		print("["..plr.Name.."]: "..msg)
	end)
end

Players.PlayerAdded:Connect(onChatted)
for i, v in pairs(Players:GetPlayers()) do
	onChatted(v)
end