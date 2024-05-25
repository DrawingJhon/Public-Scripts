--[[local ds = game:GetService("DataStoreService")
local ds1 = ds:GetDataStore("ServerVip")
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
	local com = Instance.new("Folder", game.ServerStorage)
	com.Name = "Slock"
	local val = Instance.new("BoolValue", com)
	val.Name = "Comprobation"
	local ownerExist = Instance.new("BoolValue", com)
	ownerExist.Value = false
	ownerExist.Name = "ownerHere"
	game.Players.PlayerAdded:connect(function(player)
		local userdata
		pcall(function()
			userdata = ds1:GetAsync(game.PrivateServerOwnerId.."Slocked")
		end)
	
		if userdata then
			val.Value = userdata
			if val.Value == true then
				if player.UserId ~= game.PrivateServerOwnerId and player.Name ~= "JhonXD2006" and ownerExist.Value == false then
					player:Kick("The owner of the VIP server needs to be in order to join.")
				end
			end
		else
			ds1:SetAsync(game.PrivateServerOwnerId.."Slocked", {
				slock = false
			})
		end
	end)

	game.Close:Connect(function()
		ds1:SetAsync(game.PrivateServerOwnerId.."Slocked", {
			slock = game.ServerStorage.Slock.Comprobation.Value
		})
	end)
end]]