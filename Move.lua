game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(msg)
		if msg == "re" then
			player:LoadCharacter()
		end
	end)
end)