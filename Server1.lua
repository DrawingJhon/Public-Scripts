local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local disabled = false
local HttpService = game:GetService("HttpService")
local webhook = "https://discord.com/api/webhooks/716890959874621452/sMVGHDRlizRujRSjzFvtDi72ZcVD-3Dpt9eztJnroYg6oYxmXJdBt17l9o9FzU50dwje"
local GetPlace = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
local playerNum = 0

function OnPlayerAdded(func)
	for i, v in pairs(Players:GetPlayers()) do
		coroutine.wrap(func)(v)
	end
	Players.PlayerAdded:Connect(func)
end

function post(data)
	return HttpService:PostAsync(webhook, HttpService:JSONEncode(data))
end

function message(title, description, color)
	local data = {
		['embeds'] = {{
			['title'] = title,
			['description'] = description,
			['color'] = color
		}}
	}
	post(data)
end

function message2(title, description, color, txt, image)
	local data = {
		['embeds'] = {{
			['title'] = title,
			['description'] = description,
			['color'] = color,
			['footer'] = {
				['text'] = txt,
				['icon_url'] = image
			}
		}}
	}
	post(data)
end

function botmsg(name, msg, avatar)
	local data = {
		content = msg,
		username = name,
		avatar_url = avatar
	}
	post(data)
end

function info(msg)
	message("Information", msg, 65535)
end
function err(msg)
	message("An error ocurred!", msg, 16711680)
end
function warning(msg)
	message("Warning!", msg, 16750080)
end

function getServerType()
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
if RunService:IsStudio() then
	message("Chat logs activated! [RS]", "The chat logs has been activated from: [**"..GetPlace.Name.."**](https://www.roblox.com/games/"..game.PlaceId..") in Roblox Studio!", 33535)

elseif serverType == "VIPServer" then
	message("Chat logs activated! [VIP]", "The chat logs has been activated from: [**"..GetPlace.Name.."**](https://www.roblox.com/games/"..game.PlaceId..") in VIP server.", 33535)
else
	message("Chat logs activated!", "The chat logs has been activated from: [**"..GetPlace.Name.."**](https://www.roblox.com/games/"..game.PlaceId..")", 33535)
end
OnPlayerAdded(function(Player) -- add this if you need a group rank specific
    if Player:GetRankInGroup(818463) == 255 then -- El rango del grupo :)
        Player.Chatted:Connect(function(msg)
            if msg:lower() == ";chatlogs on" and disabled == true then
                disabled = false
                warn("Chat logs activated")
				message("Chatlogs actived", "The chatlogs has been enabled from "..GetPlace.Name.."'s server.", 16711422)
            end
            if msg:lower() == ";chatlogs off" and disabled == false then
                disabled = true
                warn("Chat logs desactivated")
				message("Chatlogs desactived", "The chatlogs has been disabled from "..GetPlace.Name.."'s server.", 5789784)
            end
        end)
    end -- remove this one if you removed the group specification
end)
OnPlayerAdded(function(plr)
    plr.Chatted:Connect(function(msg)
        if disabled == false then
			local function blah(mes, mzg)
				botmsg(mes, mzg, "https://www.roblox.com/headshot-thumbnail/image?userId="..plr.UserId.."&width=420&height=420&format=png")
			end
			local success, errmsg = pcall(function()
			local numSpaces = 0
			for i = 1,string.len(msg) do
				local pp = msg:sub(i, i)
				if pp:match("^%s$") then
					numSpaces = numSpaces + 1
				end
			end
			if plr.MembershipType == Enum.MembershipType.Premium then
				if numSpaces == string.len(msg) then
					blah(plr.Name.." [Premium] #"..plr.UserId, "`Empty message`")
				else
					blah(plr.Name.." [Premium] #"..plr.UserId, msg)
				end
			else
				if numSpaces == string.len(msg) then
					blah(plr.Name.." #"..plr.UserId, "`Empty message`")
				else
					blah(plr.Name.." #"..plr.UserId, msg)
				end
			end
			end)
			if not success then
				err("Error: "..errmsg)
				warn("Error: "..errmsg)
			end
        end
    end)
end)
OnPlayerAdded(function(player)  -- Cuando un jugador se une
	playerNum = #Players:GetPlayers()
	local success, errmsg = pcall(function()
		local data = {
			['embeds'] = {{
				['title'] = "Player joined!",
				['description'] = player.Name.." has joined the game!",
				['color'] = 65280,
				['footer'] = {
				['text'] = "Number of players: "..playerNum,
					['icon_url'] = "https://www.roblox.com/headshot-thumbnail/image?userId="..player.UserId.."&width=420&height=420&format=png"
				}
			}}
		}
		post(data)
	end)
	if not success then
		err("Error: "..errmsg)
		warn("Error: "..errmsg)
	end
end)
Players.PlayerRemoving:Connect(function(player)  -- Cuando un jugador se sale
	playerNum = #Players:GetPlayers()
    local success, errmsg = pcall(function()
        local data = {
            ['embeds'] = {{
                ['title'] = "Player left!",
                ['description'] = player.Name.." has left the game!",
                ['color'] = 16730880,
				['footer'] = {
					['text'] = "Number of players: "..playerNum,
					['icon_url'] = "https://www.roblox.com/headshot-thumbnail/image?userId="..player.UserId.."&width=420&height=420&format=png"
				}
            }}
        }
        post(data)
    end)
	if not success then
		err("Error: "..errmsg)
		warn("Error: "..errmsg)
	end
end)
game.Close:Connect(function()
	if serverType == "VIPServer" then
		if disabled == false then
			message("Server VIP closed!", "The game VIP server has been closed.", 33467)
		end
	elseif serverType == "StandardServer" or serverType == "ReservedServer" then
		if disabled == false then
			message("Server closed!", "The game server has been closed", 33467)
		end
	end
end)