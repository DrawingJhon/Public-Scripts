local players = game:GetService("Players")
local function getPlayers(text)
	print(text)
	if not text then return {} end
	if text == "everyone" or text == "here" then
		return players:GetPlayers()
	else
		local tab = {}
		for i, v in pairs(players:GetPlayers()) do
			if v.Name:lower():sub(1, #text) == text:lower() and text ~= "" then
				table.insert(tab, v)
			end
		end
		return tab
	end
end

local function chatted(msg)
	for i = 1, #msg do
		local prev = msg:sub(i - 1, i - 1)
		if msg:sub(i, i) == "@" and (prev == "" or string.match(prev, "%s")) then
			for _, plyr in pairs(getPlayers(string.match(msg:sub(i + 1), "^%S*"))) do
				if plyr then
					local pgui = plyr:findFirstChildOfClass("PlayerGui")
					if pgui then
						local sound = Instance.new("Sound", pgui)
						sound.Name = "Ping_RBX"
						sound.Volume = 1
						sound.SoundId = "rbxassetid://570433034"
						sound:Play()
						sound.Ended:Connect(function() sound:Destroy() end)
					end
				end
			end
		end
	end
end

for i, v in pairs(players:GetChildren()) do
	v.Chatted:Connect(chatted)
end

players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(chatted)
end)