function nyaah(plr)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("SoundService")
local Loadstring = require(script.Libs.Loadstring)

for i,v in pairs(ReplicatedStorage:GetChildren()) do
	if v.Name == "RemoteFolder" then
		v:Destroy()
	end
end
for i,v in pairs(script.Parent:GetChildren()) do
	if v.Name == "IY" and v ~= script then
		v:Destroy()
	end
end
for i,v in pairs(Players:GetChildren()) do
	for i,c in pairs(v.PlayerGui:GetChildren()) do
		if c.Name == "IY_GUI" then
			c:Destroy()
		end
	end
end

wait(1)

local RemoteFolder = Instance.new("Folder",ReplicatedStorage)
RemoteFolder.Name = 'RemoteFolder'

local RunRemote = Instance.new("RemoteEvent", RemoteFolder)
RunRemote.Name = "RunCmd"

function getUsernameFromUserId(userId)
	local player = Players:GetPlayerByUserId(userId)
	if player then
		return player.Name
	end 
	local name
	if pcall(function() name = Players:GetNameFromUserIdAsync(userId) end) then
		return name
	else
		return "ERROR FETCHING USER "..userId
	end
end

local OwnerID = {} -- Change that to your ROBLOX profile ID thats all
local Owner = {plr}
local AdminID = {}
local Admin = {}
local Bans = {}

for i = 1, #OwnerID do
	spawn(function()
		table.insert(Owner,getUsernameFromUserId(OwnerID[i]))
	end)
end

for i = 1, #AdminID do
	spawn(function()
		table.insert(Admin,getUsernameFromUserId(AdminID[i]))
	end)
end

repeat wait() until #Owner >= #OwnerID

local RunOnClient = Instance.new("RemoteEvent", RemoteFolder)
RunOnClient.Name = "RunOnClient"

local SendToClient = Instance.new("RemoteEvent", RemoteFolder)
SendToClient.Name = "SendToClient"

local Guis = script:WaitForChild("Guis")
local Scripts = script:WaitForChild("Scripts")
local Models = script:WaitForChild("Models")
local Tools = script:WaitForChild("Tools")

local GUI = Guis:WaitForChild("IY_GUI")

function GiveHandler(plr)
	local FoundIY = false
	for i,v in pairs(plr:WaitForChild("PlayerGui"):GetChildren()) do
		if v.Name == 'IY_GUI' or v:FindFirstChild('IY_Handler') then
			FoundIY = true
		end
	end
	if FoundIY == false then
		local Parent = plr:WaitForChild("PlayerGui")	
		local CopyHandler = GUI:Clone()
		CopyHandler.Parent = Parent
		CopyHandler.IY_Handler.Disabled = false
	end
end

for i = 1, #Owner do
	spawn(function()
		if Players:FindFirstChild(Owner[i]) then
			GiveHandler(Players[Owner[i]])
		end
	end)
end

for i = 1, #Admin do
	spawn(function()
		if Players:FindFirstChild(Admin[i]) then
			GiveHandler(Players[Admin[i]])
		end
	end)
end

local std={}
std.inTable=function(tbl,val)
    if tbl==nil then return false end
    for _,v in pairs(tbl)do
        if v==val then return true end
    end 
	return false
end

local findCmd=function(cmd_name)
	for i,v in pairs(cmds)do
		if v.NAME:lower()==cmd_name:lower() or std.inTable(v.ALIAS,cmd_name:lower()) then
			return v
		end
	end
end

function isNumber(str)
	return tonumber(str) ~= nil
end

local allowFriends = true
local function RunCommand(player,class,cmd,args,cargs)
	spawn(function()
		if FindInTable(Owner,player.Name) or FindInTable(Admin,player.Name) then
			if class == 'command' then
				capargs = cargs
				local command = findCmd(cmd)
				command.FUNC(args, player)
			elseif class == 'setting' then
				if cmd == 'allowFriends' then
					allowFriends = args
					for i,v in pairs(game.Players:GetChildren()) do
						if v.ClassName == 'Player' and v:FindFirstChild('PlayerGui') and v.PlayerGui:FindFirstChild('IY_GUI') then
							local button = v.PlayerGui:FindFirstChild('IY_GUI').Top.PopupFrame.Items.settingsFrame.allowfriendsBox
							if args == true then
								button.BackgroundColor3 = Color3.new(0.290196, 0.290196, 0.298039)
							else
								button.BackgroundColor3 = Color3.new(0.180392, 0.180392, 0.184314)
							end
						end
					end
				elseif cmd == 'requestInfo' then
					refreshBans()
					refreshAdmins()
				end
			elseif class == 'log' then
				for i,v in pairs(Players:GetChildren()) do
					spawn(function()
						if FindInTable(Admin,v.Name) or FindInTable(Owner,v.Name) then
							SendToClient:FireClient(v,'LogCMD',player.Name,cmd)
						end
					end)
				end
			end
		end
	end)
end

RunRemote.OnServerEvent:Connect(RunCommand)

local function splitString(str,delim)
	local broken = {}
	if delim == nil then delim = "," end
		for w in string.gmatch(str,"[^"..delim.."]+") do
			table.insert(broken,w)
		end
	return broken
end

local function toTokens(str)
	local tokens = {}
	for op,name in string.gmatch(str,"([+-])([^+-]+)") do
		table.insert(tokens,{Operator = op,Name = name})
	end
	return tokens
end

local SpecialPlayerCases = {
	["all"] = function(speaker)return Players:GetPlayers() end,
	["others"] = function(speaker)
		local plrs = {}
		for i,v in pairs(Players:GetPlayers()) do
			if v ~= speaker then
				table.insert(plrs,v)
			end
		end
		return plrs
	 end,
	["me"] = function(speaker)return {speaker} end,
	["#(%d+)"] = function(speaker,args,currentList)
		local returns = {}
		local randAmount = tonumber(args[1])
		local players = {unpack(currentList)}
		for i = 1,randAmount do
			if #players == 0 then break end
			local randIndex = math.random(1,#players)
			table.insert(returns,players[randIndex])
			table.remove(players,randIndex)
		end
		return returns
	end,
	["random"] = function(speaker,args,currentList)
		local players = currentList
		return {players[math.random(1,#players)]}
	end,
	["%%(.+)"] = function(speaker,args)
		local returns = {}
		local team = args[1]
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Team and string.sub(string.lower(plr.Team.Name),1,#team) == string.lower(team) then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["allies"] = function(speaker)
		local returns = {}
		local team = speaker.Team
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Team == team then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["enemies"] = function(speaker)
		local returns = {}
		local team = speaker.Team
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Team ~= team then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["team"] = function(speaker)
		local returns = {}
		local team = speaker.Team
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Team == team then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["nonteam"] = function(speaker)
		local returns = {}
		local team = speaker.Team
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Team ~= team then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["friends"] = function(speaker,args)
		local returns = {}
		for _,plr in pairs(Players:GetPlayers()) do
			if plr:IsFriendsWith(speaker.UserId) and plr ~= speaker then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["nonfriends"] = function(speaker,args)
		local returns = {}
		for _,plr in pairs(Players:GetPlayers()) do
			if not plr:IsFriendsWith(speaker.UserId) and plr ~= speaker then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["guests"] = function(speaker,args)
		local returns = {}
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Guest then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["bacons"] = function(speaker,args)
		local returns = {}
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Character:FindFirstChild('Pal Hair') or plr.Character:FindFirstChild('Kate Hair') then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["admins"] = function(speaker)
		local returns = {}
		for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
			if FindInTable(Admin,plr.Name) or FindInTable(Owner,plr.Name) then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["nonadmins"] = function(speaker)
		local returns = {}
		for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
			if not FindInTable(Admin,plr.Name) and not FindInTable(Owner,plr.Name) then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["age(%d+)"] = function(speaker,args)
		local returns = {}
		local age = tonumber(args[1])
		if not age == nil then return end
		for _,plr in pairs(Players:GetPlayers()) do
		if plr.AccountAge <= age then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["rad(%d+)"] = function(speaker,args)
		local returns = {}
		local radius = tonumber(args[1])
		local speakerChar = speaker.Character
		if not speakerChar or not speakerChar:FindFirstChild("HumanoidRootPart") then return end
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
				local magnitude = (plr.Character:FindFirstChild("HumanoidRootPart").Position-speakerChar.HumanoidRootPart.Position).magnitude
				if magnitude <= radius then table.insert(returns,plr) end
			end
		end
		return returns
	end
}

local function onlyIncludeInTable(tab,matches)
	local matchTable = {}
	local resultTable = {}
	for i,v in pairs(matches) do matchTable[v.Name] = true end
	for i,v in pairs(tab) do if matchTable[v.Name] then table.insert(resultTable,v) end end
	return resultTable
end

local function getPlayersByName(name)
	local found = {}
	for i,v in pairs(Players:GetChildren()) do
		if string.sub(string.lower(v.Name),1,#name) == string.lower(name) then
			table.insert(found,v)
		end
	end
	return found
end

local function removeTableMatches(tab,matches)
	local matchTable = {}
	local resultTable = {}
	for i,v in pairs(matches) do matchTable[v.Name] = true end
	for i,v in pairs(tab) do if not matchTable[v.Name] then table.insert(resultTable,v) end end
	return resultTable
end

function getPlayer(list,speaker)
	if list == nil then return {speaker.Name} end
	local nameList = splitString(list,",")
	
	local foundList = {}
	
	for _,name in pairs(nameList) do
		if string.sub(name,1,1) ~= "+" and string.sub(name,1,1) ~= "-" then name = "+"..name end
		local tokens = toTokens(name)
		local initialPlayers = Players:GetPlayers()
		
		for i,v in pairs(tokens) do
			if v.Operator == "+" then
				local tokenContent = v.Name
				local foundCase = false
				for regex,case in pairs(SpecialPlayerCases) do
					local matches = {string.match(tokenContent,"^"..regex.."$")}
					if #matches > 0 then
						foundCase = true
						initialPlayers = onlyIncludeInTable(initialPlayers,case(speaker,matches,initialPlayers))
					end
				end
				if not foundCase then
					initialPlayers = onlyIncludeInTable(initialPlayers,getPlayersByName(tokenContent))
				end
			else
				local tokenContent = v.Name
				local foundCase = false
				for regex,case in pairs(SpecialPlayerCases) do
					local matches = {string.match(tokenContent,"^"..regex.."$")}
					if #matches > 0 then
						foundCase = true
						initialPlayers = removeTableMatches(initialPlayers,case(speaker,matches,initialPlayers))
					end
				end
				if not foundCase then
					initialPlayers = removeTableMatches(initialPlayers,getPlayersByName(tokenContent))
				end
			end
		end
		
		for i,v in pairs(initialPlayers) do table.insert(foundList,v) end
	end
	
	local foundNames = {}
	for i,v in pairs(foundList) do table.insert(foundNames,v.Name) end
	
	return foundNames
end

function getstring(begin)
	local start = begin-1
	local AA = '' for i,v in pairs(capargs) do
		if i > start then
			if AA ~= '' then
				AA = AA .. ' ' .. v
			else
				AA = AA .. v
			end
		end
	end
	return AA
end

cmds = {}

function addcmd(name,alias,func,plgn)
	cmds[#cmds+1]=
	{
		NAME=name;
		ALIAS=alias;
		FUNC=func;
		PLUGIN=plgn;
	}
end

function FindInTable(Table, Name)
	for i,v in pairs(Table) do
		if v == Name then
			return true
		end
	end
	return false
end

function GetInTable(Table, Name)
	for i = 1, #Table do
		if Table[i] == Name then
			return i
		end
	end
	return false
end

function checkFriends(plr)
	local foundFriend = false
	for i,v in pairs(Players) do
		spawn(function()
			if FindInTable(Owner,v.Name) or FindInTable(Admin,v.Name) then
				if plr:IsFriendsWith(v.userId) then
					foundFriend = true
				end
			end
		end)
	end
	if foundFriend == true then
		return true
	end
end

local slock = false
local agelockEnabled = false
local agelock = 0
Players.PlayerAdded:connect(function(player)
	if FindInTable(Bans,player.Name:lower()) then
		player:Kick('[Banned]: You have been banned from the server')
	end
	if slock and not FindInTable(Owner,player.Name) and not FindInTable(Admin,player.Name) then
		if allowFriends == true and not checkFriends(player) then
			player:Kick('[Locked]: You cannot join this server.')
		elseif allowFriends == false then
			player:Kick('[Locked]: You cannot join this server.')
		end
	end
	if agelockEnabled and not FindInTable(Owner,player.Name) and not FindInTable(Admin,player.Name) then
		if allowFriends == true and not checkFriends(player) and player.AccountAge <= agelock then
			player:Kick('[Age Locked]: Your account is not old enough to join this server')
		elseif allowFriends == false and player.AccountAge <= agelock then
			player:Kick('[Age Locked]: Your account is not old enough to join this server')
		end
	end
	if FindInTable(Owner,player.Name) or FindInTable(Admin,player.Name) then
		GiveHandler(player)
	end
end)

function refresh(plr)
	spawn(function()
		if plr.Character ~= nil then
			local rpos = plr.Character.HumanoidRootPart.Position
			wait(0.1)
			plr:LoadCharacter()
			wait(0.1)
			repeat wait() until plr.Character ~= nil and plr.Character:FindFirstChild('HumanoidRootPart')
			plr.Character:MoveTo(rpos)
		else
			plr:LoadCharacter()	
		end
	end)
end

function Rig6(plr)
	if not plr.Character:FindFirstChild("Torso") then
		local Character = Models.R6:Clone()
		for i,v in pairs(plr.Character:GetDescendants()) do
			if not v:IsA("Motor6D") and not v:IsA("Attachment") and not v:FindFirstChild("CharacterSoundEvent") then
				local Parent = v.Parent.Name
				if Parent == 'Head' or Parent == 'HumanoidRootPart' or Parent == 'Left Arm' or Parent == 'Right Arm' or Parent == 'Left Leg' or Parent == 'Right Leg' or Parent == 'Torso' then
					v.Parent = Character[Parent]
				end
			end
		end
		Character.HumanoidRootPart.Position = plr.Character.HumanoidRootPart.Position
		Character.Name = plr.Name
		plr.Character = Character
		local userId
		if plr.CharacterAppearanceId >= 1 then
			userId = plr.CharacterAppearanceId
		else
			userId = plr.UserId
		end
		local appearance = Players:GetCharacterAppearanceAsync(userId)
		for i,v in pairs(appearance:GetChildren()) do
			if v.Name == "R6" then
				v:GetChildren()[1].Parent = Character
			elseif not v:IsA("Folder") and not v:IsA("NumberValue") then
				v.Parent = Character
			end
		end
		Character.Parent = workspace
		for i,v in pairs(Character:GetChildren()) do
			if v:IsA("Script") or v:IsA("LocalScript") then
				v.Disabled = false
			end
		end
	end
	repeat wait() until plr.Character:FindFirstChild('Torso')
end

addcmd('cmds',{'commands'},
function(args, speaker)
	SendToClient:FireClient(speaker,'Open','cmds')
end)

addcmd('settings',{},
function(args, speaker)
	SendToClient:FireClient(speaker,'Open','settings')
end)

addcmd('bans',{},
function(args, speaker)
	SendToClient:FireClient(speaker,'Open','bans')
end)

addcmd('admins',{},
function(args, speaker)
	SendToClient:FireClient(speaker,'Open','admins')
end)

addcmd('logs',{},
function(args, speaker)
	SendToClient:FireClient(speaker,'Open','logs')
end)

addcmd('keybinds',{},
function(args, speaker)
	SendToClient:FireClient(speaker,'Open','keybinds')
end)

addcmd('breakloops',{'break'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			if args[1] then
				SendToClient:FireClient(Players[v],'Breakloops')
			else
				for i,v in pairs(Players:GetChildren()) do
					spawn(function()
						if FindInTable(Admin,v.Name) or FindInTable(Owner,v.Name) then
							SendToClient:FireClient(v,'Breakloops')
						end
					end)
				end
			end
		end)
	end
end)

addcmd('removeadmin',{},
function(args, speaker)
	if not FindInTable(Owner,speaker.Name) then return end
	for i,v in pairs(Players:GetChildren()) do
		for i,c in pairs(v.PlayerGui:GetChildren()) do
			if c.Name == "IY_GUI" then
				c:Destroy()
			end
		end
	end
	for i,v in pairs(ReplicatedStorage:GetChildren()) do
		if v.Name == "RemoteFolder" then
			v:Destroy()
		end
	end
	for i,v in pairs(script.Parent:GetChildren()) do
		if v.Name == "IY" and v ~= script then
			v:Destroy()
		end
	end
	script:Destroy()
end)

addcmd('admin',{},
function(args, speaker)
	if not FindInTable(Owner,speaker.Name) then return end
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			if not FindInTable(Owner,Players[v].Name) and not FindInTable(Admin,Players[v].Name) then
				table.insert(Admin,Players[v].Name)
				GiveHandler(Players[v])
			end
		end)
	end
	refreshAdmins()
end)

addcmd('unadmin',{},
function(args, speaker)
	if not FindInTable(Owner,speaker.Name) then return end
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			if FindInTable(Admin,Players[v].Name) then
				for a,b in pairs(Admin) do
					if b == Players[v].Name then
						table.remove(Admin, a)
					end
				end
				for i,v in pairs(Players[v]:WaitForChild("PlayerGui"):GetChildren()) do
					if v.Name == 'IY_GUI' or v:FindFirstChild('IY_Handler') then
						v:Destroy()
					end
				end
			end
		end)
	end
	if FindInTable(Admin,getstring(1):lower()) then
		table.remove(Admin,GetInTable(Admin,getstring(1):lower()))
	end
	refreshAdmins()
end)

addcmd('addadmin',{},
function(args, speaker)
	if not FindInTable(Owner,speaker.Name) then return end
	if not FindInTable(Owner,getstring(1)) and not FindInTable(Admin,getstring(1)) and args[1] then
		table.insert(Admin,getstring(1))
		if Players:FindFirstChild(getstring(1)) then
			GiveHandler(Players[getstring(1)])
		end
	end
	refreshAdmins()
end)

addcmd('owner',{},
function(args, speaker)
	if not FindInTable(Owner,speaker.Name) then return end
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			if not FindInTable(Owner,Players[v].Name) then
				if FindInTable(Admin,Players[v].Name) then
					for a,b in pairs(Admin) do
						if b == Players[v].Name then
							table.remove(Admin, a)
						end
					end
					for i,v in pairs(Players[v]:WaitForChild("PlayerGui"):GetChildren()) do
						if v.Name == 'IY_GUI' or v:FindFirstChild('IY_Handler') then
							v:Destroy()
						end
					end
				end
				table.insert(Owner,Players[v].Name)
				GiveHandler(Players[v])
			end
		end)
	end
	refreshAdmins()
end)

addcmd('unowner',{},
function(args, speaker)
	if not FindInTable(Owner,speaker.Name) then return end
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			if FindInTable(Owner,Players[v].Name) then
				for a,b in pairs(Owner) do
					if b == Players[v].Name then
						table.remove(Owner, a)
					end
				end
				for i,v in pairs(Players[v]:WaitForChild("PlayerGui"):GetChildren()) do
					if v.Name == 'IY_GUI' or v:FindFirstChild('IY_Handler') then
						v:Destroy()
					end
				end
			end
		end)
	end
	refreshAdmins()
end)

addcmd('kick',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			if not FindInTable(Owner,Players[v].Name) and not FindInTable(Admin,Players[v].Name) then
				if args[2] then
					Players[v]:Kick('[Kicked]: '..getstring(2))
				else
					Players[v]:Kick('[Kicked]')
				end
			end
		end)
	end
end)

function refreshBans()
	for i,v in pairs(game.Players:GetChildren()) do
		if v.ClassName == 'Player' and v:FindFirstChild('PlayerGui') and v.PlayerGui:FindFirstChild('IY_GUI') then
			local parent = v.PlayerGui:FindFirstChild('IY_GUI')
			local BList = parent.Top.PopupFrame.Items.bansFrame
			BList:ClearAllChildren()
			BList.CanvasSize = UDim2.new(0, 0, 0, 0)
			for i = 1, #Bans do
				local YSize = 22
				local Position = ((i * YSize) - YSize)
				local newcmd = parent.Top.PopupFrame.Items.Label:Clone()
				newcmd.Parent = BList
				newcmd.Visible = true
				newcmd.Position = UDim2.new(0,0,0, Position)
				newcmd.labelText.Text = Bans[i]
				BList.CanvasSize = UDim2.new(0,0,0, Position + 30)
				local unban = newcmd.closeBox
				unban.MouseButton1Click:Connect(function()
					table.remove(Bans,GetInTable(Bans,Bans[i]))
					refreshBans()
				end)
				if BList.CanvasSize.Y.Offset >= 218 then
					for i,c in pairs(BList:GetChildren()) do
						c.closeBox.Position = UDim2.new(c.closeBox.Position.X.Scale,307,c.closeBox.Position.Y.Scale,c.closeBox.Position.Y.Offset)
					end
				else
					for i,c in pairs(BList:GetChildren()) do
						c.closeBox.Position = UDim2.new(c.closeBox.Position.X.Scale,315,c.closeBox.Position.Y.Scale,c.closeBox.Position.Y.Offset)
					end
				end
			end
		end
	end
end

function refreshAdmins()
	spawn(function()
		for i,v in pairs(game.Players:GetChildren()) do
			if v.ClassName == 'Player' and v:FindFirstChild('PlayerGui') and v.PlayerGui:FindFirstChild('IY_GUI') then
				wait()
				local parent = v.PlayerGui:FindFirstChild('IY_GUI')
				local AList = parent.Top.PopupFrame.Items.adminsFrame
				AList:ClearAllChildren()
				AList.CanvasSize = UDim2.new(0, 0, 0, 0)
				local YSize = 22
				local count = 1
				for i = 1, #Admin do
					local Position = ((count * YSize) - YSize)
					local newcmd = parent.Top.PopupFrame.Items.Label:Clone()
					newcmd.Parent = AList
					newcmd.Visible = true
					newcmd.Position = UDim2.new(0,0,0, Position)
					newcmd.labelText.Text = Admin[i].." - [ADMIN]"
					AList.CanvasSize = UDim2.new(0,0,0, Position + 30)
					if FindInTable(Owner,v.Name) then
						newcmd.closeBox.MouseButton1Click:Connect(function()
							local AdminName = Admin[i]
							table.remove(Admin,GetInTable(Admin,AdminName))
							if Players:FindFirstChild(AdminName) then
								for i,v in pairs(Players[AdminName]:WaitForChild("PlayerGui"):GetChildren()) do
									if v.Name == 'IY_GUI' or v:FindFirstChild('IY_Handler') then
									v:Destroy()
									end
								end
							end
							refreshAdmins()
						end)
					else
						newcmd.closeBox:Destroy()
					end
					count = count + 1
				end
				for i = 1, #Owner do
					local Position = ((count * YSize) - YSize)
					local newcmd = parent.Top.PopupFrame.Items.Label:Clone()
					newcmd.Parent = AList
					newcmd.Visible = true
					newcmd.Position = UDim2.new(0,0,0, Position)
					newcmd.labelText.Text = Owner[i].." - [OWNER]"
					AList.CanvasSize = UDim2.new(0,0,0, Position + 30)
					newcmd.closeBox.Visible = false
					newcmd.labelText.TextColor3 = Color3.new(1, 0, 0)
					count = count + 1
				end
				if AList.CanvasSize.Y.Offset >= 218 then
					for i,c in pairs(AList:GetChildren()) do
						c.closeBox.Position = UDim2.new(c.closeBox.Position.X.Scale,307,c.closeBox.Position.Y.Scale,c.closeBox.Position.Y.Offset)
					end
				else
					for i,c in pairs(AList:GetChildren()) do
						c.closeBox.Position = UDim2.new(c.closeBox.Position.X.Scale,315,c.closeBox.Position.Y.Scale,c.closeBox.Position.Y.Offset)
					end
				end
			end
		end
	end)
end

addcmd('ban',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			if not FindInTable(Owner,Players[v].Name) and not FindInTable(Admin,Players[v].Name) then
				local plr = Players[v].Name:lower()
				table.insert(Bans,plr)
				refreshBans(speaker)
				pcall(function()
					local OOF = Instance.new("Sound",Players[v].PlayerGui)
					OOF.SoundId = 'rbxassetid://889397884'
					OOF.Volume = 10
					OOF:Play()
				end)
				if args[2] then
					Players[v]:Kick('[Banned]: '..getstring(2))
				else
					Players[v]:Kick('[Banned]')
				end
			end
		end)
	end
end)

addcmd('addban',{},
function(args, speaker)
	if not FindInTable(Owner,getstring(1)) and not FindInTable(Admin,getstring(1)) and args[1] then
		table.insert(Bans,getstring(1))
		refreshBans(speaker)
	end
end)

addcmd('unban',{},
function(args, speaker)
	local plr = getstring(1):lower()
	if FindInTable(Bans,plr) then
		table.remove(Bans,GetInTable(Bans,plr))
	end
	refreshBans(speaker)
end)

addcmd('clrbans',{},
function(args, speaker)
	Bans = {}
	refreshBans(speaker)
end)

addcmd('serverlock',{'slock'},
function(args, speaker)
	slock = true
	for i,v in pairs(Players:GetChildren()) do
		local hintGui = Guis.IY_Hint:Clone()
		local infoValue = hintGui.Info
		infoValue.Value = 'The server has been locked. (Nobody can join)'
		hintGui.Parent = v:WaitForChild("PlayerGui")
		hintGui.IY_Hint_Handler.Disabled = false
	end
end)

addcmd('unserverlock',{'unslock'},
function(args, speaker)
	slock = false
	for i,v in pairs(Players:GetChildren()) do
		local hintGui = Guis.IY_Hint:Clone()
		local infoValue = hintGui.Info
		infoValue.Value = 'Serverlock has been disabled. (Players can join)'
		hintGui.Parent = v:WaitForChild("PlayerGui")
		hintGui.IY_Hint_Handler.Disabled = false
	end
end)

addcmd('agelock',{},
function(args, speaker)
	if not args[1] then return end
	agelockEnabled = true
	agelock = args[1]
	for i,v in pairs(Players:GetChildren()) do
		local hintGui = Guis.IY_Hint:Clone()
		local infoValue = hintGui.Info
		infoValue.Value = 'The server has been age locked. (Minimum age: '..agelock..')'
		hintGui.Parent = v:WaitForChild("PlayerGui")
		hintGui.IY_Hint_Handler.Disabled = false
	end
end)

addcmd('unagelock',{},
function(args, speaker)
	agelockEnabled = false
	for i,v in pairs(Players:GetChildren()) do
		local hintGui = Guis.IY_Hint:Clone()
		local infoValue = hintGui.Info
		infoValue.Value = 'Agelock has been disabled. (No minimum age)'
		hintGui.Parent = v:WaitForChild("PlayerGui")
		hintGui.IY_Hint_Handler.Disabled = false
	end
end)

addcmd('shutdown',{},
function(args, speaker)
	if args[1] then
		while true do
			for i,v in pairs(Players:GetChildren()) do
				spawn(function()
					v:Kick('[SHUTDOWN]: '..getstring(1))
				end)
			end
			wait(1)
		end
	else
		while true do
			for i,v in pairs(Players:GetChildren()) do
				spawn(function()
					v:Kick('[SHUTDOWN]')
				end)
			end
			wait(1)
		end
	end
end)

addcmd('kill',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		Players[v].Character:BreakJoints()
	end
end)

addcmd('gear',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			local Item = game:GetService("InsertService"):LoadAsset(args[2])
			wait()
			Item = Item:GetChildren()[1]
			local Parent = Players[v]:WaitForChild("Backpack")
			Item.Parent = Parent
		end)
	end
end)

addcmd('sword',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			local Item = game:GetService("InsertService"):LoadAsset(125013769)
			wait()
			Item = Item:GetChildren()[1]
			local Parent = Players[v]:WaitForChild("Backpack")
			Item.Parent = Parent
		end)
	end
end)

addcmd('message',{'m'},
function(args, speaker)
	for i,v in pairs(Players:GetChildren()) do
		spawn(function()
			local messageGui = Guis.IY_Message:Clone()
			local infoValue = messageGui.Info
			infoValue.Name = 'Message From '..speaker.Name
			infoValue.Value = getstring(1)
			messageGui.Parent = v:WaitForChild("PlayerGui")
			messageGui.IY_Message_Handler.Disabled = false
		end)
	end
end)

addcmd('servermessage',{'sm'},
function(args, speaker)
	for i,v in pairs(Players:GetChildren()) do
		spawn(function()
			local messageGui = Guis.IY_Message:Clone()
			local infoValue = messageGui.Info
			infoValue.Name = 'Message'
			infoValue.Value = getstring(1)
			messageGui.Parent = v:WaitForChild("PlayerGui")
			messageGui.IY_Message_Handler.Disabled = false
		end)
	end
end)

addcmd('privatemessage',{'pm'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			local messageGui = Guis.IY_Message:Clone()
			local infoValue = messageGui.Info
			infoValue.Name = 'Private Message From '..speaker.Name
			infoValue.Value = getstring(2)
			messageGui.Parent = Players[v]:WaitForChild("PlayerGui")
			messageGui.IY_Message_Handler.Disabled = false
		end)
	end
end)

addcmd('hint',{'h'},
function(args, speaker)
	for i,v in pairs(Players:GetChildren()) do
		spawn(function()
			local hintGui = Guis.IY_Hint:Clone()
			local infoValue = hintGui.Info
			infoValue.Value = getstring(1)
			hintGui.Parent = v:WaitForChild("PlayerGui")
			hintGui.IY_Hint_Handler.Disabled = false
		end)
	end
end)

addcmd('privatehint',{'ph'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			local hintGui = Guis.IY_Hint:Clone()
			local infoValue = hintGui.Info
			infoValue.Value = getstring(2)
			hintGui.Parent = Players[v]:WaitForChild("PlayerGui")
			hintGui.IY_Hint_Handler.Disabled = false
		end)
	end
end)

addcmd('goto',{'to'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			if Players[v].Character ~= nil then
				if speaker.Character:FindFirstChild("HumanoidRootPart") then
					speaker.Character:FindFirstChildOfClass('Humanoid').Jump = true
				end
				speaker.Character.HumanoidRootPart.CFrame = Players[v].Character.HumanoidRootPart.CFrame + Vector3.new(4,1,0)
			end
		end)
	end
end)

addcmd('bring',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			if Players[v].Character ~= nil then
				if Players[v].Character:FindFirstChildOfClass("Humanoid") then
				Players[v].Character:FindFirstChildOfClass('Humanoid').Jump = true
				end
				Players[v].Character.HumanoidRootPart.CFrame = speaker.Character.HumanoidRootPart.CFrame + Vector3.new(4,1,0)
				wait(0.1)
				Players[v].Character.HumanoidRootPart.CFrame = speaker.Character.HumanoidRootPart.CFrame + Vector3.new(4,1,0)
			end
		end)
	end
end)

addcmd('tp',{'teleport'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	local players2 = getPlayer(args[2], speaker)
	for i,v in pairs(players) do
		spawn(function()
			if Players[v].Character ~= nil and Players[players2[1]].Character ~= nil then
				if Players[v].Character:FindFirstChildOfClass("Humanoid") then
				Players[v].Character:FindFirstChildOfClass('Humanoid').Jump = true
				end
				Players[v].Character.HumanoidRootPart.CFrame = Players[players2[1]].Character.HumanoidRootPart.CFrame + Vector3.new(4,1,0)
				wait(0.1)
				Players[v].Character.HumanoidRootPart.CFrame = Players[players2[1]].Character.HumanoidRootPart.CFrame + Vector3.new(4,1,0)
			end
		end)
	end
end)

addcmd('speed',{'ws'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    if not args[1]or not args[2]then return end
    local num=args[2]
	for i,v in pairs(players) do
		if Players[v].Character:FindFirstChildOfClass("Humanoid") then
			Players[v].Character:FindFirstChildOfClass('Humanoid').WalkSpeed=tonumber(num)
		end
	end
end)

addcmd('music',{'sound'},
function(args, speaker)
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name == 'IY_Sound' then
			v:Destroy()
		end
	end
	if args[1] ~= 'stop' or args[1] ~= 'off' then
		local sound = Instance.new("Sound",workspace)
		sound.Name = 'IY_Sound'
		sound.SoundId = "rbxassetid://" .. args[1]
		sound.Looped = true
		sound.Volume = 1
		sound:Play()
		local Asset = game:GetService("MarketplaceService"):GetProductInfo(args[1])
		SendToClient:FireClient(speaker,'Notify','Now Playing: '..Asset.Name)
	end
end)

addcmd('pitch',{},
function(args, speaker)
	local audio = workspace:FindFirstChild('IY_Sound')
	if audio.ClassName == 'Sound' then
		audio.PlaybackSpeed = args[1]
	end
end)

addcmd('volume',{'vol'},
function(args, speaker)
	local audio = workspace:FindFirstChild('IY_Sound')
	if audio.ClassName == 'Sound' then
		audio.Volume = args[1]
	end
end)

addcmd('age',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		local players = getPlayer(args[1], speaker)
		local ages = {}
		for i,v in pairs(players) do
			local p = Players[v]
			table.insert(ages, p.Name.."'s age is: "..p.AccountAge)
		end
		local hintGui = Guis.IY_Hint:Clone()
		local infoValue = hintGui.Info
		infoValue.Value = table.concat(ages, ', ')
		hintGui.Parent = speaker:WaitForChild("PlayerGui")
		hintGui.IY_Hint_Handler.Disabled = false
	end
end)

addcmd('btools',{'f3x'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		local f3x = Tools.BuildingTools:Clone()
		f3x.Parent = Players[v]:WaitForChild("Backpack")
	end
end)

addcmd('respawn',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		Players[v]:LoadCharacter()
	end
end)

addcmd('refresh',{'re'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		refresh(Players[v])
	end
end)

addcmd('clone',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		if not Players[v] or not Players[v].Character then return nil end
		Players[v].Character.Archivable = true
		local Char = Players[v].Character:Clone()
		Players[v].Character.Archivable = false
		Char.Parent = workspace
		Char:MakeJoints()
		Char:MoveTo(Players[v].Character.HumanoidRootPart.Position + Vector3.new(0,3,1))
		local cloneV = Instance.new("BoolValue")
		cloneV.Name = "isclone"
		cloneV.Parent = Char
	end
end)

addcmd('noclones',{'removeclones'},
function(args, speaker)
	for _, child in pairs(workspace:GetChildren()) do
		if child:FindFirstChild('isclone') then
			child:Destroy()
		end
	end
end)

addcmd('unlockws',{},
function(args, speaker)
    local function unlock(instance) 
        for i,v in pairs(instance:GetChildren()) do
            if v:IsA("BasePart") then
                v.Locked = false
            end
            unlock(v)
        end
    end
    unlock(workspace)
end)

addcmd('lockws',{},
function(args, speaker)
    local function lock(instance) 
        for i,v in pairs(instance:GetChildren()) do
            if v:IsA("BasePart") then
                v.Locked = true
            end
            lock(v)
        end
    end
    lock(workspace)
end)

addcmd('lock',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		for i,v in pairs(Players[v].Character:GetDescendants()) do
			if v:IsA("Part") then
				v.Locked = true
			end
		end
	end
end)

addcmd('unlock',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		for i,v in pairs(Players[v].Character:GetDescendants()) do
			if v:IsA("Part") then
				v.Locked = false
			end
		end
	end
end)

addcmd('explode',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i, v in pairs(players) do
        if Players[v].Character:FindFirstChild("HumanoidRootPart") then
            Instance.new("Explosion", Players[v].Character).Position = Players[v].Character.HumanoidRootPart.Position					
        end
    end
end)

addcmd('ff',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		Instance.new("ForceField", Players[v].Character)
	end
end)

addcmd('unff',{'noff'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		for j,v1 in pairs(Players[v].Character:GetChildren()) do
			if v1:IsA("ForceField") then
				v1:Destroy()
			end
		end
	end
end)

origsettings = {abt = game:GetService("Lighting").Ambient, oabt = game:GetService("Lighting").OutdoorAmbient, brt = game:GetService("Lighting").Brightness, time = game:GetService("Lighting").TimeOfDay, fclr = game:GetService("Lighting").FogColor, fe = game:GetService("Lighting").FogEnd, fs = game:GetService("Lighting").FogStart}
addcmd('restorelighting',{'rlighting'},
function(args,speaker)
	game:GetService("Lighting").Ambient = origsettings.abt
	game:GetService("Lighting").OutdoorAmbient = origsettings.oabt
	game:GetService("Lighting").Brightness = origsettings.brt
	game:GetService("Lighting").TimeOfDay = origsettings.time
	game:GetService("Lighting").FogColor = origsettings.fclr
	game:GetService("Lighting").FogEnd = origsettings.fe
	game:GetService("Lighting").FogStart = origsettings.fs
end)

addcmd("savelighting",{'slighting','savel'},
function(args,speaker)
origsettings = {abt = game:GetService("Lighting").Ambient, oabt = game:GetService("Lighting").OutdoorAmbient, brt = game:GetService("Lighting").Brightness, time = game:GetService("Lighting").TimeOfDay, fclr = game:GetService("Lighting").FogColor, fe = game:GetService("Lighting").FogEnd, fs = game:GetService("Lighting").FogStart}
end)

nodisco = nil
addcmd('disco',{},
function(args, speaker)
	nodisco = nil
	coroutine.resume(coroutine.create(function()
		repeat
			game:GetService('Lighting').GlobalShadows = true
			game:GetService('Lighting').FogEnd = 200
			game:GetService('Lighting').TimeOfDay = 0
			local r = 255
			local g = 0
			local b = 0
			for i = 0,255,5 do
				if nodisco ~=nil then return end
				r = r - 5
				b = b + 5
				game:GetService('Lighting').Ambient = Color3.fromRGB(r,g,b)
				game:GetService('Lighting').OutdoorAmbient = Color3.fromRGB(r,g,b)
				game:GetService('Lighting').FogColor = Color3.fromRGB(r,g,b)
				wait()
			end
			for i = 0,255,5 do
				if nodisco ~=nil then return end
				g = g + 5
				game:GetService('Lighting').Ambient = Color3.fromRGB(r,g,b)
				game:GetService('Lighting').OutdoorAmbient = Color3.fromRGB(r,g,b)
				game:GetService('Lighting').FogColor = Color3.fromRGB(r,g,b)
				wait()
			end
			for i = 0,255,5 do
				if nodisco ~=nil then return end
				b = b - 5
				game:GetService('Lighting').Ambient = Color3.fromRGB(r,g,b)
				game:GetService('Lighting').OutdoorAmbient = Color3.fromRGB(r,g,b)
				game:GetService('Lighting').FogColor = Color3.fromRGB(r,g,b)
				wait()
			end
			for i = 0,255,5 do
				if nodisco ~=nil then return end
				r = r + 5
				game:GetService('Lighting').Ambient = Color3.fromRGB(r,g,b)
				game:GetService('Lighting').OutdoorAmbient = Color3.fromRGB(r,g,b)
				game:GetService('Lighting').FogColor = Color3.fromRGB(r,g,b)
				wait()
			end
			for i = 0,255,5 do
				if nodisco ~=nil then return end
				g = g - 5
				game:GetService('Lighting').Ambient = Color3.fromRGB(r,g,b)
				game:GetService('Lighting').OutdoorAmbient = Color3.fromRGB(r,g,b)
				game:GetService('Lighting').FogColor = Color3.fromRGB(r,g,b)
				wait()
			end
		until nodisco
	end))
end)

addcmd('undisco',{'nodisco'},
function(args, speaker)
	nodisco = true
	wait()
	game:GetService("Lighting").Ambient = origsettings.abt
	game:GetService("Lighting").OutdoorAmbient = origsettings.oabt
	game:GetService("Lighting").Brightness = origsettings.brt
	game:GetService("Lighting").TimeOfDay = origsettings.time
	game:GetService("Lighting").FogColor = origsettings.fclr
	game:GetService("Lighting").FogEnd = origsettings.fe
	game:GetService("Lighting").FogStart = origsettings.fs
end)

addcmd('char',{'character'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	local plr = nil
	for i,v in pairs(players)do
		for a,b in pairs(Players:GetChildren()) do
			local L_name = b.Name:lower()
			local F = L_name:find(args[2])
			if F == 1 then
				plr = b
			end
		end
		if plr ~= nil then
			Players[v].CharacterAppearanceId = tostring(plr.UserId)
		elseif isNumber(args[2]) then
			Players[v].CharacterAppearanceId = args[2]
		end
		refresh(Players[v])
	end
end)

addcmd('unchar',{'uncharacter'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		Players[v].CharacterAppearanceId = 0
		refresh(Players[v])
	end
end)

addcmd('clear',{'clearws','clearworkspace'},
function(args, speaker)
	for _,v in pairs(workspace:GetChildren()) do
		if not v:IsA("Terrain") and v ~= workspace.CurrentCamera and not Players:GetPlayerFromCharacter(v) then
			v:Destroy()
		elseif v:IsA("Terrain") then
			v:Clear()
		end
	end
	for i,v in pairs(workspace.Terrain:GetChildren()) do v:Destroy() end
	local p = Instance.new("Part", workspace)
	p.Anchored = true
	p.FormFactor = "Symmetric"
	p.Size = Vector3.new(1000,1,1000)
	p.Position = Vector3.new(0,0,0)
	p.BrickColor = BrickColor.new("Bright green")
	p.Material = "Grass"
	p.Locked = true
end)

addcmd('place',{'game'},
function(args, speaker)
	if not FindInTable(Owner,speaker.Name) then return end
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			game:GetService("TeleportService"):Teleport(args[2], Players[v])
		end)
	end
end)

addcmd('createteam',{'newteam'},
function(args, speaker)
	local NewTeam = Instance.new("Team", game:GetService("Teams"))
	NewTeam.TeamColor = BrickColor.new("Really black")
	NewTeam.Name = getstring(1)
end)

addcmd('removeteam',{'deleteteam'},
function(args, speaker)
	for i,v in pairs(game:GetService("Teams"):GetChildren())do
		local L_name = v.Name:lower()
		local F = L_name:find(getstring(1))
		if F == 1 then
			v:Destroy()
		end
	end
end)

addcmd('team',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	local teamname = nil
	for i,v in pairs(players)do
		for a,b in pairs(game.Teams:GetChildren()) do
			local L_name = b.Name:lower()
			local F = L_name:find(getstring(2))
			if F == 1 then
				teamname = b
			end
		end
		Players[v].Team = teamname
	end
end)

addcmd('maxhealth',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			Players[v].Character:FindFirstChildOfClass('Humanoid').MaxHealth = args[2]
		end)
    end
end)

addcmd('sethealth',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			Players[v].Character:FindFirstChildOfClass('Humanoid').Health = args[2]
		end)
	end
end)

addcmd('ambient',{},
function(args, speaker)
	game:GetService("Lighting").Ambient = Color3.fromRGB(args[1],args[2],args[3])
	game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(args[1],args[2],args[3])
end)

addcmd('fogend',{},
function(args, speaker)
	game:GetService("Lighting").FogEnd = args[1]
end)

addcmd('fogcolor',{},
function(args, speaker)
	game:GetService("Lighting").FogColor = Color3.fromRGB(args[1],args[2],args[3])
end)

injail = {}
addcmd('jail',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			if FindInTable(injail, Players[v].Name) then return end
			table.insert(injail, Players[v].Name)
			local plrName = Players[v].Name
			local pchar = Players[v].Character
			local J = Models.Jail:Clone()
			J.Parent = workspace
			J:MoveTo(pchar.HumanoidRootPart.Position)
			J.Name = 'JAIL_' .. Players[v].Name
			repeat wait(0.5)
				pchar = Players[v].Character if pchar and pchar:FindFirstChild('HumanoidRootPart') and J:FindFirstChild('MAIN') then pchar.HumanoidRootPart.CFrame = J.MAIN.CFrame + Vector3.new(0, 1, 0) end
			until not Players:FindFirstChild(plrName) or not FindInTable(injail, Players[v].Name)
			workspace["JAIL_" .. plrName]:Destroy()
			if FindInTable(injail, plrName) then
				table.remove(injail, plrName)
			end
		end)
	end
end)

addcmd('unjail',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			for a,b in pairs(injail) do
				if b == Players[v].Name then
					table.remove(injail, a)
				end
			end
		end)
	end
end)

addcmd('fling',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		if Players[v].Character:FindFirstChild("HumanoidRootPart") then
			local Fling = Instance.new("BodyForce", Players[v].Character.HumanoidRootPart)
			Fling.Name = "Fling"
			Fling.force = Vector3.new(10000,10000,10000)
		end
	end
end)

addcmd('name',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	if not args[1] then return end
	for i,v in pairs(players) do
		for a, mod in pairs(Players[v].Character:children()) do
			if mod:FindFirstChild("TAG") then
				Players[v].Character.Head.Transparency = 0
				mod:Destroy()
			end
		end
		
		local char = Players[v].Character
		local model = Instance.new("Model", char)
		local clone = char.Head:Clone()
		local hum = Instance.new("Humanoid", model)
		local weld = Instance.new("Weld", clone)
		model.Name = getstring(2)
		clone.Parent = model
		hum.Name = "TAG"
		hum.MaxHealth = 100
		hum.Health = 100
		weld.Part0 = clone
		weld.Part1 = char.Head
		char.Head.Transparency = 1
	end
end)

addcmd('unname', {},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		for a, mod in pairs(Players[v].Character:GetChildren()) do
			if mod:FindFirstChild("TAG") then
				Players[v].Character.Head.Transparency = 0
				mod:Destroy()
			end
		end
	end
end)

addcmd('unanchorws',{'unanchor'},
function(args, speaker)
   local function unanchor(instance) 
        for i,v in pairs(instance:GetChildren()) do
            if v:IsA("BasePart") then
                v.Anchored=false
            end
            unanchor(v)
        end
    end
    unanchor(workspace)
end)

addcmd('anchorws',{'anchor'},
function(args, speaker)
   local function anchor(instance) 
        for i,v in pairs(instance:GetChildren()) do
            if v:IsA("BasePart") then
                v.Anchored=true
            end
            anchor(v)
        end
    end
    anchor(workspace)
end)

addcmd('arrest',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		if not FindInTable(Owner,Players[v].Name) and not FindInTable(Admin,Players[v].Name) then
			local p = Players[v]
			local char = p.Character 
			local torso = p.Character:FindFirstChild("HumanoidRootPart") 
			local humanoid = p.Character:FindFirstChildOfClass("Humanoid")
			if torso and humanoid and not char:FindFirstChild("VAN") then 
				local van = Models.Cop:Clone()
				if van then
					local function check()
						if not van or not van.Parent or not p or p.Parent ~= game:GetService("Players") or not torso or not humanoid or not torso.Parent or not humanoid.Parent or not char or not char.Parent then
							return false
						else
							return true
						end
					end
					
					--local driver = van.Driver 
					--local grabber = van.Clown 
					local primary = van.Primary
					--local door = van.Door
					local tPos = torso.CFrame
					
					local sound = Instance.new("Sound",primary)
					sound.SoundId = "rbxassetid://258529216"
					sound.Looped = true
					sound:Play()
					
					local chuckle = Instance.new("Sound",primary)
					chuckle.SoundId = "rbxassetid://175964948"
					chuckle.Looped = true
					chuckle.Volume = 0.5
					chuckle:Play()
					
					van.PrimaryPart = van.Primary
					van.Name = "VAN"
					van.Parent = workspace
					humanoid.Name = "NoResetForYou"
					humanoid.WalkSpeed = 0
					sound.Pitch = 1.3
					
					local music = workspace:FindFirstChild("COPSONG") or Instance.new("Sound",workspace)
					music.Name = "COPSONG"
					music.SoundId = "rbxassetid://132007810"
					music.Volume = 1
					music.Looped = true
					if not music.Playing then music:Play() end
					
					spawn(function()
						while wait(0.2) do
							van.Body.Lightbar.Red.PointLight.Enabled = true
							van.Body.Lightbar.Blue.PointLight.Enabled = false
							wait(0.2)
							van.Body.Lightbar.Red.PointLight.Enabled = false
							van.Body.Lightbar.Blue.PointLight.Enabled = true
						end
					end)
					
					for i = 1,200 do
						if not check() then
							break
						else
							van:SetPrimaryPartCFrame(tPos*(CFrame.new(-200+i,-1,-7)*CFrame.Angles(0,math.rad(270),0)))
							wait(0.001*(i/5))
						end
					end
					
					sound.Pitch = 0.9
					
					wait(0.5)
					if check() then
						--door.Transparency = 1
					end
					
					local freeze = Instance.new("Sound",primary)
					freeze.SoundId = "rbxassetid://163732279"
					freeze.Volume = 5
					freeze:Play()
					
					wait(3)
					
					if check() then
						torso.CFrame = primary.CFrame*(CFrame.new(0,2.3,0)*CFrame.Angles(0,math.rad(90),0))
					end
					
					wait(0.5)
					if check() then
						--door.Transparency = 0
					end
					wait(0.5)
					
					sound.Pitch = 1.3
					local gui = Instance.new("ScreenGui")
					local frame = Instance.new("Frame",gui)
					frame.BackgroundTransparency = 1
					frame.BackgroundColor3 = Color3.new(0,0,0)
					frame.Position = UDim2.new(0,0,0,-36)
					frame.Size = UDim2.new(1,0,1,36)
					spawn(function()
						for i = 1,0,-0.01 do
							frame.BackgroundTransparency = i
							wait(0.1)
						end
						frame.BackgroundTransparency = 0
					end)
					
					p.CameraMaxZoomDistance = 0.5
					
					torso.Anchored = true
					
					for i = 1,400 do
						if not check() then
						break
					else
						van:SetPrimaryPartCFrame(tPos*(CFrame.new(0+i,-1,-7)*CFrame.Angles(0,math.rad(270),0)))
						torso.CFrame = primary.CFrame*(CFrame.new(0,-0.4,0)*CFrame.Angles(0,math.rad(90),0))
						wait(0.1/(i*5))
							
						if i == 270 then
							music.Volume = 5
						end
					end
				end
				if p and p.Parent == game:GetService("Players") then
					torso.Anchored = false
					p.CharacterAdded:Connect(function()
						wait()
						p:Kick()
					end)
					p:Kick()
				end
				wait(0.5)
				pcall(function() van:Destroy() end)
				pcall(function() gui:Destroy() end)
				if not workspace:FindFirstChild("VAN") then
					music:Destroy()
				end
				end
			end
		end
	end
end)

addcmd('hatsize',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		for i,v in pairs(Players[v].Character:GetChildren()) do
			if v:IsA('Accessory') or v:IsA('Hat') then
				for a,b in pairs(v.Handle:GetChildren()) do
					if b:IsA('SpecialMesh') then
						b.Scale = args[2] * Vector3.new(1, 1, 1)
					end
				end
			end
		end
	end
end)

addcmd('size',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			Rig6(Players[v])
			local pchar = Players[v].Character
			local function scale(chr,scl)
		    local Head = chr['Head']
		    local Torso = chr['Torso']
		    local LA = chr['Left Arm']
		    local RA = chr['Right Arm']
		    local LL = chr['Left Leg']
		    local RL = chr['Right Leg']
		    local HRP = chr['HumanoidRootPart']
		    wait(0.1)
		    Head.formFactor = 3
		    Torso.formFactor = 3
		    LA.formFactor = 3
		    RA.formFactor = 3
		    LL.formFactor = 3
		    RL.formFactor = 3
		    HRP.formFactor = 3
		    Head.Size = Vector3.new(scl * 2, scl, scl)
		    Torso.Size = Vector3.new(scl * 2, scl * 2, scl)
		    LA.Size = Vector3.new(scl, scl * 2, scl)
		    RA.Size = Vector3.new(scl, scl * 2, scl)
		    LL.Size = Vector3.new(scl, scl * 2, scl)
		    RL.Size = Vector3.new(scl, scl * 2, scl)
		    HRP.Size = Vector3.new(scl * 2, scl * 2, scl)
		    local Motor1 = Instance.new('Motor6D', Torso)
		    Motor1.Part0 = Torso
		    Motor1.Part1 = Head
	    	Motor1.C0 = CFrame.new(0, 1 * scl, 0) * CFrame.Angles(-1.6, 0, 3.1)
	    	Motor1.C1 = CFrame.new(0, -0.5 * scl, 0) * CFrame.Angles(-1.6, 0, 3.1)
	    	Motor1.Name = "Neck"    
	    	local Motor2 = Instance.new('Motor6D', Torso)
	    	Motor2.Part0 = Torso
	    	Motor2.Part1 = LA
	    	Motor2.C0 = CFrame.new(-1 * scl, 0.5 * scl, 0) * CFrame.Angles(0, -1.6, 0)
	    	Motor2.C1 = CFrame.new(0.5 * scl, 0.5 * scl, 0) * CFrame.Angles(0, -1.6, 0)
	    	Motor2.Name = "Left Shoulder"
	    	local Motor3 = Instance.new('Motor6D', Torso)
	   		Motor3.Part0 = Torso
	    	Motor3.Part1 = RA
	    	Motor3.C0 = CFrame.new(1 * scl, 0.5 * scl, 0) * CFrame.Angles(0, 1.6, 0)
	    	Motor3.C1 = CFrame.new(-0.5 * scl, 0.5 * scl, 0) * CFrame.Angles(0, 1.6, 0)
	    	Motor3.Name = "Right Shoulder"
	    	local Motor4 = Instance.new('Motor6D', Torso)
	    	Motor4.Part0 = Torso
	    	Motor4.Part1 = LL
	    	Motor4.C0 = CFrame.new(-1 * scl, -1 * scl, 0) * CFrame.Angles(0, -1.6, 0)
	    	Motor4.C1 = CFrame.new(-0.5 * scl, 1 * scl, 0) * CFrame.Angles(0, -1.6, 0)
	    	Motor4.Name = "Left Hip"
	    	local Motor5 = Instance.new('Motor6D', Torso)
	    	Motor5.Part0 = Torso
	    	Motor5.Part1 = RL
	    	Motor5.C0 = CFrame.new(1 * scl, -1 * scl, 0) * CFrame.Angles(0, 1.6, 0)
	    	Motor5.C1 = CFrame.new(0.5 * scl, 1 * scl, 0) * CFrame.Angles(0, 1.6, 0)
	    	Motor5.Name = "Right Hip"
	    	local Motor6 = Instance.new('Motor6D', HRP)
	    	Motor6.Part0 = HRP
	    	Motor6.Part1 = Torso
	    	Motor6.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(-1.6, 0, -3.1)
	    	Motor6.C1 = CFrame.new(0, 0, 0) * CFrame.Angles(-1.6, 0, -3.1) end
			scale(pchar, args[2])
		end)
	end
end)

addcmd('punish',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		Players[v].Character.Parent = game:GetService("Lighting")
	end
end)

addcmd('unpunish',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		Players[v].Character.Parent = workspace
	end
end)

addcmd('chickenarms',{'chicken'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			local Chicken = Players[v].Character
			Chicken.Torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.fromEulerAnglesXYZ(0,math.pi/2,0) * CFrame.fromEulerAnglesXYZ(math.pi/2, 0, 0) * CFrame.fromEulerAnglesXYZ(0,-math.pi/2,0)
			Chicken.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.5, 0)
			Chicken.Torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, 0) * CFrame.fromEulerAnglesXYZ(0,-math.pi/2,0) * CFrame.fromEulerAnglesXYZ(math.pi/2, 0, 0) * CFrame.fromEulerAnglesXYZ(0,-math.pi/2,0)
			Chicken.Torso["Right Shoulder"].C1 = CFrame.new(0, 0.5, 0)
		end)
	end
end)

addcmd('change',{'stat'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			if Players[v]:FindFirstChild('leaderstats') then
				for i,v in pairs(Players[v].leaderstats:GetChildren()) do
					if string.lower(v.Name) == string.lower(args[2]) and v:IsA('IntValue') or v:IsA('NumberValue') then
						if args[3] then v.Value = tonumber(args[3]) end
					elseif string.lower(v.Name) == string.lower(args[2]) and v:IsA('StringValue') then
						v.Value = getstring(3)
					end
				end
			end
		end)
	end
end)

local decalID = 0
addcmd('decalspam',{},
function(args, speaker)
	decalID = args[1]
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			local One = Instance.new("Decal", v)
			local Two = Instance.new("Decal", v)
			local Three = Instance.new("Decal", v)
			local Four = Instance.new("Decal", v)
			local Five = Instance.new("Decal", v)
			local Six = Instance.new("Decal", v)
			One.Texture = "http://www.roblox.com/asset/?id="..decalID
			Two.Texture = "http://www.roblox.com/asset/?id="..decalID
			Three.Texture = "http://www.roblox.com/asset/?id="..decalID
			Four.Texture = "http://www.roblox.com/asset/?id="..decalID
			Five.Texture = "http://www.roblox.com/asset/?id="..decalID
			Six.Texture = "http://www.roblox.com/asset/?id="..decalID
			One.Face = "Front"
			Two.Face = "Back"
			Three.Face = "Right"
			Four.Face = "Left"
			Five.Face = "Top"
			Six.Face = "Bottom"
			One.Name = "IYdecal"
			Two.Name = "IYdecal"
			Three.Name = "IYdecal"
			Four.Name = "IYdecal"
			Five.Name = "IYdecal"
			Six.Name = "IYdecal"
		end
	end
end)

addcmd('undecalspam',{'nodecalspam'},
function(args, speaker)
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Decal") and v.Texture == "http://www.roblox.com/asset/?id="..decalID then
			v.Parent = nil
		end
	end
end)

addcmd('deleteclass',{'removeclass','deleteclassname','removeclassname','dc'},
function(args, speaker)
	local part = getstring(1)
	for i,v in pairs(workspace:GetDescendants())do
		if v.ClassName:lower() == part:lower() then
			v:Destroy()
		end
	end
end)

addcmd('delete',{'remove'},
function(args, speaker)
	local part = getstring(1)
	for i,v in pairs(workspace:GetDescendants())do
		if v.Name:lower() == part:lower() then
			v:Destroy()
		end
	end
end)

addcmd('copytools',{'ctools','clonetools'},
function(args, speaker)
    local players1, players2 = getPlayer(args[1], speaker), getPlayer(args[2], speaker)
	for i,v in pairs(players1) do
		for a,b in pairs(players2) do
			spawn(function()
				for i,v in pairs(Players[v].Backpack:GetChildren()) do
					if v:IsA('Tool') or v:IsA('HopperBin') then
						if not Players[b] then
							v:Clone().Parent = speaker.Backpack
						else
							v:Clone().Parent = Players[b].Backpack
						end
					end
				end
			end)
		end
	end
end)

addcmd('dog',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			Rig6(Players[v])
		    local pchar = Players[v].Character
		    if pchar:FindFirstChild("Shirt") then
			    pchar.Shirt:Destroy()
		    end
		    if pchar:FindFirstChild("Pants") then
			    pchar.Pants:Destroy()
		    end
		    if pchar:FindFirstChild("Shirt Graphic") then
			    pchar["Shirt Graphic"].Graphic = ""
		    end
		    pchar.Torso.Transparency = 1
		    pchar.Torso.Neck.C0 = CFrame.new(0,-.5,-2) * CFrame.Angles(math.rad(90),math.rad(180),0)
		    pchar.Torso["Right Shoulder"].C0 = CFrame.new(.5,-1.5,-1.5) * CFrame.Angles(0,math.rad(90),0)
		    pchar.Torso["Left Shoulder"].C0 = CFrame.new(-.5,-1.5,-1.5) * CFrame.Angles(0,math.rad(-90),0)
		    pchar.Torso["Right Hip"].C0 = CFrame.new(1.5,-1,1.5) * CFrame.Angles(0,math.rad(90),0)
		    pchar.Torso["Left Hip"].C0 = CFrame.new(-1.5,-1,1.5) * CFrame.Angles(0,math.rad(-90),0)
		    local FakeTorso = Instance.new("Seat", pchar)
		    FakeTorso.Name = "FakeTorso"
		    FakeTorso.FormFactor = "Symmetric"
		    FakeTorso.TopSurface = 0
		    FakeTorso.BottomSurface = 0
		    FakeTorso.Size = Vector3.new(3,1,4)
		    FakeTorso.BrickColor = BrickColor.new("Brown")
		    FakeTorso.CFrame = pchar.Torso.CFrame
		    local BF = Instance.new("BodyForce", FakeTorso)
		    BF.Force = Vector3.new(0, FakeTorso:GetMass() * 196.25, 0)
		    local W = Instance.new("Weld", pchar.Torso)
		    W.Part0 = pchar.Torso
		    W.Part1 = FakeTorso
		    W.C0 = CFrame.new(0,-.5,0)
		    local BC = pchar["Body Colors"]
		    BC.HeadColor = BrickColor.new("Brown")
		    BC.LeftArmColor = BrickColor.new("Brown")
		    BC.LeftLegColor = BrickColor.new("Brown")
		    BC.RightArmColor = BrickColor.new("Brown")
		    BC.RightLegColor = BrickColor.new("Brown")
		    BC.TorsoColor = BrickColor.new("Brown")
		end)
	end
end)

addcmd('firstp',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
        Players[v].CameraMode = "LockFirstPerson"
    end
end)

addcmd('thirdp',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
        Players[v].CameraMode = "Classic"
    end
end)

addcmd('maxzoom',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		Players[v].CameraMaxZoomDistance = args[2]
	end
end)

addcmd('flashlight',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			local flashlight = Tools:WaitForChild('Flashlight'):Clone()
			flashlight.Parent = Players[v].Backpack
			if args[2] then
				for i,v in pairs(flashlight.Handle:GetChildren()) do
					if v.ClassName == 'SpotLight' then
						v.Color = Color3.fromRGB((args[2]),(args[3]),(args[4]))
					end
				end
			end
		end)
	end
end)

addcmd('globalshadows',{'gshadows'},
function(args, speaker)
    game:GetService("Lighting").GlobalShadows = true
end)

addcmd('unglobalshadows',{'nogshadows','ungshadows','noglobalshadows'},
function(args, speaker)
     game:GetService("Lighting").GlobalShadows = false
end)

addcmd('headsize',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
	local plrchar = Players[v].Character
	if not plrchar:FindFirstChildOfClass('Humanoid'):FindFirstChild('HeadScale') then
		if args[2] == 1 then
			plrchar.Head.Mesh.Scale = Vector3.new(1.25, 1.25, 1.25)
			plrchar.Head.Mesh.Offset = Vector3.new(0, 0, 0)
		else
			plrchar.Head.Mesh.Scale = args[2] * Vector3.new(1.25, 1.25, 1.25)
		end
	else plrchar:FindFirstChildOfClass('Humanoid').HeadScale.Value = args[2]
		end
	end
end)

addcmd('jpower',{'grav','jumppower','jp'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    if not args[1]or not args[2]then return end
    local num=args[2]
	for i,v in pairs(players) do
		if Players[v].Character:FindFirstChildOfClass("Humanoid") then
			Players[v].Character:FindFirstChildOfClass('Humanoid').JumpPower=tonumber(num)
		end
	end
end)

local starmanPlayers = {}
local starmanLastColor = nil
local starmanEvents = {}

addcmd("starman",{'st'},
function(args,speaker)
	local function starman(plr)
		local char = plr.Character
		local lastColor = ""
		local newColor = ""
	
		local powerupSound = Instance.new("Sound",char.HumanoidRootPart)
		powerupSound.Name = "PowerUp"
		powerupSound.Volume = 10
		powerupSound.SoundId = "rbxassetid://182755256"
		wait()
		powerupSound:Play()
	
		game:GetService("Debris"):AddItem(powerupSound,2)

		while char.HumanoidRootPart:FindFirstChild("Starman") do char.HumanoidRootPart.Starman:Destroy() end
		
		local starmanMusic = Instance.new("Sound",char.HumanoidRootPart)
		starmanMusic.Name = "Starman"
		starmanMusic.Volume = 5
		starmanMusic.Looped = true
		starmanMusic.SoundId = "rbxassetid://530596723"
		wait()
		starmanMusic:Play()

		if char:FindFirstChild("Shirt") then char.Shirt:Destroy() end
		if char:FindFirstChild("Pants") then char.Pants:Destroy() end

		char:FindFirstChildOfClass('Humanoid').WalkSpeed = 32
		char:FindFirstChildOfClass('Humanoid').MaxHealth = math.huge
		char:FindFirstChildOfClass('Humanoid').Health = math.huge
		
		local invisff = Instance.new("ForceField", char)
		invisff.Visible = false invisff.Name = 'smff'

		while char.HumanoidRootPart:FindFirstChild("StarmanFlash") do char.HumanoidRootPart.StarmanFlash:Destroy() end

		local light = Instance.new("PointLight",char.HumanoidRootPart)
		light.Name = "StarmanFlash"
		light.Brightness = 100
		light.Range = 20
		light.Shadows = true

		local function stardestroy(part)
			if part.Parent:FindFirstChild("Humanoid") and part.Parent ~= char then
				for i,v in pairs(part.Parent:GetChildren()) do
					if v:IsA("BasePart") then
						local force = Instance.new("BodyForce",v)
						force.Force = char.HumanoidRootPart.CFrame.lookVector * 50
						v:BreakJoints()
					end
				end
			
				local tadaas = {}
			
				for i = 1,1 do
					local tadaa = Instance.new("Sound",part.Parent.HumanoidRootPart)
					tadaa.Volume = 10
					tadaa.SoundId = "rbxassetid://551195499"
					table.insert(tadaas,tadaa)
				end
		
				wait()
		
				for i,v in pairs(tadaas) do
					v:Play()
				end
			end
		end

		local events = {}
		for i,v in pairs(char:GetChildren()) do
			if v:IsA("BasePart") then v.Material = Enum.Material.Neon table.insert(events,v.Touched:Connect(stardestroy)) end
		end
		if starmanEvents[plr.Name] then for i,v in pairs(starmanEvents[plr.Name]) do v:Disconnect() end starmanEvents[plr.Name] = nil end
		starmanEvents[plr.Name] = events
		starmanPlayers[plr.Name] = char
	end
	
	for _,plr in pairs(getPlayer(args[1], speaker)) do
		spawn(function()starman(Players[plr])end)
	end
end)

addcmd("unstarman",{'unst'},
function(args,speaker)
	for _,plr in pairs(getPlayer(args[1], speaker)) do
		pcall(function()
			if starmanPlayers[plr] then starmanPlayers[plr] = nil end
			if starmanEvents[plr] then for i,v in pairs(starmanEvents[plr]) do v:Disconnect() end starmanEvents[plr] = nil end
			local char = Players[plr].Character
			while char.HumanoidRootPart:FindFirstChild("Starman") do
				char.HumanoidRootPart.Starman:Destroy()
			end
			while char.HumanoidRootPart:FindFirstChild("StarmanFlash") do
				char.HumanoidRootPart.StarmanFlash:Destroy()
			end
			while char.HumanoidRootPart:FindFirstChild("smff") do
				char.HumanoidRootPart.smff:Destroy()
			end
		end)
	end
end)

local Timers = {}
function checkTimer(n,t,res)
	if not Timers[n] then Timers[n] = 0 end
	
	if tick() >= Timers[n] + t then
		if res then Timers[n] = tick() end
		return true
	else
		return false
	end
end

function nonEmpty(t)
	for i,v in pairs(t) do
		return true
	end
	return false
end

game:GetService("RunService").Heartbeat:connect(function()
	if nonEmpty(starmanPlayers) then
		if checkTimer("Starman",0.05,true) then					
			for name,plrchar in pairs(starmanPlayers) do
				ypcall(function()
					local colors = {"Bright red","Bright blue","Bright green","Bright yellow","Bright violet"}
					if not Players:FindFirstChild(name) then starmanPlayers[name] = nil end
						
					local plr = Players:FindFirstChild(name)
						
					if plr then
						local char = plrchar
						local light = char.HumanoidRootPart:FindFirstChild("StarmanFlash")
							
						local meshMap = {}

						for i,v in pairs(char:GetChildren()) do
							if v:IsA("CharacterMesh") then
								if v.BodyPart.Name == "Torso" then meshMap["Torso"] = "rbxassetid://"..v.MeshId end
								if v.BodyPart.Name == "LeftArm" then meshMap["Left Arm"] = "rbxassetid://"..v.MeshId end
								if v.BodyPart.Name == "RightArm" then meshMap["Right Arm"] = "rbxassetid://"..v.MeshId end
								if v.BodyPart.Name == "LeftLeg" then meshMap["Left Leg"] = "rbxassetid://"..v.MeshId end
								if v.BodyPart.Name == "RightLeg" then meshMap["Right Leg"] = "rbxassetid://"..v.MeshId end
							end
						end

						if char.Head:FindFirstChild("Mesh") then meshMap["Head"] = char.Head.Mesh.MeshId end
							
						if not char or char.Parent == nil then starmanPlayers[plr.Name] = nil end
						local newColor = BrickColor.new(colors[math.random(1,#colors)])
						while starmanLastColor == newColor do newColor = BrickColor.new(colors[math.random(1,#colors)]) end
						starmanLastColor = newColor
						for i,v in pairs(char:GetChildren()) do
							if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
								v.BrickColor = newColor
								local fade = v:Clone()
								if meshMap[v.Name] then
									local newMesh = Instance.new("SpecialMesh",fade)
									newMesh.MeshId = meshMap[v.Name]
								end
								fade.Name = "StarFade"
								fade.Anchored = true
								fade.CanCollide = false
								for n,c in pairs(fade:GetChildren()) do if c:IsA("Attachment") or c:IsA("Motor6D") or c:IsA("PointLight") or c:IsA("Sound") or c:IsA("Weld") then c:Destroy() end end
								fade.Parent = workspace.Terrain
								game:GetService("TweenService"):Create(fade,TweenInfo.new(0.5),{Transparency = 1}):Play()
								game:GetService("Debris"):AddItem(fade,0.5)
							end
						end
						light.Color = newColor.Color
					end
				end)
			end
		end
	end
end)

addcmd('blind',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			local SG = Players[v].PlayerGui:FindFirstChild("OverlayGui") if SG then SG:Destroy() end
			SG = Instance.new("ScreenGui", Players[v].PlayerGui) SG.Name = "OverlayGui"
			local Frame = Instance.new("Frame", SG) Frame.Name = "Overlay" Frame.Size = UDim2.new(1,0,1,0) Frame.ZIndex = 100 Frame.BackgroundColor3 = Color3.new(0,0,0)
		end)
	end
end)

addcmd('unblind',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			local SG = Players[v].PlayerGui:FindFirstChild("OverlayGui") if SG then SG:Destroy() end
		end)
	end
end)

addcmd('view',{'spectate'}, 
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		local ViewScript = Scripts.View:Clone()
		ViewScript.Plr.Value = Players[v].Name
		ViewScript.Parent = speaker.Character
		ViewScript.Disabled = false
	end
end)

addcmd('unview',{'unspectate'}, 
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		local ViewScript = Scripts.View:Clone()
		ViewScript.Plr.Value = speaker.Name
		ViewScript.Parent = speaker.Character
		ViewScript.Disabled = false
	end
end)

addcmd('burn',{'witchhunt', 'witch'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
    for i,v in pairs(players) do
		Rig6(Players[v])
	    local pchar = Players[v].Character
		if not pchar then return end
	    local char = pchar
	    local hum = char.Humanoid
	    for k,c in pairs(char:children()) do if c:IsA("Part") and c.Name~="HumanoidRootPart" then c.Anchored=true end end
	    hum.HealthDisplayDistance = 0
	    --execcmd god
	    local stake = Instance.new("Part",char)
	    stake.Anchored = true
	    stake.BrickColor = BrickColor.new("Reddish brown")
	    stake.Material = "Wood"
	    stake.Size = Vector3.new(1,7,1)
	    stake.CFrame = char.Torso.CFrame*CFrame.new(0,0,1)
	    local hay = Instance.new("Part",char)
	    hay.Anchored = true
	    hay.Material = "Grass"
	    hay.BrickColor = BrickColor.new("New Yeller")
	    hay.Size = Vector3.new(6,1,5)
	    hay.CFrame = char.Torso.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,2,0)
	    local hay2 = hay:clone()
	    hay2.Parent = char
	    hay2.CFrame = char.Torso.CFrame*CFrame.new(0,-2.6,0)*CFrame.Angles(0,6,0)
	    local fire = Instance.new("Fire",hay)
	    fire.Enabled = false
	    fire.Heat = 25
	    fire.Size = 2
	    fire.Color = Color3.new(170/255,85/255,0)
	    local smoke = Instance.new("Smoke",hay)
	    smoke.Enabled = false
	    smoke.Opacity = 1
	    smoke.RiseVelocity = 25
	    smoke.Size = 15
	    smoke.Color = Color3.new(0,0,0)
	    local light = Instance.new("PointLight",hay)
	    light.Color = Color3.new(170/255,85/255,0)
	    light.Range = 0
	    light.Brightness = 1
	    light.Enabled = false
	    --[[]]
	    local crack = Instance.new("Sound",hay)
	    crack.SoundId = "rbxassetid://239443642"
	    crack.Looped = true
	    crack.Volume = 0
	    local scream = Instance.new("Sound",char.Torso)
	    scream.SoundId = "rbxassetid://264227115"
	    scream.Looped = true
	    scream.Volume = 0
	    --]]
	    wait()
	    char['Left Arm'].CFrame = char.Torso.CFrame * CFrame.new(-0.8,0,0.7) * CFrame.Angles(-1,0,0.5)
	    char['Right Arm'].CFrame = char.Torso.CFrame * CFrame.new(0.8,0,0.7) * CFrame.Angles(-1,0,-0.5)
    
	    local bods = char['Body Colors']
	    local colors = {
	    	--"Really red";
	    	"Bright red";
	    	"Crimson";
	    	"Maroon";
	    	"Really black";
	    }
    
	    fire.Enabled=true
	    smoke.Enabled=true
	    light.Enabled=true
	    crack:Play()
	    scream:Play()
	    scream.Pitch = 0.8
	    --scream.Volume = 0.5
	    for i=1,30 do
	    	crack.Volume = crack.Volume+(1/30)
	    	scream.Volume = crack.Volume
	    	fire.Size=i
	    	smoke.RiseVelocity=i-5
	    	smoke.Size=i/2
	    	light.Range=i*2
	    	wait(1)
	    end
    
	    for i=1,#colors do
	    	bods.HeadColor=BrickColor.new(colors[i])
	    	bods.LeftArmColor=BrickColor.new(colors[i])
	    	bods.LeftLegColor=BrickColor.new(colors[i])
	    	bods.RightArmColor=BrickColor.new(colors[i])
	    	bods.RightLegColor=BrickColor.new(colors[i])
	    	bods.TorsoColor=BrickColor.new(colors[i])
	    	hay.BrickColor=BrickColor.new(colors[i])
	    	hay2.BrickColor=BrickColor.new(colors[i])
	    	stake.BrickColor=BrickColor.new(colors[i])
	    	wait(5)
	    end
	    wait(10)
	    scream.Volume = 0.5
	    wait(1)
	    scream:Stop()
	    char:BreakJoints()
	end
end)

addcmd('fly',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			if Players[v].Character:FindFirstChild("DisableFly") then
				for i,v in pairs(Players[v].Character:GetChildren()) do
					if v.Name == "DisableFly" then
						v:Destroy()
					end
				end
			end
			wait()
			local DisableFly = Instance.new("RemoteFunction", Players[v].Character)
			DisableFly.Name = "DisableFly"
			local FlyScript = Scripts.Fly:Clone()
			FlyScript.Disable.Value = DisableFly
			FlyScript.Parent = Players[v].Character
			FlyScript.Disabled = false
		end)
	end
end)

addcmd('trip', {},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		local char = Players[v].Character
		
		if char then
			local hrp = char:FindFirstChild"HumanoidRootPart"
			local hum = char:FindFirstChild"Humanoid"
			
			if hrp and hum then
				hum.PlatformStand = true
				hrp.CFrame = hrp.CFrame * CFrame.Angles(0, 0, math.rad(-90))
				hum.PlatformStand = false
			end
		end
	end
end)

addcmd('unfly',{'nofly'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		Players[v].Character.DisableFly:InvokeClient(Players[v])
	end
end)

addcmd('togglefly',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			if Players[v].Character:FindFirstChild("DisableFly") then
				for i,v in pairs(Players[v].Character:GetChildren()) do
					if v.Name == "DisableFly" then
						v:Destroy()
					end
				end
			else
				local DisableFly = Instance.new("RemoteFunction", Players[v].Character)
				DisableFly.Name = "DisableFly"
				local FlyScript = Scripts.Fly:Clone()
				FlyScript.Disable.Value = DisableFly
				FlyScript.Parent = Players[v].Character
				FlyScript.Disabled = false
			end
		end)
	end
end)

addcmd('flyspeed',{},
function(args, speaker)
	if args[2] then
		local players = getPlayer(args[1], speaker)
		for i,v in pairs(players)do
			if Players[v].Character:FindFirstChild('Fly') then
				Players[v].Character.Fly.Speed.Value = args[2]
			end
		end
	else
		speaker.Character.Fly.Speed.Value = args[1]
	end
end)

addcmd('noclip',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
		if Players[v].Character:FindFirstChild("DisableNoclip") then
			for i,v in pairs(Players[v].Character:GetChildren()) do
				if v.Name == "DisableNoclip" then
					v:Destroy()
				end
			end
		end
		wait()
		local DisableNoclip = Instance.new("RemoteFunction", Players[v].Character)
		DisableNoclip.Name = "DisableNoclip"
		local NoclipScript = Scripts.Noclip:Clone()
		NoclipScript.Disable.Value = DisableNoclip
		NoclipScript.Parent = Players[v].Character
		NoclipScript.Disabled = false
		end)
	end
end)

addcmd('clip',{'unnoclip'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		Players[v].Character.DisableNoclip:InvokeClient(Players[v])
	end
end)

addcmd('togglenoclip',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		if Players[v].Character:FindFirstChild("DisableNoclip") then
			for i,v in pairs(Players[v].Character:GetChildren()) do
				if v.Name == "DisableNoclip" then
					v:Destroy()
				end
			end
		else
			local DisableNoclip = Instance.new("RemoteFunction", Players[v].Character)
			DisableNoclip.Name = "DisableNoclip"
			local NoclipScript = Scripts.Noclip:Clone()
			NoclipScript.Disable.Value = DisableNoclip
			NoclipScript.Parent = Players[v].Character
			NoclipScript.Disabled = false
		end
	end
end)

addcmd('god',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			local Humanoid = Players[v].Character:FindFirstChildOfClass("Humanoid")
			Humanoid.MaxHealth = math.huge
			Humanoid.Health = math.huge
			Humanoid.Name = 'IYHUMANOID'
		end)
	end
end)

addcmd('ungod',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			local Humanoid = Players[v].Character:FindFirstChildOfClass("Humanoid")
			Humanoid.Name = 'Humanoid'
			Humanoid.MaxHealth = 100
			Humanoid.Health = 100
		end)
	end
end)

addcmd('gravity',{'grav'},
function(args, speaker)
	workspace.Gravity = args[1]
end)

addcmd('bait',{},
function(args, speaker)
	spawn(function()
		local M = Instance.new('Model', workspace) M.Name = 'IYbait'
		local P = Instance.new('Part', M) P.Name = 'Main' P.Position = speaker.Character.Head.Position P.Color = Color3.new(0, 0.5, 0) P.Material = 'Neon' P.Size = Vector3.new(4, 1, 4)
		local y = Instance.new("BillboardGui")
		y.Size = UDim2.new(0,100,0,150)
		y.StudsOffset = Vector3.new(0,1,0)
		y.Parent = P
		y.Adornee = P
		local f = Instance.new("TextLabel")
		f.Parent = y
		f.BackgroundTransparency = 1
		f.Position = UDim2.new(0,0,0,-50)
		f.Size = UDim2.new(0,100,0,100)
		f.Font = "Highway"
		f.FontSize = "Size48"
		f.Text = "Touch for admin!"
		f.TextStrokeColor3 = Color3.new(0,0,0)
		f.TextColor3 = Color3.new(255/255,255/255,255/255)
		f.TextStrokeTransparency = 0
		f.TextYAlignment = "Bottom"
		P.Touched:connect(function(oof) 
			if oof.Parent:FindFirstChild('Humanoid') then
				if not FindInTable(Admin,oof.Parent.Name) and not FindInTable(Owner,oof.Parent.Name) then
					local Fling = Instance.new("BodyForce", oof.Parent:FindFirstChild('HumanoidRootPart'))
					Fling.Name = "Fling"
					Fling.force = Vector3.new(90000,90000,90000)
				end
			end
		end)
	end)
end)

addcmd('removebait',{'nobait'},
function(args, speaker)
    local function dels(instance)
        for i,v in pairs(instance:GetChildren())do
            if v.name == "IYbait" then v:Destroy()end
            dels(v)
        end
    end
    dels(workspace)
end)

function fWeld(zName, zParent, zPart0, zPart1, zCoco, A, B, C, D, E, F)
	local funcw = Instance.new('Weld') funcw.Name = zName funcw.Parent = zParent funcw.Part0 = zPart0 funcw.Part1 = zPart1
	if (zCoco) then
		funcw.C0 = CFrame.new(A, B, C) * CFrame.fromEulerAnglesXYZ(D, E, F)
	else
		funcw.C1 = CFrame.new(A, B, C) * CFrame.fromEulerAnglesXYZ(D, E, F)
	end
	return funcw
end

function bang(victim, speaker)
	spawn(function()
		local P1 = game:GetService("Players")[speaker].Character.Torso
		Rig6(game:GetService("Players")[speaker])
		local V1 = game:GetService("Players")[victim].Character.Torso
		Rig6(game:GetService("Players")[victim])
		V1.Parent:FindFirstChildOfClass('Humanoid').PlatformStand = true
		P1['Left Shoulder']:destroy() local LA1 = Instance.new('Weld', P1) LA1.Part0 = P1 LA1.Part1 = P1.Parent['Left Arm'] LA1.C0 = CFrame.new(-1.5, 0, 0) LA1.Name = 'Left Shoulder'
		P1['Right Shoulder']:destroy() local RS1 = Instance.new('Weld', P1) RS1.Part0 = P1 RS1.Part1 = P1.Parent['Right Arm'] RS1.C0 = CFrame.new(1.5, 0, 0) RS1.Name = 'Right Shoulder'
		V1['Left Shoulder']:destroy() local LS2 = Instance.new('Weld', V1) LS2.Part0 = V1 LS2.Part1 = V1.Parent['Left Arm'] LS2.C0 = CFrame.new(-1.5, 0, 0) LS2.Name = 'Left Shoulder'
		V1['Right Shoulder']:destroy() local RS2 = Instance.new('Weld', V1) RS2.Part0 = V1 RS2.Part1 = V1.Parent['Right Arm'] RS2.C0 = CFrame.new(1.5, 0, 0) RS2.Name = 'Right Shoulder'
		V1['Left Hip']:destroy() local LH2 = Instance.new('Weld', V1) LH2.Part0 = V1 LH2.Part1 = V1.Parent['Left Leg'] LH2.C0 = CFrame.new(-0.5, -2, 0) LH2.Name = 'Left Hip'
		V1['Right Hip']:destroy() local RH2 = Instance.new('Weld', V1) RH2.Part0 = V1 RH2.Part1 = V1.Parent['Right Leg'] RH2.C0 = CFrame.new(0.5, -2, 0) RH2.Name = 'Right Hip'
		local D = Instance.new('Part', P1) D.TopSurface = 0 D.BottomSurface = 0 D.CanCollide = false D.BrickColor = BrickColor.new('Pastel brown') D.Shape = 'Ball' D.Size = Vector3.new(1, 1, 1)
		local DM1 = Instance.new('SpecialMesh', D) DM1.MeshType = 'Sphere' DM1.Scale = Vector3.new(0.4, 0.4, 0.4)
		fWeld('weld', P1, P1, D, true, -0.2, -1.3, -0.6, 0, 0, 0)
		local D2 = D:Clone() D2.Parent = P1
		fWeld('weld', P1, P1, D2, true, 0.2, -1.3, -0.6, 0, 0, 0)
		local C = Instance.new('Part', P1) C.TopSurface = 0 C.BottomSurface = 0 C.CanCollide = false C.BrickColor = BrickColor.new('Pastel brown') C.Size = Vector3.new(0.4, 1.3, 0.4)
		fWeld('weld', P1, P1, C, true, 0, -1, -0.52 + (-C.Size.y / 2), math.rad(-80), 0, 0)
		local C2 = D:Clone() C2.BrickColor = BrickColor.new('Pink') C2.Mesh.Scale = Vector3.new(0.4, 0.62, 0.4) C2.Parent = P1
		fWeld('weld', C, C, C2, true, 0, 0 + (C.Size.y / 2), 0, math.rad(-10), 0, 0)
		local CM = Instance.new('CylinderMesh', C)
		local BL = Instance.new('Part', V1) BL.TopSurface = 0 BL.BottomSurface = 0 BL.CanCollide = false BL.BrickColor = BrickColor.new('Pastel brown') BL.Shape = 'Ball' BL.Size = Vector3.new(1, 1, 1)
		local DM2 = Instance.new('SpecialMesh', BL) DM2.MeshType = 'Sphere' DM2.Scale = Vector3.new(1.2, 1.2, 1.2)
		fWeld('weld', V1, V1, BL, true, -0.5, 0.5, -0.6, 0, 0, 0)
		local BR = Instance.new('Part', V1) BR.TopSurface = 0 BR.BottomSurface = 0 BR.CanCollide = false BR.BrickColor = BrickColor.new('Pastel brown') BR.Shape = 'Ball' BR.Size = Vector3.new(1, 1, 1)
		local DM3 = Instance.new('SpecialMesh', BR) DM3.MeshType = 'Sphere' DM3.Scale = Vector3.new(1.2, 1.2, 1.2)
		fWeld('weld', V1, V1, BR, true, 0.5, 0.5, -0.6, 0, 0, 0)
		local BLN = Instance.new('Part', V1) BLN.TopSurface = 0 BLN.BottomSurface = 0 BLN.CanCollide = false BLN.BrickColor = BrickColor.new('Pink') BLN.Shape = 'Ball' BLN.Size = Vector3.new(1, 1, 1)
		local DM4 = Instance.new('SpecialMesh', BLN) DM4.MeshType = 'Sphere' DM4.Scale = Vector3.new(0.2, 0.2, 0.2)
		fWeld('weld', V1, V1, BLN, true, -0.5, 0.5, -1.2, 0, 0, 0)
		local BRN = Instance.new('Part', V1) BRN.TopSurface = 0 BRN.BottomSurface = 0 BRN.CanCollide = false BRN.BrickColor = BrickColor.new('Pink') BRN.Shape = 'Ball' BRN.Size = Vector3.new(1, 1, 1)
		local DM5 = Instance.new('SpecialMesh', BRN) DM5.MeshType = 'Sphere' DM5.Scale = Vector3.new(0.2, 0.2, 0.2)
		fWeld('weld', V1, V1, BRN, true, 0.5, 0.5, -1.2, 0, 0, 0)
		LH2.C1 = CFrame.new(0.2, 1.6, 0.4) * CFrame.Angles(3.9, -0.4, 0) RH2.C1 = CFrame.new(-0.2, 1.6, 0.4) * CFrame.Angles(3.9, 0.4, 0)
		LS2.C1 = CFrame.new(-0.2, 0.9, 0.6) * CFrame.Angles(3.9, -0.2, 0) RS2.C1 = CFrame.new(0.2, 0.9, 0.6) * CFrame.Angles(3.9, 0.2, 0)
		LA1.C1 = CFrame.new(-0.5, 0.7, 0) * CFrame.Angles(-0.9, -0.4, 0) RS1.C1 = CFrame.new(0.5, 0.7, 0) * CFrame.Angles(-0.9, 0.4, 0)
		if P1:FindFirstChild('weldx') then P1.weldx:destroy() end
		WE = fWeld('weldx', P1, P1, V1, true, 0, -0.9, -1.3, math.rad(-90), 0, 0)
		local N = V1.Neck N.C0 = CFrame.new(0, 1.5, 0) * CFrame.Angles(math.rad(-210), math.rad(180), 0)
		spawn(function() while wait() do for i = 1, 6 do WE.C1 = WE.C1 * CFrame.new(0, -0.3, 0) end for i = 1, 6 do WE.C1 = WE.C1 * CFrame.new(0, 0.3, 0) end end end)
	end)
end

function spasm(plr)
    spawn(function()
        local char = plr.Character
        while char and char.Parent do
            for _,v in pairs(char:GetDescendants()) do
                if v:IsA("Motor6D") then
                    v.C0 = v.C0*CFrame.Angles(2*math.pi*math.random(),2*math.pi*math.random(),2*math.pi*math.random())
                end
            end
            wait()
        end
    end)
end

addcmd('bang',{'rape'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	local target = getPlayer(args[2], speaker)[1]
    for i,v in pairs(players)do
		if args[2] then
			bang(target, v)
		else
			bang(v, speaker.Name)
		end
	end
end)

addcmd('bgui',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		if Players[v].Character.Head:FindFirstChild("BillboardGui") then
			Players[v].Character.Head:FindFirstChild("BillboardGui"):Destroy()	
		end

		local y = Instance.new("BillboardGui")
		y.Size = UDim2.new(0,100,0,150)
		y.StudsOffset = Vector3.new(0,1,0)
		y.Parent = Players[v].Character.Head
		y.Adornee = Players[v].Character.Head
		local f = Instance.new("TextLabel")
		f.Parent = y
		f.BackgroundTransparency = 1
		f.Position = UDim2.new(0,0,0,-50)
		f.Size = UDim2.new(0,100,0,100)
		f.Font = "Highway"
		f.FontSize = "Size48"
		f.Text = getstring(2)
		f.TextStrokeColor3 = Color3.new(0,0,0)
		f.TextColor3 = Color3.new(255/255,255/255,255/255)
		f.TextStrokeTransparency = 0
		f.TextYAlignment = "Bottom"
	end
end)

addcmd('unbgui',{'nobgui'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		if Players[v].Character.Head:FindFirstChild("BillboardGui") then
			Players[v].Character.Head:FindFirstChild("BillboardGui"):Destroy()	
		end
	end
end)

addcmd('removeoverheadgui',{'rohg'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		for i,c in pairs(Players[v].Character:GetDescendants()) do
			if c:IsA("BillboardGui") or c:IsA("SurfaceGui") then
				c:Destroy()
			end
		end
	end
end)

addcmd('blur',{},
function(args, speaker)
    local function dels(instance)
        for i,v in pairs(instance:GetChildren())do
            if v:IsA'BlurEffect' then v:Destroy()end
            dels(v)
        end
    end
    dels(game:GetService("Lighting"))

	local b = Instance.new("BlurEffect", game:GetService("Lighting"))
	b.Name = "IYblur"
    b.Size = args[1]
end)

addcmd('unblur',{'noblur'},
function(args, speaker)
	for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
	    if v:IsA('BlurEffect') then
	        v:Destroy()
	    end
	end
end)

addcmd('begone',{'thot'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			local thotbottle = Models.Spray:Clone()
	        local pchar=Players[v].Character
			thotbottle.Name = 'THOT BEGONE'
			thotbottle.Handle:Destroy()
			Players[v].Character.Head.Anchored = true
			for a, mod in pairs(Players[v].Character:children()) do
				if mod:FindFirstChild("TAG") then
					Players[v].Character.Head.Transparency = 0
					mod:Destroy()
				end
			end
			local char = Players[v].Character
			local model = Instance.new("Model", char)
			local clone = char.Head:Clone()
			local hum = Instance.new("Humanoid", model)
			local weld = Instance.new("Weld", clone)
			model.Name = 'THOT'
			clone.Parent = model
			hum.Name = "TAG"
			hum.MaxHealth = 100
			hum.Health = 100
			weld.Part0 = clone
			weld.Part1 = char.Head
			char.Head.Transparency = 1
			spasm(Players[v])
			thotbottle.Parent = pchar
			thotbottle:MoveTo(pchar.HumanoidRootPart.Position + Vector3.new(0, 0, 7))
			local cf = pchar.HumanoidRootPart.CFrame
			local newcf = cf + cf.lookVector * 6
			thotbottle.Head.CFrame = newcf
			local s = Instance.new("Sound")
			s.Name = "BEGONE"
			s.SoundId = "http://www.roblox.com/asset/?id=2781920220"
			s.Volume = 10
			s.Parent = thotbottle
			s:play()
			local d = Instance.new("Sound")
			d.Name = "WuOOOH"
			d.SoundId = "http://www.roblox.com/asset/?id=253143032"
			d.Volume = 5
			d.Parent = pchar
			wait(4)
			for i, x in next, char:GetDescendants() do
				if x:IsA("BasePart") and x.Anchored then
					x.Anchored = false
				end
			end
			wait()
			thotbottle:Destroy()
			local Fling = Instance.new("BodyForce", char.HumanoidRootPart)
			Fling.Name = "Fling"
			Fling.force = Vector3.new(10000,10000,10000)
			d:play()
			if Players[v] then
				wait(3)
				Instance.new("Explosion", Players[v].Character).Position = Players[v].Character.HumanoidRootPart.Position	
				pchar:BreakJoints()
			end
		end)
    end
end)

addcmd('spasm',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spasm(Players[v])
	end
end)

addcmd('animation',{'anim'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://"..args[1]
		local k = Players[v]:FindFirstChildOfClass('Humanoid'):LoadAnimation(Anim)
		k:Play()
		if args[2] then
			k:AdjustSpeed(args[2])
		else
			k:AdjustSpeed(1)
		end
	end
end)

function bleach(plr)
	spawn(function()
		Rig6(plr)
		local char = plr.Character
		local hit1 = Instance.new("Sound", workspace)
		hit1.SoundId = "http://roblox.com/asset?id=145486953"
		local hit = Instance.new("Sound", workspace)
		hit.SoundId = "http://roblox.com/asset?id=178646271"
		local Bleach = Instance.new("Part", char["Left Arm"])
		Bleach.CanCollide = false
		local Mesh = Instance.new("SpecialMesh", Bleach)
		Mesh.MeshId = "http://roblox.com/asset?id=483388971"
		Mesh.Scale = Vector3.new(0.005, 0.005, 0.005)
		Mesh.TextureId = "http://roblox.com/asset?id=520016684"
		local Handy = Instance.new("Weld", Bleach)
		Handy.Part0 = Bleach
		Handy.Part1 = char["Left Arm"]
		Handy.C0 = CFrame.new(0.5,1.8,0)
		Handy.C1 = CFrame.Angles(0,4,1)
		local drink = Instance.new("Sound", char.Head)
		drink.SoundId = "http://roblox.com/asset?id=10722059"
		wait(3)
        game.Chat:Chat(char.Head,"I need to die","Red")
        for i = 1,10 do
            wait()
            char.HumanoidRootPart.RootJoint.C0 = char.HumanoidRootPart.RootJoint.C0 * CFrame.Angles(-0.018,0,0)
            Handy.C0 = Handy.C0 * CFrame.new(-0.05,-0.07,0.09)
            Handy.C0 = Handy.C0 * CFrame.Angles(0.12,0,0)
            char.Torso["Left Shoulder"].C0 = char.Torso["Left Shoulder"].C0 * CFrame.Angles(0.2,0,-0.1)
        end
        drink:Play()
        wait(3.4)
        drink:Stop()
        for i = 1,10 do
            wait()
            char.HumanoidRootPart.RootJoint.C0 = char.HumanoidRootPart.RootJoint.C0 * CFrame.new(0,-0.50,0)
            char.HumanoidRootPart.RootJoint.C0 = char.HumanoidRootPart.RootJoint.C0 * CFrame.Angles(0.175,0,0)
            Handy.C0 = Handy.C0 * CFrame.new(0.05,0.07,-0.09)
            Handy.C0 = Handy.C0 * CFrame.Angles(-0.1,0,0)
            char.Torso["Left Shoulder"].C0 = char.Torso["Left Shoulder"].C0 * CFrame.Angles(-0.15,-0.04,0.2)
            char.Torso["Right Shoulder"].C0 = char.Torso["Right Shoulder"].C0 * CFrame.Angles(-0.05,0.03,0)
            char.Torso["Right Hip"].C0 = char.Torso["Right Hip"].C0 * CFrame.Angles(-0.02,0,0)
            char.Torso["Left Hip"].C0 = char.Torso["Left Hip"].C0 * CFrame.Angles(-0.01,0,0)
        end
        wait(0.01)
        char.Torso.Anchored = true
        char["Left Arm"].Anchored = true
        char["Right Arm"].Anchored = true
        char["Left Leg"].Anchored = true
        char["Right Leg"].Anchored = true
        char.Head.Anchored = true
        hit:Play()
        hit1:Play()
        wait(4)
        local bl00d = Instance.new("Part", char.Head)
        bl00d.Size = Vector3.new(0.1,0.1,0.1)
        bl00d.Rotation = Vector3.new(0,0,-90)
        bl00d.CanCollide = false
        bl00d.Anchored = true
        bl00d.BrickColor = BrickColor.new("Maroon")
        bl00d.Position = char.Head.Position
        bl00d.CFrame = bl00d.CFrame * CFrame.new(0.43,-0.65,0)
        bl00d.Shape = "Cylinder"
        bl00d.Material = "Pebble"
        for i = 1,100 do
            wait()
            bl00d.Size = bl00d.Size + Vector3.new(0,0.05,0.05)
        end
        wait(1)
        char:FindFirstChildOfClass('Humanoid').Health = 0
	end)
end

addcmd('bleach', {},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
	bleach(Players[v])
	end	
end)

addcmd('bomb',{'terrorist'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
	    local Char=Players[v].Character
		local HumanoidRootPart = Char.HumanoidRootPart
		local TickWait = 1
		local Dead = false
		
		local Position = Vector3.new(0,100,0)
		local function NewPart(Parent)
			local Part = Instance.new("Part", Parent)
			Part.CanCollide = false
			Part.Position = Position
			Part.TopSurface = "Smooth"
			Part.BottomSurface = "Smooth"
			Position = Position + Vector3.new(0,10,0)
			return Part
		end
		
		local Model = Char:FindFirstChild("Bomb")
		if Model then Model:Destroy() end
		
		local Model = Instance.new("Model", Char)
		Model.Name = "Bomb"
		
		local Belt = NewPart(Model)
		Belt.Size = Vector3.new(2.2,0.5,1.2)
		local Weld = Instance.new("Weld", Belt)
		Weld.Part0 = Belt
		Weld.Part1 = HumanoidRootPart
		Weld.C0 = CFrame.new(0,1.1,0)
		local Light = Instance.new("PointLight", Belt)
		Light.Range = 15
		Light.Brightness = 5
		Light.Color = Color3.new(1,0,0)
		local Beep = Instance.new("Sound", Belt)
		Beep.SoundId = "http://www.roblox.com/asset/?id=188588790"
		
		local Back = NewPart(Model)
		Back.Size = Vector3.new(1.5,1.5,0.5)
		local Weld = Instance.new("Weld", Back)
		Weld.Part0 = Back
		Weld.Part1 = HumanoidRootPart
		Weld.C0 = CFrame.new(0,0.1,-0.75)
		
		local StrapLeft = NewPart(Model)
		StrapLeft.Size = Vector3.new(0.2,0.5,1.6)
		local Weld = Instance.new("Weld", StrapLeft)
		Weld.Part0 = StrapLeft
		Weld.Part1 = HumanoidRootPart
		Weld.C0 = CFrame.new(0.65,-0.9,-0.2)
		
		local BuckleLeft = NewPart(Model)
		BuckleLeft.Size = Vector3.new(0.2,1.5,0.2)
		local Weld = Instance.new("Weld", BuckleLeft)
		Weld.Part0 = BuckleLeft
		Weld.Part1 = HumanoidRootPart
		Weld.C0 = CFrame.new(0.65,0.1,0.5)
		
		local StrapRight = NewPart(Model)
		StrapRight.Size = Vector3.new(0.2,0.5,1.6)
		local Weld = Instance.new("Weld", StrapRight)
		Weld.Part0 = StrapRight
		Weld.Part1 = HumanoidRootPart
		Weld.C0 = CFrame.new(-0.65,-0.9,-0.2)
		
		local BuckleRight = NewPart(Model)
		BuckleRight.Size = Vector3.new(0.2,1.5,0.2)
		local Weld = Instance.new("Weld", BuckleRight)
		Weld.Part0 = BuckleRight
		Weld.Part1 = HumanoidRootPart
		Weld.C0 = CFrame.new(-0.65,0.1,0.5)
		
		LightEnabled = true
		coroutine.wrap(function()
			repeat
				wait(TickWait)
				LightEnabled = not LightEnabled
				Light.Enabled = LightEnabled
				Beep:Play()
			until Dead == true or Char:FindFirstChild("Bomb") == nil
		end)()
		
		wait(10)
			if Dead == false then
				Dead = true
				wait(1.4)
				local Explosion = Instance.new("Explosion")
				Explosion.Position = Belt.Position
				Explosion.BlastPressure = 100000
				Explosion.DestroyJointRadiusPercent = 0.7
				Explosion.ExplosionType = "CratersAndDebris"
				Explosion.BlastRadius = 50
				Explosion.Parent = workspace
			end
		end)
	end
end)

addcmd('cape',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
	spawn(function()
		if Players[v].Character:FindFirstChildOfClass("Humanoid") then
			local plr = Players[v]
			repeat wait() until plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
			local torso = plr.Character.HumanoidRootPart
			local p = Instance.new("Part", torso.Parent) p.Name = "IYcape" p.Anchored = false
			p.CanCollide = false p.TopSurface = 0 p.BottomSurface = 0
			if not args[2] then
			p.Color = Color3.new(0,0,0)
			p.Color = Color3.new(0,0,0) else
			p.Color = Color3.fromRGB((args[2]),(args[3]),(args[4]))
			p.Color = Color3.fromRGB((args[2]),(args[3]),(args[4])) end
			p.formFactor = "Custom"
			p.Size = Vector3.new(.2,.2,.2)
			local msh = Instance.new("BlockMesh", p) msh.Scale = Vector3.new(9,17.5,.5)
			local motor1 = Instance.new("Motor", p)
			motor1.Part0 = p
			motor1.Part1 = torso
			motor1.MaxVelocity = .01
			motor1.C0 = CFrame.new(0,1.75,0)*CFrame.Angles(0,math.rad(90),0)
			motor1.C1 = CFrame.new(0,1,.45)*CFrame.Angles(0,math.rad(90),0)
			local wave = false
			repeat wait(1/44)
			local ang = 0.1
			local oldmag = torso.Velocity.magnitude
			local mv = .002
			if wave then ang = ang + ((torso.Velocity.magnitude/10)*.05)+.05 wave = false else wave = true end
			ang = ang + math.min(torso.Velocity.magnitude/11, .5)
			motor1.MaxVelocity = math.min((torso.Velocity.magnitude/111), .04) + mv
			motor1.DesiredAngle = -ang
			if motor1.CurrentAngle < -.2 and motor1.DesiredAngle > -.2 then motor1.MaxVelocity = .04 end
			repeat wait() until motor1.CurrentAngle == motor1.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag)  >= (torso.Velocity.magnitude/10) + 1
			if torso.Velocity.magnitude < .1 then wait(.1) end
			until not p or p.Parent ~= torso.Parent
		end
	end)
	end
end)

addcmd('uncape',{'nocape'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
	local pchar=Players[v].Character
		for _, child in pairs( pchar:GetChildren()) do
		    if child.Name == "IYcape" then
		        child:Destroy()
			end
		end
	end
end)

local rad = math.rad
addcmd('earthquake',{},
function(args, speaker)
	for i = 1,args[1] do
		wait()
		local function ear(instance)
			for i,v in pairs(instance:GetChildren())do
				if v:IsA("Part") and v.Size.x > 1  then
					v.CFrame = CFrame.new(v.Position) * CFrame.Angles(rad(math.random(-args[2],args[2])),rad(math.random(-args[2],args[2])),rad(math.random(-args[2],args[2])))
				end
				ear(v)
			end
		end ear(workspace)
     end
end)

local fm = Instance.new('BlockMesh')
fm.Scale = Vector3.new(1, 1, 2)
fm.Name = "FAT"
addcmd('fat',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		Rig6(Players[v])
		local char = Players[v].Character
		for _, child in pairs( char:GetChildren()) do
			if child.ClassName == "CharacterMesh" then
				child:Destroy()
			end
		end
		for i,v in pairs(char:GetChildren()) do
			if v:IsA('Part') and v.Name ~= 'HumanoidRootPart' then
				fm:Clone().Parent = v
			end
		end
	end
end)

Paper = Instance.new('BlockMesh')
Paper.Name = 'Paper'
Paper.Scale = Vector3.new(1,1,0.1)
addcmd('paper',{''},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			Rig6(Players[v])
		    local pchar = Players[v].Character
			for _, child in pairs( pchar:GetChildren()) do
	    	if child.ClassName == "CharacterMesh" then
	        child:Destroy()
	   		end
			end
		    local LA = Paper:Clone()
		    LA.Parent = pchar["Left Arm"]
		    local RA = Paper:Clone()
		    RA.Parent = pchar["Right Arm"]
		    local LL = Paper:Clone()
		    LL.Parent = pchar["Left Leg"]
		    local RL = Paper:Clone()
		    RL.Parent = pchar["Right Leg"]
		    local T = Paper:Clone()
		    T.Parent = pchar.Torso
			local H = Paper:Clone()
			H.Parent = pchar.Head
			pchar.Head.face:Destroy()
		end)
	end
end)

addcmd('invisible',{'invis'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i, v in pairs(players) do
        for k, v2 in pairs(Players[v].Character:GetDescendants()) do
			if v2:IsA("BasePart") or v2:IsA("Decal") then
				v2.Transparency = 1
			end
		end
    end
end)

addcmd('visible',{'vis'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i, v in pairs(players) do
        for k, v2 in pairs(Players[v].Character:GetDescendants()) do
			if v2:IsA("BasePart") or v2:IsA("Decal") then
				if v2.Name ~= 'HumanoidRootPart' then
					v2.Transparency = 0
				end
			end
		end
    end
end)

addcmd('mesh',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
	    local pchar = Players[v].Character
	    for i,v in pairs(pchar.HumanoidRootPart:GetChildren()) do
		    if v:IsA("Decal") then
			    v:Destroy()
		    end
	    end
	    for i,v in pairs(pchar:GetChildren()) do
		    if v:IsA("Accessory") then
			    v:Destroy()
		    end
	    end
		for k, v2 in pairs(Players[v].Character:GetDescendants()) do
			if v2:IsA("BasePart") or v2:IsA("Decal") then
				if v2.Name ~= 'HumanoidRootPart' then
					v2.Transparency = 1
				else
					v2.Transparency = 0
				end
			end
		end
	    local msh = Instance.new("SpecialMesh", pchar.HumanoidRootPart)
	    msh.MeshType = "FileMesh"
	    msh.MeshId = "http://www.roblox.com/asset/?id=" ..args[2]
	    msh.TextureId = "http://www.roblox.com/asset/?id=" .. args[3]
		if args[4] then
			msh.Scale = Vector3.new(args[4], args[5], args[6])
		else
			msh.Scale = Vector3.new(3, 3, 3)
		end
	end
end)

addcmd('longneck',{'giraffe'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			Rig6(Players[v])
	        local pchar=Players[v].Character
	        for i,v in pairs(pchar:GetChildren()) do
				if pchar.Torso:FindFirstChild("Neck") then
					pchar.Torso.Neck.C0 = CFrame.new(0,3,0) * CFrame.Angles(-math.rad(90),0,math.rad(180))
					local Neck = pchar:FindFirstChild("Neck") if Neck then Neck:Destroy() end
					Neck = Instance.new("Part", pchar) Neck.Name = "Neck" Neck.Size = Vector3.new(1,3,1)
					Neck.Position = Vector3.new(0,100,0) Neck.BrickColor = BrickColor.new(tostring(pchar.Head.BrickColor)) Neck.Locked = true
					local Mesh = Instance.new("CylinderMesh", Neck) Mesh.Scale = Vector3.new(0.7,1,0.7)
					local Weld = Instance.new("Weld", Neck) Weld.Part0 = Neck Weld.Part1 = pchar.Torso Weld.C0 = CFrame.new(0,-2,0)
				end
			end
		end)
	end
end)

addcmd('unlongneck',{'nolongneck', 'ungiraffe', 'nogiraffe'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
	        local pchar=Players[v].Character
	        for i,v in pairs(pchar:GetChildren()) do
				pchar.Torso.Neck.C0 = CFrame.new(0,1,0) * CFrame.Angles(-math.rad(90),0,math.rad(180))
				local Neck = pchar:FindFirstChild("Neck") 
				if Neck then 
					Neck:Destroy()
				end
	    	end
		end)
	end
end)

addcmd('time',{},
function(args, speaker)
	if not args[1] then return end
	game:GetService("Lighting").ClockTime = args[1]
end)

addcmd('nuke',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
		local pchar = Players[v].Character
		local Pos = CFrame.new(0,1,0)
		if pchar and pchar:FindFirstChild("HumanoidRootPart") then Pos = pchar.HumanoidRootPart.CFrame * CFrame.new(0,1,0) end
		local Blast = Instance.new("Part", workspace) Blast.Name = "BlastEx" Blast.Anchored = true Blast.CanCollide = false Blast.Size = Vector3.new(1,1,1) Blast.CFrame = Pos
		local BlastMesh = Instance.new("SpecialMesh", Blast) BlastMesh.MeshId = "rbxassetid://1290033" BlastMesh.TextureId = "rbxassetid://33145325" BlastMesh.Scale = Vector3.new(0,0,0)
		local Wave = Instance.new("Part", workspace) Wave.BrickColor = BrickColor.new("Deep orange") Wave.Name = "WaveEx" Wave.Anchored = true Wave.CanCollide = false Wave.Size = Vector3.new(1,1,1) Wave.CFrame = Pos * CFrame.Angles(math.pi/2,0,0)
		local WaveMesh = Instance.new("SpecialMesh", Wave) WaveMesh.MeshId = "rbxassetid://3270017"
		local Light = Instance.new("PointLight", Blast) Light.Brightness = 1000 Light.Range = 10000 Light.Color = Color3.new(1,0.2,0.2)
		
		local Effect = Instance.new("ColorCorrectionEffect", game:GetService("Lighting")) Effect.Brightness = 0.2 Effect.Contrast = 0.4 Effect.Saturation = 1 Effect.TintColor = Color3.new(1,0.2,0.2)
		
		game:GetService("Lighting").Brightness = 5
		game:GetService("Lighting").Ambient = Color3.new(1,0.5,0.5)
		game:GetService("Lighting").OutdoorAmbient = Color3.new(1,1,1)
		
		local Exp = Instance.new("Explosion", workspace)
		Exp.Position = Pos.p
		Exp.BlastPressure = 10000000
		Exp.BlastRadius = 1000000
		Exp.Hit:connect(function(Part)
			if Part.Name ~= "Base" and Part.Name ~= "BasePlate" and Part ~= Blast and Part ~= Wave and Part.Name ~= "BlastEx" and Part.Name ~= "WaveEx" then
				ypcall(function()
					Part.Anchored = false
					Part.BrickColor = BrickColor.new("Black")
					Part.Material = "Slate"
					Part:BreakJoints()	
				end)
			end
		end)
	
		local BoomSound = Instance.new('Sound') BoomSound.Parent = workspace
		BoomSound.SoundId = 'rbxassetid://212389494'
		BoomSound:Play()
		for i = 0,100,0.5 do
			Blast.Anchored = true
			Wave.Anchored = true
			BlastMesh.Scale = Vector3.new(i,i,i)
			WaveMesh.Scale = Vector3.new(i^1.3,i^1.3,5)
			Blast.CFrame = Pos
			wait()
		end
		BoomSound:Stop()
		Blast:Destroy()
		Wave:Destroy()
		wait()
		BoomSound:Destroy()
		Effect:Destroy()
		for i = 10,5,-1 do
			game:GetService("Lighting").Brightness = (i-5) + 1
			game:GetService("Lighting").Ambient = Color3.new(i/10,0.5,0.5)
			game:GetService("Lighting").OutdoorAmbient = Color3.new(i/10,i/10,i/10)
			wait(0.05)
		end
		end)
	end
end)

function spawnrain(mesh,texture)
	spawn(function()
		for i,v in pairs(Players:GetChildren()) do
			if v.Character ~= nil and v.Character:FindFirstChild('HumanoidRootPart') then
				if raining == true then
					local rain = Instance.new("Part",workspace)
					rain.CanCollide = true
					local m = Instance.new("SpecialMesh",rain)
					m.MeshId = "http://www.roblox.com/asset/?id="..mesh
					m.TextureId = "http://www.roblox.com/asset/?id="..texture
					rain.CFrame = v.Character.HumanoidRootPart.CFrame + Vector3.new(math.random(-250,250),100,math.random(-250,250))
					wait(5)
					rain:Destroy()
				end
			end
		end
	end)
end

raining = false
addcmd('rain',{},
function(args, speaker)
	raining = true
	repeat
		wait(0.5)
		spawnrain(args[1],args[2])
	until raining == false
end)

addcmd('norain',{'unrain'},
function(args, speaker)
	raining = false
end)

addcmd('ball',{'hamsterball'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		local pchar=Players[v].Character
		scale = 10
		function weld(tab)
			local last = nil
			for i,v in pairs(tab) do
				if v:IsA("BasePart") then
					if last then
						local w = Instance.new("Weld",last)
						w.Part0 = w.Parent
						w.Part1 = v
						local pos = last.CFrame:toObjectSpace(v.CFrame)
						w.C0 = pos
					end
					last = v
				end
			end
		end
		local function makeball(pos)
			local model = Instance.new("Model",workspace)
			model.Name = Players[v].Name .. "ball"
			local rand = BrickColor.Random()
			pchar.Head.Anchored = true
			for i=0,340,20 do
				wait()
				for z=-90,70,20 do
					local p = Instance.new("Part",model)
					p.formFactor = "Custom"
					p.BrickColor = rand
					p.Transparency = 0.5
					p.Size = Vector3.new(scale/5.5,scale/5.5,scale/140)
					p.Anchored = true
					p.TopSurface = 0
					p.BottomSurface = 0
					p.CFrame = CFrame.new(pos) * CFrame.Angles(math.rad(z),math.rad(i),0) * CFrame.new(0,0,-scale/2)
					p:breakJoints()
				end
			end
			weld(model:children())
			for i,v in pairs(model:children()) do v.Anchored = false end 
				pchar.Head.Anchored = false
				model:MakeJoints()
			end
 
			if pchar then
				makeball(pchar.HumanoidRootPart.Position+Vector3.new(0,scale/2-2.5,0))
			end
		end
end)

addcmd('unball',{'unhamsterball','noball','nohamsterball'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		for _, child in pairs( workspace:GetChildren()) do
			if child.Name == Players[v].Name .. "ball" then
				child:Destroy()
			end
		end
	end
end)

addcmd('rocket',{'missile'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
        local pchar=Players[v].Character
        spawn(function()
			local missile = Instance.new('Part', workspace)
			missile.Name = 'IYmissile'
			missile.CanCollide = false
			missile.Size = Vector3.new(2, 5, 2) 
			Instance.new('CylinderMesh', missile)
			local F = Instance.new('Part', missile)
			F.BrickColor = BrickColor.new('Black')
			F.CanCollide = false
			F.Size = Vector3.new(2, 0.2, 2)
			Instance.new('CylinderMesh', F)
			local fire = Instance.new('Fire', F)
			fire.Size = "15"
			fire.Heat = "25"
			local head = Instance.new('Part', missile)
			head.CanCollide = false
			head.Shape = 'Ball'
			head.Size = Vector3.new(2, 2, 2)
			head.TopSurface = 'Smooth'
			head.BottomSurface = 'Smooth'
			local BF = Instance.new('BodyForce', missile)
			BF.Name = 'force'
			BF.Force = Vector3.new(0, 0, 0)
			local W1 = Instance.new('Weld', missile)
			W1.Part0 = missile
			W1.Part1 = F
			W1.C1 = CFrame.new(0, 2.6, 0)
			local W2 = Instance.new('Weld', missile)
			W2.Part0 = missile
			W2.Part1 = head
			W2.C1 = CFrame.new(0, -2.6, 0)
			local W = Instance.new('Weld', missile)
			W.Part0 = W.Parent
			W.Part1 = pchar.HumanoidRootPart
			W.C1 = CFrame.new(0, 0.5, 1)
			missile.force.Force = Vector3.new(0, 15000, 0)
			wait(0.01)
			pchar.HumanoidRootPart.CFrame = pchar.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
			wait(5)
			Instance.new('Explosion', missile).Position = missile.Position
			wait(0.01)
			pchar:BreakJoints()
			wait(1)
			missile:destroy()
		end)
    end
end)

addcmd('shrek',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		local pchar = Players[v].Character
		for i,v in pairs(pchar:GetChildren()) do
			if v:IsA("Accessory") or v:IsA("CharacterMesh") or v:IsA("Shirt") or v:IsA("Pants") then
				v:Destroy()
			end
		end
		for i,v in pairs(pchar.Head:GetChildren()) do
			if v:IsA("Decal") or v:IsA("SpecialMesh") then
				v:Destroy()
			end
		end
		
		local mesh = Instance.new("SpecialMesh", pchar.Head)
		mesh.MeshType = "FileMesh"
		pchar.Head.Mesh.MeshId = "http://www.roblox.com/asset/?id=19999257"
		pchar.Head.Mesh.Offset = Vector3.new(-0.1, 0.1, 0)
		pchar.Head.Mesh.TextureId = "http://www.roblox.com/asset/?id=156397869"
		
		local Shirt = Instance.new("Shirt", Players[v].Character)
		local Pants = Instance.new("Pants", Players[v].Character)
		
		Shirt.ShirtTemplate = "rbxassetid://133078194"
		Pants.PantsTemplate = "rbxassetid://133078204"
	end
end)

addcmd('duck',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
	    local pchar = Players[v].Character
	    local duck = Instance.new("SpecialMesh", pchar.HumanoidRootPart)
	    duck.MeshType = "FileMesh"
	    duck.MeshId = "http://www.roblox.com/asset/?id=9419831"
	    duck.TextureId = "http://www.roblox.com/asset/?id=9419827"
	    duck.Scale = Vector3.new(5, 5, 5)
		for k, v2 in pairs(Players[v].Character:GetDescendants()) do
			if v2:IsA("BasePart") or v2:IsA("Decal") then
				if v2.Name ~= 'HumanoidRootPart' then
					v2.Transparency = 1
				else
					v2.Transparency = 0
				end
			end
		end
	end
end)

addcmd('car',{'vehicle'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			local pchar=Players[v].Character
			local model = Models.Car:Clone()
			model.Parent = workspace
			model:MakeJoints()
			model:MoveTo(pchar.HumanoidRootPart.Position + Vector3.new(5, 5, 0))
			model.Name = "IYcar" .. Players[v].Name wait(0.2)
			for _, child in pairs( model:GetChildren()) do
			    if child.ClassName == "Part" then
					child.Anchored = true
					wait(1)
					child.Anchored = false
				end
			end
		end)
	end
end)

addcmd('uncar',{'unvehicle','nocar','novehicle'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		for _, child in pairs( workspace:GetChildren()) do
		    if child.Name == "IYcar" .. Players[v].Name then
			    child:Destroy()
		    end
		end
	end
end)

strobe = false
addcmd('strobe',{'flash'},
function(args, speaker)
	if strobe == false then
		strobep = Instance.new("ColorCorrectionEffect")
		strobep.Brightness = 1
		strobep.Parent = game:GetService("Lighting")
		strobe = true
		repeat wait()
			strobep.Enabled = true
			wait()
			strobep.Enabled = false
		until strobe == false
	end
end)

addcmd('unstrobe',{'noflash','nostrobe','unflash','unstrobe'},
function(args, speaker)
	strobe = false
	strobep:Destroy()
end)

addcmd('creeper',{'crpr'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
	Rig6(Players[v])
	local pchar = Players[v].Character
        if Players[v] and pchar and pchar:findFirstChild("Torso") then
            if pchar:FindFirstChild("Shirt") then
	            pchar.Shirt.Parent = pchar.Torso
            end
            if pchar:FindFirstChild("Pants") then
	            pchar.Pants.Parent = pchar.Torso
            end
            if pchar:FindFirstChild("Shirt Graphic") then
	            pchar["Shirt Graphic"].Graphic = ""
            end
            for i,v in pairs(pchar:GetChildren()) do
	            if v:IsA("Accessory") then
		            v:Destroy()
	            end
            end
            pchar.Torso.Neck.C0 = CFrame.new(0,1,0) * CFrame.Angles(math.rad(90),math.rad(180),0)
            pchar.Torso["Right Shoulder"].C0 = CFrame.new(0,-1.5,-.5) * CFrame.Angles(0,math.rad(90),0)
            pchar.Torso["Left Shoulder"].C0 = CFrame.new(0,-1.5,-.5) * CFrame.Angles(0,math.rad(-90),0)
            pchar.Torso["Right Hip"].C0 = CFrame.new(0,-1,.5) * CFrame.Angles(0,math.rad(90),0)
            pchar.Torso["Left Hip"].C0 = CFrame.new(0,-1,.5) * CFrame.Angles(0,math.rad(-90),0)
            pchar["Body Colors"].HeadColor = BrickColor.new("Bright green")
            pchar["Body Colors"].LeftArmColor = BrickColor.new("Bright green")
            pchar["Body Colors"].LeftLegColor = BrickColor.new("Bright green")
            pchar["Body Colors"].RightArmColor = BrickColor.new("Bright green")
            pchar["Body Colors"].RightLegColor = BrickColor.new("Bright green")
            pchar["Body Colors"].TorsoColor = BrickColor.new("Bright green")
        end
    end
end)

addcmd('spookyify',{},
function(args, speaker)
local music = Instance.new("Sound", workspace)
music.SoundId = "http://www.roblox.com/asset/?id=257569267"
music.Volume = 20
music.Looped = true
music:Play()

local tex1 = "http://www.roblox.com/asset/?id=185495987"
local tex2 = "http://www.roblox.com/asset/?id=260858020"
local tex3 = "http://www.roblox.com/asset/?id=149213919"
local tex4 = "http://www.roblox.com/asset/?id=171905673"

local w = workspace:GetChildren()

for i= 1,#w do
    if w[i]:isA("BasePart") then
        local pe = Instance.new("ParticleEmitter", w[i])
        pe.Texture = tex4
        pe.VelocitySpread = 5
    end
end

local playerLeaderstats = {}
for i, v in pairs(Players:GetChildren()) do
table.insert(playerLeaderstats, v)
end
for i, v in pairs(playerLeaderstats) do
pe = Instance.new("ParticleEmitter",v.Character.HumanoidRootPart)
pe.Texture = "http://www.roblox.com/asset/?id=171905673"
pe.VelocitySpread = 50
end

local texture = "http://www.roblox.com/asset/?id=185495987"

local A = workspace:GetChildren()
local B = workspace:GetChildren()
local C = workspace:GetChildren()
local D = workspace:GetChildren()
local E = workspace:GetChildren()
local F = workspace:GetChildren()
for i,v in pairs(A) do
    if v:IsA("Part") then
    local d =    Instance.new("Decal",v)
        v.Decal.Face = "Top"
        v.Decal.Texture = texture
        v.Anchored = true        
    end
end

for i,v in pairs(B) do
    if v:IsA("Part") then
        local s = Instance.new("Decal",v)
        s.Face = "Front"
        s.Texture = texture
    end
end

for i,v in pairs(C) do
    if v:IsA("Part") then
        local h = Instance.new("Decal",v)
        h.Face = "Back"
        h.Texture = texture
    end
end

for i,v in pairs(D) do
    if v:IsA("Part") then
        local j = Instance.new("Decal",v)
        j.Face = "Left"
        j.Texture = texture
    end
end

for i,v in pairs(E) do
    if v:IsA("Part") then
        local k = Instance.new("Decal",v)
        k.Face = "Right"
        k.Texture = texture
    end
end

for i,v in pairs(F) do
    if v:IsA("Part") then
        local l = Instance.new("Decal",v)
        l.Face = "Bottom"
        l.Texture = texture
    end

local imageOne = "http://www.roblox.com/asset/?id=169585459"
local imageTwo = "http://www.roblox.com/asset/?id=169585475"
local imageThree = "http://www.roblox.com/asset/?id=169585485"
local imageFour = "http://www.roblox.com/asset/?id=169585502"
local imageFive = "http://www.roblox.com/asset/?id=169585515"
local imageSix = "http://www.roblox.com/asset/?id=169585502"
local imageSeven = "http://www.roblox.com/asset/?id=169585485"
local imageEight = "http://www.roblox.com/asset/?id=169585475"

local Spooky = Instance.new("Sound", workspace)
Spooky.Name = "Spooky"
Spooky.SoundId = "rbxassetid://174270407"
Spooky.Volume = 15
Spooky.Looped = true
Spooky:Play()

local Sky = Instance.new("Sky", game:GetService("Lighting"))
Sky.SkyboxBk = imageOne
Sky.SkyboxDn = imageOne
Sky.SkyboxFt = imageOne
Sky.SkyboxLf = imageOne
Sky.SkyboxRt = imageOne
Sky.SkyboxUp = imageOne


while true do
    Sky.SkyboxBk = imageOne
    Sky.SkyboxDn = imageOne
    Sky.SkyboxFt = imageOne
    Sky.SkyboxLf = imageOne
    Sky.SkyboxRt = imageOne
    Sky.SkyboxUp = imageOne
    wait(0.15)
    Sky.SkyboxBk = imageTwo
    Sky.SkyboxDn = imageTwo
    Sky.SkyboxFt = imageTwo
    Sky.SkyboxLf = imageTwo
    Sky.SkyboxRt = imageTwo
    Sky.SkyboxUp = imageTwo
    wait(0.15)
    Sky.SkyboxBk = imageThree
    Sky.SkyboxDn = imageThree
    Sky.SkyboxFt = imageThree
    Sky.SkyboxLf = imageThree
    Sky.SkyboxRt = imageThree
    Sky.SkyboxUp = imageThree
    wait(0.15)
    Sky.SkyboxBk = imageFour
    Sky.SkyboxDn = imageFour
    Sky.SkyboxFt = imageFour
    Sky.SkyboxLf = imageFour
    Sky.SkyboxRt = imageFour
    Sky.SkyboxUp = imageFour
    wait(0.15)
    Sky.SkyboxBk = imageFive
    Sky.SkyboxDn = imageFive
    Sky.SkyboxFt = imageFive
    Sky.SkyboxLf = imageFive
    Sky.SkyboxRt = imageFive
    Sky.SkyboxUp = imageFive
    wait(0.15)
    Sky.SkyboxBk = imageSix
    Sky.SkyboxDn = imageSix
    Sky.SkyboxFt = imageSix
    Sky.SkyboxLf = imageSix
    Sky.SkyboxRt = imageSix
    Sky.SkyboxUp = imageSix
    wait(0.15)
    Sky.SkyboxBk = imageSeven
    Sky.SkyboxDn = imageSeven
    Sky.SkyboxFt = imageSeven
    Sky.SkyboxLf = imageSeven
    Sky.SkyboxRt = imageSeven
    Sky.SkyboxUp = imageSeven
    wait(0.15)
    Sky.SkyboxBk = imageEight
    Sky.SkyboxDn = imageEight
    Sky.SkyboxFt = imageEight
    Sky.SkyboxLf = imageEight
    Sky.SkyboxRt = imageEight
    Sky.SkyboxUp = imageEight
    wait(0.15)
    
end
end
end)

function pipeTp(name,target)
	spawn(function()
		local pipe = Instance.new("Part")
		pipe.Name = "Pipe"
		pipe.Color = Color3.new(52/255,142/255,64/255)
		pipe.Size = Vector3.new(8,8,8)
		pipe.Anchored = true
		local mesh = Instance.new("SpecialMesh",pipe)
		mesh.MeshId = "rbxassetid://856736661"
		mesh.Scale = Vector3.new(0.15, 0.15, 0.15)
		local sound = Instance.new("Sound",pipe)
		sound.SoundId = "rbxassetid://864352897"
		sound.Volume = 1
		
		local targetpos = game:GetService("Players")[target].Character.HumanoidRootPart.CFrame
		
		local char = game:GetService("Players")[name].Character
		char.PrimaryPart = char.HumanoidRootPart
		if char:FindFirstChild("Torso") then
			char.Torso.Anchored = true
		else
			char.UpperTorso.Anchored = true
		end
		
		local torso = char.HumanoidRootPart
		local initPos = torso.CFrame
		
		pipe.Parent = workspace
		pipe.CFrame = initPos - Vector3.new(0,8,0)
		
		for i = 0,8,0.2 do
			pipe.CFrame = initPos - Vector3.new(0,8-i,0)
			if i >= 1 then char:SetPrimaryPartCFrame(pipe.CFrame + Vector3.new(0,7,0)) end
			wait()
		end
		
		sound:Play()
		for i = 7,-8,-0.2 do
			char:SetPrimaryPartCFrame(pipe.CFrame + Vector3.new(0,i,0))
			wait()
		end
		char:SetPrimaryPartCFrame(pipe.CFrame + Vector3.new(0,-8,0))
		
		for i = 8,0,-0.2 do
			pipe.CFrame = initPos - Vector3.new(0,8-i,0)
			wait()
		end
		
		pipe.CFrame = targetpos - Vector3.new(0,8,0)
		char:SetPrimaryPartCFrame(pipe.CFrame)
		
		for i = 0,8,0.2 do
			pipe.CFrame = targetpos - Vector3.new(0,8-i,0)
			wait()
		end
		
		local played = false
		for i = -8,7,0.2 do
			if i >= 0 and not played then played = true sound:Play() end
			char:SetPrimaryPartCFrame(pipe.CFrame + Vector3.new(0,i,0))
			wait()
		end
		char:SetPrimaryPartCFrame(pipe.CFrame + Vector3.new(0,7,0))
		
		for i = 8,0,-0.2 do
			pipe.CFrame = targetpos - Vector3.new(0,8-i,0)
			if i >= 1 then char:SetPrimaryPartCFrame(pipe.CFrame + Vector3.new(0,7,0)) end
			wait()
		end
		
		pipe:Destroy()
		
		if char:FindFirstChild("Torso") then
			char.Torso.Anchored = false
		else
			char.UpperTorso.Anchored = false
		end
	end)
end

addcmd('pipetp',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	local target = getPlayer(args[2], speaker)[1]
    for i,v in pairs(players)do
        pipeTp(v,target)
    end
end)

local song = nil
function zinniaKick(name)
    spawn(function()
            if song == nil or song.Parent == nil then
                song = Instance.new("Sound",workspace)
                song.SoundId = "rbxassetid://190423831"
                song.Volume = 1
                song.Looped = true
                song:Play()
            end
            local zin = Instance.new("Part")
            zin.Name = "CuteZinnia"
            zin.Anchored = true
            zin.CanCollide = false
            zin.Locked = true
            local mesh = Instance.new("SpecialMesh")
            mesh.MeshId = "rbxassetid://1175670539"
            mesh.TextureId = "rbxassetid://1175670558"
            mesh.Scale = Vector3.new(0.05,0.05,0.05)
            mesh.Offset = Vector3.new(0,0.88,0)
            mesh.Parent = zin
            local char = game:GetService("Players")[name].Character
            char.PrimaryPart = char.HumanoidRootPart
            if char:FindFirstChild("Torso") then
                char.Torso.Anchored = true
            else
                char.UpperTorso.Anchored = true
            end
            zin.CFrame = (char.HumanoidRootPart.CFrame + char.HumanoidRootPart.CFrame.lookVector*50) * CFrame.Angles(0,math.pi,0) + Vector3.new(0,500,0) + (char:FindFirstChild("UpperTorso") and Vector3.new(0,0.9,0) or Vector3.new(0,0,0))
            zin.Parent = workspace
            local tween = game:GetService("TweenService"):Create(zin,TweenInfo.new(3,Enum.EasingStyle.Quart,Enum.EasingDirection.Out,0,false,0),{CFrame = zin.CFrame - Vector3.new(0,500,0)})
            tween:Play()
            wait(3)
            for i = 50,1,-1 do
                zin.CFrame = (char.HumanoidRootPart.CFrame + char.HumanoidRootPart.CFrame.lookVector*i) * CFrame.Angles(0,math.pi,0) + (char:FindFirstChild("UpperTorso") and Vector3.new(0,0.9,0) or Vector3.new(0,0,0))
                wait()
            end
            char:SetPrimaryPartCFrame(zin.CFrame + CFrame.Angles(0,math.pi/2,0)*zin.CFrame.lookVector*3.5 + Vector3.new(0,3,0))
            wait(1)
            local turns = 0

            while turns < 200 do
                zin.CFrame = zin.CFrame*CFrame.Angles(0,(-math.pi/3)*turns/200,0)
                char:SetPrimaryPartCFrame(zin.CFrame + CFrame.Angles(0,math.pi/2,0)*zin.CFrame.lookVector*3.5 + Vector3.new(0,3,0))
                turns = turns + 1
                wait()
            end
            for i = 1,10 do
                zin.CFrame = zin.CFrame*CFrame.Angles(0,(-math.pi/3)*turns/200,0)
                char:SetPrimaryPartCFrame(zin.CFrame + CFrame.Angles(0,math.pi/2,0)*zin.CFrame.lookVector*3.5 + Vector3.new(0,3,0))
                wait()
            end
            local rX,rZ = 0,0
            repeat rX = math.random(-10000,10000) until math.abs(rX) > 5000
                repeat rZ = math.random(-10000,10000) until math.abs(rZ) > 5000
                    local bv = Instance.new("BodyForce",char.HumanoidRootPart)
                    bv.Force = Vector3.new(rX,10000,rZ)
                    if char:FindFirstChild("Torso") then
                        char.Torso.Anchored = false
                    else
                        char.UpperTorso.Anchored = false
                    end
                    function KICK(P)
                        spawn(function()
							if not FindInTable(Admin, P.Name) and not FindInTable(Owner, P.Name)then
                                P:Kick()
							end
                        end)
                    end
                    spawn(function()
                            if game:GetService("Players")[name] == game:GetService("Players").LocalPlayer then wait(10) else wait(5) end
                            game:GetService("Players")[name].CharacterAdded:Connect(function()
                                    wait()
                                    KICK(game:GetService("Players")[name])
                                end)
                            KICK(game:GetService("Players")[name])
                        end)
                    for i = 1,20 do
                        zin.CFrame = zin.CFrame*CFrame.Angles(0,(-math.pi/3)*turns/200,0)
                        wait()
                    end
                    while turns > 0 do
                        zin.CFrame = zin.CFrame*CFrame.Angles(0,(-math.pi/3)*turns/200,0)
                        turns = turns - 5
                        wait()
                    end
                    wait(1)
                    zin.Name = "GoneZinnia"
                    local go = Instance.new("BodyVelocity",zin)
                    go.Velocity = zin.CFrame.lookVector * 100
                    go.MaxForce = Vector3.new(1000000,1000000,1000000)
                    zin.Anchored = false
                    wait(20)
         if song and not workspace:FindFirstChild("CuteZinnia") then
             song:Destroy()
             song = nil
         end
   	end)
end

addcmd('zinniakick',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
        zinniaKick(Players[v].Name)
    end
end)

local Saved = {}

RestorePoint = function()
    Saved = {}
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        v.Archivable = true;
    end
    for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if not v:IsA("Terrain") and not v:IsA("Camera") then
            if not game:GetService("Players"):FindFirstChild(v.Name) then
                table.insert(Saved, v:Clone());
            end
        elseif v:IsA("Terrain") then
            Saved.Terrain = game:GetService("Workspace").Terrain:CopyRegion(game:GetService("Workspace").Terrain.MaxExtents);
        end
    end
    return Saved;
end

InsertPoint = function()
    if #Saved == 0 and not Saved.Terrain then
        return false;
    end
    for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if not v:IsA("Camera") and not v:IsA("Terrain") then
            if not game:GetService("Players"):FindFirstChild(v.Name) then
                pcall(function()
                    v:Destroy()
                end)
            end
        elseif v:IsA("Terrain") then
            v:Clear()
        end
    end
    for i, v in ipairs(Saved) do
		v:Clone().Parent = workspace;
    end
    game:GetService("Workspace").Terrain:PasteRegion(Saved.Terrain, game:GetService("Workspace").Terrain.MaxExtents.Min, true);
end

addcmd('savemap',{'smap'},
function(args, speaker)
	if not FindInTable(Owner,speaker.Name) then return end
	RestorePoint()
end)

addcmd('restoremap',{'rmap'},
function(args, speaker)
	if not FindInTable(Owner,speaker.Name) then return end
	InsertPoint()
end)

function gull(name)
	spawn(function()
	local char = game:GetService("Players")[name].Character
	char.PrimaryPart = char.HumanoidRootPart
	
	local tors = game:GetService("Players")[name].Character.HumanoidRootPart
	local initCFrame = tors.CFrame
	
	if char:FindFirstChild("Torso") then
		char.Torso.Anchored = true
	else
		char.UpperTorso.Anchored = true
	end
	char:FindFirstChildOfClass("Humanoid").Name = "Sad"

	local gull = Instance.new("Part")
	gull.Anchored = true
	gull.CanCollide = false
	gull.Position = Vector3.new(0,100000,0)
	local mesh = Instance.new("SpecialMesh",gull)
	mesh.MeshId = "http://www.roblox.com/asset/?id=272501436"
	mesh.TextureId = "http://www.roblox.com/asset/?id=267684509"
	mesh.Scale = Vector3.new(10,10,10)
	
	local leftWing = Instance.new("Part",gull)
	leftWing.CanCollide = false
	local lmesh = Instance.new("SpecialMesh",leftWing)
	lmesh.MeshId = "http://www.roblox.com/asset/?id=267684584"
	lmesh.TextureId = "http://www.roblox.com/asset/?id=267684509"
	lmesh.Scale = Vector3.new(10,10,10)
	local leftMotor = Instance.new("Motor6D",gull)
	leftMotor.MaxVelocity = 1
	leftMotor.Part0 = gull
	leftMotor.Part1 = leftWing
	leftMotor.C0 = CFrame.new(-50.2919998, -0.0920021087, 0.280000001)
	
	local rightWing = Instance.new("Part",gull)
	rightWing.CanCollide = false
	local rmesh = Instance.new("SpecialMesh",rightWing)
	rmesh.MeshId = "http://www.roblox.com/asset/?id=267684651"
	rmesh.TextureId = "http://www.roblox.com/asset/?id=267684509"
	rmesh.Scale = Vector3.new(10,10,10)
	local rightMotor = Instance.new("Motor6D",gull)
	rightMotor.MaxVelocity = 1
	rightMotor.Part0 = gull
	rightMotor.Part1 = rightWing
	rightMotor.C0 = CFrame.new(47.1930008, -0.0670021027, 0.280000001)
	
	local sound = Instance.new("Sound",gull)
	sound.SoundId = "rbxassetid://160877039"
	sound.Volume = 10
	gull.Parent = workspace

	for i = 400,-1000,-2 do
		local der = 0.02*i
		local angle = math.atan(der/1)
		gull.CFrame = initCFrame*CFrame.Angles(angle,math.pi,0) + initCFrame.lookVector * (i+5) + Vector3.new(0,0.01*i^2+7,0)
		if i == 0 then sound:Play() end
		if i <= 0 then
			char:SetPrimaryPartCFrame(gull.CFrame)
			local nextAngle = -0.2*math.sin(0.05*math.pi*(i))
			leftMotor.DesiredAngle = -nextAngle
			leftMotor.C0 = CFrame.new(-50.2919998, 47.193*math.tan(nextAngle), 0.280000001)
			rightMotor.DesiredAngle = nextAngle
			rightMotor.C0 = CFrame.new(47.1930008, 47.193*math.tan(nextAngle), 0.280000001)
		end
		wait()
	end
	
	local function KICK(P)
		spawn(function()
			if not FindInTable(Admin, P.Name) and not FindInTable(Owner, P.Name) then
				P:Kick()
			end
		end)
	end
	
	if char:FindFirstChild("Torso") then
		char.Torso.Anchored = false
	else
		char.UpperTorso.Anchored = false
	end
	
	spawn(function()
	if game:GetService("Players")[name] == game:GetService("Players").LocalPlayer then wait(5) end
	game:GetService("Players")[name].CharacterAdded:Connect(function()
		wait()
		KICK(game:GetService("Players")[name])
	end)
	KICK(game:GetService("Players")[name])
	end)
	
		local go = Instance.new("BodyVelocity",gull)
		go.Velocity = Vector3.new(0,1000,0)
		go.MaxForce = Vector3.new(1000000,1000000,1000000)
		gull.Anchored = false
	end)
end

addcmd('seagull',{'gull'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
        gull(Players[v].Name)
    end
end)

addcmd('sit',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
        spawn(function()
			Players[v].Character:FindFirstChildOfClass('Humanoid').Sit = true
		end)
    end
end)

addcmd('light',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
	spawn(function()
        local pchar=Players[v].Character
        for j,v1 in pairs(pchar.HumanoidRootPart:GetChildren()) do
			if v1:IsA("PointLight") then
				v1:Destroy()
			end
		end
        local light = Instance.new("PointLight", pchar.HumanoidRootPart)
		light.Range = 12
		light.Brightness = 3
		if not args[2] then return end
        light.Color = Color3.fromRGB((args[2]),(args[3]),(args[4]))
		light.Range = 12
		light.Brightness = 3
		end)
    end
end)

addcmd('nolight',{'unlight'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
        local pchar=Players[v].Character
        for j,v1 in pairs(pchar.HumanoidRootPart:GetChildren()) do
			if v1:IsA("PointLight") then
				v1:Destroy()
			end
		end
    end
end)

addcmd('plrsound',{'playersound'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		if not args[1] and args[2] then return end
		local pchar=Players[v].Character
		for _, child in pairs( pchar:GetDescendants()) do
	    	if child.ClassName == "Sound" then
				child:Destroy()
			end
		end
		local s = Instance.new("Sound")
		s.Name = "IYplrsound"
		s.SoundId = "http://www.roblox.com/asset/?id=" .. args[2]
		s.Volume = 1
		s.Pitch = 1
		s.Looped = true
		s.archivable = true
		s.Parent = pchar.HumanoidRootPart
		s:Play()
    end
end)

addcmd('noplrsound',{'noplayersound','unplayersound','unplrsound'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		if not args[1] then return end
		local pchar=Players[v].Character
		for _, child in pairs( pchar:GetDescendants()) do
			if child.ClassName == "Sound" then
				child:Destroy()
			end
		end
	end
end)

addcmd('mute',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			local CoreGui = Scripts.Mute:Clone()
			CoreGui.IsMuted.Value = true
			CoreGui.Parent = Players[v].Character
			CoreGui.Disabled = false
		end)
	end
end)

addcmd('unmute',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			local CoreGui = Scripts.Mute:Clone()
			CoreGui.IsMuted.Value = false
			CoreGui.Parent = Players[v].Character
			CoreGui.Disabled = false
		end)
	end
end)

addcmd('removechat',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			local CoreGui = Scripts.CoreGui:Clone()
			CoreGui.Type.Value = 'Chat'
			CoreGui.Parent = Players[v].Character
			CoreGui.Disabled = false
		end)
	end
end)

addcmd('restorechat',{'enablechat'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			local CoreGui = Scripts.CoreGui:Clone()
			CoreGui.Type.Value = 'Chat'
			CoreGui.Enabled.Value = true
			CoreGui.Parent = Players[v].Character
			CoreGui.Disabled = false
		end)
	end
end)

addcmd('hideplayerlist',{'hideplrlist'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			local CoreGui = Scripts.CoreGui:Clone()
			CoreGui.Type.Value = 'PlayerList'
			CoreGui.Parent = Players[v].Character
			CoreGui.Disabled = false
		end)
	end
end)

addcmd('showplayerlist',{'showplrlist','unhideplayerlist','unhideplrlist'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			local CoreGui = Scripts.CoreGui:Clone()
			CoreGui.Type.Value = 'PlayerList'
			CoreGui.Enabled.Value = true
			CoreGui.Parent = Players[v].Character
			CoreGui.Disabled = false
		end)
	end
end)

addcmd('hidebackpack',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			local CoreGui = Scripts.CoreGui:Clone()
			CoreGui.Type.Value = 'Backpack'
			CoreGui.Parent = Players[v].Character
			CoreGui.Disabled = false
		end)
	end
end)

addcmd('showbackpack',{'unhidebackpack'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			local CoreGui = Scripts.CoreGui:Clone()
			CoreGui.Type.Value = 'Backpack'
			CoreGui.Enabled.Value = true
			CoreGui.Parent = Players[v].Character
			CoreGui.Disabled = false
		end)
	end
end)

addcmd('startergear',{'sg'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			for i,v in pairs(Players[v].Backpack:GetChildren()) do
				if v:IsA("Tool") then
					v:Clone().Parent = Players[v].StarterGear
				end
			end
			for i,v in pairs(Players[v].Character:GetChildren()) do
				if v:IsA("Tool") then
					v:Clone().Parent = Players[v].StarterGear
				end
			end
		end)
	end
end)

addcmd('nostartergear',{'nosg'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			Players[v].StarterGear:ClearAllChildren()
		end)
	end
end)

addcmd('zinnia',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		require(2784999300)(Players[v].Name)
    end
end)

addcmd('spawn',{'spawnpoint'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	if players ~= nil then
		for i, v in pairs(players) do
			local M = Instance.new('SpawnLocation', workspace) M.Name = 'IYspawn'
			M.CFrame = Players[v].Character.HumanoidRootPart.CFrame
			M.Color = Color3.new(0.180392, 0.180392, 0.184314) M.Material = 'Neon' M.Size = Vector3.new(6, 1, 6)
			M.Position = Players[v].Character.HumanoidRootPart.Position + Vector3.new(0, -3.5, 0)
			M.Anchored = true
		end
	end
end)

addcmd('deletespawns',{'removespawns','nospawns'},
function(args, speaker)
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("SpawnLocation") then
			v:Destroy()
		end
	end
end)

addcmd('jumpscare',{'scare'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			local Spook = Guis.IY_JumpScare:Clone()
			Spook.Parent = Players[v]:WaitForChild("PlayerGui")
			Spook.Image.Handle.Disabled = false
		end)
	end
end)

addcmd('particles',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		local char = Players[v].Character
		for i,v in pairs(char.HumanoidRootPart:GetChildren()) do
			if v:IsA('ParticleEmitter') then
				v:Destroy()
			end
		end
		local prt = Instance.new('ParticleEmitter', char.HumanoidRootPart)
		prt.Texture = 'rbxassetid://' .. args[2]
		prt.Rate = 10
		prt.SpreadAngle = Vector2.new(50, 50)
	end
end)

addcmd('unparticles',{'noparticles'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		local char = Players[v].Character
		for i,v in pairs(char.HumanoidRootPart:GetChildren()) do
			if v:IsA('ParticleEmitter') then
				v:Destroy()
			end
		end
	end
end)

addcmd('sparkles',{'sp'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
	        local pchar=Players[v].Character
	        local Sparkles = Instance.new("Sparkles", pchar.HumanoidRootPart)
	    	if not args[2] then return end
	        Sparkles.Color = Color3.fromRGB((args[2]),(args[3]),(args[4]))
		end)
    end
end)

addcmd('nosparkles',{'unsparkles','unsp','nosp'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
        local pchar=Players[v].Character
        for j,v1 in pairs(pchar:GetDescendants()) do
			if v1:IsA("Sparkles") then
				v1:Destroy()
			end
		end
	end
end)

addcmd('rhats',{'removehats','nohats'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		for i,v in pairs(Players[v].Character:GetChildren()) do
			if v:IsA('Accessory') then
				v:Destroy()
			end
		end
	end
end)

addcmd('naked',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		for i,v in pairs(Players[v].Character:GetChildren()) do
			if v:IsA('Shirt') or v:IsA('Pants') or v:IsA('ShirtGraphic') then
				v:Destroy()
			end
		end
	end
end)

addcmd('rainbow',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		local Parts={}
		local function GetDiscoColor(hue)
		    local section = hue % 1 * 3
		    local secondary = 0.5 * math.pi * (section % 1)
		    if section < 1 then
		        return Vector3.new(1, 1 - math.cos(secondary), 1 - math.sin(secondary))
		    elseif section < 2 then
		        return Vector3.new(1 - math.sin(secondary), 1, 1 - math.cos(secondary))
		    else
		        return Vector3.new(1 - math.cos(secondary), 1 - math.sin(secondary), 1)
		    end
		end
		local Part = function(x,y,z,color,tr,cc,an,parent)
		    local p = Instance.new('Part',parent)
		    p.formFactor = 'Custom'
		    p.Size = Vector3.new(x,y,z)
		    p.BrickColor = BrickColor.new(color)
		    p.CanCollide = cc
		    p.Transparency = tr
		    p.Anchored = an
		    p.TopSurface,p.BottomSurface = 0,0
		    p:BreakJoints''
		    table.insert(Parts,p)
		    return p
		end
		local Weld = function(p0,p1)
		    local w = Instance.new('Motor',p0)
		    w.Part0 = p0
		    w.Part1 = p1
		    return w 
		end
		local Mesh = function(par,num,x,y,z)
		    local msh = 0
		    if num == 1 then
		        msh = Instance.new("SpecialMesh",par)
		        msh.MeshId='rbxasset://fonts/torso.mesh'
		        msh.TextureId='rbxasset://25701026'
		    end
		    if num == 2 then
		        msh = Instance.new("SpecialMesh",par)
		        msh.MeshId='rbxasset://fonts/head.mesh'
		        msh.TextureId='rbxassetid://25701026'
		    end
		    msh.Scale = Vector3.new(x,y,z)
		    return msh
		end
		local char=Players[v].Character
		for _,v in pairs(char:GetChildren()) do
		    if v.ClassName=="Part" then
		        v.Transparency=1
		    elseif v.ClassName=="Hat" then
		        v.Handle.Mesh.TextureId='rbxassetid://25701026'
		        table.insert(Parts,v.Handle)
		    end
		end
		local t=Part(1,1,1,'',0,false,false,char)
		Mesh(t,1,1,1,1)
		Weld(char.Torso,t)
		local a=Part(1,1,1,'',0,false,false,char)
		Mesh(a,1,.5,1,1)
		Weld(char['Right Arm'],a)
		local a=Part(1,1,1,'',0,false,false,char)
		Mesh(a,1,.5,1,1)
		Weld(char['Left Arm'],a)
		local l=Part(1,1,1,'',0,false,false,char)
		Mesh(l,1,.5,1,1)
		Weld(char['Right Leg'],l)
		local l=Part(1,1,1,'',0,false,false,char)
		Mesh(l,1,.5,1,1)
		Weld(char['Left Leg'],l)
		local h=Part(1,1,1,'',0,false,false,char)
		Mesh(h,2,1,1,1)
		Weld(char.Head,h)
		spawn(function()
		    game:GetService("RunService").Heartbeat:connect(function()
		        for i=1,#Parts do
		            Parts[i].Mesh.VertexColor=GetDiscoColor(tick()*.5)
		        end
		    end)
		end);
	end
end)
	
addcmd('notools',{'rtools','clrtools','removetools'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
	for i,v in pairs(players) do
		spawn(function()
			for i,v in pairs(Players[v].Backpack:GetDescendants()) do
				if v:IsA('Tool') or v:IsA('HopperBin') then
					v:destroy()
				end
			end
			for i,v in pairs(Players[v].Character:GetDescendants()) do
				if v:IsA('Tool') or v:IsA('HopperBin') then
					v:destroy()
				end
			end
		end)
	end
end)

addcmd('spin',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			local Spin = Instance.new("BodyAngularVelocity", Players[v].Character.HumanoidRootPart)
			Spin.Name = "Spinning"
			Spin.MaxTorque = Vector3.new(0, math.huge, 0)
			Spin.AngularVelocity = Vector3.new(0,20,0)
		end)
	end
end)

addcmd('unspin',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
	    local pchar = Players[v].Character
	    for i,v in pairs(pchar.HumanoidRootPart:GetChildren()) do
		    if v.Name == "Spinning" then
			    v:Destroy()
		    end
	    end
	end
end)

addcmd('fire',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
	        for k, v2 in pairs(Players[v].Character:GetDescendants()) do
				if v2:IsA("BasePart") then
					local Fire = Instance.new("Fire", v2)
					if args[2] then
						Fire.Color = Color3.fromRGB((args[2]),(args[3]),(args[4]))
						Fire.SecondaryColor = Color3.new((args[2]),(args[3]),(args[4]))
					end
				end
			end
		end)
	end
end)

addcmd('nofire',{'unfire'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
        local pchar=Players[v].Character
        for j,v1 in pairs(pchar:GetDescendants()) do
			if v1:IsA("Fire") then
				v1:Destroy()
			end
		end
	end
end)


addcmd('trail',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
			Rig6(Players[v])
	        local pchar=Players[v].Character
	        for j,v1 in pairs(pchar.Torso:GetChildren()) do
				if v1.Name == "TRAIL" then
					v1:Destroy()
				end
			end
			if pchar:FindFirstChild("Torso") then
				local e = Instance.new("Trail", pchar.Torso)
				e.Name = "TRAIL"
				e.FaceCamera = true
				e.Attachment0 = pchar.Torso.WaistCenterAttachment
				e.Attachment1 = pchar.Torso.NeckAttachment
				if args[2] then
					e.Color = ColorSequence.new(Color3.fromRGB(args[2],args[3],args[4]),Color3.new(0,0,0))
				else
					e.Color = ColorSequence.new(Color3.new(1,1,1),Color3.new(0,0,0))
				end
			end
		end)
    end
end)

addcmd('untrail',{'notrail'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
	        local pchar=Players[v].Character
	        for j,v1 in pairs(pchar.Torso:GetChildren()) do
				if v1.Name == "TRAIL" then
					v1:Destroy()
				end
			end
		end)
    end
end)

addcmd('script',{'execute','s'},
function(args, speaker)
	if not FindInTable(Owner,speaker.Name) then return end
	if args[1] then
		Loadstring(args[1])()
	end
end)

addcmd('executelocal',{'localscript'},
function(args, speaker)
	if not FindInTable(Owner,speaker.Name) then return end
	if args[1] then
		RunOnClient:FireClient(speaker,args[1])
	end
end)

addcmd('freeze',{'fr'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	if players ~= nil then
		for i, v in pairs(players) do
			spawn(function()
				for i, x in next, Players[v].Character:GetDescendants() do
					if x:IsA("BasePart") and not x.Anchored and x.Name ~= 'HumanoidRootPart' then
						x.Anchored = true
					end
				end
			end)
		end
	end
end)

addcmd('thaw',{'unfreeze','unfr'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	if players ~= nil then
		for i, v in pairs(players) do
			spawn(function()
				for i, x in next, Players[v].Character:GetDescendants() do
					if x:IsA("BasePart") and x.Anchored then
						x.Anchored = false
					end
				end
			end)
		end
	end
end)

addcmd('nolimbs',{'rlimbs'},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i, v in pairs(players) do
		if Players[v].Character:FindFirstChildOfClass('Humanoid').RigType == Enum.HumanoidRigType.R15 then
			for i,v in pairs(Players[v].Character:GetChildren()) do
				if v:IsA("BasePart") and
					v.Name == "RightUpperLeg" or
					v.Name == "LeftUpperLeg" or
					v.Name == "RightUpperArm" or
					v.Name == "LeftUpperArm" then
					v:Destroy()
				end
			end
		else
			for i,v in pairs(Players[v].Character:GetChildren()) do
				if v:IsA("BasePart") and
					v.Name == "Right Leg" or
					v.Name == "Left Leg" or
					v.Name == "Right Arm" or
					v.Name == "Left Arm" then
					v:Destroy()
				end
			end
		end
	end
end)

addcmd('glass',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	if players ~= nil then
		for i, v in pairs(players) do
			Rig6(Players[v])
			for _, child in pairs(Players[v].Character:GetChildren()) do
	    		if child.ClassName == "CharacterMesh" or child.ClassName == "Shirt" or child.ClassName == "Pants" then
	        		child:Destroy()
	   			end
			end
			for _, child in pairs(Players[v].Character:GetChildren()) do
    			if child:IsA("BasePart") then
        			child.Material = "Glass"
					child.Transparency = 0.3
    			end
			end
		end
	end
end)

addcmd('r6',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i, c in pairs(players) do
		spawn(function()
			Rig6(Players[c])
		end)
	end
end)

local chatter do
	local CHAT_COLORS = {
		Color3.new(253/255,41/255,67/255),
		Color3.new(1/255,162/255,255/255),
		Color3.new(2/255,184/255,87/255),
		BrickColor.new("Bright violet").Color,
		BrickColor.new("Bright orange").Color,
		BrickColor.new("Bright yellow").Color,
		BrickColor.new("Light reddish violet").Color,
		BrickColor.new("Brick yellow").Color
	}
	
	local function GetNameValue(pName)
		local value = 0
		for index = 1,#pName do
			local cValue = string.byte(string.sub(pName,index,index))
			local reverseIndex = #pName - index + 1
			if #pName%2 == 1 then
				reverseIndex = reverseIndex - 1
			end
			if reverseIndex%4 >= 2 then
				cValue = - cValue
			end
			value = value + cValue
		end
		return value
	end
	
	local function nameValue(pName)
		return CHAT_COLORS[(GetNameValue(pName) % #CHAT_COLORS) + 1]
	end
	
	local cryer = function(name,msg)	
		local id = 123456
		
		local plr = game:GetService("Players"):FindFirstChild(name)
		
		pcall(function()
			id = game:GetService("Players"):GetUserIdFromNameAsync(name)
		end)
	
		local data = {
			ID = math.random(),
			FromSpeaker = name,
			SpeakerUserId = id,
			OriginalChannel = "All",
			IsFiltered = true,
			MessageLength = string.len(msg),
			Message = msg,
			MessageType = "Message",
			Time = os.time(),
			ExtraData = {NameColor = nameValue(name)}
		}
		
		if plr and plr:IsA("Player") and plr.Team then
			data.ExtraData.NameColor = plr.Team.TeamColor.Color
		end
		
		local remote = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering:FireAllClients(data,"All")
	end
	
	chatter = cryer
end

addcmd('chat',{},
function(args, speaker)
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		spawn(function()
			chatter(Players[v].Name,getstring(2))
		end)
	end
end)

addcmd('fakechat',{'fchat'},
function(args, speaker)
	chatter(args[1],getstring(2))
end)

addcmd('smite',{},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		local pchar=Players[v].Character
		spawn(function()
			local char = pchar
			local zeus = Instance.new("Model",char)
			local cloud = Instance.new("Part",zeus)
			cloud.Anchored = true
			cloud.CanCollide = false
			cloud.CFrame = char.HumanoidRootPart.CFrame*CFrame.new(0,25,0)
			local sound = Instance.new("Sound",cloud)
			sound.SoundId = "rbxassetid://133426162"
			local mesh = Instance.new("SpecialMesh",cloud)
			mesh.MeshId = "http://www.roblox.com/asset/?id=1095708"
			mesh.TextureId = "http://www.roblox.com/asset/?id=1095709"
			mesh.Scale = Vector3.new(30,30,40)
			mesh.VertexColor = Vector3.new(0.3,0.3,0.3)
			local light = Instance.new("PointLight",cloud)
			light.Color = Color3.new(0,85/255,1)
			light.Brightness = 10
			light.Range = 30
			light.Enabled = false
			wait(0.2)
			sound.Volume = 0.5
			sound.Pitch = 0.8
			sound:Play()
			light.Enabled = true
			wait(1/100)
			light.Enabled = false
			wait(0.2)
			light.Enabled = true
			light.Brightness = 1
			wait(0.05)
			light.Brightness = 3
			wait(0.02)
			light.Brightness = 1
			wait(0.07)
			light.Brightness = 10
			wait(0.09)
			light.Brightness = 0
			wait(0.01)
			light.Brightness = 7
			light.Enabled = false
			wait(1.5)
			local part1 = Instance.new("Part",zeus)
			part1.Anchored = true
			part1.CanCollide = false
			part1.Size = Vector3.new(2, 9.2, 1)
			part1.BrickColor = BrickColor.new("New Yeller")
			part1.Transparency = 0.6
			part1.BottomSurface = "Smooth"
			part1.TopSurface = "Smooth"
			part1.CFrame = char.HumanoidRootPart.CFrame*CFrame.new(0,15,0)
			part1.Rotation = Vector3.new(0.359, 1.4, -14.361)
			wait()
			local part2 = part1:clone()
			part2.Parent = zeus
			part2.Size = Vector3.new(1, 7.48, 2)
			part2.CFrame = char.HumanoidRootPart.CFrame*CFrame.new(0,7.5,0)
			part2.Rotation = Vector3.new(77.514, -75.232, 78.051)
			wait()
			local part3 = part1:clone()
			part3.Parent = zeus
			part3.Size = Vector3.new(1.86, 7.56, 1)
			part3.CFrame = char.HumanoidRootPart.CFrame*CFrame.new(0,1,0)
			part3.Rotation = Vector3.new(0, 0, -11.128)
			sound.SoundId = "rbxassetid://130818250"
			sound.Volume = 1
			sound.Pitch = 1
			sound:Play()
			wait()
			part1.Transparency = 1
			part2.Transparency = 1
			part3.Transparency = 1
			Instance.new("Smoke",char.HumanoidRootPart).Color = Color3.new(0,0,0)
			char:BreakJoints()
		end)
	end
end)

addcmd('asteroid',{'meteor', 'meteorite'},
function(args, speaker)
    local players = getPlayer(args[1], speaker)
    for i,v in pairs(players)do
		spawn(function()
        	local pchar=Players[v].Character
			local Ast = Instance.new("Part", workspace) Ast.Name = "Asteroid" Ast.Position = pchar.HumanoidRootPart.Position + Vector3.new(0,500,0) Ast.Size = Vector3.new(12,12,12)
			local Mesh = Instance.new("SpecialMesh", Ast) Mesh.MeshId = "rbxassetid://1290033" Mesh.Scale = Vector3.new(6.2,6.2,6.2) Mesh.TextureId = "rbxassetid://1290030"
			local Fire = Instance.new("Fire", Ast) Fire.Heat = 25 Fire.Size = 30
			local Smoke = Instance.new("Smoke", Ast) Smoke.RiseVelocity = 10 Smoke.Size = 10
			local f = Instance.new("Sound")
			f.Name = "fly"
			f.SoundId = "rbxassetid://179438534"
			f.Volume = 3
			f.Pitch = 1
			f.Looped = true
			f.archivable = true
			f.Parent = Ast
			f:play()
			local Touched = false
			coroutine.wrap(function()
				repeat wait(0.1)
					Ast.Position = Vector3.new(pchar.HumanoidRootPart.Position.X, Ast.Position.Y, pchar.HumanoidRootPart.Position.Z)
				until not Ast or Ast.Parent == nil or Touched == true
			end)()
			Ast.Touched:connect(function(Part)
				if Touched == false then
					Touched = true
					Part:BreakJoints()
					local Boom = Instance.new("Explosion", workspace)
					Boom.Position = Ast.Position
					Boom.BlastPressure = 1000000
					Boom.BlastRadius = 30
					Fire.Heat = 0
					Smoke.RiseVelocity = 0
					f:Destroy()
					local s = Instance.new("Sound")
					s.Name = "boom"
					s.SoundId = "rbxassetid://188590169"
					s.Volume = 3
					s.Pitch = 1
					s.Looped = true
					s.archivable = true
					s.Parent = Ast
					s:play()
					coroutine.wrap(function()
						wait(10)
						s:Destroy()
						if Ast and Ast.Parent ~= nil then
							Ast:Destroy()
						end
					end)()
				end
			end)
		end)
	end
end)

RestorePoint()
end

return nyaah