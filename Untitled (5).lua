local remote = Instance.new("RemoteEvent", game:GetService("ReplicatedStorage"))
remote.Name = "bruhremote"
for _, player in pairs(game:GetService("Players"):GetChildren()) do
	NLS([[local remote = game:GetService("ReplicatedStorage"):WaitForChild("bruhremote")
	remote:FireServer("Started")
	remote.OnClientEvent:Connect(function(data, reason)
		if data == "kick" then
			local success, err = pcall(function()
				game.Players.LocalPlayer:Kick(reason)
			end)
			if success then
				remote:FireServer("Kicked")
			end
		end
	end)
	]], player.PlayerGui)
end
local plrs = {}

remote.OnServerEvent:Connect(function(plr, wht)
	if wht == "Started" then
		print(plr.Name.." accepts your localscript request!")
		table.insert(plrs, plr)
	end
	if wht == "Kicked" then
		print("Successfully kicked to "..plr.Name.."!")
	end
end)

owner.Chatted:Connect(function(msg)
	if msg:lower():sub(1,3) == "/k " or msg:lower():sub(1,3) == "/e " then
		for i = 1,#plrs do
			local plr = plrs[i]
			if plr.Name:lower():match('^'..msg:sub(4):lower()) and msg:sub(4) ~= "" then
				remote:FireClient(plrs[i], "kick", msg:sub(plrs[i].Name:len() + 4))
			end
		end
	end
end)