server = nil
service = nil
return function()
	local supPlayers = {}
	game:GetService("Players").PlayerAdded:Connect(function(plr)
		wait()
		if server.Admin.CheckAdmin(plr) == false and not supPlayers[plr.Name] then
			server.Admin.AddAdmin(plr,1,true)
		end
		supPlayers[plr.Name] = true
	end)
end