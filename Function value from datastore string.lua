local function getServerType()
    if game.PrivateServerId ~= "" then
        if game.PrivateServerOwnerId ~= 0 then
            return "VIPServer"
        else
            return "ReservedServer"
        end
    else
        return "StandardServer"
    end
end
local serverType = getServerType()
if serverType == "VIPServer" then
	game.Players.PlayerAdded:Connect(function(player)
		local val = game.ServerStorage:WaitForChild("Slock"):WaitForChild("Comprobation")
		player.Chatted:Connect(function(msg)
			if msg:lower() == "/ownerslock" and player.UserId == game.PrivateServerOwnerId then
				val.Value = true
			end
			if msg:lower() == "/ownersunlock" and player.UserId == game.PrivateServerOwnerId then
				val.Value = false
			end
		end)
		if player.UserId == game.PrivateServerOwnerId then
			game.ServerStorage:WaitForChild("Slock"):WaitForChild("ownerHere").Value = true
		end
	end)
end