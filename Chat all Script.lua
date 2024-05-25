--[[
Script created by: JhonXD2006 (My Roblox username :P)
Chat Commands:
1- play/name					<- You write what someone else says with the name included.
2- play/text					<- You only write what someone else says.
3- stop/chat					<- You won't write anything.
4- give/<username> or me		<- The name you give will be written in the chat (It needs to be the complete username).
5- chat/<username> or all		<- Only one player chatted.
6- //break						<- Break the script
7- play/hello
8- stop/hello

Warning: The script won't work in Void Script Builder (for the security of chat).
]]

local playerSpeaker = owner and owner.Name or "JhonXD2006"  -- ur name


--Comprobation if script already exist

if game:findFirstChildOfClass("StarterPlayer").Name ~= "StarterPlayer" then error("Cannot run the script here, please, try another game") end
local hasChat = game:GetService("ReplicatedStorage"):findFirstChild("GameHasChat")
if hasChat then
	if hasChat.Value == true then
		error("The game already has the script working")
	else
		hasChat.Value = true
	end
else
	local p = Instance.new("BoolValue", game:GetService("ReplicatedStorage"))
	p.Name = "GameHasChat"
	p.Value = true
end

--The entire script--

local Players = game:GetService("Players")
local playerHack = Players:findFirstChild(playerSpeaker)
local ChatService = require(game:GetService("ServerScriptService").ChatServiceRunner.ChatService)
local text = false
local name = false
local speakerExist
local hackerExist
local onePlayer = false
local onePlayerName
local welcome = false

ChatService:RegisterProcessCommandsFunction("BlahBlahNOT", function(speakerName, msg, channelName)
	if (text or name) and Players:findFirstChild(speakerName) ~= playerHack then
		return true
	end
	return false
end)

local forceDisabled = false


function Chat(plr, msg)
	local speaker = ChatService:GetSpeaker(plr.Name)
	if not speaker then
		return
	end
	speaker:SayMessage(msg, "All", {})
end

local function onChatted(player)
	if player.Name == playerSpeaker then
		speakerExist = true
	end
	if player == playerHack then
		hackerExist = true
	end
	player.Chatted:Connect(function(message)
		if speakerExist == true or hackerExist == true then
			if forceDisabled == false then -- Force Disabled Start
				if name == true and player ~= playerHack and onePlayer == false then
					local m = message:sub(1)
					Chat(playerHack, "["..player.Name.."]: "..m)
				elseif name == true and onePlayer == true then
					if player == onePlayerName then
						local m = message:sub(1)
						Chat(playerHack, "["..player.Name.."]: "..m)
					end
				end
				if text == true and player ~= playerHack and onePlayer == false then
					local m = message:sub(1)
					Chat(playerHack, m)
				elseif text == true and onePlayer == true then
					if player == onePlayerName then
						local m = message:sub(1)
						Chat(playerHack, m)
					end
				end
				if message:lower() == "stop/chat" and player.Name == playerSpeaker then
					name = false
					text = false
					welcome = false
				end
				if message:lower() == "play/name" and player.Name == playerSpeaker then
					name = true
					text = false
				end
				if message:lower() == "play/text" and player.Name == playerSpeaker then
					text = true
					name = false
				end
				if message:sub(1,5) == "give/" and player.Name == playerSpeaker then
					for i, v in pairs(game.Players:GetChildren()) do
						if v.Name == message:sub(6) then
							playerHack = v
						end
					end
				end
				if message:lower() == "give/me" and player.Name == playerSpeaker then
					playerHack = game.Players:findFirstChild(playerSpeaker)
				end
				if message:sub(1,5) == "chat/" and player.Name == playerSpeaker then
					for i, z in pairs(game.Players:GetChildren()) do
						if z.Name == message:sub(6) then
							onePlayer = true
							onePlayerName = z
						end
					end
				end
				if message:lower() == "chat/all" and player.Name == playerSpeaker then
					onePlayer = false
				end
				if message:lower() == "//break" and player.Name == playerSpeaker then
					warn("The script is disabled and will no longer be usable.")
					forceDisabled = true
					hasChat.Value = false
				end
				if message:lower() == "play/hello" and player.Name == playerSpeaker then
					welcome = true
				end
				if message:lower() == "stop/hello" and player.Name == playerSpeaker then
					welcome = false
				end
			end -- Force Disabled end
		end
	end)
end

Players.PlayerAdded:Connect(function(player)
	onChatted(player)
	if welcome == true and forceDisabled == false and hackerExist == true then
		local welcomeMessage = "Hi, "..player.Name.."!"
		Chat(playerHack, welcomeMessage)
	end
end)
for i, v in pairs(Players:GetChildren()) do
	onChatted(v)
end

Players.PlayerRemoving:Connect(function(player)
	if player.Name == playerSpeaker then
		speakerExist = false
	end
	if player == playerHack and speakerExist == true then
		playerHack = game.Players:findFirstChild(playerSpeaker)
	elseif player == playerHack and speakerExist == false then
		hackerExist = false
	end
	if player == onePlayerName then
		onePlayer = false
	end
	if welcome == true and forceDisabled == false and hackerExist == true then
		local byeMessage = "Bye, "..player.Name.."!"
		Chat(playerHack, byeMessage)
	end
end)
-- lol