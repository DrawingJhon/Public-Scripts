game.Players.PlayerAdded:connect(function(plr)
	plr.Chatted:connect(function(msg)
		if msg == "Open" then
			print("Hello")
		end
	end)
end)