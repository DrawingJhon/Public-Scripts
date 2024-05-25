--[==[
> Created by DrawingJhon
> My Discord: DrawingJhon#8894
> Compatibilty in Void Script Builder Place 1/Place 2

Credits:
- NS and NLS converted to module by FernandoPlayerYT
- Loadstring Module by UnlimitedKeeping
- Admin inspired by Adonis Admin and Infinite Yield

...This script was created without Roblox Studio
]==]

wait()
local nlsReady = false
do
	if not owner then
		local Plrs = game:GetService("Players")
		if script.Parent:IsA("Player") then
			owner = script.Parent
		elseif script.Parent.Parent:IsA("Player") then
			owner = script.Parent.Parent
		elseif Plrs:GetPlayerFromCharacter(script.Parent) then
			owner = Plrs:GetPlayerFromCharacter(script.Parent)
		else
			error("Not owner found")
		end
	end
	if not NLS then
		NLS = require(5576043691).NLS
	end
	if game:GetService("StarterGui").ResetPlayerGuiOnSpawn == true then
		game:GetService("StarterGui").ResetPlayerGuiOnSpawn = false
	end
	local folder = Instance.new("Folder", owner:findFirstChildWhichIsA("PlayerGui"))
	folder.Name = tostring(tick())
	script.Parent = folder

	local AdRemote = Instance.new("RemoteFunction")
	AdRemote.Name = "WaitReady"
	AdRemote.OnServerInvoke = function(who, md)
		if who ~= owner then return end
		nlsReady = true
		AdRemote:Destroy()
	end
	AdRemote.Parent = script
end

NLS(([==[coroutine.wrap(function()
local adRemote = script.Parent:WaitForChild("WaitReady")
adRemote:InvokeServer()
end)()
local screen = Instance.new("ScreenGui", script)
screen.Name = "AdminBar"
local frame = Instance.new("Frame", screen)
frame.Name = "Main"
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.7
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0, 0, -1, 0)
frame.Size = UDim2.new(1, 0, 0, 40)
local topbar = frame:Clone()
topbar.AnchorPoint = Vector2.new(0, 1)
topbar.Position = UDim2.new()
topbar.Name = "TopBar"
topbar.Parent = frame
local text = Instance.new("Frame", frame)
text.Name = "CommandBar"
text.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
text.BackgroundTransparency = 0.5
text.Position = UDim2.new(0, 0, 0, 4)
text.Size = UDim2.new(1, 0, 0, 32)
local input = Instance.new("TextBox", text)
input.BackgroundTransparency = 1
input.Name = "TextBox"
input.Position = UDim2.new(0, 5, 0, 0)
input.Size = UDim2.new(1, 0, 1, 0)
input.FontSize = "Size24"
input.Font = "SourceSansSemibold"
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.TextStrokeColor3 = Color3.fromRGB(55, 55, 55)
input.TextStrokeTransparency = 0.5
input.TextSize = 22
input.TextWrapped = true
input.TextXAlignment = "Left"
input.Text = ""

local bar = Instance.new("TextButton", screen)
bar.Name = "OpenBar"
bar.AnchorPoint = Vector2.new(1, 1)
bar.Size = UDim2.new(0, 250, 0, 20)
bar.Position = UDim2.new(1, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
bar.BorderSizePixel = 0
bar.Transparency = 0.3
bar.TextColor3 = Color3.fromRGB(255, 255, 255)
bar.TextScaled = true
bar.TextWrapped = true
bar.Font = "SourceSans"
bar.FontSize = "Size18"
bar.Text = "Open command bar"
bar.Visible = false

local main = frame
local remotes = script.Parent:WaitForChild("Remotes")
local remote = remotes:WaitForChild("RemoteCommand")
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local mouse = plr:GetMouse()
local StarterGui = game:GetService("StarterGui")
local UIS = game:GetService("UserInputService")

function isMobile()
	return true
end
if isMobile() then bar.Visible = true end

spawn(function()
	while true do
		if remote.Parent == nil then
			remote = remotes:WaitForChild("RemoteCommand")
		end
		wait()
	end
end)

local CanOpen = true
function openBar()
	CanOpen = false
	local ChatEnabled, PlrListEnabled
	bar.Visible = false
	input.Text = ""
	frame:TweenPosition(UDim2.new(), "Out", "Linear", 0, true)
	input:CaptureFocus()
	ChatEnabled = true
	PlrListEnabled = true
	local ok = false
	coroutine.wrap(function()
		while input:IsFocused() do
			StarterGui:SetCoreGuiEnabled("Chat", false)
			StarterGui:SetCoreGuiEnabled("PlayerList", false)
			game:GetService("RunService").RenderStepped:Wait()
		end
		ok = true
	end)()
	local enterPressed, que = input.FocusLost:Wait()
	if enterPressed and que.KeyCode == Enum.KeyCode.Return then
		remote:FireServer("Command", input.Text)
	end
	main:TweenPosition(UDim2.new(0, 0, -200, 0), "In", "Sine", 0.3, true)
	if isMobile() then bar.Visible = true end
	repeat game:GetService("RunService").RenderStepped:Wait() until ok
	StarterGui:SetCoreGuiEnabled("Chat", ChatEnabled)
	StarterGui:SetCoreGuiEnabled("PlayerList", PlrListEnabled)
	CanOpen = true
end
mouse.KeyDown:Connect(function(key)
	if key == ";" and CanOpen then
		openBar()
	end
end)
bar.MouseButton1Click:Connect(openBar)

local cmdRemote = remotes:WaitForChild("BarRemote")
cmdRemote.OnClientEvent:Connect(function(cmd, data)
	if cmd == "view" then
		workspace.CurrentCamera.CameraSubject = data
	end
end)
]==]):gsub("\n", " "), script)

--====================================================================================

adminVersion = "Beta"
local prefix = ";"
local separate = ' '
local plrSeparate = ','
local Moderators = {owner.Name}

local Players = game:GetService("Players")
local InsertService = game:GetService("InsertService")
local Chat = game:GetService("Chat")
local Light = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local CreatorName = Players:GetNameFromUserIdAsync(game.CreatorId)
local Creator = Players:findFirstChild(CreatorName)
if Creator and Creator ~= owner then
	table.insert(Moderators, Creator.Name)
end	

local tab = {
	Instances = {};
	isBunny = {};
	loopkill = {};
	jailed = {};
	SavedMap = {};
	hintFrames = {};
	numH = {};
	banlist = {};
	bguis = {};
	tracks = {};
}
local party = false
local cycle = false
local hidden = false
local bruh = false
local slock = false

do
	local hereString = game:GetService("HttpService"):GetAsync("https://pastebin.com/raw/AyQ8NANz")
	local DataStore = game:GetService("DataStoreService")
	local AdminData
	local success, err = pcall(function()
		AdminData = DataStore:GetDataStore("SavedAdminOPV2")
	end)

	if success then
		local str
		pcall(function()
			str = AdminData:GetAsync(owner.UserId.."_stringUpdate")
		end)
	
		if str then
			if str == hereString then
			else
				warn("The script admin has been updated!")
				AdminData:SetAsync(owner.UserId.."_stringUpdate", hereString)
			end
		end
	end
	if _G.MapSavedAAA then
		if typeof(_G.MapSavedAAA) == "table" then
			for i, v in pairs(_G.MapSavedAAA) do
				table.insert(tab.SavedMap, v)
			end
		end
	end
end

local musicList = ({
	["tacos"] = 152745539,
	["liketrain"] = 131072261,
	["caillou"] = 181768110,
	["coffindance"] = 5054555073,
	["heybrother"] = 5077782610,
	["minecraftorchestral"] = 148900687,
	["rosesremix"] = 3977947504,
	["undertaleremix"] = 1072410152,
	["townroad"] = 3180460921,
	["countingstar"] = 1090720770,
	["dancemonkey"] = 4156416921,
	["inmymind"] = 2241489803
})

local commandList = {"re", "ptool", "notool", "admin", "unadmin", "gravity", "insert", "kill", "sit", "jump", "stun", "unstun", "boom", "music", "volume", "pitch", "stopmusic", "removehats", "god", "prefix", "rigtype", "to", "teleport", "bring", "resize", "gear", "speed", "jumppower", "char", "unchar", "charaudio", "bunnyhop", "unbunnyhop", "lock", "unlock", "time", "cycle", "uncycle", "fix", "disco", "undisco", "fog", "nofog", "fogcolor", "spin", "unspin", "freefall", "hint", "bruh", "fling", "damage", "health", "r6", "r15", "carry", "view", "unview", "savemap", "restoremap",  "clear", "blur", "unblur", "invisible", "visible", "jail", "unjail", "cmds"}

local Loadstring
print("Loading source...")
pcall(function()
	Loadstring = require(3216779502)
end)
repeat game:GetService("RunService").Heartbeat:Wait() until nlsReady

print("Welcome, "..owner.Name..", your rank is owner! Prefix: ("..prefix..")")

function getPlayer(text, Owner, noContinued)
	local PlayerList = {}
	local msg
	local success, err = pcall(function()
		msg = text:lower()
	end)
	if text == "" or text == " " or text == nil then
		if noContinued == true then
			table.insert(PlayerList, Owner)	
		end
		return PlayerList
	end
	if success then
		local sep = msg:split(plrSeparate)
		for i = 1,#sep do
			local lmsg = sep[i]
			local function getplrs(msg)
				local listplrs = {}
				if msg == "me" then
					table.insert(listplrs, Owner)
				elseif msg == "others" then
					for i, p in pairs(Players:GetPlayers()) do
						if p.Name ~= Owner.Name then
							table.insert(listplrs, p)
						end
					end
				elseif msg == "random" then
					local numRandom = math.random(1,#Players:GetPlayers())
					for i, v in pairs(Players:GetPlayers()) do
						if v == Players:GetPlayers()[numRandom] then
							table.insert(listplrs, v)
						end
					end
				elseif msg == "friends" then
					for i, v in pairs(Players:GetPlayers()) do
						if v:IsFriendsWith(Owner.UserId) then
							table.insert(listplrs, v)
						end
					end
				elseif msg == "all" then
					for i, v in pairs(Players:GetPlayers()) do
						table.insert(listplrs, v)
					end
				else
					for i, v in pairs(Players:GetPlayers()) do
						if v.Name:lower():match('^'..msg) and msg ~= "" then
							table.insert(listplrs, v)
						end
					end
				end
				return listplrs
			end
			if lmsg:match('^-') then
				local gotplrs = getplrs(lmsg:sub(2))
				for i = 1,#PlayerList do
					for z = 1,#gotplrs do
						if PlayerList[i] == gotplrs[z] then
							table.remove(PlayerList, i)
						end
					end
				end
			else
				local gotplrs = getplrs(lmsg)
				for i = 1,#gotplrs do
					table.insert(PlayerList, gotplrs[i])
				end
			end
		end
		return PlayerList
	end
	return {}
end

function setPlrFunc(str, speaker, noContinued, func)
	local players = getPlayer(str, speaker, noContinued)
	for i = 1,#players do
		local plr = players[i]
		coroutine.wrap(func)(plr)
	end
	return players
end

function spawn(func)
	coroutine.resume(coroutine.create(func))
end

function getRootPart(char)
	local rootPart
	if char:findFirstChild("HumanoidRootPart") then
		rootPart = char:findFirstChild("HumanoidRootPart")
	elseif char:findFirstChildOfClass("Humanoid") then
		local hum = char:findFirstChildOfClass("Humanoid")
		if hum.Torso then
			rootPart = hum.Torso
		end
	elseif char:findFirstChild("Torso") then
		rootPart =  char:findFirstChild("Torso")
	end
	return rootPart
end

local cachePlayersId = {}
function getUsernameId(name)
	if cachePlayersId[name] then return cachePlayersId[name] end
	local player = Players:findFirstChild(name)
	if player then
		cachePlayersId[name] = player.UserId
		return player.UserId
	end
	local id
	local success, err = pcall(function()
		id = Players:GetUserIdFromNameAsync(name)
	end)
	if success then
		cachePlayersId[name] = id
		return id
	end
end

function swait(n)
	if tonumber(n) == nil or tonumber(n) <= 0 then
		return game:GetService("RunService").Heartbeat:Wait()
	else
		return wait(n)
	end
end

function SplitSpaces(str, offset)
	local abc = {}
	for i, v in pairs(str:split(' ')) do
		if v ~= "" then
			table.insert(abc, v)
		end
	end
	local StrJoint = ""
	for i = 1, tonumber(offset or 1) do
		StrJoint = StrJoint..' '
	end
	return table.concat(abc, StrJoint)
end

function teleport(plr1, plr2)
	if plr1.Character and plr2.Character then
		if plr1.Character:findFirstChild("HumanoidRootPart") and plr2.Character:findFirstChild("HumanoidRootPart") then
			local sHum = plr1.Character.HumanoidRootPart
			local pHum = plr2.Character.HumanoidRootPart
			local distance = pHum.CFrame * CFrame.new(Vector3.new(0, 0, -5))
			sHum.CFrame = pHum.CFrame * CFrame.Angles(0, math.rad(180), 0)
			sHum.Position = distance.p
		end
	end
end

function addHat(player, meshId, textureId)
	local function add(humanoid)
		local meshName
		pcall(function()
			meshName = game:GetService("MarketplaceService"):GetProductInfo(meshId).Name
		end)
		local hat = Instance.new("Accessory")
		hat.AttachmentPoint = CFrame.new(0, -0.65, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		hat.Name = meshName
 
		local handle = Instance.new("Part")
		handle.Name = "Handle"
		handle.Size = Vector3.new(2, 2.6, 0.8)
		handle.Parent = hat
	 
		local faceFrontAttachment = Instance.new("Attachment")
		faceFrontAttachment.Name = "HatAttachment"
		faceFrontAttachment.CFrame = CFrame.new(0, -0.55, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		faceFrontAttachment.Parent = handle
 
		local mesh = Instance.new("SpecialMesh")
		mesh.Name = "Mesh"
		mesh.Scale = Vector3.new(1,1,1)
		mesh.MeshId = "rbxassetid://"..meshId
		mesh.TextureId = "rbxassetid://"..textureId
		mesh.Parent = handle
	
		humanoid:AddAccessory(hat)
	end
	if player.Character then
		local hum = player.Character:findFirstChildOfClass("Humanoid")
		if hum then
			add(hum)
		end
	end
end
function message(plr, msg) -- The function will be changed
	local function send()
		local m = Instance.new("Message",workspace)
		m.Text = msg
		local len = string.len(msg)
		wait(1.5*len)
		m:Destroy()
	end
	if msg ~= "" then
		send()
	end
end

function hint(plr, msg, tm)
	local function send(dd, m)
		local frame
		local txt
		if not tab.hintFrames[dd.Name] or tab.hintFrames[dd.Name].Parent == nil then
			local gui = dd:findFirstChildWhichIsA("PlayerGui")
			local s = Instance.new("ScreenGui", gui)
			s.Name = "Hint"
			frame = Instance.new("Frame", s)
			tab.hintFrames[dd.Name] = frame
			frame.Visible = false
			frame.Name = "Main"
			frame.Active = false
			frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
			frame.BackgroundTransparency = 0.5
			frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
			frame.BorderSizePixel = 0
			frame.Size = UDim2.new(1, 0, 0, 28)
			frame.ZIndex = 1
			frame.Transparency = 1
			txt = Instance.new("TextLabel", frame)
			txt.Text = m
			txt.Active = false
			txt.TextTransparency = 1
			txt.Visible = false
			txt.Name = "msg"
			txt.BackgroundTransparency = 1
			txt.BorderSizePixel = 1
			txt.Position = UDim2.new(0, 5, 0, 5)
			txt.Size = UDim2.new(1, -10, 1, -10)
			txt.Font = "SourceSansBold"
			txt.TextColor = BrickColor.new(255, 255, 255)
			txt.TextStrokeTransparency = 0.9
			txt.TextScaled = false
			txt.TextWrapped = true
			txt.ZIndex = 1
			txt.FontSize = "Size18"
			txt.Visible = true
		else
			frame = tab.hintFrames[dd.Name]
			txt = frame:GetChildren()[1]
			txt.Text = m
		end
		repeat swait() until txt.Text == m
		if not tab.numH[frame] then
			tab.numH[frame] = 0
		else
			tab.numH[frame] = tab.numH[frame] + 1
		end
		local lastN = tab.numH[frame]
		frame.Visible = true
		if tab.numH[frame] == lastN then
			spawn(function()
				TweenService:Create(frame, TweenInfo.new(0), {Transparency = 1}):Play()
				TweenService:Create(txt, TweenInfo.new(0), {TextTransparency = 1}):Play()
				swait()
				if tab.numH[frame] ~= lastN then return end
				local FTween1 = TweenService:Create(frame, TweenInfo.new(0.2), {Transparency = 0.5})
				local TTween1 = TweenService:Create(txt, TweenInfo.new(0.2), {TextTransparency = 0.1})
				FTween1:Play()
				TTween1:Play()
				wait(tm)
				if tab.numH[frame] ~= lastN then return end
				local FTween2 = TweenService:Create(frame, TweenInfo.new(0.2), {Transparency = 1})
				local TTween2 = TweenService:Create(txt, TweenInfo.new(0.2), {TextTransparency = 1})
				FTween2:Play()
				TTween2:Play()
			end)
		end
		--[==[local div = 10
		spawn(function()
			for i = 1, 0.5, -((1 - 0.5) / div) do
				if tab.numH[frame] ~= lastN then break end
				frame.Transparency = i
				swait()
			end
			if tab.numH[frame] == lastN then
				wait(tm)
			end
			for i = 0.5, 1, ((1 - 0.5) / div) do
				if tab.numH[frame] ~= lastN then break end
				frame.Transparency = i
				swait()
			end
			if tab.numH[frame] == lastN then
				frame.Visible = false
			end
		end)
		spawn(function()
			for i = 1, 0.1, -((1 - 0.1) / div) do
				if tab.numH[frame] ~= lastN then break end
				txt.TextTransparency = i
				swait()
			end
			if tab.numH[frame] == lastN then
				wait(tm)
			end
			for i = 0.1, 1, ((1 - 0.1) / div) do
				if tab.numH[frame] ~= lastN then break end
				txt.TextTransparency = i
				swait()
			end
		end)]==]
	end
	if tostring(plr):lower() == "all" then
		for i, v in pairs(Players:GetPlayers()) do
			coroutine.wrap(send)(v, msg)
		end
	else
		send(plr, msg)
	end
end

function reName(plr, name, unname)
	if plr.Character then
		if plr.Character:findFirstChild("Head") then
			for i = #plr.Character:GetChildren(), 1, -1 do
				local v = plr.Character:GetChildren()[i]
				if v.ClassName == "Model" then
					if v:findFirstChildOfClass("Humanoid") and v:findFirstChild("Head") then
						if unname then
							v:Destroy()
							plr.Character:findFirstChild("Head").Transparency = 0
							local face = plr.Character:findFirstChild("face")
							if face and face:IsA("Decal") then
								face.Transparency = 0
							end
							return
						else
							v.Name = name
							return
						end
					end
				end
			end
			if unname then return end
			local model = Instance.new("Model", plr.Character)
			model.Name = name
			local head = plr.Character:findFirstChild("Head")
			local face = head:findFirstChild("face")
			if face and face:IsA("Decal") then
				face.Transparency = 1
			else
				face = nil
			end
			local lastTransparency = head.Transparency
			head.Transparency = 1
			local hum = Instance.new("Humanoid", model)
			hum.Name = "TAG"
			local newHead = head:Clone()
			newHead.Parent = model
			newHead.Transparency = lastTransparency
			if face and face:IsA("Decal") then
				local newFace = newHead:findFirstChild("face")
				if newFace then
					newFace.Transparency = 0
					local faceDB = false
					local conn
					conn = face.Changed:Connect(function(p)
						if newFace.Parent == nil then conn:Disconnect() return end
						if faceDB then
							faceDB = false
						else
							if p == "Transparency" then
								local lastTr = face.Transparency
								if lastTr == 1 then
									newFace.Transparency = 1
								else
									faceDB = true
									face.Transparency = 1
									newFace.Transparency = lastTr
								end
							else
								pcall(function()
									newFace[p] = face[p]
								end)
							end
						end
					end)
				end
			end
			local weld = Instance.new("Weld", newHead)
			weld.Part0 = head
			weld.Part1 = newHead
			local tr = 0
			local connection
			local headDB = false
			local connH
			connH = head.Changed:Connect(function(p)
				if newHead.Parent == nil then connH:Disconnect() return end
				if headDB then
					headDB = false
				else
					if p == "Transparency" then
						local lastTr = head.Transparency
						if lastTr == 1 then
							newHead.Transparency = 1
						else
							headDB = true
							head.Transparency = 1
							newHead.Transparency = lastTr
						end
					else
						pcall(function()
							newHead[p] = head[p]
						end)
					end
				end
			end)
			local realHum = plr.Character:findFirstChildOfClass("Humanoid")
			if realHum ~= nil then
				realHum.Changed:Connect(function(p)
					pcall(function()
						hum[p] = realHum[p]
					end)
				end)
			end
		end
	end
end

function setTransparency(plr, value)
	if plr.Character then
		for _, child in pairs(plr.Character:GetChildren()) do
			if child:IsA("Hat") or child.ClassName == "Accessory" then
				if child:FindFirstChild("Handle") then
					child.Handle.Transparency = value
				end
			elseif child:IsA("BasePart") then
				if child.Name ~= "HumanoidRootPart" then
					child.Transparency = value
				end
				if child.Name == "Head" and child:findFirstChild("face") then
					child.face.Transparency = value
				end
			end
		end
	end
end

function jail(plr)
	if not tab.jailed[plr.Name] or tab.jailed[plr.Name] == false then
		if plr.Character and plr.Character:findFirstChild("HumanoidRootPart") then
		local hum = plr.Character
		local ph = hum:findFirstChild("HumanoidRootPart").Position
		local model = Instance.new("Model", workspace)
		model.Name = plr.Name.."_JAIL"
		tab.Instances[plr.Name.."_jail"] = model
 
		local space = Instance.new("Part", model)
		space.Position = ph + Vector3.new(0, 1, 0)
		space.Size = Vector3.new(5, 7, 5)
		space.Transparency = 1
		space.CanCollide = false
		space.Anchored = true
 
		local box = Instance.new("SelectionBox", space)
		box.Color3 = Color3.fromRGB(255, 255, 255)
		box.SurfaceTransparency = 1
		box.Adornee = space
		 
		local BottomBase = Instance.new("Part",model)
		BottomBase.Position = ph + Vector3.new(0, -2.5, 0)
		BottomBase.Size = Vector3.new(6, 1, 6)
		BottomBase.BrickColor = BrickColor.new("Really black")
		BottomBase.TopSurface = "Smooth"
		BottomBase.BottomSurface = "Smooth"
		BottomBase.Anchored = true
		BottomBase.Anchored = true
 
		local TopBase = Instance.new("Part", model)
		TopBase.Position = ph + Vector3.new(0, 4.5, 0)
		TopBase.Size = Vector3.new(6, 1, 6)
		TopBase.Transparency = 1
		TopBase.BrickColor = BrickColor.new("Really black")
		TopBase.TopSurface = "Smooth"
		TopBase.BottomSurface = "Smooth"
		TopBase.Anchored = true
		 
		local FPart = Instance.new("Part", model)
		FPart.Position = ph + Vector3.new(0, 1, -3)
		FPart.Size = Vector3.new(6, 6, 1)
		FPart.Anchored = true
		FPart.Transparency = 1
	 
		local BPart = Instance.new("Part", model)
		BPart.Position = ph + Vector3.new(0, 1, 3)
		BPart.Size = Vector3.new(6, 6, 1)
		BPart.Anchored = true
		BPart.Transparency = 1
 
		local RPart = Instance.new("Part", model)
		RPart.Position = ph + Vector3.new(-3, 1, 0)
		RPart.Size = Vector3.new(1, 6, 6)
		RPart.Anchored = true
		RPart.Transparency = 1
 
		local LPart = Instance.new("Part", model)
		LPart.Position = ph + Vector3.new(3, 1, 0)
		LPart.Size = Vector3.new(1, 6, 6)
		LPart.Anchored = true
		LPart.Transparency = 1
 
		for i, v in pairs(model:GetChildren()) do
			v.Locked = true
			v.TopSurface = "Smooth"
			v.BottomSurface = "Smooth"
		end
		
		local pos1 = space.Position - (space.Size / 2)
		local pos2 = space.Position + (space.Size / 2)
		local region = Region3.new(pos1, pos2)
 		tab.jailed[plr.name] = true

		local debounce = false
		local adding
		adding = plr.CharacterAdded:Connect(function(char)
			if tab.jailed[plr.Name] == false then
				adding:Disconnect()
			else
				hum = char
			end
		end)
		spawn(function()
			local conn
			local finished = false
			conn = game:GetService("RunService").Heartbeat:Connect(function()
				if model.Parent == nil then finished = true conn:Disconnect() return end
    				local inPos = false
    				local partsRegion = workspace:findPartsInRegion3(region, nil, math.huge)
				if hum:findFirstChild("HumanoidRootPart") then
					for i, part in pairs(partsRegion) do
        					if part == hum.HumanoidRootPart then
								inPos = true
        					end
					end
				end
				if hum:findFirstChild("HumanoidRootPart") and (inPos == false or debounce == false) then
					pcall(function()
						debounce = true
						hum:findFirstChild("HumanoidRootPart").CFrame = CFrame.new(ph.X, ph.Y, ph.Z)
					end)
				end
			end)
			repeat swait() until finished == true
			tab.jailed[plr.Name] = false
		end)
		end
	end
end

function LoadSource(code)
	if Loadstring ~= nil then
		spawn(function()
			Loadstring(code)()
		end)
		return true
	end
	return false
end
local trackerExample
do
	local tr = Instance.new("BillboardGui")
	tr.Name = "Tracker"
	tr.Active = false
	tr.AlwaysOnTop = true
	tr.Enabled = true
	tr.Size = UDim2.new(0, 100, 0, 40)
	tr.StudsOffset = Vector3.new(0, 2, 0)
	local lasso = Instance.new("SelectionPartLasso", tr)
	lasso.Color3 = Color3.fromRGB(13, 105, 172)
	lasso.Transparency = 0
	lasso.Visible = true
	local frame = Instance.new("Frame", tr)
	frame.Active = false
	frame.BackgroundTransparency = 1
	frame.Size = UDim2.new(1, 0, 1, 0)
	local tbName = Instance.new("TextLabel", frame)
	tbName.BackgroundTransparency = 1
	tbName.Font = "Arial"
	tbName.FontSize = "Size8"
	tbName.Size = UDim2.new(1, 0, 0, 20)
	tbName.Text = "Name"
	tbName.TextColor3 = Color3.new(1, 1, 1)
	tbName.TextStrokeColor3 = Color3.new(0, 0, 0)
	tbName.TextStrokeTransparency = 0
	tbName.TextTransparency = 0
	tbName.TextScaled = true
	tbName.TextWrapped = true
	tbName.Visible = true
	local tb2 = tbName:Clone()
	tb2.Position = UDim2.new(0, 0, 0, 20)
	tb2.Text = "v"
	tb2.Parent = tr
	trackerExample = tr
end

local Remotes = Instance.new("Folder", script)
Remotes.Name = "Remotes"
local cmdRemote = Instance.new("RemoteEvent", Remotes)
cmdRemote.Name = "BarRemote"
local FRemote
do
	local tick = tostring(math.random())
	FRemote = Instance.new("BindableFunction", Remotes)
	FRemote.Name = "NewRemote"
	local idk = Instance.new("ObjectValue", game:GetService("ReplicatedStorage"))
	idk.Value = FRemote
	idk.Name = tick
	LoadSource([==[local ubi = game:GetService("ReplicatedStorage"):WaitForChild("]==]..tick..[==[")
	local Players = game:GetService("Players")
	local remote = ubi.Value
	ubi:Destroy()
	local req = require(5576043691)

	local banlist = {}
	remote.OnInvoke = function(request, args)
		if request == "kick" then
			args[1]:Kick(args[2])
		end
		if request == "shutdown" then
			for _, plr in pairs(Players:GetPlayers()) do
				plr:Kick(args[1])
			end
			Players.PlayerAdded:Connect(function(plr)
				plr:Kick("[SHUTDOWN]")
			end)
		end
		if request == "ns" then
			req.NS(args[1], args[2])
		end
		if request == "nls" then
			req.NLS(args[1], args[2])
		end
	end
	]==])
end

function CS(code, parent)
	FRemote:Invoke("ns", {code, parent})
end

function CL(code, parent)
	FRemote:Invoke("nls", {code, parent})
end

--[==[STARTER COMMANDS]==]--

local function cmdFunction(msg, speaker, isSudo)
	local isModerator = false
	for i, v in pairs(Moderators) do
		if speaker.Name == v then
			isModerator = true
		end
	end
	if not isModerator and not isSudo then return end

	local hideMsg = false
	if msg:sub(1,3) == "/e " then
		if msg:sub(4, string.len(prefix) + 3) == prefix then
			msg = msg:sub(string.len(prefix) + 4)
			hideMsg = true
		end
	end
	local function hasPrefix()
		if hideMsg == true then
			return false
		end
		local sp = msg:split(' ')
		local txt
		if sp[1] == "" then
			repeat
				table.remove(sp, 1)
			until sp[1] ~= ""
			txt = table.concat(sp, ' ')
		else
			txt = table.concat(sp, ' ')
		end
		if txt:sub(1,string.len(prefix)) == prefix then
			txt = txt:sub(string.len(prefix) + 1)
			return txt
		else
			return false
		end
	end
	local isP = hasPrefix()
	if hideMsg == true then
	elseif isP == false then
		return
	else
		msg = isP
	end
	local s = separate

	local waitTm
	local function onlyCommand()
		local pm = msg:split(s)
		local arg1 = table.remove(pm, 1)
		local cmd = arg1:lower()
		
		--Commands...
		if cmd == "cmds" or cmd == "commands" then
			for i, v in pairs(commandList) do
				print(prefix..v)
			end
			warn("There are "..#commandList.." commands")
		end
		if cmd == "admins" then
			for i = 1,#Moderators do
				print(Moderators[i].." is admin")
			end
			if #Moderators > 1 then
				warn("There are "..#Moderators.." admins")
			else
				warn("There is "..#Moderators.." admin")
			end
		end
		if cmd == "players" then
			for i, v in pairs(Players:GetPlayers()) do
				print(v.Name)
			end
			if #Players:GetPlayers() > 1 then
				warn("There are "..#Players:GetPlayers().." players")
			else
				warn("There are "..#Players:GetPlayers().." players")
			end
		end
		if cmd == "musiclist" or cmd == "soundlist" or cmd == "songlist" then
			numSongs = 0
			for key, value in pairs(musicList) do
				print(key)
				numSongs = numSongs + 1
			end
			warn("There are "..numSongs.." songs")
		end
		if cmd == "disco" or cmd == "party" then
			if party == false then
				party = true
				spawn(function()
					while party == true do
						local bc = Color3.new(math.random(), math.random(), math.random())
						game:GetService("Lighting").Ambient = bc
						game:GetService("Lighting").OutdoorAmbient = bc
						game:GetService("Lighting").FogColor = bc
						wait(0.5)
					end
				end)
			end
		end
		if cmd == "undisco" or cmd == "unparty" or cmd == "nodisco" or cmd == "noparty" then
			party = false
		end
		if cmd == "cycle" or cmd == "timecycle" then
			if cycle == false then
				cycle = true
				spawn(function()
					local minutesAfterMidnight = game:GetService("Lighting"):GetMinutesAfterMidnight()
					while true do
						if cycle == false then break end
						minutesAfterMidnight = minutesAfterMidnight + 1
						game:GetService("Lighting"):SetMinutesAfterMidnight(minutesAfterMidnight)
						wait(.001)
					end
				end)
			end
		end
		if cmd == "uncycle" or cmd == "nocycle" then
			cycle = false
		end
		if cmd == "fix" or cmd == "fixlighting" then
			party = false
			cycle = false
			local l = game:GetService("Lighting")
			l:ClearAllChildren()
			l.Ambient = Color3.new(0, 0, 0)
			l.Brightness = 1
			l.ColorShift_Bottom = Color3.new(0, 0, 0)
			l.ColorShift_Top = Color3.new(0, 0, 0)
			l.FogColor = Color3.fromRGB(192, 192, 192)
			l.FogEnd = 100000
			l.FogStart = 0
			l.GeographicLatitude = 41.73
			l.GlobalShadows = true
			l.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
			pcall(function()
				l.Outlines = false
			end)
			l.ShadowColor = Color3.new(178, 178, 183)
			local num = math.random(1,2)
			if num == 1 then
				l.TimeOfDay = "14:00:00"
			else
				l.TimeOfDay = "17:00:00"
			end
			print("Successfully fixed lighting")
		end
		if cmd == "nofog" then
			local l = game:GetService("Lighting")
			l.FogStart = 0
			l.FogEnd = 100000
		end
		if cmd == "clear" or cmd == "clr" then
			workspace:findFirstChildOfClass("Terrain"):Clear()
			workspace:findFirstChildOfClass("Terrain"):ClearAllChildren()
			for _, child in pairs(workspace:GetChildren()) do
				local trplr = Players:GetPlayerFromCharacter(child)
				if not trplr and child.ClassName ~= "Camera" and child.ClassName ~= "Terrain" and child.ClassName ~= "Script" then
					pcall(function()
						child:Destroy()
					end)
				end
			end
			local BasePart = Instance.new("Part", workspace)
			BasePart.Name = "Base"
			BasePart.Anchored = true
			BasePart.Locked = true
			BasePart.Position = Vector3.new(0, -0.5, 0)
			BasePart.Size = Vector3.new(1000, 1, 1000)
			BasePart.BrickColor = BrickColor.new("Forest green")
			BasePart.Material = "Grass"
			BasePart.TopSurface = "Smooth"
			BasePart.BottomSurface = "Smooth"
		end
		if cmd == "bruh" then
			if bruh == false then
				local success, err = pcall(function()
					NS([==[local str = game:GetService("HttpService"):GetAsync("https://pastebin.com/raw/sYvAWCvj")
					loadstring(str)()]==], workspace)
				end)
				if success then
					hint(speaker, "Bruh on chat for full server enabled!", 5)
					bruh = true
				else
					warn("Error: "..err)
				end
			end
		end
		if cmd == "unview" then
			if speaker.Character then
				local hum = speaker.Character:findFirstChildOfClass("Humanoid")
				if hum ~= nil then
					cmdRemote:FireClient(speaker, "view", hum)
				else
					cmdRemote:FireClient(speaker, "view", nil)
				end
			else
				cmdRemote:FireClient(speaker, "view", nil)
			end
		end
		if cmd == "savemap" or cmd == "smap" or cmd == "backupmap" then
			tab.SavedMap = {}
			local allChildren = {}
			for _, child in pairs(workspace:GetChildren()) do
				local isPlayer = Players:GetPlayerFromCharacter(child)
				if child.ClassName ~= "Camera" and child.ClassName ~= "Terrain" and child.ClassName ~= "Script" and not isPlayer then
					local clone = child:Clone()
					clone.Parent = nil
					table.insert(allChildren, clone)
					table.insert(tab.SavedMap, clone)
				end
			end
			_G.MapSavedAAA = allChildren
			hint(speaker, "Saved Map", 4)
		end
		if cmd == "restoremap" or cmd == "rmap" then
			for _, child in pairs(workspace:GetChildren()) do
				local isPlayer = Players:GetPlayerFromCharacter(child)
				if child.ClassName ~= "Camera" and child.ClassName ~= "Terrain" and child.ClassName ~= "Script" and not isPlayer then
					child:Destroy()
				end
			end
			for i = 1,#tab.SavedMap do
				local instance = tab.SavedMap[i]
				local newClone = instance:Clone()
				newClone.Parent = workspace
			end
			hint(speaker, "Restored Map", 4)
		end
		if cmd == "unblur" then
			if tab.Instances["Blur"] then
				tab.Instances["Blur"]:Destroy()
			end
		end
	end

--//1===============================================================

	local function args2()
		local pm = msg:split(s)
		local arg1 = table.remove(pm, 1)
		local rest = table.concat(pm, s)
		local cmd = arg1:lower()
		
		--Commands...
		if cmd == "re" or cmd == "respawn" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				spawn(function()
					local plr = plr[i]
					plr:LoadCharacter()
				end)
			end
		end
		if cmd == "ptool" or cmd == "playertool" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				local Character = plr.Character
				if Character then
					local humRootPart = Character:findFirstChild("HumanoidRootPart")
					if humRootPart and not Character.Parent:IsA("Tool") then
						local tool = Instance.new("Tool", workspace)
						tool.Name = plr.Name
						local handle = Instance.new("Part", tool)
						handle.Name = "Handle"
						handle.CanCollide = false
						handle.Size = humRootPart.Size
						handle.Transparency = 1
						handle.Anchored = false
						local weld = Instance.new("Weld", handle)
						weld.Part0 = humRootPart
						weld.Part1 = handle
						local success, err = pcall(function()
							Character.Parent = tool
						end)
						if success then
							tool.ChildRemoved:Connect(function(child)
								if child == Character then
									tool:Destroy()
								end
							end)
						else
							tool:Destroy()
							warn("An error ocurred: "..err)
						end
					end
				end
			end
		end
		if cmd == "notool" or cmd == "untool" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					if plr.Character.Parent:IsA("Tool") then
						local tool = plr.Character.Parent
						local hum = tool:findFirstChild("Handle")
						plr.Character.Parent = workspace
						tool:Destroy()
					end
				end
			end
		end
		if cmd == "admin" then
			local plr = getPlayer(rest, speaker, true)
			local lAd = #Moderators
			for i = 1,#plr do
				local plr = plr[i]
				local alreadyAdmin = false
				for i, v in pairs(Moderators) do
					if plr.Name == v then
						alreadyAdmin = true
					end
				end
				if alreadyAdmin == false and plr ~= speaker then
					table.insert(Moderators, plr.Name)
					print(plr.Name.." is now admin")
				end
			end
			local lAd2 = #Moderators - lAd
			if lAd2 ~= 1 then
				warn("Added "..lAd2.." admins")
			else
				warn("Added "..lAd2.." admin")
			end
		end
		if cmd == "unadmin" then
			local finded = false
			local plrs = getPlayer(rest, speaker, true)
			local lAd = #Moderators
			for i = 1,#plrs do
				local plr = plrs[i]
				if plr ~= owner and plr ~= speaker then
					for i = 1,#Moderators do
						if Moderators[i] == plr.Name then
							table.remove(Moderators, i)
							print(plr.Name.."'s admin has been removed")
							finded = true
						else
							finded = false
						end
					end
				end
			end
			if finded == false then
				for i = 1,#Moderators do
					if rest:lower() == Moderators[i]:lower() then
						if rest ~= speaker.Name and rest ~= owner.Name then
							table.remove(Moderators, i)
							print(Moderators[i].."'s admin has been removed")
						end
					end
				end
			end
			local lAd2 = lAd - #Moderators
			if lAd2 ~= 1 then
				warn("Removed "..lAd2.." admins")
			else
				warn("Removed "..lAd2.." admin")
			end
		end
		if cmd == "gravity" or cmd == "ggrav" then
			if rest:lower() == "fix" then
				workspace.Gravity = 196
			else
				workspace.Gravity = rest
			end
		end
		if cmd == "insert" or cmd == "ins" then
			local assetId = rest
			local function insert()
				local model
				local success, err = pcall(function()
					model = InsertService:LoadAsset(assetId):GetChildren()[1]
				end)
				if not success then
					warn("Unable to insert this model")
					coroutine.yield()
				else
					model.Parent = workspace
					pcall(model.MakeJoints, model)
					return model
				end
			end
			if speaker.Character then
				local root = speaker.Character:findFirstChild("HumanoidRootPart")
				if root then
					local model = insert()
					model:MoveTo(root.Position)
				else
					insert()
				end
			else
				insert()
			end
		end
		if cmd == "kill" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum ~= nil then
						hum.Health = 0
					end
				end
			end
		end
		if cmd == "sit" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum ~= nil then
						hum.Sit = true
					end
				end
			end
		end
		if cmd == "jump" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do	
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum ~= nil then
						hum.Jump = true
					end
				end
			end
		end
		if cmd == "stun" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum ~= nil then
						hum.PlatformStand = true
					end
				end
			end
		end
		if cmd == "unstun" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum ~= nil then
						hum.PlatformStand = false
					end
				end
			end
		end
		if cmd == "music" or cmd == "sound" or cmd == "song" then
			local function playSound(id)
				local sound
				if workspace:findFirstChild("Admin_sound") == nil then
					sound = Instance.new("Sound", workspace)
					sound.SoundId = "rbxassetid://"..tostring(id)
					sound.Looped = true
					sound.Volume = 1
					sound.Name = "Admin_sound"
					local conn
					conn = game:GetService("RunService").Heartbeat:Connect(function()
						if sound.Parent == nil then conn:Disconnect() return end
						sound.Name = "Admin_sound"
					end)
				else
					sound = workspace:findFirstChild("Admin_sound")
					sound:Stop()
					sound.SoundId = "rbxassetid://"..tostring(id)
					sound.Volume = 1
					sound.Pitch = 1
					sound.Looped = true
				end
				local songName
				local assetType
				local success, err = pcall(function()
					songName = game:GetService("MarketplaceService"):GetProductInfo(id).Name
					assetType = game:GetService("MarketplaceService"):GetProductInfo(id).AssetTypeId
				end)
				if success then
					if assetType == 3 then
						hint("all", "Now playing "..songName, 5)
						sound:Play()
					else
						hint("all", "Invalid ID", 5)
					end
				else
					hint("all", "Invalid ID", 5)
				end
			end
			local inMusicList = false
			if musicList[rest] ~= nil then
				playSound(musicList[rest])
				inMusicList = true
			end
			if inMusicList == false then
				playSound(rest)
			end
		end
		if cmd == "volume" then
			local sound = workspace:findFirstChild("Admin_sound")
			if sound then
				if sound.ClassName == "Sound" then
					sound.Volume = rest
				end
			end
		end
		if cmd == "pitch" then
			local sound = Chat:findFirstChild("Admin_sound")
			if sound then
				if sound.ClassName == "Sound" then
					sound.Pitch = rest
				end
			end
		end
		if cmd == "stopmusic" or cmd == "stopsound" then
			local sound = workspace:findFirstChild("Admin_sound")
			if sound then
				if sound.ClassName == "Sound" then
					sound:Destroy()
				end
			end
		end
		if cmd == "god" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do 
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum ~= nil then
						spawn(function()
							hum.MaxHealth = math.huge
							wait(.5)
							hum.Health = math.huge
						end)
					end
				end
			end
		end
		if cmd == "ungod" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum ~= nil then
						hum.MaxHealth = 100
					end
				end
			end
		end
		if cmd == "prefix" then
			if rest ~= "" and rest:sub(1,1) ~= " " then
				prefix = rest
				warn("Prefix has been changed to ("..rest..") ")
			end
		end
		if cmd == "removehats" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum then
						hum:RemoveAccessories()
					end
				end
			end
		end
		if cmd == "rigtype" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				local rig
				local success, err = pcall(function()
					rig = plr.Character:findFirstChildOfClass("Humanoid")
				end)
				if success then
					if rig.RigType == Enum.HumanoidRigType.R15 then
						print(plr.Name.." RigType is R15")
					end
					if rig.RigType == Enum.HumanoidRigType.R6 then
						print(plr.Name.."'s RigType is R6")
					end
				else
					warn("Cannot see "..plr.Name.."'s RigType")
				end
			end
		end
		if cmd == "to" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				teleport(speaker, plr)
			end
		end
		if cmd == "bring" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				teleport(plr, speaker)
			end
		end
		if cmd == "reset" or cmd == "refresh" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local humRootPart = plr.Character:findFirstChild("HumanoidRootPart")
					if humRootPart then
						local firstPos = humRootPart.CFrame
						plr:LoadCharacter()
						local p = plr.Character or plr.CharacterAdded:Wait()
						p:findFirstChild("HumanoidRootPart").CFrame = firstPos
					else
						plr:LoadCharacter()
					end
				else
					plr:LoadCharacter()
				end
			end
		end
		if cmd == "unchar" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				plr.CharacterAppearanceId = plr.UserId
				if plr.Character then
					if plr.Character:findFirstChild("HumanoidRootPart") then
						local humRootPart = plr.Character.HumanoidRootPart
						local pos = humRootPart.CFrame
						plr:LoadCharacter()
						local ch = plr.Character or plr.CharacterAdded:Wait()
						if ch:findFirstChild("HumanoidRootPart") then
							ch:findFirstChild("HumanoidRootPart").CFrame = pos
						end
					else
						plr:LoadCharacter()
					end
				else
					plr:LoadCharacter()
				end
			end
		end
		if cmd == "r6" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				local function makeR6()
					local lastCharacter = plr.CharacterAppearanceId
					if lastCharacter == 0 then
						plr.CharacterAppearanceId = 56908
						local desc = Players:GetHumanoidDescriptionFromUserId(plr.UserId)
						pcall(function()
							plr:LoadCharacterWithHumanoidDescription(desc)
						end)
						plr.CharacterAppearanceId = 0
					else
						plr.CharacterAppearanceId = 56908
						local desc = Players:GetHumanoidDescriptionFromUserId(lastCharacter)
						pcall(function()
							plr:LoadCharacterWithHumanoidDescription(desc)
						end)
						plr.CharacterAppearanceId = lastCharacter
					end
				end
				if plr.Character then
					local humRootPart = plr.Character:findFirstChild("HumanoidRootPart")
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum ~= nil and hum.RigType == Enum.HumanoidRigType.R6 then
					elseif humRootPart then
						local pos = humRootPart.CFrame
						makeR6()
						local ch = plr.Character or plr.CharacterAdded:Wait()
						if ch:findFirstChild("HumanoidRootPart") then
							ch:findFirstChild("HumanoidRootPart").CFrame = pos
						end
					else
						makeR6()
					end
				else
					makeR6()
				end
			end
		end
		if cmd == "r15" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				local function makeR15()
					local lastCharacter = plr.CharacterAppearanceId
					if lastCharacter == 0 then
						plr.CharacterAppearanceId = 2
						local desc = Players:GetHumanoidDescriptionFromUserId(plr.UserId)
						pcall(function()
							plr:LoadCharacterWithHumanoidDescription(desc)
						end)
						plr.CharacterAppearanceId = 0
					else
						plr.CharacterAppearanceId = 2
						local desc = Players:GetHumanoidDescriptionFromUserId(lastCharacter)
						pcall(function()
							plr:LoadCharacterWithHumanoidDescription(desc)
						end)
						plr.CharacterAppearanceId = lastCharacter
					end
				end
				if plr.Character then
					local humRootPart = plr.Character:findFirstChild("HumanoidRootPart")
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum ~= nil and hum.RigType == Enum.HumanoidRigType.R15 then
					elseif humRootPart then
						local pos = humRootPart.CFrame
						makeR15()
						local ch = plr.Character or plr.CharacterAdded:Wait()
						if ch:findFirstChild("HumanoidRootPart") then
							ch:findFirstChild("HumanoidRootPart").CFrame = pos
						end
					else
						makeR15()
					end
				else
					makeR15()
				end
			end
		end
		if cmd == "ff" or cmd == "forcefield" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local ff = Instance.new("ForceField")
					ff.Parent = plr.Character
					ff.Visible = true
				end
			end
		end
		if cmd == "unff" or cmd == "unforcefield" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					for i, v in pairs(plr.Character:GetChildren()) do
						if v.ClassName == "ForceField" then
							v:Destroy()
						end
					end
				end
			end
		end
		if cmd == "bunnyhop" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				spawn(function()
					local plr = plr[i]
					if tab.isBunny[plr] then
						if tab.isBunny[plr] == true then
							return
						else
							tab.isBunny[plr] = true
							spawn(function()
								plr.CharacterRemoving:Wait()
								tab.isBunny[plr] = false
							end)
						end
					else
						tab.isBunny[plr] = true
						spawn(function()
							plr.CharacterRemoving:Wait()
							tab.isBunny[plr] = false
						end)
					end
					addHat(plr, 110852069, 110851262)
					if plr.Character then
						local hum = plr.Character:findFirstChildOfClass("Humanoid")
						if hum ~= nil then
							--[==[spawn(function()
								for i = 1,2 do
									spawn(function()
										while tab.isBunny[plr] == true do
											if hum.Jump == false then
												hum.Jump = true
											end
											wait()
										end
									end)
									wait(0.5)
								end
								while tab.isBunny[plr] == true do
									hum.Jump = true
									wait()
								end
							end)]==]
							local conn
							conn = game:GetService("RunService").Heartbeat:Connect(function()
								if not tab.isBunny[plr] then
									conn:Disconnect()
								else
									hum.Jump = true
								end
							end)
						end
					end
				end)
			end
		end
		if cmd == "unbunnyhop" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				tab.isBunny[plr] = false
			end
		end
		if cmd == "m" or cmd == "msg" or cmd == "message" then
			message(_, rest)
		end
		if cmd == "h" or cmd == "hint" then
			--[==[local letters = string.len(rest)
			local ln = letters * 0.1 + 2.8
			local n
			if n > 12 then
				n = 12
			else
				n = ln
			end]==]
			hint("all", speaker.Name..": "..rest, 5)
		end
		if cmd == "punish" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				plr.Character:Remove()
			end
		end
		if cmd == "unpunish" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					if plr.Character.Parent == nil then
						plr.Character.Parent = workspace
					end
				end
			end
		end
		if cmd == "clone" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local char = plr.Character
					char.Archivable = true
					local clone = char:Clone()
					clone.Parent = workspace
					if char:findFirstChild("Head") then
						clone:MoveTo(char:findFirstChild("Head").Position)
					end
				end
			end
		end
		if cmd == "decalsky" or cmd == "sky" then
			local function changeSky(id)
				local link = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId="
				local properties = {"SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp"}
				local s = Instance.new("Sky", game:GetService("Lighting"))
				for _, pr in pairs(properties) do
					s[pr] = link..id
				end
			end
			changeSky(rest)
		end
		if cmd == "unname" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				spawn(function()
					reName(plr, _, true)
				end)
			end
		end
		if cmd == "wait" then
			waitTm = tonumber(rest)
		end
		if cmd == "invisible" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				spawn(function()
					--for t = 1, 0, -0.1 do
						setTransparency(plr, 1)
						--wait(0.1)
					--end
				end)
			end
		end
		if cmd == "visible" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				setTransparency(plr, 0)
			end
		end
		if cmd == "lock" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					for _, child in pairs(plr.Character:GetDescendants()) do
						if child:IsA("BasePart") then
							child.Locked = true
						end
					end
				end
			end
		end
		if cmd == "unlock" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					for _, child in pairs(plr.Character:GetDescendants()) do
						if child:IsA("BasePart") then
							child.Locked = false
						end
					end
				end
			end
		end
		if cmd == "naked" or cmd == "dog" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					for i, child in pairs(plr.Character:GetChildren()) do
						if child.ClassName == "Pants" or child.ClassName == "Shirt" then
							child:Destroy()
						end
					end
				end
			end
		end
		if cmd == "age" or cmd == "info" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				print(plr.Name.."'s age is "..plr.AccountAge)
			end
		end
		if cmd == "time" then
			local success, err = pcall(function()
				game:GetService("Lighting").ClockTime = rest
			end)
			if not success then
				warn("An error ocurred!: "..err)
			end
		end
		if cmd == "loopkill" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				pcall(function() spawn(function()
					if not tab.loopkill[plr.Name] or tab.loopkill[plr.Name] == false then
						tab.loopkill[plr.Name] = true
						repeat swait()
							local ch = plr.Character or plr.CharacterAdded:Wait()
							if tab.loopkill[plr.Name] == false then break end
							if ch:findFirstChildOfClass("Humanoid") then
								wait(0.3)
								ch:findFirstChildOfClass("Humanoid").Health = 0
							end
						until tab.loopkill[plr.Name] == false
					end
				end) end)
			end
		end
		if cmd == "unloopkill" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				tab.loopkill[plr.Name] = false
			end
		end
		if cmd == "fly" then
			local plyrs = getPlayer(rest, speaker, true)
			local url = "https://pastebin.com/raw/1BHaWhDA"
			local loadstr = pcall(loadstring, "") and loadstring or Loadstring
			for _, plr in pairs(plyrs) do
				local torso = plr.Character and plr.Character:findFirstChild("HumanoidRootPart") or nil
				if torso then
					local aliveVal = torso:findFirstChild("ADONIS_FLIGHT_ALIVE")
					if aliveVal then
						aliveVal:Destroy()
					end
					local load = loadstr(game:GetService("HttpService"):GetAsync(url))
					getfenv(load).owner = plr
					load()
				end
			end
		end
		if cmd == "unfly" then
			local plyrs = getPlayer(rest, speaker, true)
			for _, plr in pairs(plyrs) do
				local torso = plr.Character and plr.Character:findFirstChild("HumanoidRootPart") or nil
				if torso then
					local aliveVal = torso:findFirstChild("ADONIS_FLIGHT_ALIVE")
					if aliveVal then
						aliveVal:Destroy()
					end
				end
			end
		end
		if cmd == "unfire" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChild("HumanoidRootPart")
					if hum and hum:IsA("BasePart") then
						for _, child in pairs(hum:GetChildren()) do
							if child.ClassName == "Fire" then
								child:Destroy()
							elseif child.ClassName == "PointLight" then
								if child.Name == "Fire_light" then
									child:Destroy()
								end
							end
						end
					end
				end
			end
		end
		if cmd == "unrope" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					if plr.Character:findFirstChild("HumanoidRootPart") then
						for _, child in pairs(plr.Character.HumanoidRootPart:GetChildren()) do
							if child.ClassName == "Attachment" then
								if child.Name == "Rope_Attachment" then
									child:Destroy()
								end
							elseif child.ClassName == "RopeConstraint" then
								if child.Name == "Rope_Constraint" then
									child:Destroy()
								end
							end
						end
					end
				end
			end
		end
		if cmd == "freeze" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					for _, child  in pairs(plr.Character:GetChildren()) do
						if child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" then
							child.Anchored = true
						end
					end
				end
			end
		end
		if cmd == "unfreeze" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					for _, child in pairs(plr.Character:GetChildren()) do
						if child:IsA("BasePart") then
							child.Anchored = false
						end
					end
				end
			end
		end
		if cmd == "freecam" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChild("HumanoidRootPart")
					if hum then
						if hum:IsA("BasePart") then
							hum.Anchored = true
						end
					end
				end
			end
		end
		if cmd == "unfreecam" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChild("HumanoidRootPart")
					if hum then
						if hum:IsA("BasePart") then
							 hum.Anchored = false
						end
					end
				end
			end
		end
		if cmd == "jail" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					if plr.Character:findFirstChild("HumanoidRootPart") then
						jail(plr)
					end
				end
			end
		end
		if cmd == "unjail" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if tab.Instances[plr.Name.."_jail"] then
					tab.Instances[plr.Name.."_jail"]:Destroy()
				end
			end
		end
		if cmd == "dance" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local h = plr.Character:findFirstChildOfClass("Humanoid")
					if h ~= nil and h:findFirstChild("Animator") then
						local animation = Instance.new("Animation")
						animation.AnimationId = "rbxassetid://27789359"
						local anTrack = h:LoadAnimation(animation)
						anTrack:Play()
					end
				end
			end
		end
		if cmd == "view" then
			local plr = getPlayer(rest, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local humanoid = plr.Character:findFirstChildOfClass("Humanoid")
					if humanoid ~= nil then
						cmdRemote:FireClient(speaker, "view", humanoid)
					end
				end
			end
		end
		if cmd == "unspin" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if tab.Instances[plr.Name.."_spin"] then
					tab.Instances[plr.Name.."_spin"]:Destroy()
				end
			end
		end
		if cmd == "removetools" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				spawn(function()
					local plr = plr[i]
					local backpack = plr:findFirstChildOfClass("Backpack")
					if backpack then
						for _, child in pairs(backpack:GetChildren()) do
							if child:IsA("Tool") then
								child:Destroy()
							end
						end
					end
					if plr.Character then
						for _, child in pairs(plr.Character:GetChildren()) do
							if child:IsA("Tool") then
								child:Destroy()
							end
						end
					end
				end)
			end
		end
		if cmd == "fling" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				spawn(function()
					local plr = plr[i]
					if plr.Character then
						local rootPart = plr.Character:findFirstChild("HumanoidRootPart")
						local hum = plr.Character:findFirstChildOfClass("Humanoid")
						if rootPart then
							if hum ~= nil then
								hum.Sit = true
								local BodyVelocity = Instance.new("BodyVelocity", rootPart)
								BodyVelocity.Name = "Fling"
								BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								BodyVelocity.Velocity = Vector3.new(math.random(-1000, 1000), 500, math.random(-1000, 1000))
								wait(1)
								BodyVelocity:Destroy()
							end
						end
					end
				end)
			end
		end
		if cmd == "blur" then
			local blur
			if tab.Instances["Blur"] and tab.Instances["Blur"].Parent == game:GetService("Lighting") then
				blur = tab.Instances["Blur"]
			else
				blur = Instance.new("BlurEffect", game:GetService("Lighting"))
			end
			blur.Name = "AD_BlurEffect"
			if tonumber(rest) ~= nil then
				if tonumber(rest) <= 50 then
					blur.Size = rest
				else
					blur.Size = 50
				end
			end
			tab.Instances["Blur"] = blur
		end
		if cmd == "s" or cmd == "script" then
			if Loadstring == nil then
				warn("Unable to use this command")
				return
			end
			CS([[owner = game:GetService("Players")["]]..speaker.Name..[["]
 ]]..rest, game:GetService("ServerScriptService"))
			hint(speaker, "Ran Script", 3.5)
		end
		if cmd == "ls" or cmd == "localscript" then
			if Loadstring == nil then
				warn("Unable to use this command")
				return
			end
			CL([[owner = game:GetService("Players")["]]..speaker.Name..[["]
 ]]..rest, speaker:findFirstChildOfClass("PlayerGui"))
			hint(speaker, "Ran LocalScript", 3.5)
		end
		if cmd == "f3x" or cmd == "btools" or cmd == "buildingtools" then
			if Loadstring == nil then
				warn("Unable to use this command")
				return
			end
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				spawn(function()
					LoadSource([[require(4611675387).load("]]..plr.Name..[[")]])
				end)
			end
		end
		if cmd == "shutdown" then
			if Loadstring == nil then
				warn("Unable to use this command")
				return
			end
			local reason = "[SHUTDOWN]"
			if rest == nil or rest == "" or rest == " " then
			else
				reason = reason..": "..rest
			end
			FRemote:Invoke("shutdown", {reason})
		end
		if cmd == "unban" then
			if Loadstring == nil then
				warn("Unable to use this command")
				return
			end
			for name, d in pairs(tab.banlist) do
				if rest:lower():match("^"..name:lower()) and rest ~= "" then
					tab.banlist[name] = nil
					hint(speaker, "Unbanned "..name, 5)
				end
			end
		end
		if cmd == "slock" or cmd == "serverlock" then
			if Loadstring == nil then
				warn("Unable to use this command")
				return
			end
			if rest:lower() == "on" or rest:lower() == "true" or rest:lower() == "yes" or rest == "" then
				slock = true
				hint(speaker, "Server locked", 4.5)
			elseif rest:lower() == "off" or rest:lower() == "false" or rest:lower() == "no" then
				slock = false
				hint(speaker, "Server unlocked", 4.5)
			end
		end
		if cmd == "ht" or cmd == "newhint" then
			hint("all", rest, 5)
		end
		if cmd == "unbgui" or cmd == "nobgui" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local head = plr.Character:findFirstChild("Head")
					if tab.bguis[head] then
						if tab.bguis[head].Parent ~= nil then
							tab.bguis[head].Parent:Destroy()
						end
					end
				end
			end
		end
		if cmd == "undname" or cmd == "undisplayname" then
			local plr = getPlayer(rest, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChildOfClass("Humanoid") 
					if hum then
						hum.DisplayName = ""
					end
				end
			end
		end
		if cmd == "track" or cmd == "find" then
			local plyrs = getPlayer(rest, speaker, true)
			local tracks = tab.tracks
			for _, plr in pairs(plyrs) do
				if plr.Character and speaker.Character then
					local torso = plr.Character:findFirstChild("HumanoidRootPart")
					local head = plr.Character:findFirstChild("Head")
					local hum = speaker.Character:findFirstChildOfClass("Humanoid")
					if torso and hum and head then
						local tracker = trackerExample:Clone()
						tracker.Adornee = head
						tracker.Name = plr.Name.."Tracker"
						local lasso = tracker.SelectionPartLasso
						lasso.Humanoid = hum
						lasso.Part = torso
						tracker.Frame.TextLabel.Text = plr.Name
						local function onChanged(prop)
							if prop == "Parent" then
								if not torso.Parent or not hum.Parent then
									tracker:Destroy()
								end
							end
						end
						torso.Changed:Connect(onChanged)
						hum.Changed:Connect(onChanged)
						if not tracks[speaker] then
							tracks[speaker] = {}
						end
						if not tracks[speaker][plr] then
							tracks[speaker][plr] = {}
						end
						table.insert(tracks[speaker][plr], tracker)
						tracker.Parent = speaker:findFirstChildOfClass("PlayerGui")
					end
				end
			end
		end
		if cmd == "unfind" or cmd == "untrack" then
			local tracks = tab.tracks
			if not tracks[speaker] then return end
			local plyrs = getPlayer(rest, speaker, true)
			for _, plr in pairs(plyrs) do
				for i, track in pairs(tracks[speaker][plr] or {}) do
					track:Destroy()
				end
			end
		end
	end

--//2===============================================================

	local function args3()
		local pm = msg:split(s)
		local arg1 = table.remove(pm, 1)
		local arg2 = table.remove(pm, 1)
		local rest = table.concat(pm, s)
		local cmd = arg1:lower()
		--Commands...
		if cmd == "resize" or cmd == "size" then
			local plr = getPlayer(arg2, speaker, false)
			for i = 1, #plr do
				local plr = plr[i]
				if plr.Character then
					if plr.Character:findFirstChildOfClass("Humanoid") then
						if plr.Character:findFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 then
							plr.Character.Humanoid.BodyDepthScale.Value = rest
							plr.Character.Humanoid.BodyHeightScale.Value = rest
							plr.Character.Humanoid.BodyWidthScale.Value = rest
							plr.Character.Humanoid.HeadScale.Value = rest
						end
					end
				end
			end
		end
		if cmd == "speed" or cmd == "walkspeed" then
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local humanoid = plr.Character:findFirstChildOfClass("Humanoid")
					if humanoid ~= nil then
						humanoid.WalkSpeed = rest
					end
				end
			end
		end
		if cmd == "jumppower" or cmd == "jpower" then
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local humanoid = plr.Character:findFirstChildOfClass("Humanoid")
					if humanoid ~= nil then
						humanoid.JumpPower = rest
					end
				end
			end
		end
		if cmd == "gear" then
			local plr = getPlayer(arg2, speaker, false)
			local assetId = rest
			for i = 1,#plr do
				local plr = plr[i]
				local backpack = plr:findFirstChildOfClass("Backpack")
				if backpack then
					local model = InsertService:LoadAsset(assetId)
					model.Parent = backpack
				end
			end
		end
		if cmd == "tp" or cmd == "teleport" then
			local plr1 = getPlayer(arg2, speaker, false)
			local plr2 = getPlayer(rest, speaker, false)
			for i = 1,#plr1 do
				spawn(function()
					for z = 1,#plr2 do
						local plr1 = plr1[i]
						local plr2 = plr2[z]
						teleport(plr1, plr2)
					end
				end)
			end
		end	
		if cmd == "char" then
			local plr = getPlayer(arg2, speaker, true)
			local plrId = getUsernameId(rest)
			for i = 1,#plr do
				local plr = plr[i]
				local function char()
					if plrId ~= nil then
						plr.CharacterAppearanceId = plrId
						plr:LoadCharacter()
					else
						plr.CharacterAppearanceId = plr.UserId
						plr:LoadCharacter()
					end
				end
				if plr.Character then
					if plr.Character:findFirstChild("HumanoidRootPart") then
						local humRootPart = plr.Character:findFirstChild("HumanoidRootPart")
						local pos = humRootPart.CFrame
						char()
						local ch = plr.Character or plr.CharacterAdded:Wait()
						if ch:findFirstChild("HumanoidRootPart") then
							ch:findFirstChild("HumanoidRootPart").CFrame = pos
						end
					else
						char()
					end
				else
					char()
				end
			end
		end
		if cmd == "name" or cmd == "rename" then
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				reName(plr, rest)
			end
		end
		if cmd == "kick" then
			if Loadstring == nil then
				warn("Unable to use this command")
				return
			end
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				local permission = false
				for i, mod in pairs(Moderators) do
					if speaker == owner and plr ~= speaker then
						permission = true
					elseif plr.Name ~= mod and plr ~= speaker then
						permission = true
					end
				end
				if permission == true then
					FRemote:Invoke("kick", {plr, rest})
					hint(speaker, "Kicked "..plr.Name, 4)
				end
			end
		end
		if cmd == "damage" then
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum ~= nil then
						hum:TakeDamage(rest)
					end
				end
			end
		end
		if cmd == "health" then
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum ~= nil then
						hum.Health = rest
					end
				end
			end
		end
		if cmd == "fog" then
			local l = game:GetService("Lighting")
			l.FogStart = arg2
			l.FogEnd = rest
		end
		if cmd == "charaudio" then
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					if plr.Character:findFirstChild("HumanoidRootPart") then
						local hum = plr.Character:findFirstChild("HumanoidRootPart")
						local song = Instance.new("Sound", hum)
						song.SoundId = "rbxassetid://"..rest
						song.Volume = 1
						song.Pitch = 1
						song.Looped = true
						song:Play()
					end
				end
			end
		end
		if cmd == "sudo" then
			if speaker ~= owner then return end
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				cmdFunction(rest, plr, true)
			end
		end
		if cmd == "fire" then
			local plr = getPlayer(arg2, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChild("HumanoidRootPart")
					if hum and hum:IsA("BasePart") then
						local bc = BrickColor.new(tonumber(rest) or rest)
						local fire = Instance.new("Fire", hum)
						fire.Color = bc.Color
						fire.SecondaryColor = bc.Color
						fire.Heat = 9
						fire.Size = 5
						fire.Enabled = true
						local fl = Instance.new("PointLight", hum)
						fl.Brightness = 5
						fl.Color = bc.Color
						fl.Range = 15
						fl.Shadows = false
						fl.Enabled = true
						fl.Name = "Fire_light"
					end
				end
			end
		end
		if cmd == "headsize" then
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local head = plr.Character:findFirstChild("Head")
					if head then
						if head:IsA("BasePart") then
							head.Size = Vector3.new(rest, rest, rest)
						end
					end
				end
			end
		end
		if cmd == "freefall" then
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChild("HumanoidRootPart")
					if hum then
						hum.Position = hum.Position + Vector3.new(0, tonumber(rest), 0)
					end
				end
			end
		end
		if cmd == "spin" then
			local plr = getPlayer(arg2, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChild("HumanoidRootPart")
					if hum then
						if not tab.Instances[plr.Name.."_spin"] or tab.Instances[plr.Name.."_spin"].Parent ~= hum then
							local sp = Instance.new("BodyAngularVelocity", hum)
							sp.Name = "Spinner"
							tab.Instances[plr.Name.."_spin"] = sp
							if tonumber(rest) ~= nil then
								sp.AngularVelocity = Vector3.new(0, tonumber(rest), 0)
							else
								sp.AngularVelocity = Vector3.new(0, 10, 0)
							end
							sp.MaxTorque = Vector3.new(0, math.huge, 0)
							sp.P = 1250
						end
						if tab.Instances[plr.Name.."_spin"] then
							if tab.Instances[plr.Name.."_spin"].Parent == hum then
								local sp = tab.Instances[plr.Name.."_spin"]
								if tonumber(rest) ~= nil then
									sp.AngularVelocity = Vector3.new(0, tonumber(rest), 0)
								else
									sp.AngularVelocity = Vector3.new(0, 10, 0)
								end
							end
						end
					end
				end
			end
		end
		if cmd == "boom" or cmd == "explode" then
			local plr = getPlayer(arg2, speaker, true)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local humRootPart = plr.Character:findFirstChild("HumanoidRootPart")
					local ps
					if tonumber(rest) ~= nil then
						ps = rest
					else
						ps = 4
					end
					if humRootPart then
						local explosion = Instance.new("Explosion", workspace)
						explosion.Name = "BOOM!!!"
						explosion.Position = humRootPart.Position
						explosion.BlastRadius = ps
					elseif plr.Character:findFirstChild("Head") then
						local explosion = Instance.new("Explosion",workspace)
						explosion.Name = "BOOM!!!"
						explosion.Position = plr.Character.Head.Position
						explosion.BlastRadius = ps
					end
				end
			end
		end
		if cmd == "carry" then
			local plr1 = getPlayer(arg2, speaker, false)
			local plr2 = getPlayer(rest, speaker, false)
			for i = 1,#plr1 do
				for z = 1,#plr2 do
					spawn(function()
						local plr1 = plr1[i]
						local plr2 = plr2[z]
						if plr1.Character and plr2.Character then
							if plr1.Character:findFirstChild("Torso") and plr1.Character:findFirstChildOfClass("Humanoid") and plr2.Character:findFirstChild("HumanoidRootPart") then
								local torso = plr1.Character.Torso
								local rootPart = plr2.Character.HumanoidRootPart
								local hum = plr1.Character:findFirstChildOfClass("Humanoid")
								hum.PlatformStand = true
								if hum:findFirstChild("Animator") then
									hum.Animator.Parent = nil
								end
								local animate = plr1.Character:findFirstChild("Animate")
								if animate and animate:IsA("Script") then
									animate.Disabled = true
								end
								for _, tr in pairs(hum:GetPlayingAnimationTracks()) do
									tr:Stop()
								end
								wait(0.1)
								local rh = torso:findFirstChild("Right Hip")
								local lh = torso:findFirstChild("Left Hip")
								local hf = torso:findFirstChild("Neck")
								local leftArm = torso:findFirstChild("Left Shoulder")
								local rightArm = torso:findFirstChild("Right Shoulder")
								rh.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0) * CFrame.Angles(0, math.rad(-25), math.rad(90))
								lh.C0 = CFrame.new(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0) * CFrame.Angles(0, math.rad(25), math.rad(-90))
								hf.C0 = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0) * CFrame.Angles(0, math.rad(12), 0)
								leftArm.C0 = CFrame.new(-1, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0) * CFrame.Angles(0, 0, math.rad(-90))
								rightArm.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0) * CFrame.Angles(0, 0, math.rad(90))
							
								local lastCFrame = rootPart.CFrame
								local weld = Instance.new("Weld", torso)
								weld.Part0 = torso
								weld.Part1 = rootPart
								weld.C0 = CFrame.new(0, -1.75, -1)
								rootPart.CFrame = lastCFrame
							end
						end
					end)
				end
			end
		end
		if cmd == "ban" then
			if Loadstring == nil then
				warn("Unable to use this command")
				return
			end
			local reason = "[Banned]"
			local banlist = tab.banlist
			if rest == nil or rest == "" or rest == " " then
			else
				reason = reason..": "..rest
			end
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				local permission = false
				for i, mod in pairs(Moderators) do
					if speaker == owner and plr ~= speaker then
						permission = true
					elseif plr.Name ~= mod and plr ~= speaker then
						permission = true
					end
				end
				if not banlist[plr.Name] and permission == true then
					banlist[plr.Name] = true
					FRemote:Invoke("kick", {plr, reason})
					hint(speaker, "Banned "..plr.Name, 5)
				end
			end
		end
		if cmd == "bgui" or cmd == "billboardgui" then
			local plr = getPlayer(arg2, speaker, false)
			local function bgui(head)
				if tab.bguis[head] and tab.bguis[head].Parent ~= nil then
					local tb = tab.bguis[head]
					tb.Text = rest
				else
					local gui = Instance.new("BillboardGui", head)
					gui.Enabled = true
					gui.Size = UDim2.new(40, 35, 2, 35)
					gui.StudsOffset = Vector3.new(0, 2, 0)
					local tb = Instance.new("TextLabel")
					tb.Visible = false
					tb.Parent = gui
					tab.bguis[head] = tb
					tb.Text = rest
					tb.Active = false
					tb.BackgroundTransparency = 1
					tb.Font = "SourceSansBold"
					tb.FontSize = "Size32"
					tb.Position = UDim2.new(0, 0, 0.05, 0)
					tb.Size = UDim2.new(1, 0, 0.5, 0)
					tb.TextColor = BrickColor.new(255, 255, 255)
					tb.TextStrokeTransparency = 0
					tb.TextScaled = true
					repeat swait() until tb.Text == rest
					tb.Visible = true
				end
			end
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local head = plr.Character:findFirstChild("Head")
					if head then
						coroutine.wrap(bgui)(head)
					end
				end
			end
		end
		if cmd == "dname" or cmd == "displayname" then
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum then
						hum.DisplayName = rest or ""
					end
				end
			end
		end
		if cmd == "animation" or cmd == "anim" then
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					local hum = plr.Character:findFirstChildOfClass("Humanoid")
					if hum then
						local animation = Instance.new("Animation")
						animation.AnimationId = "rbxassetid://"..(tonumber(rest) or "")
						local track = hum:LoadAnimation(animation)
						track:Play()
					end
				end
			end
		end
		if cmd == "color" then
			local plr = getPlayer(arg2, speaker, false)
			for i = 1,#plr do
				local plr = plr[i]
				if plr.Character then
					for i, v in pairs(plr.Character:GetChildren()) do
						if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
							v.BrickColor = BrickColor.new(tonumber(rest) or rest)
						end
					end
				end
			end
		end
		if cmd == "cs" then
			if not Loadstring then
				return warn("Unable to use this command")
			end
			local plyrs = getPlayer(arg2, speaker, false)
			for _, plr in pairs(plyrs) do
				CL([[owner = game:GetService("Players").LocalPlayer ]]..rest, plr:findFirstChild("PlayerGui"))
				hint(speaker, "Ran LocalScript on "..plr.Name, 3.5)
			end
		end
	end

--//3===============================================================

	local function args4()
		local pm = msg:split(s)
		local arg1 = table.remove(pm, 1)
		local arg2 = table.remove(pm, 1)
		local arg3 = table.remove(pm, 1)
		local rest = table.concat(pm, s)
		local cmd = arg1:lower()
		--Commands...
		
		if cmd == "fogcolor" then
			local l = game:findFirstChildOfClass("Lighting")
			l.FogColor = Color3.fromRGB(arg2, arg3, rest)
		end
		if cmd == "rope" then
			local plr1 = getPlayer(arg2, speaker, false)
			local plr2 = getPlayer(arg3, speaker, false)
			for i = 1,#plr1 do
				for z = 1,#plr2 do
					local plr1 = plr1[i]
					local plr2 = plr2[z]
					if plr1.Character and plr2.Character then
						if plr1.Character:findFirstChild("HumanoidRootPart") and plr2.Character:findFirstChild("HumanoidRootPart") then
							local at1 = Instance.new("Attachment", plr1.Character.HumanoidRootPart)
							at1.Name = "Rope_Attachment"
							local at2 = Instance.new("Attachment", plr2.Character.HumanoidRootPart)
							at2.Name = "Rope_Attachment"
							local rope = Instance.new("RopeConstraint", plr1.Character.HumanoidRootPart)
							rope.Attachment0 = at1
							rope.Attachment1 = at2
							rope.Length = tonumber(rest) or 20
							rope.Name = "Rope_Constraint"
							rope.Enabled = true
							rope.Visible = true
						end
					end
				end
			end
		end
	end
	local function args5()
		local pm = msg:split(s)
		local arg1 = table.remove(pm, 1)
		local arg2 = table.remove(pm, 1)
		local arg3 = table.remove(pm, 1)
		local arg4 = table.remove(pm, 1)
		local rest = table.concat(pm, s)
		local cmd = arg1:lower()

		--Commands...
	end
	spawn(onlyCommand)
	spawn(args2)
	spawn(args3)
	spawn(args4)
	spawn(args5)
	if waitTm then
		wait(waitTm)
	end
end

local function sepFunc(msg, plr)
	local t = msg:split(string.char(124))
	for i = 1,#t do
		cmdFunction(t[i], plr)
	end
end

Players.PlayerAdded:Connect(function(plr)
	if Loadstring ~= nil then
		if tab.banlist[plr.Name] then
			FRemote:Invoke("kick", {plr, "You are banned from the server"})
		end
		local isMod = false
		for i, mod in pairs(Moderators) do
			if plr.Name == mod then
				isMod = true
			end
		end
		if not isMod and slock == true then
			FRemote:Invoke("kick", {plr, "[Server locked]"})
		end
	end
	plr.Chatted:Connect(function(msg)
		sepFunc(msg, plr)
	end)
end)
for i, plr in pairs(Players:GetPlayers()) do
	plr.Chatted:Connect(function(msg)
		sepFunc(msg, plr)
	end)
end

--[==[local frame1 = Instance.new("Frame", screen)
frame1.Name = "Background"
frame1.AnchorPoint = Vector2.new(1, 1)
frame1.Position = UDim2.new(0.975, 0, 0.975, 0)
frame1.Size = UDim2.new(0,300, 0, 125)
frame1.Style = 3
frame1.Visible = true
local frame2 = Instance.new("Frame", frame1)
frame2.Name = "TextBackground"
frame2.AnchorPoint = Vector2.new(0.5, 0)
frame2.Position = UDim2.new(0.5, 0, 0.2, 0)
frame2.Size = UDim2.new(0, 250, 0, 50)
frame2.Style = 3
frame2.ClipsDescendants = true
local label = Instance.new("TextBox", frame2)
label.BackgroundTransparency = 1
label.Font = "ArialBold"
label.Size = UDim2.new(1, 0, 1, 0)
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextScaled = true
local bar = Instance.new("TextBox", screen)
bar.Name = "Admin_Bar"
bar.AnchorPoint = Vector2.new(1, 1)
bar.Size = UDim2.new(0, 250, 0, 20)
bar.Position = UDim2.new(1, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
bar.BorderSizePixel = 0
bar.TextColor3 = Color3.fromRGB(255, 255, 255)
bar.TextScaled = true
bar.TextWrapped = true
bar.Font = "SourceSans"
bar.FontSize = "Size18"
bar.Text = "Command Bar"]==]

local remote = Instance.new("RemoteEvent", Remotes)
remote.Name = "RemoteCommand"
remote.OnServerEvent:connect(function(plr, what, data)
	if what == "Command" then
		sepFunc(data, plr)
	end
end)

spawn(function()
	while true do
		if remote.Parent == nil then
			remote = Instance.new("RemoteEvent", Remotes)
			remote.Name = "RemoteCommand"
			remote.OnServerEvent:connect(function(plr, what, data)
				if what == "Command" then
					sepFunc(data, plr)
				end
			end)
		end
		wait()
	end
end)