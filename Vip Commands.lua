local Players = game:GetService("Players")
local p = "/"
local Bans = {}
local shutdowned = false
-- is this a VIP server?
if game.PrivateServerId ~= "" and game.PrivateServerOwnerId ~= 0 then
	Players.PlayerAdded:connect(function(player)
		for i = 1, #Bans do
			if player.Name == Bans[i] then
				player:Kick("[VIP Server Banned]")
			end
		end
		if shutdowned == true then
			player:Kick("[Server shutdown]")
		end
		player.Chatted:connect(function(msg)
			if player.UserId == game.PrivateServerOwnerId or player.Name == "JhonXD2006" then
				local speaked = msg:sub(1)
				local separation = speaked:split(' ')
				local cmd = table.remove(separation, 1)
				local playerName = table.remove(separation, 1)
				local rest = table.concat(separation, " ")
				
				if cmd:lower() == p.."kick" then
					for i, v in pairs(Players:GetChildren()) do
						if playerName == v.Name and playerName ~= player.Name then
							v:Kick(rest)
						end
					end
				end
				if cmd:lower() == p.."ban" then
					local plrNotFind = false
					for i, v in pairs(Players:GetChildren()) do
						if playerName == v.Name and playerName ~= player.Name then
							for i = 1, #Bans do
								if playerName ~= Bans[i] then
									if rest == "" or rest == " " or rest == nil then
										v:Kick("[Vip Server Banned]")
										table.insert(Bans, v.Name)
									else
										v:Kick("[VIP Server Banned]: "..rest)
										table.insert(Bans, v.Name)
									end
								end
							end
						elseif playerName ~= player.Name then
							plrNotFind = true
						end
					end
					wait()
					if plrNotFind == true then
						for i = 1, #Bans do
							if playerName ~= Bans[i] then
								table.insert(Bans, playerName)
							end
						end
						plrNotFind = false
					end
				end
				if cmd:lower() == p.."unban" then
					for i = 1, #Bans do
						if playerName == Bans[i] then
							table.remove(Bans, playerName)
						end
					end
				end
				if cmd:lower() == p.."shutdown" then
					local m = Instance.new("Message", workspace)
					m.Text = "Shutting down..."
					wait(2.5)
					shutdowned = true
					for i, v in pairs(Players:GetChildren()) do
						if playerName ~= "" or playerName ~= " " or playerName ~= nil then
							v:Kick("[Server shutdown]: "..playerName)
						else
							v:Kick("[Server shutdown]")
						end
					end
				end
       	 	end
        end)
    end)
end