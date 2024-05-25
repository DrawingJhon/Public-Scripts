--Bubble chat filtered

local players = game:GetService("Players")
local chat = game:GetService("Chat")
local textService = game:GetService("TextService")

local function setup(plr)
	plr.Chatted:Connect(function(message)
		local head = plr.Character and plr.Character:findFirstChild("Head")
		if head and head:IsA("BasePart") and head:IsDescendantOf(workspace) then
			if message:sub(1,3) == "/e " or message:sub(1,3) == "/w " then
			else
				local filter = textService:FilterStringAsync(message, plr.UserId):GetNonChatStringForBroadcastAsync()
				pcall(chat.Chat, chat, head, filter, "White")
			end
		end
	end)
end

for i, v in pairs(players:GetPlayers()) do
	setup(v)
end
players.PlayerAdded:Connect(setup)