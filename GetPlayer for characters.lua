function getPlayer(shortcut)
	local player = nil
	local g = game.Players:GetPlayers()
	for i = 1, #g do
		if string.lower(string.sub(g[i].Name, 1, string.len(shortcut))) == string.lower(shortcut) then
			player = g[i]
			break
		end
	end
	return player
end