--[==[

--//TEST BETA V2 ADMIN\\--

> Created by DrawingJhon
> Compatibilty in Void Script Builder Place 1/Place 2

Credits:
- NS and NLS converted to module by FernandoPlayerYT
- Loadstring Module by UnlimitedKeepingrm
- Admin inspired by Adonis Admin and Infinite Yield

...This script was created without Roblox Studio
]==]

--====================================================================================

print("Loading data...")
assert(owner and typeof(owner) == "Instance" and owner:IsA("owner"), "Owner found")

local adminVersion = "Beta"
local Settings = {
	Prefix = ";";
	PlayerPrefix = "!";
	SpecialPrefix = "";
	SplitKey = ' ';
	PlrSeparate = ',';
	BatchKey = ",";
	DataStoreKey = "Default";
	Banned = {};
	BlackList = {};
	Moderators = {};
	Owners = {};
	Creators = {Workspace.Players};
}

local RequireAllowed = true
local TrackedTasks = {}
local cachePlayersId = {}
local RunningLoops = {}
local SavedGuis = {}
local Instance = {new = Instance.new}
local RbxEvents = {}
local Key53 = (function()
	local k = ""
	local str = Settings.DataStoreKey:sub(1, 50)
	for i, v in pairs(string.split(str, "")) do
		k = k..tostring(string.byte(v))
	end
	return k
end)()
local inv256

local service, Functions, Admin, Core, Remote, Commands, Process, Variables, Assets

local message = function(...) game:GetService("TestService"):Message(...) end
local Routine = function(func, ...) coroutine.resume(coroutine.create(func), ...) end

local Variables = {
	CodeName = math.random();
	InsertList = {};
	Objects = {};
	RopeConstraints = {};
	Hints = {};
	Waypoints = {};
	Jails = {};
	Spinners = {};
	Tracks = {};
	Skies = {};
	MainGui = {};
	CommandLoops = {};
	InsertedObjects = {};
	BanMessage = "Banned";
	LockMessage = "Not Whitelisted";
	MusicList = {
		{Name='jericho',ID=292340735};
		{Name='dieinafire',ID=242222291};
		{Name='beam',ID=165065112};
		{Name='myswamp',ID=166325648};
		{Name='skeletons',ID=168983825};
		{Name='russianmen',ID=173038059};
		{Name='freedom',ID=130760592};
		{Name='seatbelt',ID=135625718};
		{Name='tempest',ID=135554032};
		{Name="focus",ID=136786547};
		{Name="azylio",ID=137603138};
		{Name="caramell",ID=2303479};
		{Name="epic",ID=27697743};
		{Name="halo",ID=1034065};
		{Name="pokemon",ID=1372261};
		{Name="cursed",ID=1372257};
		{Name="extreme",ID=11420933};
		{Name="tacos",ID=142295308};
		{Name="wakemeup",ID=2599359802};
		{Name="awaken",ID=27697277};
		{Name="alone",ID=27697392};
		{Name="mario",ID=1280470};
		{Name="choir",ID=1372258};
		{Name="chrono",ID=1280463};
		{Name="dotr",ID=11420922};
		{Name="entertain",ID=27697267};
		{Name="fantasy",ID=1280473};
		{Name="final",ID=1280414};
		{Name="emblem",ID=1372259};
		{Name="flight",ID=27697719};
		{Name="gothic",ID=27697743};
		{Name="hiphop",ID=27697735};
		{Name="intro",ID=27697707};
		{Name="mule",ID=1077604};
		{Name="film",ID=27697713};
		{Name="nezz",ID=8610025};
		{Name="resist",ID=27697234};
		{Name="schala",ID=5985787};
		{Name="organ",ID=11231513};
		{Name="tunnel",ID=9650822};
		{Name="spanish",ID=5982975};
		{Name="venom",ID=1372262};
		{Name="wind",ID=1015394};
		{Name="guitar",ID=5986151};
		{Name="weapon",ID=142400410};
		{Name="derezzed",ID=142402620};
		{Name="sceptics",ID=153251489};
		{Name="pianoremix",ID=142407859};
		{Name="antidote",ID=145579822};
		{Name="overtime",ID=135037991};
		{Name="fluffyunicorns",ID=141444871};
		{Name="tsunami",ID=569900517};
		{Name="finalcountdownremix",ID=145162750};
		{Name="stereolove",ID=142318819};
		{Name="minecraftorchestral",ID=148900687};
		{Name="superbacon",ID=300872612};
		{Name="alonemarsh",ID=639750143}; -- Alone - Marshmello
		{Name="crabraveoof",ID=2590490779}; -- Crab rave oof
		{Name="rickroll",ID=4581203569};
		{Name="deathbed",ID=4966153470};
		{Name="muffinsong",ID=1753701701};
		{Name="helloworld",ID=5642549252};
		{Name="shrekophone",ID=6344613233};
		{Name="NoOnesAroundToHelp",ID=1280408510};
		{Name="caillou",ID=181768110};
		{Name="flowergarden",ID=3229605759};
		{Name="shineon",ID=4257587332};
		{Name="pizzatheme",ID=672731096};
		{Name="oldtownroad",ID=652513366};
		{Name="undertale",ID=1072410152};
	};
}

service = setmetatable({
	MarketPlace = game:GetService("MarketplaceService");
	ChatService = (function()
		local success, result = pcall(function()
			return require(game:GetService("ServerScriptService").ChatServiceRunner.ChatService)
		end)
		if not success then
			warn("ChatService was not found")
		else
			return result
		end
	end)();
	RbxEvent = function(signal, func) local event = signal:connect(func) table.insert(RbxEvents, event) return event end;
	SelfEvent = function(signal, func) local rbxevent = service.RbxEvent(signal, function(...) func(...) end) end;
	DelRbxEvent = function(signal) for i,v in next,RbxEvents do if v == signal then v:Disconnect() table.remove(RbxEvents, i) end end end;
	Delete = function(obj,num) game:service("Debris"):AddItem(obj, (num or 0)) pcall(obj.Destroy, obj) end;
	Reals = {};
	New = function(class, data)
		local new = Instance.new(class)
		if data then
			if type(data) == "table" then
				local parent = data.Parent
				data.Parent = nil
				for val, prop in pairs(data) do
					new[val] = service.Reals[prop] or prop
				end
				if parent then
					new.Parent = parent
				end
			elseif type(data) == "userdata" then
				new.Parent = service.Reals[data] or data
			end
		end
		return new
	end;
	TextWrap = function(bg, tb, data)
		if not tb then
			tb = bg:findFirstChild("ADText")
		end

		local textWrapped = false

		local function onGet(index)
			if index == "TextWrapped" then
				return textWrapped
			elseif index:lower() == "clone" then
				return function()
					local cloned = bg:Clone()
					return service.TextWrapped(cloned, cloned:findFirstChild("ADText"))
				end
			elseif index:match("^Text") or index:match("^Font") then
				return tb[index]
			else
				return bg[index]
			end
		end

		local function onEdit(index, value)
			if index == "TextWrapped" then
				textWrapped = value
			elseif index == "Text" then
				for i = 1,5 do
					tb.Text = value
				end
			elseif index:match("^Text") or index:match("^Font") then
				tb[index] = value
			else
				bg[index] = value
			end
		end

		local function update()
			if textWrapped then
				local x = tb.TextBounds.X
				if x >= (bg.Size.X.Offset - 10) then
					local charX = tb.TextBounds.X / #tb.Text
					local pos = math.floor((bg.Size.X.Offset - 10) / charX)
					local result = tb.Text
					while true do
						if result:sub(pos) == "" then
							break
						end
						local matched
						if result:match("\n") then
							matched = result:match("^.+\n(.*)$")
						else
							matched = result
						end
						result = result:sub(1,pos-1).."\n"..result:sub(1,pos)
					end
					tb.Text = result
				end
			end
		end
		update()
		tb.Changed:Connect(function(prop)
			if prop == "Text" then
				update()
			end
		end)

		if data then
			if type(data) == "table" then
				local parent = data.Parent
				data.Parent = nil
				for val, prop in pairs(data) do
					onEdit(val, service.Reals[prop] or prop)
				end
				if parent then
					bg.Parent = parent
				end
			elseif type(data) == "userdata" then
				bg.Parent = service.Reals[data] or data
			end
		end

		local wrapped = newproxy(true)
		service.Reals[wrapped] = tb
		local meta = getmetatable(wrapped)
		meta.__index = function(self, index)
			return onGet(index)
		end
		meta.__newindex = function(self, index, value)
			onEdit(index, value)
		end
		meta.__metatable = "The metatable is locked"
		return wrapped
	end;
	TextLabel = function(data)
		if not (game.PlaceId == 843468296 or game.PlaceId == 843495510) then
			return service.New("TextLabel", data)
		end

		local Bg = service.New("Frame")
		local Tb = service.New("TextBox", Bg)
		Tb.Name = "ADText"
		Tb.ClearTextOnFocus = false
		Tb.TextEditable = false
		Tb.Size = UDim2.new(0, 0, 0, 0)
		Tb.Position = UDim2.new(0.5, 0, 0.5, 0)
		Tb.AnchorPoint = Vector2.new(0.5, 0.5)
		Tb.BackgroundTransparency = 1
		return service.TextWrap(Bg, Tb, data)
	end;
	Wait = function(mode)
		if not mode or mode == "Stepped" then
			service.RunService.Stepped:wait()
		elseif mode == "Heartbeat" then
			service.RunService.Heartbeat:wait()
		elseif mode and tonumber(mode) then
			wait(tonumber(mode))
		end
	end;
	TrackTask = function(name, func, ...)
		local index = math.random()
		local isThread = string.sub(name, 1, 7) == "Thread:"
		local data = {
			Name = name;
			Status = "Waiting";
			Function = func;
			isThread = isThread;
			Created = os.time();
			Index = index;
		}
		local function taskFunc(...)
			TrackedTasks[index] = data
			data.Status = "Running"
			data.Returns = {pcall(func, ...)}
			if not data.Returns[1] then
				data.Status = "Errored"
			else
				data.Status = "Finished"
			end
			TrackedTasks[index] = nil
			return unpack(data.Returns)
		end
		if isThread then
			data.Thread = coroutine.create(taskFunc)
			return coroutine.resume(data.Thread, ...)
		else
			return taskFunc(...)
		end
	end;
	EventTask = function(name, func)
		local newTask = service.TrackTask
		return function(...)
			return newTask(name, func, ...)
		end
	end;
	GetTasks = function()
		return TrackedTasks
	end;
	Insert = function(id, rawModel)
		local model = service.InsertService:LoadAsset(id)
		if not rawModel and model:IsA("Model") and model.Name == "Model" then
			local asset = model:GetChildren()[1]
			asset.Parent = model.Parent
			model:Destroy()
			return asset
		end
		return model
	end;
	GetUserIdFromName = function(name)
		if cachePlayersId[name] then return cachePlayersId[name] end
		local player = service.Players:findFirstChild(name)
		if player then
			cachePlayersId[name] = player.UserId
			return player.UserId
		end
		local id
		local success, err = pcall(function()
			id = service.Players:GetUserIdFromNameAsync(name)
		end)
		if success then
			cachePlayersId[name] = id
			return id
		end
	end;
	StartLoop = function(name, delay, func, noYield)
		local tab = {
			Name = name;
			Delay = delay;
			Function = func;
			Running = true;
		}

		local index = tostring(name).." - "..Functions:GetRandom()

		local function kill()
			tab.Running = true
			if RunningLoops[index] == tab then
				RunningLoops[index] = nil
			end
		end

		local function loop()
			if tonumber(delay) then
				repeat 
					func()
					wait(tonumber(delay))
				until RunningLoops[index] ~= tab or not tab.Running
				kill()
			elseif delay == "Heartbeat" then
				repeat 
					func()
					service.RunService.Heartbeat:wait()
				until RunningLoops[index] ~= tab or not tab.Running
				kill()
			elseif delay == "RenderStepped" then
				repeat 
					func()
					service.RunService.RenderStepped:wait()
				until RunningLoops[index] ~= tab or not tab.Running
				kill()
			elseif delay == "Stepped" then
				repeat 
					func()
					service.RunService.Stepped:wait()
				until RunningLoops[index] ~= tab or not tab.Running
				kill()
			else
				tab.Running = false
			end
		end

		tab.Kill = kill
		RunningLoops[index] = tab

		if noYield then
			service.TrackTask("Thread: Loop: "..name, loop)
		else
			service.TrackTask("Loop: "..name, loop)
		end

		return tab
	end;
	StopLoop = function(name)
		for ind, loop in pairs(RunningLoops) do
			if name == loop.Function or name == loop.Name then
				loop.Running = false
			end
		end
	end;
	Env = function(name)
		local env_module = require(2157297281)()
		spawn(function()
			env_module.Parent = nil
		end)
		local env = require(env_module)
		return name and env.game:GetService(name) or env
	end;
}, {
	__index = function(self, index)
		local found = Functions[index]
		if found ~= nil then
			return found
		else
			local ran, serv = pcall(game.GetService, game, index)
			if ran and serv then
				service[tostring(serv)] = serv
				return serv
			end
		end
	end;
	__tostring = "Service";
	__metatable = "Service";
})

Functions = {
	GetPlayers = function(text, plr, notContinued, dontError)
		local PlayerList = {}
		local msg = type(text) == "string" and text:lower()
		if type(text) ~= "string" or text:match("^%s*$") then
			if notContinued then
				table.insert(PlayerList, plr)	
				return PlayerList
			elseif plr and not dontError then
				Functions.Output("No players matching ("..tostring(text or "nil")..") were found!", {plr})
			end
		else
			local sep = msg:split(Settings.PlrSeparate)
			for i = 1,#sep do
				local lmsg = sep[i]
				local function getplrs(msg)
					local listplrs = {}
					local plyrs = service.Players:GetPlayers()
					if msg == "me" and plr then
						table.insert(listplrs, plr)
					elseif msg == "others" and plr then
						for i, p in pairs(service.Players:GetPlayers()) do
							if p ~= plr then
								table.insert(listplrs, p)
							end
						end
					elseif msg == "random" then
						table.insert(listplrs, plyrs[math.random(1,#plyrs)])
					elseif msg == "friends" and plr then
						for i, v in pairs(service.Players:GetPlayers()) do
							if v:IsFriendsWith(plr.UserId) then
								table.insert(listplrs, v)
							end
						end
					elseif msg == "all" then
						for i, v in pairs(service.Players:GetPlayers()) do
							table.insert(listplrs, v)
						end
					elseif msg:sub(1, 1) == "#" then
						local matched = msg:match("%#(.*)")
						if matched and tonumber(matched) then
							local num = tonumber(matched)
							for i = 1, num do
								table.insert(listplrs, plyrs[math.random(1,#plyrs)])
							end
						end
					elseif msg:sub(1, 7) == "radius-" and plr then
						local matched = msg:match("radius%-(.*)")
						if matched and tonumber(matched) then
							local num = tonumber(matched)
							for i, v in next, service.Players:GetPlayers() do
								local pos1 = plr.Character and plr.Character:GetModelCFrame().p
								local pos2 = v.Character and v.Character:GetModelCFrame().p
								if (pos1 - pos2).magnitude <= num then
									table.insert(listplrs, v)
								end
							end
						end
					else
						local found = false
						for i, v in pairs(service.Players:GetPlayers()) do
							if v.DisplayName:lower():sub(1,#msg) == msg:lower() then
								table.insert(listplrs, v)
								found = true
							end
						end
						if not found then
							for i, v in pairs(service.Players:GetPlayers()) do
								if v.Name:lower():sub(1,#msg) == msg:lower() then
									table.insert(listplrs, v)
								end
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
			if #PlayerList == 0 and not dontError then
				Functions.Output("No player matching "..text.." were found!", {plr})
			end
			return PlayerList
		end
		return {}
	end;
	PlayAnimation = function(player, animId)
		if player.Character and tonumber(animId) then
			local human = player.Character:findFirstChildOfClass("Humanoid")
			if human and not human:findFirstChildOfClass("Animator") then
				service.New("Animator", human)
			end
			Remote.Send(player, "Function", "PlayAnimation", animId)
		end
	end;
	SetLighting = function(prop, value)
		if service.Lighting[prop] ~= nil then
			service.Lighting[prop] = value
		end
	end;
	DSKeyNormalize = function(intab, reverse)
		local tab = {}

		if reverse then
			for i,v in next,intab do
				if tonumber(i) then
					tab[tonumber(i)] = v;
				end
			end
		else
			for i,v in next,intab do
				tab[tostring(i)] = v;
			end
		end

		return tab;
	end;
	GetRandom = function(pLen)
		local Len = (type(pLen) == "number" and pLen) or math.random(5, 10)
		local Res = {}
		for Idx = 1, Len do
			Res[Idx] = string.format('%02x', math.random(126))
		end
		return table.concat(Res)
	end;
	Trim = function(str)
		return str:match("^%s*(.-)%s*$")
	end;
	Round = function(num)
		return math.floor(num + 0.5)
	end;
	CleanWorkspace = function()
		for i, v in pairs(service.Workspace:GetChildren()) do
			if v:IsA("Tool") or v:IsA("Accessory") or v:IsA("Hat") then
				v:Destroy()
			end
		end
	end;
	RemoveSeatWelds = function(seat)
		if seat ~= nil then
			for i, v in next, seat:GetChildren() do
				if v:IsA("Weld") then
					if v.Part1 ~= nil and v.Part1.Name == "HumanoidRootPart" then
						v:Destroy()
					end
				end
			end
		end
	end;
	Split = function(msg, key, num)
		local sep = msg:split(key)
		local rest
		local Args = {}
		for i, arg in next, sep do
			if arg == "" then
			elseif Args[num - 1] or num == 1 then
				table.insert(Args, arg)
				local tab = {}
				for z = i, #sep do
					table.insert(tab, sep[z])
				end
				rest = table.concat(tab, key)
				Args.rest = rest
				break
			elseif num > 0 then
				table.insert(Args, arg)
			end
		end
		return Args, rest
	end;
	Hint = function(message, players, time)
		local num = time and tonumber(time) or 5
		local frame = service.New("Frame")
		frame.Name = "Hint"
		frame.Active = false
		frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		frame.BackgroundTransparency = 0.5
		frame.BorderSizePixel = 0
		frame.Size = UDim2.new(1, 0, 0, 28)
		local msg = service.TextLabel(frame)
		msg.Name = "Message"
		msg.Active = false
		msg.BackgroundColor3 = Color3.new(0, 0, 0)
		msg.BackgroundTransparency = 1
		msg.Font = "SourceSansBold"
		msg.FontSize = "Size18"
		msg.Position = UDim2.new(0, 0, 0, 5)
		msg.Size = UDim2.new(1, 0, 	1, -10)
		msg.Text = message
		msg.TextColor3 = Color3.fromRGB(255, 255, 255)
		msg.TextStrokeColor3 = Color3.fromRGB(86, 86, 86)
		msg.TextStrokeTransparency = 0.9
		msg.TextWrapped = true
		for i, v in pairs(players) do
			if type(v) ~= "userdata" or not v:IsA("Player") then
				error("System error (Hint): "..tostring(v).." is not a valid player")
			end
			coroutine.wrap(function()
				local ind = tostring(v.userId)
				local sgui = SavedGuis[ind] and SavedGuis[ind].Hint
				if not (sgui and sgui.Parent) then
					sgui = service.New("ScreenGui")
					sgui.Name = "HintScreenGui"
					sgui.Parent = v:findFirstChildOfClass("PlayerGui")
				end
				if not SavedGuis[ind] then
					SavedGuis[ind] = {}
				end
				SavedGuis[ind].Hint = sgui
				local main = sgui:findFirstChild("Main") or service.New("Frame", sgui)
				main.Name = "Main"
				main.Active = false
				main.BackgroundTransparency = 1
				main.Position = UDim2.new(0, 0, 0, 0)
				main.Size = UDim2.new(1, 0, 0, 28 * 5)
				local first = main:GetChildren()[2]
				local uiList = main:findFirstChildOfClass("UIListLayout") or service.New("UIListLayout", main)
				if #main:GetChildren() >= 5 then
					if first then
						first:Destroy()
					end
				end
				local newFrame = frame:Clone()
				newFrame.Parent = main
				delay(num, function()
					newFrame:Destroy()
				end)
			end)()
		end
	end;
	Output = function(message, players, time)
		for i, v in pairs(players or {}) do
			Remote.Send(v, "Function", "Output", message, time)
		end
	end;
	Message = function(title, message, players, tim)
		local gui = service.New("ScreenGui")
		gui.Name = "MessageGui"
		gui.ResetOnSpawn = false
		local frame = service.New("Frame", gui)
		frame.BackgroundColor3 = Color3.new(0, 0, 0)
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 1
		frame.Position = UDim2.new(0, 0, 0, -50)
		frame.Size = UDim2.new(1, 0, 1, 50)
		--frame.ZIndex = 7
		local ttl = service.TextLabel(frame)
		ttl.Name = "Title"
		ttl.BackgroundTransparency = 1
		ttl.BorderSizePixel = 0
		ttl.Position = UDim2.new(0, 10, 0, 60)
		ttl.Size = UDim2.new(1, -20, 0, 30)
		--ttl.ZIndex = 7
		ttl.Font = "ArialBold"
		ttl.Text = title
		ttl.TextColor3 = Color3.new(1, 1, 1)
		ttl.TextStrokeColor3 = Color3.fromRGB(53, 53, 53)
		ttl.FontSize = "Size24"
		ttl.TextSize = 24
		ttl.TextStrokeTransparency = 1
		ttl.TextTransparency = 1
		ttl.TextWrapped = true
		local msg = service.TextLabel(frame)
		msg.Name = "Message"
		msg.BackgroundTransparency = 1
		msg.BorderSizePixel = 1
		msg.Position = UDim2.new(0, 10, 0, 95)
		msg.Size = UDim2.new(1, -20, 1, -105)
		--msg.ZIndex = 7
		msg.Font = "Arial"
		msg.Text = message
		msg.FontSize = "Size28"
		msg.TextSize = 28
		msg.TextStrokeTransparency = 1
		msg.TextTransparency = 1
		msg.TextColor3 = Color3.new(1, 1, 1)
		msg.TextStrokeColor3 = Color3.fromRGB(80, 80, 80)
		msg.TextWrapped = true

		local fadeSteps = 10
		local blurSize = 10
		local textFade = 0.1
		local strokeFade = 0.5
		local frameFade = 0.3

		local blurStep = blurSize/fadeSteps
		local frameStep = frameFade/fadeSteps
		local textStep = 0.1
		local strokeStep = 0.1

		for i, v in pairs(players) do
			if type(v) ~= "userdata" or not v:IsA("Player") then
				error("System error (Message): "..tostring(v).." is not a valid player")
			end
			coroutine.wrap(function()
				local playerGui = v:findFirstChildOfClass("PlayerGui")
				local ind = tostring(v.UserId)
				local sgui = SavedGuis[ind] and SavedGuis[ind].Message
				if sgui then
					sgui:Destroy()
				end
				if not SavedGuis[ind] then
					SavedGuis[ind] = {}
				end
				local gui = gui:Clone()
				SavedGuis[ind].Message = gui
				local frame = gui.Frame
				local ttl = frame.Title --service.TextWrap(frame.Title)
				local msg = frame.Message --service.TextWrap(frame.Message)
				gui.Parent = playerGui
				local function fadeIn()
					for i = 1,fadeSteps do
						if msg.TextTransparency>textFade then
							msg.TextTransparency = msg.TextTransparency-textStep
							ttl.TextTransparency = ttl.TextTransparency-textStep
						end
						if msg.TextStrokeTransparency>strokeFade then
							msg.TextStrokeTransparency = msg.TextStrokeTransparency-strokeStep
							ttl.TextStrokeTransparency = ttl.TextStrokeTransparency-strokeStep
						end
						if frame.BackgroundTransparency>frameFade then
							frame.BackgroundTransparency = frame.BackgroundTransparency-frameStep
						end
						wait() --service.Wait("Stepped")
					end
				end
				local function fadeOut()
					for i = 1,fadeSteps do
						if msg.TextTransparency<1 then
							msg.TextTransparency = msg.TextTransparency+textStep
							ttl.TextTransparency = ttl.TextTransparency+textStep
						end
						if msg.TextStrokeTransparency<1 then
							msg.TextStrokeTransparency = msg.TextStrokeTransparency+strokeStep
							ttl.TextStrokeTransparency = ttl.TextStrokeTransparency+strokeStep
						end
						if frame.BackgroundTransparency<1 then
							frame.BackgroundTransparency = frame.BackgroundTransparency+frameStep
						end
						wait() --service.Wait("Stepped")
					end
					gui:Destroy()
				end
				fadeIn()
				wait(tim or 5)
				if not gone then
					fadeOut()
				end
			end)()
		end
	end;
	CreateClothingFromImageId = function(clothingtype, Id)
		local Clothing = Instance.new(clothingtype)
		Clothing.Name = clothingtype
		Clothing[clothingtype == "Shirt" and "ShirtTemplate" or clothingtype == "Pants" and "PantsTemplate" or clothingtype == "ShirtGraphic" and "Graphic"] = string.format("rbxassetid://%d", Id)
		return Clothing
	end;
	Kick = function(player, ...)
		if not player then return end
		local ind = player.UserId
		for i, v in pairs(service.Env("Players"):GetPlayers()) do
			if v.UserId == ind then
				v:Kick(...)
				break
			end
		end
	end;
	Shutdown = function(reason)
		if not Core.PanicMode then
			Functions.Message("System Message", "Shutting down...", service.Players:GetPlayers(), 5)
			wait(1)
		end
		service.Players.PlayerAdded:Connect(function(plr)
			Functions.Kick(plr, "Game shutdown: "..tostring(reason or "No Reason Given"))
		end)
		for i, v in pairs(service.NetworkServer:GetChildren()) do
			service.Routine(function()
				if v and v:GetPlayer() then
					Functions.Kick(v:GetPlayer(), "Game shutdown: "..tostring(reason or "No Reason Given"))
				end
			end)
		end
	end;
	ConvertPlayerCharacterToRig2 = function(p, rigType)
		local lastAppearanceId = p.CharacterAppearanceId
		local convertAppearanceId = rigType == "R6" and 56908 or 0
		p.CharacterAppearanceId = convertApperanceId
		local desc = Players:GetHumanoidDescriptionFromUserId(lastAppearance == 0 and p.UserId or lastAppearanceId)
		pcall(function()
			p:LoadCharacterWithHumanoidDescription(desc)
		end)
		p.CharacterAppearanceId = lastAppearanceId
	end;
	ConvertPlayerCharacterToRig = function(p, rigType)
		rigType = rigType or "R15"

		if not RequiredAllowed then
			return Functions.ConvertPlayerCharacterToRig2(p, rigType)
		end

		for i, v in pairs(service.Env("Players"):GetPlayers()) do
			if v.UserId == p.UserId then
				p = v
				break
			end
		end
		local char = p.Character
		if not p.Character then
			p:LoadCharacter()
			char = p.CharacterAdded:Wait()
		end
		local head = char:FindFirstChild"Head"
		local human = char:FindFirstChildOfClass"Humanoid"

		if head then
			local rig = Assets["Rig"..rigType]:Clone() -- requires R6 and R15 in Dependencies to retrieve the Rig Models !!
			local rigHuman = rig:FindFirstChildOfClass"Humanoid"
			local origHeadCF = head.CFrame
			rig.Name = p.Name

			for a,b in pairs(char:children()) do
				if b:IsA("Accessory") or b:IsA("Pants") or b:IsA("Shirt") or b:IsA("ShirtGraphic") or b:IsA("BodyColors") then
					b.Parent = rig
				elseif b:IsA"BasePart" and b.Name == "Head" and b:FindFirstChild("face") then
					rig.Head.face.Texture = b.face.Texture
				end
			end

			p.Character = rig
			rig.Parent = service.Env("Workspace")
			rig.Head.CFrame = origHeadCF

			human.RigType = service.Env().Enum.HumanoidRigType[rigType]
			local success, desc = pcall(service.Env("Players").GetHumanoidDescriptionFromUserId, service.Env("Players"), p.CharacterAppearanceId)
			if success then 
				p.Character:findFirstChildOfClass("Humanoid"):ApplyDescription(desc)
			end
		end
	end;
	HammerKick = function(character, kickmessage, dontKick)
		character:findFirstChildOfClass("Humanoid").WalkSpeed = 0
		character:findFirstChildOfClass("Humanoid").JumpPower = 0
		local function addweld()
			if character:findFirstChild("Torso") then
				local heead = Instance.new("Weld", character.Torso)
				heead.Part0 = character.Torso
				heead.Part1 = character.Head
				heead.C0 = CFrame.new(0,1.5,0)
				heead.Name = "HeadWeld"
				wait(0.7)
				for i = 0,1 , 0.08 do
					heead.C0 = heead.C0:lerp(CFrame.new(0,1.5,0.4) * CFrame.fromEulerAnglesXYZ(1.2,0,0),i)
					wait()
				end
				wait(0.7)
				while wait() do
					heead.C0 = heead.C0 * CFrame.fromEulerAnglesXYZ(0.5,0.5,0.5)
				end
			elseif character:findFirstChild("UpperTorso") then
				local heead = Instance.new("Weld", character.UpperTorso)
				heead.Part0 = character.UpperTorso
				heead.Part1 = character.Head
				heead.C0 = CFrame.new(0,1.5,0)
				heead.Name = "HeadWeld"
				wait(0.7)
				for i = 0,1 , 0.08 do
					heead.C0 = heead.C0:lerp(CFrame.new(0,1.5,0.4) * CFrame.fromEulerAnglesXYZ(1.2,0,0),i)
					wait()
				end
				wait(0.7)
				while wait() do
					heead.C0 = heead.C0 * CFrame.fromEulerAnglesXYZ(0.5,0.5,0.5)
				end
			end
		end
		spawn(addweld)
		local banhamma = Instance.new("Part", character)
		banhamma.Size = Vector3.new(3, 10, 2)
		banhamma:BreakJoints()
		banhamma.CFrame = character.Head.CFrame * CFrame.new(0,20,0) * CFrame.fromEulerAnglesXYZ(math.pi/2,0,1)
		banhamma.Name = "ban"
		banhamma.Transparency = 1
		banhamma.Anchored = true
		local mesh = Instance.new("SpecialMesh", banhamma)
		mesh.MeshId = "http://www.roblox.com/asset/?id=10604848"
		mesh.TextureId = "http://www.roblox.com/asset/?id=10605252"
		local special = Instance.new("Sound", banhamma)
		special.SoundId = "rbxassetid://427090157"
		special.Volume = 2
		special:Play()
		for i = 1,20 do
			banhamma.Transparency = banhamma.Transparency - 0.05
			if character:findFirstChildOfClass("Humanoid") then
				character:findFirstChildOfClass("Humanoid").JumpPower = 0
				character:findFirstChildOfClass("Humanoid").WalkSpeed = 0
			end
			wait()
		end
		local hammertime = Instance.new("Sound", banhamma)
		hammertime.SoundId = "rbxassetid://176192087"
		hammertime.Volume = 3
		hammertime:Play()
		wait(1)
		if character:findFirstChild("Head") then
			local scream = Instance.new("Sound", character.Head)
			scream.SoundId = "rbxassetid://176238381"
			scream.Volume = 2
			scream:Play()
			banhamma.Anchored = false
			local angularvel = Instance.new("BodyAngularVelocity", banhamma)
			angularvel.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
			angularvel.AngularVelocity = banhamma.CFrame.rightVector * 20
			local touchedban = false
			local function touched(part)
				if part.Name == "Head" and part.Parent == character then
					touchedban = true
					local aaaaaaaa = Instance.new("Sound", banhamma)
					aaaaaaaa.SoundId = "rbxassetid://147722910"
					aaaaaaaa.Volume = 2
					aaaaaaaa:Play()
					angularvel:Destroy()
					banhamma.CanCollide = true
					for i,v in pairs(character:GetChildren()) do
						if v.ClassName == "Part" and v.Name ~= "ban" or v.ClassName == "Accessory" then
							v:destroy()
						end
					end
					local play = service.Players:GetPlayerFromCharacter(character)
					if play then
						if dontKick then
							for i,v in pairs(character:GetChildren()) do
                                if v.ClassName == "Part" and v.Name ~= "ban" or v.ClassName == "Accessory" then
                                    v:destroy()
                                end
                            end
						else
							Functions.Kick(play, "[Hammer message]: "..(kickmessage or "..."))
						end
					end
				end
			end
			banhamma.Touched:connect(touched)
			wait(2)
			if not touchedban and character:findFirstChild("Head") then
				banhamma.CFrame = character:findFirstChild("Head").CFrame
			end
		end
	end;
}

Remote = {
	PlayerData = {};
	Clients = {};
	Send = function(p, typ, cmd, ...)
		assert(p and p:IsA("Player"), "Remote.Send: ".. tostring(p) .." is not a valid Player")
		local remote = Core.RemoteEvent[p.UserId]
		remote:FireClient(p, typ, cmd, ...)
	end;
	Commands = {
		ProcessCommand = function(p, args)
			Process.Command(p, args[1], {Check = true})
		end
	}
}

Core = {
	PanicMode = false;
	DataCache = {};
	RemoteEvent = {};
	RemoteFunction = {};
	DataStore = service.DataStoreService:GetDataStore("_ADLoaderV2_");
	DS_RESET_SALTS = {
		SavedSettings = "32K5j4";
		SavedTables = "32K5j4";
	};
	DefaultData = function(p)
		return {
			Banned = false;
			TimeBan = false;
			AdminNotes = {};
			Keybinds = {};
			Client = {};
			Warnings = {};
			AdminPoints = {};
			Aliases = {};
		};
	end;
	DataStoreEncode = function(key)
		local str = tostring(key)
		local Key14 = 4887
		if not inv256 then
			inv256 = {}
			for M = 0, 127 do
				local inv = -1
				repeat inv = inv + 2
				until inv * (2*M + 1) % 256 == 1
				inv256[M] = inv
			end
		end
		local K, F = Key53, 16384 + Key14
		return (str:gsub('.', function(m)
			local L = K % 274877906944  -- 2^38
			local H = (K - L) / 274877906944
			local M = H % 128
			m = m:byte()
			local c = (m * inv256[M] - (H - M) / 128) % 256
			K = L * F + H + c + m
			return ('%02x'):format(c)
		end))
	end;
	DataStoreDecode = function(key)
		local str = tostring(key)
		local Key14 = 4887
		local K, F = Key53, 16384 + Key14
		return (str:gsub('%x%x', function(c)
			local L = K % 274877906944  -- 2^38
			local H = (K - L) / 274877906944
			local M = H % 128
			c = tonumber(c, 16)
			local m = (c + (H - M) / 128) * (2*M + 1) % 256
			K = L * F + H + c + m
			return string.char(m)
		end))
	end;
	GetData = function(key)
		if Core.DataStore then
			local ran, ret = pcall(Core.DataStore.GetAsync, Core.DataStore, Core.DataStoreEncode(key))
			if ran then
				Core.DataCache[key] = ret
				return ret
			else
				return Core.DataCache[key]
			end
		end
	end;
	GetPlayer = function(p)
		local key = tostring(p.UserId)
		local PlayerData = Core.DefaultData(p)
		if not Remote.PlayerData[key] then
			Remote.PlayerData[key] = PlayerData
			if Core.DataStore then
				local data = Core.GetData(key)
				if data and type(data) == "table" then
					for i, v in next, data do
						PlayerData[i] = v
					end
				end
			end	
		else
			PlayerData = Remote.PlayerData[key]
		end
		return PlayerData
	end;
	MakeEvent = function(p, insConsole)
		local ran, error = pcall(function()
			if server.Running then
				local ind = tostring(p.UserId)
				local rTable = {}
				local event = service.New("RemoteEvent")
				local func = service.New("RemoteFunction", {Parent = event, Name = ""})
				local secureTriggered = false
				local tripDet = math.random()

				Core.DisconnectEvent(p)
				Core.RemoteEvent[ind] = rTable
				Core.TripDet = tripDet

				event.Name = Core.Name
				event.Archivable = false

				Core.RemoteEvent[ind].Object = event
				Core.RemoteEvent[ind].Function = func

				event.Parent = service.ReplicatedStorage

				local function secure(ev, name)
					return service.RbxEvent(ev.Changed, function(p)
						if Core.RemoteEvent == rTable then
							if ev and ev == Core.RemoteEvent.Function then
								Core.RemoteEvent.Function.OnServerInvoke = Process.Remote
							end

							if p == "Name" then
								event.Name = name
							elseif tripDet == Core.TripDet and wait() and not secureTriggered then
								--print("Secure triggered");
								secureTriggered = true;
								Core.DisconnectEvent();
								Core.MakeEvent()
							end
						end
					end)
				end

				Core.RemoteEvent.Event = service.RbxEvent(event.OnServerEvent, Process.Remote)
				func.OnServerInvoke = Process.Remote

				Core.RemoteEvent.Security = secure(event, Core.Name)
				Core.RemoteEvent.FuncSec = secure(func, "");
			end
		end)

		if error then
			warn(error)
		end
	end;
	LoadExistingPlayer = function(p)
		--warn("Loading existing player: "..tostring(p))
		Process.PlayerAdded(p)
	end	
}

Admin = {
	CommandCache = {};
	PrefixCache = {};
	SpecialLevels = {};
	TempAdmins = {};
	UserIdCache = {};
	BlankPrefix = false;
	GetCommand = function(Command)
		if Admin.PrefixCache[Command:sub(1,1)] or Variables.BlankPrefix then
			local matched
			if Command:find(Settings.SplitKey) then
				matched = Command:match("^(%S+)"..Settings.SplitKey)
			else
				matched = Command:match("^(%S+)")
			end
			if matched then
				local found = Admin.CommandCache[matched:lower():sub(2)]
				if found then
					local real = Commands[found]
					if real then
						return found, real, matched
					end
				end
			end
		end
	end;	
	GetArgs = function(msg, num, ...)
		local str = table.concat({...}, Settings.SplitKey)
		local args, b  = Functions.Split(str, Settings.SplitKey, num)
		args.rest, args.REST = b, b
		return args
	end;	
	RunCommand = function(coma, ...)
		local ind, com = Admin.GetCommand(coma)
		if com then
			local cmdArgs = com.Args or com.Arguments
			local args = Admin.GetArgs(coma, #cmdArgs, ...)
			local ran, error = service.TrackTask("Command: "..tostring(coma), com.Function, false, args)
			if error then
				--logError("SERVER", "Command", error)
			end
		end
	end;
	RunCommandAsPlayer = function(coma, plr, ...)
		local ind, com = Admin.GetCommand(coma)
		if com then
			local cmdArgs = com.Args or com.Arguments
			local args = Admin.GetArgs(coma, #cmdArgs, ...)
			local adminLvl = Admin.GetLevel(plr)
			local ran, err = service.TrackTask(tostring(plr)..": "..coma, com.Function, plr, args, {PlayerData = {
				Player = plr;
				Level = adminLvl;
			}})
			if err then
				err = err:match(":(.+)$") or "Uknown error"
				Functions.Output(err, {plr})
			end
		end
	end;
	AddBan = function(plr)
		table.insert(Settings.Banned, plr.Name..":"..plr.UserId)
		if plr then
			pcall(Functions.Kick, plr, "You have been banned")
		end
	end;
	RemoveBan = function(name)
		local ret
		for i, v in pairs(Settings.Banned) do
			if tostring(v):lower():sub(1,#name) == name:lower() or name:lower() == "all" then
				table.remove(Settings.Banned, i)
				ret = v
			end
		end
		return ret
	end;
	FormatCommand = function(command)
		local text = command.Prefix..command.Command
		local cmdArgs = command.Args or command.Arguments
		local splitter = Settings.SplitKey

		for ind,arg in next,cmdArgs do
			text = text..splitter.."<"..arg..">"
		end

		return text
	end;
	GetPlayerGroup = function(p, group)
		local data = Core.GetPlayer(p)
		local groups = data.Groups
		local isID = type(group) == "number"

		if groups then
			for i,v in next,groups do
				if (isID and group == v.Id) or (not isID and group == v.Name) then
					return v
				end
			end
		end
	end;
	IsComLevel = function(testLevel, comLevel)
		if testLevel == comLevel then
			return true
		elseif type(testLevel) == "table" then
			for i,v in next,testLevel do
				if i == comLevel or v == comLevel or (type(i) == "string" and type(comLevel) == "string" and i:lower() == comLevel:lower()) then
					return i,v
				elseif type(comLevel) == "table" then
					for k,m in ipairs(comLevel) do
						if i == m or v == m or (type(i) == "string" and type(m) == "string" and i:lower() == m:lower()) then
							return i,v
						end
					end
				end
			end
		elseif type(comLevel) == "string" then
			return testLevel:lower() == comLevel:lower()
		elseif type(comLevel) == "table" then
			for i,v in ipairs(comLevel) do
				if testLevel:lower() == v:lower() then
					return true
				end
			end
		end
	end;
	CheckPermission = function(pDat, cmd)
		local allowed = false
		local p = pDat.Player
		local adminLevel = pDat.Level
		local comLevel = cmd.AdminLevel
		local isComLevel = Admin.IsComLevel

		if adminLevel >= 4 then
			return true
		elseif (Settings.PlayerCommands or adminLevel >= 1) and isComLevel("Players", comLevel) then
			return true
		elseif adminLevel >= 1 and isComLevel("Moderators", comLevel) then
			return true
		elseif adminLevel >= 2 and isComLevel("Owners", comLevel) then
			return true
		elseif adminLevel >= 3 and isComLevel("Creators", comLevel) then
			return true
		end

		return false
	end;
	DoCheck = function(p, check)
		local pType = type(p)
		local cType = type(check)
		if pType == "string" and cType == "string" then
			if p == check or check:lower():sub(1,#tostring(p)) == p:lower() then
				return true
			end
		elseif pType == "number" and (cType == "number" or tonumber(check)) then
			if p == tonumber(check) then
				return true
			end
		elseif cType == "number" then
			if p.userId == check then
				return true
			end
		elseif cType == "string" and pType == "userdata" and p:IsA("Player") then
			local isGood = p and p.Parent == service.Players
			if isGood and check:match("^Group:(.*):(.*)") then
				local sGroup,sRank = check:match("^Group:(.*):(.*)")
				local group,rank = tonumber(sGroup),tonumber(sRank)
				if group and rank then
					local pGroup = Admin.GetPlayerGroup(p, group)
					if pGroup then
						local pRank = pGroup.Rank
						if pRank == rank or (rank < 0 and pRank >= math.abs(rank)) then
							return true
						end
					end
				end
			elseif isGood and check:sub(1, 6) == "Group:" then --check:match("^Group:(.*)") then
				local group = tonumber(check:match("^Group:(.*)"))
				if group then
					local pGroup = Admin.GetPlayerGroup(p, group)
					if pGroup then
						return true
					end
				end
			elseif isGood and check:sub(1, 5) == "Item:" then --check:match("^Item:(.*)") then
				local item = tonumber(check:match("^Item:(.*)"))
				if item then
					if service.MarketPlace:PlayerOwnsAsset(p, item) then
						return true
					end
				end
			elseif p and check:sub(1, 9) == "GamePass:" then --check:match("^GamePass:(.*)") then
				local item = tonumber(check:match("^GamePass:(.*)"))
				if item then
					if service.MarketPlace:UserOwnsGamePassAsync(p.UserId, item) then
						return true
					end
				end
			elseif check:match("^(.*):(.*)") then
				local player, sUserid = check:match("^(.*):(.*)")
				local userid = tonumber(sUserid)
				if player and userid and p.Name == player or p.userId == userid then
					return true
				end
			elseif p.Name == check then
				return true
			elseif type(check) == "string" then
				local cache = Admin.UserIdCache[check]

				if cache and p.UserId == cache then
					return true
				elseif cache==false then
					return
				end

				local suc,userId = pcall(function() return service.Players:GetUserIdFromNameAsync(check) end)

				if suc and userId then
					Admin.UserIdCache[check] = userId

					if p.UserId == userId then
						return true
					end
				elseif not suc then
					Admin.UserIdCache[check] = false
				end
			end
		elseif cType == "table" and pType == "userdata" and p and p:IsA("Player") then
			if check.Group and check.Rank then
				local rank = check.Rank
				local pGroup = Admin.GetPlayerGroup(p, check.Group)
				if pGroup then
					local pRank = pGroup.Rank
					if pRank == rank or (rank < 0 and pRank >= math.abs(rank)) then
						return true
					end
				end
			end
		end
	end;
	CheckTable = function(p,tab)
		local doCheck = Admin.DoCheck
		for i,v in next,tab do
			if doCheck(p,v) then
				return true
			end
		end
	end;
	GetUpdatedLevel = function(p)
		local checkTable = Admin.CheckTable
		local doCheck = Admin.DoCheck

		if false then --Admin.IsPlaceOwner(p)
			return 5
		end

		for ind, admin in next, Admin.SpecialLevels do
			if doCheck(p, admin.Player) then
				return admin.Level
			end
		end

		local levels = {
			{ --// Blacklist
				Level = 0;
				Tables = {
					Settings.BlackList;
				}
			};
			{ --// Creators
				Level = 3;
				Tables = {
					Settings.Creators;
				}
			};
			{ --// Owners
				Level = 2;
				Tables = {
					Settings.Owners;
				}
			};
			{ --// Moderators
				Level = 1;
				Tables = {	
					Settings.Moderators;
				}
			}
		}

		for i = 1,#levels do
			local level = levels[i]
			if level then
				for ind, tab in next, level.Tables do
					if checkTable(p, tab) then
						return level.Level
					end
				end
			end
		end

		return 0
	end;
	UpdateCachedLevel = function(p)
		local data = Core.GetPlayer(p)
		data.Groups = service.GroupService:GetGroupsAsync(p.UserId) or {}
		data.AdminLevel = Admin.GetUpdatedLevel(p)
		data.LastLevelUpdate = tick()
		return data.AdminLevel
	end;
	LevelToList = function(lvl)
		return ({
			[1] = Settings.Moderators;
			[2] = Settings.Owners;
			[3] = Settings.Creators;
		})[lvl]
	end;
	LevelToListName = function(lvl)
		return ({
			[0] = "Players";
			[1] = "Moderators";
			[2] = "Owners";
			[3] = "Creators";
		})[lvl]
	end;
	GetLevel = function(p)
		local data = Core.GetPlayer(p)
		local level = data.AdminLevel
		local lastUpdate = data.LastLevelUpdate
		local clients = Remote.Clients

		if clients[tostring(p.UserId)] and not level or not lastUpdate or tick()-lastUpdate > 60 then
			Admin.UpdateCachedLevel(p)
			if level and data.AdminLevel and type(p) == "userdata" and p:IsA("Player") then
				if data.AdminLevel < level then
					Functions.Hint("Your admin level has been reduced to "..data.AdminLevel.." ["..Admin.LevelToListName(data.Adminlevel) or "Unknown".."]", {p})
				elseif data.AdminLevel > level then
					Functions.Hint("Your admin has been increased to "..data.AdminLevel.." ["..Admin.LevelToListName(data.AdminLevel) or "Unknown", {p})
				end
			end
		end

		return data.AdminLevel or 0
	end;
	SetLevel = function(p, level)
		local current = Admin.GetLevel(p)
		local list = Admin.LevelToList(current)
		if tonumber(level) then
			if current>4 then
				return false
			else
				Admin.SpecialLevels[tostring(p.UserId)] = {Player = p.userId, Level = level}
			end
		elseif level == "Reset" then
			Admin.SpecialLevels[tostring(p.UserId)] = nil
		end
		Admin.UpdateCachedLevel(p)
	end;
	CheckAdmin = function(p)
		local level = Admin.GetLevel(p)
		if level>0 then
			return true
		else
			return false
		end
	end;
}

Process = {
	Command = function(p, msg, opts, noYield)
		local Admin = Admin
		local Functions = Functions
		local Process = Process
		local Logs = Logs
		local opts = opts or {}

		msg = Functions.Trim(msg)

		if msg:match(Settings.BatchKey) then
			for cmd in msg:gmatch("[^"..Settings.BatchKey.."]+") do
				local cmd = Functions.Trim(cmd)
				local waiter = Settings.PlayerPrefix.."wait"
				if cmd:lower():sub(1,#waiter) == waiter then
					local num = cmd:sub(#waiter + 1)
					if num and tonumber(num) then
						wait(tonumber(num))
					end
				else
					Process.Command(p, cmd, opts, false)
				end
			end
		else
			local pData = opts.PlayerData or (p and Core.GetPlayer(p))
			--local msg = (pData and Admin.AliasFormat(pData.Aliases, msg)) or msg
			local index, command, matched = Admin.GetCommand(msg)

			if not command then
				if opts.Check then
					Functions.Output(msg.." is not a valid command.", {p})
				end
			else
				local allowed = false
				local isSystem = false
				local pDat = {
					Player = opts.Player or p;
					Level = opts.AdminLevel or Admin.GetLevel(p);
				}

				if opts.isSystem or p == "SYSTEM" then
					isSystem = true
					allowed = true
					p = p or "SYSTEM"
				else
					allowed = Admin.CheckPermission(pDat, command)
				end

				if allowed and opts.Chat and command.Chattable == false then
					Functions.Output("You are not permitted this in chat: "..tostring(msg), {p})
					return
				end

				if allowed then
					if not command.Disabled then
						local cmdArgs = command.Args or command.Arguments
						local argString = msg:match("^.-"..Settings.SplitKey..'(.+)') or ''
						local args = (opts.Args or opts.Arguments) or (#cmdArgs > 0 and Functions.Split(argString, Settings.SplitKey, #cmdArgs)) or {}
						local taskName = "Command:: "..tostring(p)..": ("..msg..")"
						local commandId = "Command_"..math.random()
						local running = true

						if noYield then
							taskName = "Thread: "..taskName
						end

						local ran, error = service.TrackTask(taskName, command.Function, p, args, {PlayerData = pDat, Options = opts})
						if not opts.IgnoreErrors then
							if error and type(error) == "string" then 
								error =  (error and tostring(error):match(":(.+)$")) or error or "Unknown error"
								if not isSystem then 
									Functions.Output(error, {p})
								end 
							elseif error and type(error) ~= "string" then
								if not isSystem then 
									Functions.Output("There was an error but the error was not a string? "..tostring(error), {p}) 
								end 
							end
						end
					else
						if not isSystem and not opts.NoOutput then
							Functions.Output("This command has been disabled.", {p})
						end
					end
				else
					if not isSystem and not opts.NoOutput then
						Functions.Output('You are not allowed to run '..msg, {p})
					end 
				end
			end
		end
	end;
	Remote = function(p, com, ...)
		local args = {...}
		local command = Remote.Commands[tostring(com)]
		if command then
			local rets = {service.TrackTask("Remote: "..tostring(p)..": "..tostring(com), command, p, args)}
			if not rets[1] then
				--logError(p, tostring(com)..": "..tostring(rets[2]))
			else
				return {unpack(rets, 2)}
			end
		end
	end;
	PlayerAdded = function(p)
		local key = tostring(p.UserId)
		local keyData = {
			Player = p;
			Key = Functions:GetRandom();
			Decoy1 = Functions:GetRandom();
			Decoy2 = Functions:GetRandom();
			Cache = {};
			Sent = 0;
			Received = 0;
			LastUpdate = tick();
			FinishedLoading = false;
			LoadingStatus = "WAITING_FOR_KEY";
		}

		Remote.PlayerData[key] = nil
		Remote.Clients[key] = keyData

		spawn(function()
			local playerGui = p:FindFirstChildOfClass("PlayerGui") or p:WaitForChild("PlayerGui", 600);
			if playerGui then
				playerGui.Changed:Connect(function()
					if playerGui.Name ~= "PlayerGui" then
						playerGui.Name = "PlayerGui";
					end
				end)
			end
		end)

		local PlayerData = Core.GetPlayer(p)
		local level = Admin.GetLevel(p)
		local banned, reason = nil --Admin.CheckBan(p)
		local removed = false

		if banned then
			Functions.Kick(p, Variables.BanMessage.. " | Reason: "..(reason or "No reason provided"))
			removed = true
		end

		if Variables.ServerLock and level < 1 and not removed then
			Functions.Kick(p, Variables.LockMessage)
			removed = true
		end

		if not removed then
			if Remote.Clients[key] then
				--Core.HookClient(p)
				--p.CharacterAdded:Connect(function(c)
				--	service.TrackTask(tostring(p)..": CharacterAdded", Process.CharacterAdded, p)
				--end)
			end
		end
	end
}

Assets = {}

local MainModule
local success, err = pcall(function()
	MainModule = require(6505718551)
end)
if not success then
	RequireAllowed = false
end

do
	if RequireAllowed then
		local require = service.Env().require
		pcall(function()
			Assets.RigR15 = getfenv(require(3239236979).Initialize).script.Server.Assets.RigR15:Clone()
			Assets.RigR6 = getfenv(require(3239236979).Initialize).script.Server.Assets.RigR6:Clone()
		end)
	end

	local UFO = service.New("Model", {
		Name = "UFO";
	})
	local Bay = service.New("Part", {
		Name = "Bay";
		Color = Color3.fromRGB(134, 255, 245);
		Material = "Neon";
		CFrame = CFrame.new(-214.836, 38.795, -36.346, 1, 0, 0, 0, 1, 0, 0, 0, 1);
		Anchored = true;
		CanCollide = false;
		Size = Vector3.new(8.477, 3.242, 7.417);
		TopSurface = "Smooth";
		BottomSurface = "Smooth";
		Parent = UFO;
	}) do
		local nk = NumberSequenceKeypoint.new
		local ns = NumberSequence.new
		local csk = ColorSequenceKeypoint.new
		local particleEmitter = service.New("ParticleEmitter", {
			Color = ColorSequence.new({csk(0, Color3.fromRGB(147, 39, 255)), csk(1, Color3.fromRGB(147, 39, 255))});
			LightEmission = 1;
			LightInfluence = 1;
			Orientation = "FacingCamera";
			Size = ns({nk(0, 30), nk(1, 30)});
			Texture = "rbxassetid://173642823";
			Transparency = ns({nk(0, 1), nk(0.052, 0), nk(0.928, 0), nk(1, 1)});
			ZOffset = 0;
			Drag = 0;
			Acceleration = Vector3.new(0, 0, 0);
			LockedToPart = false;
			TimeScale = 1;
			VelocityInheritance = 0;
			EmissionDirection = "Top";
			Enabled = true;
			Lifetime = NumberRange.new(2.5, 2.5);
			Rate = 10;
			RotSpeed = NumberRange.new(10, 15);
			Rotation = NumberRange.new(0, 135);
			Speed = NumberRange.new(0, 0);
			SpreadAngle = Vector2.new(0, 0);
			Parent = Bay;
		})
	end
	local BeamPart = service.New("Part", {
		Name = "BeamPart";
		Color = Color3.new(1, 1, 1);
		Material = "Neon";
		Transparency = 0.5;
		CFrame = CFrame.new(-214.664, 21.556, -36.463, -1, 0, 0.017, 0, 1, 0, -0.017, 0, -1);
		Anchored = true;
		CanCollide = false;
		Size = Vector3.new(4.238, 41.536, 4.238);
		TopSurface = "Smooth";
		BottomSurface = "Smooth";
		Parent = UFO;
	}) do
		local nk = NumberSequenceKeypoint.new
		local ns = NumberSequence.new
		local csk = ColorSequenceKeypoint.new
		local particleEmitter = service.New("ParticleEmitter", {
			Color = ColorSequence.new({csk(0, Color3.fromRGB(195, 15, 255)), csk(1, Color3.fromRGB(195, 15, 255))});
			LightEmission = 1;
			LightInfluence = 1;
			Orientation = "FacingCamera";
			Size = ns({nk(0, 10), nk(1, 10)});
			Texture = "rbxassetid://173642823";
			Transparency = ns({nk(0, 1), nk(0.052, 0), nk(0.928, 0), nk(1, 1)});
			ZOffset = 0;
			Drag = 0;
			Acceleration = Vector3.new(0, 0, 0);
			LockedToPart = false;
			TimeScale = 1;
			VelocityInheritance = 0;
			EmissionDirection = "Top";
			Enabled = true;
			Lifetime = NumberRange.new(2.5, 2.5);
			Rate = 10;
			RotSpeed = NumberRange.new(10, 15);
			Rotation = NumberRange.new(0, 135);
			Speed = NumberRange.new(0, 0);
			SpreadAngle = Vector2.new(0, 0);
			Parent = BeamPart;
		})
	end
end

Commands = setmetatable({}, {__newindex = function(self, index, value)
	rawset(self, index, value)
	Admin.CommandCache[value.Command] = index
	Admin.PrefixCache[value.Prefix] = true
	for i, v in pairs(value.Aliases) do
		Admin.CommandCache[v] = index
	end
end})

--= SERVER =--

server = {
	Running = true,
	service = service,
	Functions = Functions,
	Admin = Admin,
	Core = Core,
	Remote = Remote,
	Commands = Commands,
	Process = Process,
	Variables = Variables,
	Assets = Assets
}

service.GetPlayers = Functions.GetPlayers
service.Routine = Routine

if shared.MapBackup and typeof(shared.MapBackup) == "Instance" and shared.MapBackup:IsA("Model") then
	Variables.MapBackup = shared.MapBackup
end
if shared.TerrainMapBackup and typeof(shared.TerrainMapBackup) == "Instance" and shared.TerrainMapBackup:IsA("TerrainRegion") then
	Variables.TerrainMapBackup = shared.TerrainMapBackup
end

for index, player in next, service.Players:GetPlayers() do
	service.TrackTask("Thread: LoadPlayer ".. tostring(player.Name), server.Core.LoadExistingPlayer, player);
end

--// Events
service.RbxEvent(service.Players.PlayerAdded, service.EventTask("PlayerAdded", server.Process.PlayerAdded))

function cPcall(func, ...)
	local function cour(...)
		coroutine.resume(coroutine.create(func), ...)
	end
	local ran, err = pcall(cour, ...)
	if err then
		warn(":: AD_Error :: "..err)
	end
end

function fWeld(zName, zParent, zPart0, zPart1, zCoco, A, B, C, D, E, F)
	local funcw = service.New('Weld') funcw.Name = zName funcw.Parent = zParent funcw.Part0 = zPart0 funcw.Part1 = zPart1
	if (zCoco) then
		funcw.C0 = CFrame.new(A, B, C) * CFrame.fromEulerAnglesXYZ(D, E, F)
	else
		funcw.C1 = CFrame.new(A, B, C) * CFrame.fromEulerAnglesXYZ(D, E, F)
	end
	return funcw
end

--[==[STARTER COMMANDS]==]--

function addCmd(cmd, aliases, args, func, data)
	local info = {
		Command = (type(cmd) == "string") and cmd or error("The name of a command is needed to run");
		Aliases = aliases or {};
		Arguments = args or {};
		Function = func or error("No function detected");
		Prefix = Settings.Prefix;
		AdminLevel = "Moderators";
	}
	if data and type(data) == "table" then
		for i, v in next, data do
			info[i] = v
		end
	end
	Commands[info.Command] = info
	return info
end

--[[
//Example:
addCmd("print", {}, {"message"}, function(speaker, args, pData)
	print(speaker.Name.." says: "..args.rest)
end)
]]

addCmd("respawn", {"re"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		v:LoadCharacter()
	end
end)
addCmd("kill", {}, {"player"}, function(speaker, args)
	for i, plr in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local char = plr.Character
		if char then
			char:BreakJoints()	
		end
	end
end)
addCmd("ggrav", {"gamegrav","workspacegrav"}, {"number or fix"}, function(speaker, args)
	local num = tonumber(args[1])
	if num then
		workspace.Gravity = num
	else
		workspace.Gravity = 196.2
	end
end)
addCmd("insert", {"ins"}, {"id"}, function(speaker, args)
	local id = args[1]:lower()
	for i, v in pairs(Variables.InsertList) do
		if id == v.Name:lower() then
			id = v.ID
			break
		end
	end
	local obj = service.Insert(tonumber(id), true)
	if obj then
		obj.Parent = service.Workspace
		pcall(function() obj:MakeJoints() end)
		if speaker.Character then
			obj:MoveTo(speaker.Character:GetModelCFrame().p)
		end
	end
end)
addCmd("sit", {"seat"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid") or nil
		if hum then
			hum.Sit = true
		end
	end
end)
addCmd("jump", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid") or nil
		if hum then
			hum.Jump = true
		end
	end
end)
addCmd("stun", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid") or nil
		if hum then
			hum.PlatformStand = true
		end
	end
end)
addCmd("unstun", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid") or nil
		if hum then
			hum.PlatformStand = false
		end
	end
end)
addCmd("music", {"song", "playsong"}, {"id";"noloop(true/false)";"pitch";"volume"}, function(speaker, args)
	for i, v in pairs(workspace:GetChildren()) do
		if v.Name == "AD_SOUND" and v:IsA("Sound") then
			v:Destroy()
		end
	end

	local id = args[1]:lower()
	local looped = args[2]
	local pitch = tonumber(args[3]) or 1
	local mp = service.MarketPlace
	local volume = tonumber(args[4]) or 1
	local name = 'Invalid ID '

	if id ~= "0" and id ~= "off" then
		if looped then
			if looped == "true" then
				looped = false
			else
				looped = true
			end
		else
			looped = true
		end

		for i,v in pairs(Variables.MusicList) do
			if id==v.Name:lower() then
				id = v.ID
				if v.Pitch then
					pitch = v.Pitch
				end
				if v.Volume then
					volume=v.Volume
				end
			end
		end

		pcall(function()
			if mp:GetProductInfo(id).AssetTypeId == 3 then
				name = "Now playing "..mp:GetProductInfo(id).Name
			end
		end)

		local s = service.New("Sound")
		s.Name = "AD_SOUND"
		s.Parent = workspace
		s.SoundId = "rbxassetid://"..id
		s.Volume = volume
		s.Pitch = pitch
		s.Looped = looped
		s.Archivable = false
		wait(0.5)
		s:Play()

		if name == "Invalid ID" then
			error("Invalid ID", 0)
		else
			Functions.Hint(name, service.Players:GetPlayers())
		end
	end
end)
addCmd("stopmusic", {"musicoff"}, {}, function(speaker, args)
	for i, v in pairs(workspace:GetChildren()) do
		if v.Name == "AD_SOUND" and v:IsA("Sound") then
			v:Destroy()
		end
	end
end)
addCmd("pitch", {}, {"number"}, function(speaker, args)
	local pitch = args[1]
	for i, v in pairs(service.Workspace:GetChildren()) do
		if v.Name == "AD_SOUND" then
			if args[1]:sub(1,1) == "+" then
				v.Pitch = v.Pitch + tonumber(args[1]:sub(2))
			elseif args[1]:sub(1,1) == "-" then
				v.Pitch = v.Pitch - tonumber(args[1]:sub(2))
			else
				v.Pitch = pitch
			end
		end
	end
end)
addCmd("volume", {}, {"number"}, function(speaker, args)
	local volume = tonumber(args[1])
	if volume then
		for i, v in pairs(workspace:GetChildren()) do
			if v.Name == "AD_SOUND" and v:IsA("Sound") then
				if args[1]:sub(1,1) == "+" then
					v.Volume=v.Volume+tonumber(args[1]:sub(2))
				elseif args[1]:sub(1,1) == "-" then
					v.Volume=v.Volume-tonumber(args[1]:sub(2))
				else
					v.Volume = volume 
				end
			end
		end
	end
end)
addCmd("jail", {"imprison"}, {"player"}, function(speaker, args)
	for i, plr in pairs(service.GetPlayers(args.rest, speaker, true)) do
		if plr.Character and plr.Character:findFirstChild("HumanoidRootPart") then
			local cf = CFrame.new(plr.Character.HumanoidRootPart.CFrame.p + Vector3.new(0, 1, 0))
			local origpos = plr.Character.HumanoidRootPart.Position

			local mod = service.New("Model", service.Workspace)
			mod.Name = plr.Name.."_ADJAIL"
			local top = service.New("Part", mod)
			top.Locked = true
			--top.formFactor = "Symmetric"
			top.Size = Vector3.new(6,1,6)
			top.TopSurface = 0
			top.BottomSurface = 0
			top.Anchored = true
			top.CanCollide = true;
			top.BrickColor = BrickColor.new("Really black")
			top.Transparency = 1
			top.CFrame = cf * CFrame.new(0,3.5,0)
			local bottom = top:Clone()
			bottom.Transparency = 0
			bottom.Parent = mod
			bottom.CanCollide = true
			bottom.CFrame = cf * CFrame.new(0,-3.5,0)
			local front = top:Clone()
			front.Transparency = 1
			front.Reflectance = 0
			front.Parent = mod
			front.Size = Vector3.new(6,6,1)
			front.CFrame = cf * CFrame.new(0,0,-3)
			local back = front:Clone()
			back.Transparency = 1
			back.Parent = mod
			back.CFrame = cf * CFrame.new(0,0,3)
			local right = front:Clone()
			right.Transparency = 1
			right.Parent = mod
			right.Size = Vector3.new(1,6,6)
			right.CFrame = cf * CFrame.new(3,0,0)
			local left = right:Clone()
			left.Transparency = 1
			left.Parent = mod
			left.CFrame = cf * CFrame.new(-3,0,0)
			local msh = service.New("BlockMesh", front)
			msh.Scale = Vector3.new(1,1,0)
			local msh2 = msh:Clone()
			msh2.Parent = back
			local msh3 = msh:Clone()
			msh3.Parent = right
			msh3.Scale = Vector3.new(0,1,1)
			local msh4 = msh3:Clone()
			msh4.Parent = left
			local brick = service.New('Part',mod)
			local box = service.New('SelectionBox',brick)
			box.Adornee = brick
			box.Color = BrickColor.new('White')
			brick.Anchored = true
			brick.CanCollide = false
			brick.Transparency = 1
			brick.Size = Vector3.new(5,7,5)
			brick.CFrame = cf

			local value = service.New("StringValue", mod)
			value.Name = "Player"
			value.Value = plr.Name

			plr.Character.HumanoidRootPart.CFrame = cf

			local ind = tostring(plr.UserId)
			local jail = {
				Player = plr;
				Name = plr.Name;
				Index = ind;
				Jail = mod;
				Tools = {};
			}

			Variables.Jails[ind] = jail

			--[[
			for l, k in pairs(plr.Backpack:GetChildren()) do
				if k:IsA("Tool") or k:IsA("HopperBin") then
					table.insert(jails.Tools, k)
				end
			end
			--]]

			service.TrackTask("Thread: JailLoop"..tostring(ind), function()
				while wait() and Variables.Jails[ind] == jail and mod.Parent == service.Workspace do
					if Variables.Jails[ind] == jail and plr.Parent == service.Players then
						if plr.Character then
							local torso = plr.Character:findFirstChild("HumanoidRootPart")
							if torso then
								for l, k in pairs(plr.Backpack:GetChildren()) do
									if k:IsA("Tool") or k:IsA("HopperBin") then
										table.insert(jail.Tools, k)
									end
								end
								if (torso.Position - origpos).magnitude > 3.3 then
									torso.CFrame = cf
								end
							end
						end
					elseif Variables.Jails[ind] ~= jail then
						mod:Destroy()
						break
					end
				end
				mod:Destroy()
			end)		
		end
	end
end)
addCmd("unjail", {"free";"release"}, {"player"}, function(speaker, args)
	local found = false
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local ind = tostring(v.UserId)
		local jail = Variables.Jails[ind]
		if jail then
			pcall(function() jail.Jail:Destroy() end)
			Variables.Jails[ind] = nil
			found = true
		end
	end
end)
addCmd("char", {"character";"appearance"}, {"player";"ID or player"}, function(speaker, args)
	local ind = tonumber(args.rest:match("^userid%-(%d*)")) or service.GetUserIdFromName(args.rest)
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		v.CharacterAppearanceId = ind or v.UserId
		local torso = v.Character and v.Character:findFirstChild("HumanoidRootPart") or nil
		if torso then
			local cf = torso.CFrame
			v:LoadCharacter()
			local char = v.Character or v.CharacterAdded:Wait()
			local newTorso = char:findFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
			newTorso.CFrame = cf
		else
			v:LoadCharacter()
		end
	end
end)
addCmd("unchar", {"uncharacter";"fixappearance"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		v.CharacterAppearanceId = v.UserId
		local torso = v.Character and v.Character:findFirstChild("HumanoidRootPart") or nil
		if torso then
			local cf = torso.CFrame
			v:LoadCharacter()
			local char = v.Character or v.CharacterAdded:Wait()
			local newTorso = char:findFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
			newTorso.CFrame = cf
		else
			v:LoadCharacter()
		end
	end
end)
addCmd("damage", {"hurt"}, {"player", "number"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid") or nil
		if hum then
			hum:TakeDamage(args[2])
		end
	end
end)
addCmd("health", {"sethealth"}, {"player", "number"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid") or nil
		if hum then
			hum.MaxHealth = args[2]
			hum.Health = hum.MaxHealth
		end
	end
end)
addCmd("god", {"inmortal"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid") or nil
		if hum then
			hum.MaxHealth = math.huge
			hum.Health = 9e9
		end
	end
end)
addCmd("ungod", {"mortal"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid") or nil
		if hum then
			hum.MaxHealth = 100
			hum.Health = hum.MaxHealth
		end
	end
end)
addCmd("ff", {"forcefield"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		service.New("ForceField", v.Character)
	end
end)
addCmd("unff", {"unforcefield"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		if v.Character then
			for z, cl in pairs(v.Character:GetChildren()) do
				if cl:IsA("ForceField") then cl:Destroy() end
			end
		end
	end
end)
addCmd("tp", {"teleport", "transport"}, {"player1", "player2"}, function(speaker, args)
	if args[2]:match("^waypoint%-(.*)") or args[2]:match("wp%-(.*)") then
		local m = args[2]:match("^waypoint%-(.*)") or args[2]:match("wp%-(.*)")
		local point
		for i, v in pairs(Variables.Waypoints) do
			if i:lower():sub(1, #m) == m:lower() then
				point = v
			end
		end
		for i, v in pairs(service.GetPlayers(args[1], speaker)) do
			if point then
				if v.Character then
					v.Character:MoveTo(point)
				end
			end
		end
	elseif args[2]:find(",") then
		local x, y, z = args[2]:match('(.*),(.*),(.*)')
		for i, v in pairs(service.GetPlayers(args[1], speaker)) do
			local char = v.Character
			if char then
				local hum = char:findFirstChildOfClass("Humanoid")
				if hum then
					if hum.SeatPart~=nil then
						Functions.RemoveSeatWelds(hum.SeatPart)
					end
					if hum.Sit then
						hum.Sit = false
						hum.Jump = true
					end
				end
				spawn(function()
					char:MoveTo(Vector3.new(tonumber(x), tonumber(y), tonumber(z)))
				end)
			end
		end
	else
		for i, plr1 in pairs(service.GetPlayers(args[1], speaker)) do
			for k, plr2 in pairs(service.GetPlayers(args.rest, speaker)) do
				if plr1.Character and plr2.Character then
					local hum = plr2.Character:findFirstChildOfClass("Humanoid")
					if hum and hum.SeatPart ~= nil then
						Functions.RemoveSeatWelds(hum.SeatPart)
					end
					if hum and hum.Sit then
						hum.Sit = false
						hum.Jump = true
						wait()
					end
					local sHum = plr1.Character.HumanoidRootPart
					local pHum = plr2.Character.HumanoidRootPart
					sHum.CFrame = (pHum.CFrame * CFrame.Angles(0, math.rad(180), 0)) * CFrame.new(0, 0, 5.2)
				end
			end
		end
	end
end)
addCmd("bring", {"tptome"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		Admin.RunCommand(Settings.Prefix.."tp", v.Name, speaker.Name)
	end
end)
addCmd("to", {"tpmeto"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		Admin.RunCommand(Settings.Prefix.."tp", speaker.Name, v.Name)
	end
end)
addCmd("freefall", {"skydive"}, {"player";"height"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		if v.Character and v.Character:findFirstChild("HumanoidRootPart") then
			v.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame + Vector3.new(0, tonumber(args[2]),  0)
		end
	end
end)
addCmd("waypoint", {"wp";"checkpoint"}, {"name"}, function(speaker, args)
	local name = args[1] or tostring(#Variables.Waypoints + 1)
	if speaker.Character and speaker.Character:findFirstChild("HumanoidRootPart") then
		Variables.Waypoints[name] = speaker.Character.HumanoidRootPart.Position
		Functions.Hint("Made waypoint "..name.." | "..tostring(Variables.Waypoints[name]), {speaker})
	end
end)
addCmd("delwaypoint", {"delwp";"delcheckpoint";"deletewaypoint";"deletewp";"deletecheckpoint"}, {"name"}, function(speaker, args)
	for i, v in pairs(Variables.Waypoints) do
		if i:lower():sub(1,#args[1])==args[1]:lower() or args[1]:lower()=='all' then
			Variables.Waypoints[i] = nil
			Functions.Hint('Deleted waypoint '..i, {speaker})
		end
	end
end)
addCmd("removehats", {"nohats"}, {"player"}, function(speaker, args)
	for k, p in pairs(service.GetPlayers(args.rest, speaker, true)) do
		for i, v in pairs(p.Character and p.Character:GetChildren() or {}) do
			if v:IsA("Accoutrement") then
				v:Destroy()
			end
		end
	end
end)
addCmd("resize", {"size"}, {"player";"mult"}, function(speaker, args)
	local num = tonumber(args[2]) or 1

	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		coroutine.resume(coroutine.create(function()
			local char = v.Character
			local human = char and char:findFirstChildOfClass("Humanoid")
			local ScaleValues = {BodyDepthScale=true;BodyHeightScale=true;BodyWidthScale=true;HeadScale=true;}

			if human and human.RigType == Enum.HumanoidRigType.R15 then
				for k, val in next, human:GetChildren() do
					if val:IsA("NumberValue") and val.Name:match(".*Scale") then
						val.Value = val.Value * num
					end
				end
			elseif human and human.RigType == Enum.HumanoidRigType.R6 then
				local Motors = {}
				local Percent = num
				table.insert(Motors, char.HumanoidRootPart.RootJoint)
				for i,Motor in pairs(char.Torso:GetChildren()) do
					if Motor:IsA("Motor6D") then
						table.insert(Motors, Motor)
					end
				end
				for i,v in pairs(Motors) do
					v.C0 = CFrame.new((v.C0.Position * Percent)) * (v.C0 - v.C0.Position)
					v.C1 = CFrame.new((v.C1.Position * Percent)) * (v.C1 - v.C1.Position)
				end


				for i,Part in pairs(char:GetChildren()) do
					if Part:IsA("BasePart") then
						Part.Size = Part.Size * Percent
					end
				end


				for i,Accessory in pairs(char:GetChildren()) do
					if Accessory:IsA("Accessory") then
						local weld = Accessory.Handle.AccessoryWeld
						local mesh = Accessory.Handle:findFirstChildOfClass("SpecialMesh")

						weld.C0 = CFrame.new((weld.C0.Position * Percent)) * (weld.C0 - weld.C0.Position)
						weld.C1 = CFrame.new((weld.C1.Position * Percent)) * (weld.C1 - weld.C1.Position)

						if mesh then
							mesh.Scale = mesh.Scale * Percent
						end
					end
				end
			end
		end))
	end
end)
addCmd("refresh", {"reset"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local torso = v.Character and v.Character:findFirstChild("HumanoidRootPart") or nil
		if torso then
			local lastPos = torso.CFrame
			v:LoadCharacter()
			local char = v.Character or v.CharacterAdded:Wait()
			char:findFirstChild("HumanoidRootPart").CFrame = lastPos
		else
			v:LoadCharacter()
		end
	end
end)
addCmd("invisible", {}, {"player"}, function(speaker, args)
	for i, v in next, service.GetPlayers(args.rest, speaker, true) do
		if v.Character then
			for k, obj in next, v.Character:GetChildren() do
				if obj:IsA("BasePart") then
					obj.Transparency = 1
					if obj:findFirstChild("face") and obj.face:IsA("Decal") then
						obj.face.Transparency = 1
					end
				elseif obj:IsA("Accoutrement") and obj:findFirstChild("Handle") then
					obj.Handle.Transparency = 1
				elseif obj:IsA("ForceField") then
					obj.Visible = false
				elseif obj.Name == "Head" then
					local face = obj:findFirstChild("face")
					if face and face:IsA("Decal") then
						face.Transparency = 1
					end
				end
			end
		end
	end
end)
addCmd("visible", {}, {"player"}, function(speaker, args)
	for i, v in next, service.GetPlayers(args.rest, speaker, true) do
		if v.Character then
			for k, obj in next, v.Character:GetChildren() do
				if obj:IsA("BasePart") and obj.Name ~= "HumanoidRootPart" then
					obj.Transparency = 0
					if obj:findFirstChild("face") and obj.face:IsA("Decal") then
						obj.face.Transparency = 0
					end
				elseif obj:IsA("Accoutrement") and obj:findFirstChild("Handle") then
					obj.Handle.Transparency = 0
				elseif obj:IsA("ForceField") then
					obj.Visible = true
				elseif obj.Name == "Head" then
					local face = obj:findFirstChild("face")
					if face and face:IsA("Decal") then
						face.Transparency = 0
					end
				end
			end
		end
	end
end)
addCmd("name", {"rename"}, {"player", "name/hide"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		if v.Character and v.Character:findFirstChild("Head") then
			for a, mod in pairs(v.Character:children()) do
				if mod:findFirstChild("NameTag") then
					v.Character.Head.Transparency = 0
					mod:Destroy()
				end
			end

			local char = v.Character
			local head = char:FindFirstChild('Head')
			local mod = service.New("Model", char)
			local cl = char.Head:Clone()
			local hum = service.New("Humanoid", mod)
			mod.Name = args.rest or ''
			cl.Parent = mod
			hum.Name = "NameTag"
			hum.MaxHealth=v.Character.Humanoid.MaxHealth
			wait()
			hum.Health=v.Character.Humanoid.Health

			if args.rest and args.rest:lower()=='hide' then
				mod.Name = ''
				hum.MaxHealth = 0
				hum.Health = 0
			else
				v.Character.Humanoid.Changed:connect(function(c)
					hum.MaxHealth = v.Character.Humanoid.MaxHealth
					wait()
					hum.Health = v.Character.Humanoid.Health
				end)
			end

			cl.CanCollide = false
			local weld = service.New("Weld", cl) weld.Part0 = cl weld.Part1 = char.Head
			char.Head.Transparency = 1
		end
	end
end)
addCmd("unname", {"fixname"}, {"player"}, function(speaker, args)
	for i,v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		if v.Character and v.Character:findFirstChild("Head") then
			for a, mod in pairs(v.Character:children()) do
				if mod:findFirstChild("NameTag") then
					v.Character.Head.Transparency = 0
					mod:Destroy()
				end
			end
		end
	end
end)
addCmd("displayname", {"dname"}, {"player";"name/hide"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		local char = v.Character
		local human = char and char:findFirstChildOfClass("Humanoid")
		if human then
			if args.rest:lower() == 'hide' then
				human.DisplayName = ' '
			else
				human.DisplayName = args.rest
			end
		end
	end
end)
addCmd("undisplayname", {"undname"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local char = v.Character
		local human = char and char:findFirstChildOfClass("Humanoid")
		if human then
			human.DisplayName = v.DisplayName
		end
	end
end)
addCmd("color", {"bodycolor"}, {"player";"color"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		for k, c in pairs(v.Character and v.Character:GetChildren() or {}) do
			if c:IsA("BasePart") and c.Name ~= "HumanoidRootPart" then
				c.BrickColor = BrickColor.new(tonumber(args.rest) or args.rest)
			end
		end
	end
end)
addCmd("s", {"scr";"script";"makescript"}, {"code"}, function(speaker, args)
	if not RequireAllowed then error("Unable to use this command", 0) end
	local makeScript = MainModule.NS
	if makeScript then
		makeScript([[owner = game:GetService("Players")["]]..speaker.Name..[["] ]]..args.rest, service.Env("ServerScriptService"))
		Functions.Hint("Ran Script", {speaker})
	else
		error("Unable to use this command", 0)
	end
end)
addCmd("ls", {"lscr";"localscript"}, {"code"}, function(speaker, args)
	if not RequireAllowed then error("Unable to use this command", 0) end
	local makeLocal = MainModule.NLS
	if makeLocal then
		makeLocal([[owner = game:GetService("Players").LocalPlayer ]]..args.rest, service.Env("Players")[speaker.Name]:findFirstChildOfClass("PlayerGui"))
		Functions.Hint("Ran LocalScript", {speaker})
	else
		error("Unable to use this command", 0)
	end
end)
addCmd("cs", {"cscr";"clientscript"}, {"player";"code"}, function(speaker, args)
	if not RequireAllowed then error("Unable to use this command", 0) end
	local makeLocal = MainModule.NLS
	if makeLocal then
		for i, v in next, service.GetPlayers(args[1], speaker) do
			makeLocal([[owner = game:GetService("Players").LocalPlayer ]]..args.rest, service.Env("Players")[v.Name]:findFirstChildOfClass("PlayerGui"))
			Functions.Hint("Ran LocalScript on "..v.Name, {speaker})
		end
	else
		error("Unable to use this command", 0)
	end
end)
addCmd("speed", {"setspeed";"walkspeed";"ws"}, {"player";"number"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid") or nil
		if hum then
			hum.WalkSpeed = args[2] or 16
		end
	end
end)
addCmd("jpower", {"jpow";"jumppower"}, {"player";"number"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid") or nil
		if hum then
			hum.JumpPower = args[2] or 50
		end
	end
end)
addCmd("rope", {"chain"}, {"player1";"player2";"length"}, function(speaker, args)
	assert(args[1] and args[2], "Argument missing or nil")
	for i, plr1 in pairs(service.GetPlayers(args[1], speaker)) do
		for z, plr2 in pairs(service.GetPlayers(args[2], speaker)) do
			local torso1 = plr1.Character and plr1.Character:findFirstChild("HumanoidRootPart")
			local torso2 = plr2.Character and plr2.Character:findFirstChild("HumanoidRootPart")
			if torso1 and torso2 then
				local att1 = service.New("Attachment", torso1)
				local att2 = service.New("Attachment", torso2)
				local rope = service.New("RopeConstraint", torso1)

				att1.Name = "AD_Rope_Attachment"
				att2.Name = "AD_Rope_Attachment"
				rope.Name = "AD_Rope_Constraint"

				rope.Visible = true
				rope.Attachment0 = att1
				rope.Attachment1 = att2
				rope.Length = tonumber(args.rest) or 20
			end
		end
	end
end)
addCmd("unrope", {"unchain"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		if v.Character then
			for k, c in pairs(v.Character:findFirstChild("HumanoidRootPart") and v.Character.HumanoidRootPart:GetChildren() or {}) do
				if c.Name == "AD_Rope_Attachment" and c:IsA("Attachment") then
					c:Destroy()
				elseif c.Name == "AD_Rope_Constraint" and c:IsA("RopeConstraint") then
					c:Destroy()
				end
			end
		end
	end
end)
addCmd("freeze", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		for k, c in pairs(v.Character and v.Character:GetChildren() or {}) do
			if c:IsA("BasePart") and c.Name ~= "HumanoidRootPart" then
				c.Anchored = true
			end
		end
	end
end)
addCmd("thaw", {"unice";"unfreeze"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		Routine(function()
			if v.Character and v.Character:findFirstChild("HumanoidRootPart") then
				local ice = v.Character:FindFirstChild("AD_Ice")
				local plate
				if ice then
					plate = service.New("Part",v.Character)
					local mesh = service.New("CylinderMesh",plate)
					plate.FormFactor = "Custom"
					plate.TopSurface = "Smooth"
					plate.BottomSurface = "Smooth"
					plate.Size = Vector3.new(0.2,0.2,0.2)
					plate.BrickColor = BrickColor.new("Steel blue")
					plate.Name = "[EISS] Water"
					plate.Anchored = true
					plate.CanCollide = false
					plate.CFrame = v.Character.HumanoidRootPart.CFrame*CFrame.new(0,-3,0)
					plate.Transparency = ice.Transparency

					for i = 0.2,3,0.2 do
						ice.Size = Vector3.new(5,ice.Size.Y-i,5)
						ice.CFrame = v.Character.HumanoidRootPart.CFrame*CFrame.new(0,-i,0)
						plate.Size = Vector3.new(i+5,0.2,i+5)
						wait()
					end
					ice:Destroy()
				end
				for a, obj in pairs(v.Character:children()) do
					if obj:IsA("BasePart") and obj.Name~="HumanoidRootPart" and obj~=plate then obj.Anchored = false end
				end
				wait(3)
				pcall(function() plate:Destroy() end)
			end
		end)
	end
end)
addCmd("freecam", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local torso = v.Character and v.Character:findFirstChild("HumanoidRootPart")
		if torso and torso:IsA("BasePart") then
			torso.Anchored = true
		end
	end
end)
addCmd("unfreecam", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local torso = v.Character and v.Character:findFirstChild("HumanoidRootPart")
		if torso and torso:IsA("BasePart") then
			torso.Anchored = false
		end
	end
end)
addCmd("dance", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		Functions.PlayAnimation(v, 27789359)
	end
end)
addCmd("charaudio", {"charactermusic";"charmusic"}, {"player";"audioId"}, function(speaker, args)
	assert(args[1] and args[2] and tonumber(args[2]), "Argument missing or invalid")
	local audio = service.New("Sound", {
		Looped = true;
		Name = "AD_AUDIO";
		SoundId = "rbxassetid://"..args[2]
	})
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		local char = v.Character
		local rootPart = char and char:findFirstChild("HumanoidRootPart")
		if rootPart then
			local new = audio:Clone()
			new.Parent = rootPart
			new:Play()
		end
	end
end)
addCmd("uncharaudio", {"uncharactermusic";"uncharmusic"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local char = v.Character
		local rootPart = char and char:findFirstChild("HumanoidRootPart")
		if rootPart then
			local found = rootPart:findFirstChild("AD_AUDIO")
			if found then
				found:Stop()
				found:Destroy()
			end
		end
	end
end)
addCmd("spin", {}, {"player";"(optional) speed"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		local ind = tostring(v.UserId)
		if v.Character then
			local torso = v.Character:findFirstChild("HumanoidRootPart")
			if torso then
				local sp
				for i, v in pairs(torso:GetChildren()) do
					if v.Name == "AD_Spinner" and v:IsA("BodyAngularVelocity") then
						sp = v
					end
				end
				local spinner = sp or service.New("BodyAngularVelocity", torso)
				spinner.Name = "AD_Spinner"
				spinner.AngularVelocity = Vector3.new(0, tonumber(args.rest) or 10, 0)
				spinner.MaxTorque = Vector3.new(0, math.huge, 0)
				spinner.P = 1250
			end
		end
	end
end)
addCmd("unspin", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local torso = v.Character and v.Character:findFirstChild("HumanoidRootPart")
		if torso then
			for i, v in pairs(torso:GetChildren()) do
				if v.Name == "AD_Spinner" and v:IsA("BodyAngularVelocity") then
					v:Destroy()
				end
			end
		end
	end
end)
addCmd("explode", {"boom";"boomboom"}, {"player";"radius"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		local torso = v.Character and v.Character:findFirstChild("HumanoidRootPart")
		if torso then
			local ex = service.New("Explosion", service.Workspace)
			ex.Position = torso.Position
			ex.BlastRadius = args[2] or 20
		end
	end
end)
addCmd("fog", {}, {"start";"end"}, function(speaker, args)
	Functions.SetLighting("FogEnd", args[2])
	Functions.SetLighting("FogStart", args[1])
end)
addCmd("nofog", {"fogoff"}, {}, function(speaker, args)
	Functions.SetLighting("FogEnd", 1000000000000)
end)
addCmd("fogcolor", {}, {"r";"g";"b"}, function(speaker, args)
	Functions.SetLighting("FogColor", Color3.fromRGB(args[1], args[2], args[3]))
end)
addCmd("clone", {"cloneplayer"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local char = v.Character
		if char then
			char.Archivable = true
			local clone = char:Clone()
			table.insert(Variables.Objects, clone)
			clone.Parent = workspace
			clone:MoveTo(v.Character:GetModelCFrame().p)
			clone:MakeJoints()
			char.Archivable = false
		end
	end
end)
addCmd("lockmap", {"lockws"}, {}, function(speaker, args)
	for i, v in pairs(service.Workspace:GetDescendants()) do
		if v and v.Parent and v:IsA("BasePart") then
			v.Locked = true
		end
	end
end)
addCmd("unlockmap", {"unlockws"}, {}, function(speaker, args)
	for i, v in pairs(service.Workspace:GetDescendants()) do
		if v and v.Parent and v:IsA("BasePart") then
			v.Locked = false
		end
	end
end)
addCmd("trip", {}, {"player";"angle"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		if v.Character and v.Character:findFirstChild("HumanoidRootPart") then
			local angle = tonumber(args[2]) or 130
			v.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, 0, math.rad(angle))
		end
	end
end)
addCmd("lock", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		for a, obj in pairs(v.Character and v.Character:GetChildren() or {}) do
			if obj:IsA("BasePart") then
				obj.Locked = true
			elseif obj:IsA("Accoutrement") and obj:findFirstChild("Handle") and obj.Handle:IsA("BasePart") then
				obj.Handle.Locked = true
			end
		end
	end
end)
addCmd("unlock", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		for a, obj in pairs(v.Character and v.Character:GetChildren() or {}) do
			if obj:IsA("BasePart") then
				obj.Locked = false
			elseif obj:IsA("Accoutrement") and obj:findFirstChild("Handle") and obj.Handle:IsA("BasePart") then
				obj.Handle.Locked = false
			end
		end
	end
end)
addCmd("dog", {"dogify"}, {"player"}, function(speaker, args)
	for i, plr in pairs(service.GetPlayers(args.rest, speaker, true)) do
		--Routine(function()
		if plr and plr.Character and plr.Character:findFirstChild("HumanoidRootPart") then
			local human = plr.Character:findFirstChildOfClass("Humanoid")

			if not human then
				Functions.Output(plr.Name.." doesn't have a Humanoid [Transformation Error]", {speaker})
				return
			end
			if human.RigType == Enum.HumanoidRigType.R6 then
				if plr.Character:findFirstChild("Shirt") then
					plr.Character.Shirt.Parent = plr.Character.HumanoidRootPart
				end
				if plr.Character:findFirstChild("Pants") then
					plr.Character.Pants.Parent = plr.Character.HumanoidRootPart
				end
				if plr.Character:findFirstChildOfClass("ShirtGraphic") then
					plr.Character:findFirstChildOfClass("ShirtGraphic").Graphic = ""
				end
				local char, torso, ca1, ca2 = plr.Character, plr.Character.Torso, CFrame.Angles(0, math.rad(90), 0), CFrame.Angles(0, math.rad(-90), 0)

				torso.Transparency = 1
				for i, v in next, torso:GetChildren() do
					if v:IsA("Motor6D") then
						local lc0 = service.New('CFrameValue', {Name = 'Last0';Value = v.C0;Parent = v})
					end
				end
				torso.Neck.C0 = CFrame.new(0, -.5, -2) * CFrame.Angles(math.rad(90), math.rad(180), 0)
				torso["Right Shoulder"].C0 = CFrame.new(.5, -1.5, -1.5) * ca1
				torso["Left Shoulder"].C0 = CFrame.new(-.5, -1.5, -1.5) * ca2
				torso["Right Hip"].C0 = CFrame.new(1.5, -1, 1.5) * ca1
				torso["Left Hip"].C0 = CFrame.new(-1.5, -1, 1.5) * ca2
				local st = service.New("Seat", {
					Name = "AD_Torso";
					FormFactor = 0;
					TopSurface = 0;
					BottomSurface = 0;
					Size = Vector3.new(3, 1, 4);
				})

				local bf = service.New("BodyForce", {Force = Vector3.new(0, 2e3, 0), Parent = st})

				st.CFrame = torso.CFrame
				st.Parent = char

				local weld = service.New("Weld", {Parent = st, Part0 = torso, Part1 = st, C1 = CFrame.new(0, .5, 0)})

				for d, e in next, char:GetDescendants() do
					if e:IsA("BasePart") then
						e.BrickColor = BrickColor.new("Brown")
					end
				end
			elseif human.RigType == Enum.HumanoidRigType.R15 then
				Functions.Output("Cannot support R15 for "..plr.Name.." [Dog Transformation Error]", {speaker})
			end
		end
		--end)
	end
end)
addCmd("headsize", {}, {"player";"number"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		local realSize = Vector3.new(2, 1, 1)
		local size = tonumber(args[2]) or realSize
		local head = v.Character and v.Character:findFirstChild("Head")
		if head then
			head.Size = realSize * size
		end
	end
end)
addCmd("fling", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local char = v.Character
		if char then
			local torso = char:findFirstChild("HumanoidRootPart")
			local hum = char:findFirstChildOfClass("Humanoid")
			if torso and hum then
				hum.Sit = true
				local vel = service.New("BodyVelocity", torso)
				vel.Name = "AD_Fling"
				vel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				vel.Velocity = Vector3.new(math.random(-1000, 1000), 500, math.random(-1000, 1000))
				delay(1, function()
					if vel then
						vel:Destroy()
					end
				end)
			end
		end
	end
end)
addCmd("blur", {"screenblur";"blureffect"}, {"blur size"}, function(speaker, args)
	local blur
	if Variables.BlurEffect and Variables.BlurEffect.Parent then
		blur = Variables.BlurEffect
	else
		blur = service.New("BlurEffect", service.Lighting)
		Variables.BlurEffect = blur
	end
	blur.Name = "AD_BlurEffect"
	blur.Size = math.min(tonumber(args.rest) or 24, 50)
end)
addCmd("unblur", {"unscreenblur"}, {}, function(speaker, args)
	local blur = Variables.BlurEffect
	if blur then
		blur:Destroy()
	end
end)
addCmd("clear", {"cleargame";"clr"}, {}, function(speaker, args)
	for i, v in pairs(Variables.Objects) do
		if v:IsA("Script") or v:IsA("LocalScript") then
			v.Disabled = true
		end
		v:Destroy()
	end

	for i, v in pairs(Variables.Jails) do
		if not v.Player or not v.Player.Parent then
			local ind = v.Index
			pcall(function() v.Jail:Destroy() end)
			Variables.Jails[ind] = nil
		end
	end

	for i, v in pairs(service.Workspace:GetChildren()) do
		if v:IsA("Message") or v:IsA("Hint") then
			v:Destroy()
		end
	end

	Variables.Objects = {}
end)
addCmd("r6", {"classicrig"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		Functions.ConvertPlayerCharacterToRig(v, "R6")
	end
end)
addCmd("r15", {"rthro"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		Functions.ConvertPlayerCharacterToRig(v, "R15")
	end
end)
addCmd("bunnyhop", {"bhop"}, {"player"}, function(speaker, args)
	local hat = service.Insert(110891941)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		if v.Character then
			hat:Clone().Parent = v.Character
			local hum = v.Character:findFirstChildOfClass("Humanoid")
			local target = service.New("StringValue", {Name = "HippityHopitus";Parent = v.Character})
			service.TrackTask("Thread: BunnyLoop"..tostring(v.UserId), function()
				while hum and hum.Parent do
					target.Name = "HippityHopitus"
					if target.Parent then
						hum.Jump = true
						service.Wait()
					else
						break
					end
				end
			end)
		end
	end
end)
addCmd("unbunnyhop", {"unbhop"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local t = v.Character and v.Character:findFirstChild("HippityHopitus")
		if t and t:IsA("StringValue") then
			t:Destroy()
		end
	end
end)
addCmd("resetstats", {"rs"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		if v:findFirstChild("leaderstats") then
			for a, q in pairs(v.leaderstats:GetChildren()) do
				if q:IsA("IntValue") then q.Value = 0 end
			end
		end
	end
end)
addCmd("change", {"leaderstat";"stat"}, {"player";"stat";"value"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		if v:findFirstChild("leaderstats") then
			for a, st in pairs(v.leaderstats:GetChildren()) do
				if st.Name:lower():find(args[2]:lower()) == 1 then
					st.Value = args[3]
				end
			end
		end
	end
end)
addCmd("add", {"addtostat";"addstat"}, {"player";"stat;";"value"}, function(speaker, args)
	for i,v in pairs(service.GetPlayers(args[1], speaker)) do
		if v:findFirstChild("leaderstats") then
			for a, st in pairs(v.leaderstats:GetChildren()) do
				if st.Name:lower():find(args[2]:lower()) == 1 and tonumber(st.Value) then
					st.Value = tonumber(st.Value)+tonumber(args[3])
				end
			end
		end
	end
end)
addCmd("subtract", {"minusfromstat";"minusstat";"subtractstat"}, {"player";"stat";"value"}, function(speaker, args)
	for i,v in pairs(service.GetPlayers(args[1], speaker)) do
		if v:findFirstChild("leaderstats") then
			for a, st in pairs(v.leaderstats:GetChildren()) do
				if st.Name:lower():find(args[2]:lower()) == 1 and tonumber(st.Value) then
					st.Value = tonumber(st.Value)-tonumber(args[3])
				end
			end
		end
	end
end)
addCmd("track", {"trace";"find"}, {"player"}, function(speaker, args)
	local playerGui = speaker:findFirstChildOfClass("PlayerGui")
	for i, v in next, service.GetPlayers(args.rest, speaker, true) do
		local Humanoid = speaker.Character and speaker.Character:findFirstChildOfClass("Humanoid")
		local Part = v.Character and v.Character:findFirstChild("HumanoidRootPart")
		if Part and Humanoid then
			local bb = service.New("BillboardGui")
			local la = service.New("SelectionPartLasso", bb)
			la.Part = Part
			la.Humanoid = Humanoid
			bb.Name = v.Name..'Tracker'
			bb.Adornee = v.Character.Head
			bb.AlwaysOnTop = true
			bb.StudsOffset = Vector3.new(0,2,0)
			bb.Size = UDim2.new(0,100,0,40)
			local f = service.New('Frame',bb)
			f.BackgroundTransparency = 1
			f.Size = UDim2.new(1,0,1,0)
			local name = service.New('TextLabel',f)
			name.Text = v.Name
			name.BackgroundTransparency = 1
			name.Font = "Arial"
			name.TextColor3 = Color3.new(1,1,1)
			name.TextStrokeColor3 = Color3.new(0,0,0)
			name.TextStrokeTransparency = 0
			name.Size = UDim2.new(1,0,0,20)
			name.TextScaled = true
			name.TextWrapped = true
			local arrow = name:clone()
			arrow.Parent = f
			arrow.Position = UDim2.new(0,0,0,20)
			arrow.Text = 'v'
			bb.Parent = playerGui
			local ind = tostring(speaker.UserId)
			local tracks = Variables.Tracks
			if not tracks[ind] then
				tracks[ind] = {}
			end
			tracks[ind][tostring(v.UserId)] = bb
		end
	end
end)
addCmd("untrack", {"untrace";"unfind"}, {"player"}, function(speaker, args)
	local tracks = Variables.Tracks[tostring(speaker.UserId)]
	if tracks then
		if args[1]:lower() == Settings.SpecialPrefix.."all" then
			for i, v in pairs(tracks) do
				v:Destroy()
			end
		else
			for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
				if tracks[tostring(v.UserId)] then
					tracks[tostring(v.UserId)]:Destroy()
				end
			end
		end
	end
end)
addCmd("sword", {"givesword"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local backpack = v:findFirstChildOfClass("Backpack")
		if backpack then
			local sword = service.Insert(125013769)
			local config = sword:findFirstChild("Configurations")
			if config and config:findFirstChild("CanTeamkill") and config.CanTeamkill:IsA("BoolValue") then
				confing.CanTeamkill.Value = true
			end
			sword.Parent = backpack
		end
	end
end)
addCmd("disco", {}, {}, function(speaker, args)
	service.StopLoop("LightingTask")
	service.StartLoop("LightingTask", 0.5, function()
		local color = Color3.new(math.random(255)/255, math.random(255)/255, math.random(255)/255)
		Functions.SetLighting("Ambient", color)
		Functions.SetLighting("OutdoorAmbient", color)
		Functions.SetLighting("FogColor", color)
	end)
end)
addCmd("undisco", {}, {}, function(speaker, args)
	service.StopLoop("LightingTask")
end)
addCmd("sell", {}, {"player";"id"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		service.MarketPlace:PromptPurchase(v, tonumber(args[2]), false)
	end
end)
addCmd("time", {"timeofday"}, {"time"}, function(speaker, args)
	Functions.SetLighting("TimeOfDay", args[1])
end)
addCmd("loopkill", {}, {"player";"num(optional)"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		service.StopLoop(v.userId.."LOOPKILL")
		local num = tonumber(args[2]) or math.huge
		local deaths = 0
		local conn; conn = v.CharacterAdded:Connect(function()
			deaths = deaths + 1
			if deaths >= num then
				conn:Disconnect()
				service.StopLoop(v.userId.."LOOPKILL")
			end
		end)
		Routine(service.StartLoop, v.userId.."LOOPKILL", 1, function()
			if v.Character and deaths < num then
				v.Character:BreakJoints()
			end
		end)
	end
end)
addCmd("unloopkill", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		service.StopLoop(v.userId.."LOOPKILL")
	end
end)
addCmd("nil", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		v.Character = nil
		v.Parent = nil
	end
end)
addCmd("forceplace", {}, {"player";"placeid/serverName"}, function(speaker, args)
	local id = tonumber(args[2])
	local players = service.GetPlayers(args[1], speaker)
	for i, v in pairs(players) do
		service.TeleportService:Teleport(tonumber(args[2]), v)
	end
end)
addCmd("neon", {"neonify"}, {"player", "(optional)color"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		for k, p in pairs(v.Character and v.Character:GetChildren() or {}) do
			if p:IsA("BasePart") then
				p.Material = "Neon"
				p.BrickColor = args[2] and BrickColor.new(tostring(args[2])) or p.BrickColor
				if p.Name == "Head" and p:findFirstChild("Mesh") then
					p.Mesh:Destroy()
				end
			elseif p:IsA("Shirt") or p:IsA("Pants") or p:IsA("Accoutrement") then
				p:Destroy()
			end
		end
	end
end)
addCmd("gear", {"givegear"}, {"player";"id"}, function(speaker, args)
	local gear = service.Insert(tonumber(args[2]))
	if gear:IsA("Tool") or gear:IsA("HopperBin") then
		service.New("StringValue", gear).Name = Variables.CodeName..gear.Name
		for i, v in pairs(service.GetPlayers(args[1], speaker)) do
			local backpack = v:findFirstChildOfClass("Backpack")
			if backpack then
				gear:Clone().Parent = backpack
			end
		end
	end
end)
addCmd("hat", {"givehat"}, {"player";"id"}, function(speaker, args)
	if not args[2] then error("Argument missing or nil") end
	local id = tonumber(args[2])
	if not tonumber(id) then error("Invalid ID") end
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		if v.Character then
			local obj = service.Insert(tonumber(id))
			if obj:IsA("Accoutrement") then
				obj.Parent = v.Character
			end
		end
	end
end)
addCmd("shirt", {"giveshirt"}, {"player";"id"}, function(speaker, args)
	local ClothingId = tonumber(args[2])
	local AssetIdType
	pcall(function()
		AssetIdType = service.MarketPlace:GetProductInfo(ClothingId).AssetTypeId
	end)
	local Shirt = AssetIdType == 11 and service.Insert(ClothingId) or AssetIdType == 1 and Functions.CreateClothingFromImageId("Shirt", ClothingId)
	for i,v in pairs(service.GetPlayers(args[1], speaker, true)) do
		if v.Character then
			for g,k in pairs(v.Character:GetChildren()) do
				if k:IsA("Shirt") then k:Destroy() end
			end
			if Shirt then
				Shirt:Clone().Parent = v.Character
			end
		end
	end
end)
addCmd("pants", {"givepants"}, {"player";"id"}, function(speaker, args)
	local ClothingId = tonumber(args[2])
	local AssetIdType
	pcall(function()
		AssetIdType = service.MarketPlace:GetProductInfo(ClothingId).AssetTypeId
	end)
	local Pants = AssetIdType == 12 and service.Insert(ClothingId) or AssetIdType == 1 and Functions.CreateClothingFromImageId("Pants", ClothingId)
	for i,v in pairs(service.GetPlayers(args[1], speaker, true)) do
		if v.Character then
			for g,k in pairs(v.Character:GetChildren()) do
				if k:IsA("Pants") then k:Destroy() end
			end	
			if Pants then
				Pants:Clone().Parent = v.Character
			end
		end
	end
end)
addCmd("face", {"giveface"}, {"player";"id"}, function(speaker, args)
	for i,v in pairs(service.GetPlayers(args[1], speaker, true)) do
		if not v.Character:FindFirstChild("Head") then
			return
		end

		if v.Character and v.Character:findFirstChild("Head") and v.Character.Head:findFirstChild("face") then
			v.Character.Head:findFirstChild("face"):Destroy()
		end

		service.Insert(tonumber(args[2])).Parent = v.Character:FindFirstChild("Head")
	end
end)
addCmd("h", {"hint"}, {"message"}, function(speaker, args)
	assert(args.rest, "Argument missing or nil")
	Functions.Hint(speaker.Name..": "..(args.rest), service.Players:GetPlayers())
end)
addCmd("sh", {"systemhint";"shint"}, {"message"}, function(speaker, args)
	assert(args.rest, "Argument missing or nil")
	Functions.Hint(args.rest, service.Players:GetPlayers())
end, {AdminLevel = "Owners"})
addCmd("newteam", {"createteam";"maketeam"}, {"name";"BrickColor"}, function(speaker, args)
	local color = BrickColor.new(args.rest)
	local team = service.New("Team", service.Teams)
	team.Name = args[1]
	team.AutoAssignable = false
	team.TeamColor = color
end)
addCmd("team", {"setteam";"changeteam"}, {"player";"team"}, function(speaker, args)
	assert(args[1] and args[2], "Argument missing or nil")
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		for a, tm in pairs(service.Teams:GetChildren()) do
			if tm.Name:lower():sub(1,#args.rest) == args.rest:lower() then
				v.Team = tm
			end
		end
	end
end)
addCmd("removeteam", {}, {"name"}, function(speaker, args)
	for i, v in pairs(service.Teams:GetChildren()) do
		if v:IsA("Team") and v.Name:lower():sub(1,#args.rest) == args.rest:lower() then
			v:Destroy()
		end
	end
end)
addCmd("unteam", {"removefromteam";"neutral"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		v.Neutral = true
		v.Team = nil
		v.TeamColor = BrickColor.new(194)
	end
end)
addCmd("naked", {"removeclothes";"nude";"undress"}, {"player";"(optional morph)boy/girl"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		local gender = args[2] and args[2]:lower()
		local char = v.Character
		if char then
			for _, child in pairs(char:GetChildren()) do
				if child:IsA("Shirt") or child:IsA("Pants") or child:IsA("ShirtGraphic") then
					child:Destroy()
				end
			end
			local torso = char:findFirstChild("Torso") or char:findFirstChild("UpperTorso")
			if torso then
				if gender == "boy" then
					local P1 = torso
					local D = service.New("Part", {Parent = torso; TopSurface = 0; BottomSurface = 0; CanCollide = false; BrickColor = BrickColor.new("Pastel brown"); Shape = "Ball"; Size = Vector3.new(1, 1, 1);})
					local DM1 = service.New("SpecialMesh", {Parent = D; MeshType = "Sphere";Scale = Vector3.new(0.4, 0.4, 0.4);})
					fWeld('weld', P1, P1, D, true, -0.2, -1.3, -0.6, 0, 0, 0)
					local D2 = D:Clone() D2.Parent = P1
					fWeld('weld', P1, P1, D2, true, 0.2, -1.3, -0.6, 0, 0, 0)
					local C = service.New('Part', P1) C.TopSurface = 0 C.BottomSurface = 0 C.CanCollide = false C.BrickColor = BrickColor.new('Pastel brown') C.Size = Vector3.new(0.4, 1.3, 0.4)
					fWeld('weld', P1, P1, C, true, 0, -1, -0.52 + (-C.Size.y / 2), math.rad(-80), 0, 0)
					local C2 = D:Clone() C2.BrickColor = BrickColor.new('Pink') C2.Mesh.Scale = Vector3.new(0.4, 0.62, 0.4) C2.Parent = P1
					fWeld('weld', C, C, C2, true, 0, 0 + (C.Size.y / 2), 0, math.rad(-10), 0, 0)
					local CM = service.New('CylinderMesh', C)
				elseif gender == "girl" then
					local V1 = torso
					local BL = service.New('Part', V1) BL.TopSurface = 0 BL.BottomSurface = 0 BL.CanCollide = false 
					BL.BrickColor = BrickColor.new('Pastel brown') BL.Shape = 'Ball' BL.Size = Vector3.new(1, 1, 1)
					local DM2 = service.New('SpecialMesh', BL) DM2.MeshType = 'Sphere' DM2.Scale = Vector3.new(1.2, 1.2, 1.2)
					fWeld('weld', V1, V1, BL, true, -0.5, 0.5, -0.6, 0, 0, 0)
					local BR = service.New('Part', V1) BR.TopSurface = 0 BR.BottomSurface = 0 BR.CanCollide = false 
					BR.BrickColor = BrickColor.new('Pastel brown') BR.Shape = 'Ball' BR.Size = Vector3.new(1, 1, 1)
					local DM3 = service.New('SpecialMesh', BR) DM3.MeshType = 'Sphere' DM3.Scale = Vector3.new(1.2, 1.2, 1.2)
					fWeld('weld', V1, V1, BR, true, 0.5, 0.5, -0.6, 0, 0, 0)
					local BLN = service.New('Part', V1) BLN.TopSurface = 0 BLN.BottomSurface = 0 BLN.CanCollide = false 
					BLN.BrickColor = BrickColor.new('Pink') BLN.Shape = 'Ball' BLN.Size = Vector3.new(1, 1, 1)
					local DM4 = service.New('SpecialMesh', BLN) DM4.MeshType = 'Sphere' DM4.Scale = Vector3.new(0.2, 0.2, 0.2)
					fWeld('weld', V1, V1, BLN, true, -0.5, 0.5, -1.2, 0, 0, 0)
					local BRN = service.New('Part', V1) BRN.TopSurface = 0 BRN.BottomSurface = 0 BRN.CanCollide = false 
					BRN.BrickColor = BrickColor.new('Pink') BRN.Shape = 'Ball' BRN.Size = Vector3.new(1, 1, 1)
					local DM5 = service.New('SpecialMesh', BRN) DM5.MeshType = 'Sphere' DM5.Scale = Vector3.new(0.2, 0.2, 0.2)
					fWeld('weld', V1, V1, BRN, true, 0.5, 0.5, -1.2, 0, 0, 0)
				end
			end
		end
	end
end)
addCmd("talk", {"maketalk"}, {"player";"message"}, function(speaker, args)
	local message = args.rest
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		if v.Character and v.Character:findFirstChild("Head") and v.Character.Head:IsA("BasePart") then
			service.Chat:Chat(v.Character.Head, message, Enum.ChatColor.Blue)
		end
	end
end)
addCmd("chat", {"forcechat"}, {"player";"message"}, function(speaker, args)
	local message = args.rest or ""
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		service.ChatService:GetSpeaker(v.Name):SayMessage(message, "All")
	end
end)
addCmd("punish", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		if v.Character then
			v.Character.Parent = nil
		end
	end
end)
addCmd("unpunish", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		if v.Character then
			v.Character.Parent = workspace
		end
	end
end)
addCmd("ice", {"iceage";"icefreeze";"funfreeze"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		Routine(function()
			if v.Character and v.Character:findFirstChild("HumanoidRootPart") then
				for a, obj in pairs(v.Character:children()) do
					if obj:IsA("BasePart") and obj.Name~="HumanoidRootPart" then obj.Anchored = true end
				end
				local ice=service.New("Part",v.Character)
				ice.BrickColor=BrickColor.new("Steel blue")
				ice.Material="Ice"
				ice.Name="AD_Ice"
				ice.Anchored=true
				--ice.CanCollide=false
				ice.TopSurface="Smooth"
				ice.BottomSurface="Smooth"
				ice.FormFactor="Custom"
				ice.Size=Vector3.new(5, 6, 5)
				ice.Transparency=0.3
				ice.CFrame=v.Character.HumanoidRootPart.CFrame
			end
		end)
	end
end)
addCmd("kick", {}, {"player";"optional reason"}, function(speaker, args, data)
	if not RequireAllowed then error("Unable to use this command", 0) end
	local plrLevel = data.PlayerData.Level
	for i, v in next, service.GetPlayers(args[1], speaker) do
		local targLevel = Admin.GetLevel(v)
		if plrLevel>targLevel then
			Functions.Kick(v, args.rest)
			Functions.Hint("Kicked "..tostring(v), {speaker})
		end
	end
end)
addCmd("rocket", {"firework"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		cPcall(function()
			if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
				local knownchar = v.Character
				local speed = 10
				local Part = service.New("Part")
				Part.Parent = v.Character
				local SpecialMesh = service.New("SpecialMesh")
				SpecialMesh.Parent = Part
				SpecialMesh.MeshId = "http://www.roblox.com/asset/?id=2251534"
				SpecialMesh.MeshType = "FileMesh"
				SpecialMesh.TextureId = "43abb6d081e0fbc8666fc92f6ff378c1"
				SpecialMesh.Scale = Vector3.new(0.5,0.5,0.5)
				local Weld = service.New("Weld")
				Weld.Parent = Part
				Weld.Part0 = Part
				Weld.Part1 = v.Character.HumanoidRootPart
				Weld.C0 = CFrame.new(0,-1,0)*CFrame.Angles(-1.5,0,0)
				local BodyVelocity = service.New("BodyVelocity")
				BodyVelocity.Parent = Part
				BodyVelocity.maxForce = Vector3.new(math.huge,math.huge,math.huge)
				BodyVelocity.velocity = Vector3.new(0,100*speed,0)
				wait(5)
				BodyVelocity:remove()
				if knownchar.Parent then
					service.New("Explosion",service.Workspace).Position = knownchar.HumanoidRootPart.Position
					knownchar:BreakJoints()
				end
			end
		end)
	end
end)
addCmd("shrek", {"shrekify";"shrekislife";"swamp"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		Routine(function()
			if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
				Admin.RunCommand(Settings.Prefix.."pants",v.Name,"233373970")
				Admin.RunCommand(Settings.Prefix.."shirt",v.Name,"133078195")

				for i,v in pairs(v.Character:children()) do
					if v:IsA("Accoutrement") or v:IsA("CharacterMesh") then
						v:Destroy()
					end
				end

				Admin.RunCommand(Settings.Prefix.."hat",v.Name,"20011951")

				local sound = service.New("Sound",v.Character.HumanoidRootPart)
				sound.SoundId = "http://www.roblox.com/asset/?id="..130767645
				wait(0.5)
				sound:Play()
			end
		end)
	end
end)
addCmd("headsit", {"siton"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		Remote.Send(speaker, "Function", "Headsit", v)
	end
end)
addCmd("shutdown", {}, {"reason"}, function(speaker, args)
	if RequireAllowed then
		Functions.Shutdown(args.rest)
	else
		error("Unable to use this command")
	end
end, {AdminLevel = "Owners"})
addCmd("decalsky", {"sky"}, {"textureid"}, function(speaker, args)
	local prefixUrl = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId="
	local properties = {"SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp"}
	local sky = service.New("Sky", service.Ligthing)
	table.insert(Variables.Skies, sky)
	for i, v in pairs(properties) do
		sky[v] = prefixUrl..args[1]
	end
end)
addCmd("undecalsky", {}, {}, function(speaker, args)
	for i, v in pairs(Variables.Skies) do
		if v and v:IsA("Sky") then
			v:Destroy()
		end
	end
	Variables.Skies = {}
end)
addCmd("removetools", {"notools"}, {"player"}, function(speaker, args)
	for i,v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		if v.Character and v:findFirstChild("Backpack") then
			for a, tool in pairs(v.Character:children()) do if tool:IsA("Tool") or tool:IsA("HopperBin") then tool:Destroy() end end
			for a, tool in pairs(v.Backpack:children()) do if tool:IsA("Tool") or tool:IsA("HopperBin") then tool:Destroy() end end
		end
	end
end)
addCmd("boombox", {}, {"player"}, function(speaker, args)
	local gear = service.Insert(tonumber(212641536))
	if gear:IsA("Tool") or gear:IsA("HopperBin") then
		service.New("StringValue",gear).Name = Variables.CodeName..gear.Name
		for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
			if v:findFirstChild("Backpack") then
				gear:Clone().Parent = v.Backpack
			end
		end
	end
end)
addCmd("title", {"bgui"}, {"player";"text"}, function(speaker, args)
	assert(args.rest, "Argument missing or nil")
	local color = Color3.fromRGB(255, 255, 255)
	local screen = service.New("BillboardGui", {
		Name = "AD_TITLE";
		AlwaysOnTop = true;
		DistanceUpperLimit = -1;
		MaxDistance = math.huge;
		Size = UDim2.new(3, 0, 1.5, 0);
		StudsOffset = Vector3.new(0.5, 2.6, 0);
	})
	local tb = service.New("TextLabel", {
		BackgroundColor3 = Color3.new(1, 1, 1);
		BackgroundTransparency = 1;
		BorderColor3 = Color3.fromRGB(27, 42, 53);
		BorderSizePixel = 1;
		Position = UDim2.new(-0.17, -20, 0, 0);
		Size = UDim2.new(1, 40, 0.9, -1);
		Font = "SourceSansBold";
		LineHeight = 1;
		Text = args.rest;
		TextColor3 = Color3.new(1, 1, 1);
		TextScaled = true;
		TextStrokeColor3 = Color3.new(50, 0, 0);
		TextStrokeTransparency = 0.5;
		TextWrapped = true;
		TextYAlignment = "Bottom";
		Parent = screen;
	})
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		local head = v.Character and v.Character:findFirstChild("Head")
		if head then
			for k, c in pairs(head:GetChildren()) do
				if c.Name == "AD_TITLE" and c:IsA("BillboardGui") then
					c:Destroy()
				end
			end
			local title = screen:Clone()
			title.TextLabel.Text = args.rest
			title.TextLabel.TextColor3 = color
			local h,s,v = Color3.toHSV(color)
			title.TextLabel.TextStrokeColor3 = Color3.fromHSV(h, s, v*0.2)
			title.Parent = head
		end
	end
end)
addCmd("untitle", {"unbgui"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local head = v.Character and v.Character:findFirstChild("Head")
		if head then
			for k, c in pairs(head:GetChildren()) do
				if c.Name == "AD_TITLE" and c:IsA("BillboardGui") then
					c:Destroy()
				end
			end
		end
	end
end)
addCmd("m", {"message"}, {"message"}, function(speaker, args)
	assert(args.rest, "Argument missing or nil")
	Functions.Message("Message from "..speaker.Name, args.rest, service.Players:GetPlayers(), (#tostring(args[1])/19)+2.5)
end)
addCmd("sm", {"systemmessage"}, {"message"}, function(speaker, args)
	assert(args.rest, "Argument missing or nil")
	Functions.Message("System Message", args.rest, service.Players:GetPlayers(), (#tostring(args[1])/19)+2.5)
end, {AdminLevel = "Owners"})
addCmd("mpm", {"messagepm"}, {"player";"message"}, function(speaker, args)
	assert(args[1] and args[2], "Argument missing or nil")
	Functions.Message("Message from "..speaker.Name, args.rest, service.GetPlayers(args[1], speaker))
end)
addCmd("cm", {"custommessage"}, {"Upper message";"message"}, function(speaker, args)
	assert(args[1] and args[2], "Argument missing or nil")
	Functions.Message(args[1]:gsub("·", " "), args.rest, service.Players:GetPlayers(), (#tostring(args[1])/19)+2.5)
end)
addCmd("tm", {"timem";"timedmessage"}, {"time";"message"}, function(speaker, args)
	assert(tonumber(args[1]) and args[2], "Argument missing or invalid")
	Functions.Message("Message from "..speaker.Name, args.rest, service.Players:GetPlayers(), tonumber(args[1]))
end)
addCmd("animation", {"loadanim";"animate";"anim"}, {"player";"AnimationID"}, function(speaker, args)
	if args[1] and not args[2] then args[2] = args[1] args[1] = nil end

	assert(tonumber(args[2]),tostring(args[2]).." is not a valid ID")

	for i,v in pairs(service.GetPlayers(args[1], speaker)) do
		if v.Character and v.Character:findFirstChildOfClass("Humanoid") then
			coroutine.wrap(function()
				Functions.PlayAnimation(v,args[2])
			end)()
		end
	end
end)
addCmd("view", {"watch";"nsa";"viewplayer"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid")
		if hum then
			Remote.Send(speaker, "Function", "SetView", hum)
		end
	end
end)
addCmd("unview", {"rv";"fixview";"fixcam";"unwatch";"unview"}, {}, function(speaker, args)
	Remote.Send(speaker, "Function", "SetView", "reset")
end)
addCmd("btools", {"buildtools";"buildingtools";"buildertool";"f3x"}, {"player"}, function(speaker, args)
	local bt = getfenv(require(5957899914).f3x).script["Building Tools"]:Clone()
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local backpack = v:findFirstChildOfClass("Backpack")
		if backpack then
			for i, p in pairs(service.Env("Players"):GetPlayers()) do
				if p:IsA("Player") and p.UserId == v.UserId then
					bt:Clone().Parent = p:findFirstChildOfClass("Backpack")
				end
			end
		end
	end
end)
addCmd("addtag", {"newtag"}, {"player";"TagText";"TagBrickColor"}, function(speaker, args)
	assert(args[2], "Argument missing or nil (TagText)")
	assert(args[3], "Argument missing or nil (TagBrickColor)")
	local color = service.Env().BrickColor.new(args.rest).Color
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		local sp = service.ChatService:GetSpeaker(v.Name)
		local tags = sp:GetExtraData("Tags")
		table.insert(tags, {TagText = args[2], TagColor = color})
		sp:SetExtraData("Tags", tags)
		Functions.Hint("Added tag to "..v.Name.." with text: "..tostring(args[2]), {speaker})
	end
end)
addCmd("removetags", {"removetag";"rtag";"rtags"}, {"player";"TagText/all"}, function(speaker, args)
	assert(args[2], "Argument missing or nil (TagText)")
	local text = args.rest:lower()
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		local sp = service.ChatService:GetSpeaker(v.Name)
		local tags = sp:GetExtraData("Tags")
		if text == "all" then
			table.clear(tags)
		else
			for y, t in pairs(tags) do
				if t.TagText:lower():match('^'..text) and text ~= "" then
					Functions.Hint("Removed tag to "..v.Name.." with text: "..tostring(t.TagText), {speaker})
					tags[y] = nil
				end
			end
		end
	end
end)
addCmd("chatcolor", {}, {"player";"brickcolor"}, function(speaker, args)
	local color = args.rest and service.Env().BrickColor.new(args.rest).Color or service.Env().Color3.new(1, 1, 1)
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		local sp = service.ChatService:GetSpeaker(v.Name)
		sp:SetExtraData("ChatColor", color)
		Functions.Hint("Changed chat color to "..v.Name.." Color: "..tostring(color), {speaker})
	end
end)
addCmd("fchat", {"fakechat"}, {"name";"message"}, function(speaker, args)
	assert(args[1], "Argument missing or nil")
	local sp = service.ChatService:GetSpeaker(args[1])
	if not sp then
		sp = service.ChatService:AddSpeaker(args[1])
		sp:JoinChannel("All")
	end
	sp:SayMessage(args.rest, "All")
end)
addCmd("fly", {"flight"}, {"player";"speed"}, function(speaker, args)
	local speed = tonumber(args[2]) or 2
	scr = service.New("LocalScript")
	local noclip = true
	local sVal = service.New("NumberValue", {
		Name = "Speed";
		Value = speed;
		Parent = scr;
	})
	local NoclipVal = service.New("BoolValue", {
		Name = "Noclip";
		Value = noclip or false;
		Parent = scr;
	})

	scr.Name = "AD_FLIGHT"
	for i, v in next, Functions.GetPlayers(args[1], speaker, true) do
		local part = v.Character and v.Character:findFirstChild("HumanoidRootPart")
		if part then
			local oldp = part:FindFirstChild("AD_FLIGHT_POSITION")
			local oldg = part:FindFirstChild("AD_FLIGHT_GYRO")
			local olds = part:FindFirstChild("AD_FLIGHT")
			if oldp then oldp:Destroy() end
			if oldg then oldg:Destroy() end
			if olds then olds:Destroy() end
			local new = scr:Clone()
			local flightPosition = service.New("BodyPosition")
			local flightGyro = service.New("BodyGyro")
			flightPosition.Name = "AD_FLIGHT_POSITION"
			flightPosition.MaxForce = Vector3.new(0, 0, 0)
			flightPosition.Position = part.Position
			flightPosition.Parent = part

			flightGyro.Name = "AD_FLIGHT_GYRO"
			flightGyro.MaxTorque = Vector3.new(0, 0, 0)
			flightGyro.CFrame = part.CFrame
			flightGyro.Parent = part
			new.Parent = part
			new.Disabled = false
			Remote.Send(v, "Function", "Fly", new)
		end
	end
end)
addCmd("flyspeed", {"flightspeed"}, {"player";"speed"}, function(speaker, args)
	local speed = tonumber(args[2])

	for i,v in next,Functions.GetPlayers(args[1], speaker, true) do
		local part = v.Character and v.Character:FindFirstChild("HumanoidRootPart")
		if part then
			local scr = part:FindFirstChild("AD_FLIGHT")
			if scr then
				local sVal = scr:FindFirstChild("Speed")
				if sVal then
					sVal.Value = speed
				end
			end
		end
	end
end)
addCmd("unfly", {"ground"}, {"player"}, function(speaker, args)
	for i,v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local part = v.Character and v.Character:FindFirstChild("HumanoidRootPart")
		if part then
			local oldp = part:FindFirstChild("AD_FLIGHT_POSITION")
			local oldg = part:FindFirstChild("AD_FLIGHT_GYRO")
			local olds = part:FindFirstChild("AD_FLIGHT")
			if oldp then oldp:Destroy() end
			if oldg then oldg:Destroy() end
			if olds then olds:Destroy() end
		end
	end
end)
addCmd("bang", {"rape"}, {"player";"velocity"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid")
		if hum then
			if hum.RigType == Enum.HumanoidRigType.R15 then
				return Functions.Output("Cannot support R15 for "..v.Name.." [Bang Animation Error]", {speaker})
			end
		end
		Remote.Send(speaker, "Function", "Bang", v, tonumber(args[2]))
	end
end)
addCmd("unbang", {"unrape"}, {}, function(speaker, args)
	Remote.Send(speaker, "Function", "UnBang")
end)
addCmd("removeguis", {"noguis"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local playerGui = v:findFirstChildOfClass("PlayerGui")
		if playerGui then
			for _, c in pairs(playerGui:GetChildren()) do
				if c ~= Variables.MainGui[v.UserId] then
					c:Destroy()
				end
			end
		end
	end
end)
addCmd("heal", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid")
		if hum then
			hum.Health = hum.MaxHealth
		end
	end
end)
addCmd("setcoreguienabled", {"setcoreenabled";"showcoregui";"setcoregui";"setcge";"setcore"}, {"player";"element";"false/true"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		if args[3]:lower() == "on" or args[3]:lower() == "true" then
			Remote.Send(v, "Function", "SetCoreGuiEnabled", args[2], true)
		elseif args[3]:lower() == "off" or args[3]:lower() == "false" then
			Remote.Send(v, "Function", "SetCoreGuiEnabled", args[2], false)
		end
	end
end)
addCmd("fire", {"makefire";"givefire"}, {"player";"color"}, function(speaker, args)
	local color = Color3.new(1,1,1)
	local secondary = Color3.new(1,0,0)

	if args[2] then
		local str = BrickColor.new('Bright orange').Color
		local teststr = args.rest

		if BrickColor.new(teststr) ~= nil then
			str = BrickColor.new(teststr).Color
		end

		color = str
		secondary = str
	end

	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		local torso = v.Character and v.Character:findFirstChild("HumanoidRootPart")
		if torso then
			service.New("Fire", {
				Name = "FIRE";
				Color = color;
				SecondaryColor = secondary;
				Parent = torso;
			})
			service.New("PointLight", {
				Name = "FIRE_LIGHT";
				Color = color;
				Range = 15;
				Brightness = 5;
				Parent = torso;
			})
		end
	end
end)
addCmd("unfire", {"removefire";"extinguish"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local torso = v.Character and v.Character:findFirstChild("HumanoidRootPart")
		if torso then
			for _, c in pairs(torso:GetChildren()) do
				if (c.Name == "FIRE" and c:IsA("Fire")) or (c.Name == "FIRE_LIGHT" and c:IsA("PointLight")) then
					c:Destroy()
				end
			end
		end
	end
end)
addCmd("afk", {}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		Routine(function()
			local ff = service.New("ForceField", v.Character)
			local hum = v.Character:findFirstChildOfClass("Humanoid")
			local orig = hum.Health
			local tools = service.New("Model")
			hum.MaxHealth = math.huge
			wait()
			hum.Health = hum.MaxHealth
			local backpack = v:findFirstChildOfClass("Backpack")
			for k, t in pairs(backpack:GetChildren()) do
				t.Parent = tools
			end
			Admin.RunCommand(Settings.Prefix.."name",v.Name,"-AFK-_"..v.Name.."_-AFK-")
			local torso=v.Character.HumanoidRootPart
			local pos=torso.CFrame
			local running=true
			local event
			event = hum.Jumping:connect(function()
				running = false
				ff:Destroy()
				hum.Health = orig
				hum.MaxHealth = orig
				for k,t in pairs(tools:children()) do
					t.Parent = backpack
				end
				Admin.RunCommand(Settings.Prefix.."unname",v.Name)
				event:Disconnect()
			end)
			repeat torso.CFrame = pos wait() until not v or not v.Character or not torso or not running or not torso.Parent
		end)
	end
end)
addCmd("fov", {"fieldofview";"setfov"}, {"player";"number"}, function(speaker, args)
	assert(args[1] and args[2] and tonumber(args[2]), "Argument missing or invalid")
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		Remote.Send(v, "Function", "SetFov", math.clamp(tonumber(args[2]), 1, 120))
	end
end)
addCmd("pause", {"pausemusic";"psound";"pausesound"}, {}, function(speaker, args)
	for i, v in pairs(service.Workspace:GetChildren()) do
		if v.Name == "AD_SOUND" and v:IsA("Sound") then
			if v.IsPaused == false then
				v:Pause()
				Functions.Hint("Music is now paused | Run "..Settings.Prefix.."resume to resume playback",{speaker})
			else
				Functions.Hint("Music is already paused | Run "..Settings.Prefix.."resume to resume",{speaker})
			end
		end
	end
end)
addCmd("resume", {"resumemusic";"rsound";"resumesound"}, {}, function(speaker, args)
	for i, v in pairs(service.Workspace:GetChildren()) do
		if v.Name == "AD_SOUND" and v:IsA("Sound") then
			if v.IsPaused == true then
				v:Resume()
				Functions.Hint("Resuming Playback...", {speaker})
			else
				Functions.Hint("Music is not pause", {speaker})
			end
		end
	end
end)
addCmd("spasm", {"epilepsy"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		Routine(function()
			local char = v.Character
			if char then
				while char and char.Parent do
					for k, c in pairs(char:GetDescendants()) do
						if c:IsA("Motor6D") then
							c.C0 = c.C0 * CFrame.Angles(2*math.pi*math.random(),2*math.pi*math.random(),2*math.pi*math.random())
						end
					end
					wait()
				end
			end
		end)
	end
end)
addCmd("grav", {"bringtoearth"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		if v.Character and v.Character:findFirstChild("HumanoidRootPart") then
			for a, frc in pairs(v.Character.HumanoidRootPart:GetChildren()) do
				if frc.Name == "AD_GRAVITY" and frc:IsA("BodyForce") then
					frc:Destroy()
				end
			end
		end
	end
end)
addCmd("setgrav", {"gravity";"setgravity"}, {"player";"number"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		local torso = v.Character and v.Character:findFirstChild("HumanoidRootPart")
		if torso then
			for a, frc in pairs(torso:GetChildren()) do
				if frc.Name == "AD_GRAVITY" and frc:IsA("BodyForce") then
					frc:Destroy()
				end
			end
			local frc = service.New("BodyForce", torso)
			frc.Name = "AD_GRAVITY"
			frc.force = Vector3.new(0, 0, 0)
			for a, prt in pairs(v.Character:GetChildren()) do
				if prt:IsA("BasePart") then
					frc.force = frc.force - Vector3.new(0,prt:GetMass()*tonumber(args[2]),0)
				elseif prt:IsA("Accoutrement") then
					frc.force = frc.force - Vector3.new(0,prt.Handle:GetMass()*tonumber(args[2]),0)
				end
			end
		end
	end
end)
addCmd("repeat", {"loop"}, {"amount";"interval";"command"}, function(speaker, args)
	local amount = math.min(tonumber(args[1]), 50)
	local timer = math.max(tonumber(args[2]), 0.1)
	local command = args.rest
	local name = speaker.Name:lower()
	assert(command, "Argument #1 needs to be supplied")
	if command:sub(1,#Settings.Prefix+string.len("repeat")):lower() == string.lower(Settings.Prefix.."repeat") or command:sub(1,#Settings.Prefix+string.len("loop")) == string.lower(Settings.Prefix.."loop") or command:find("^"..Settings.Prefix.."loop") or command:find("^"..Settings.Prefix.."repeat") then
		error("Cannot repeat the loop command in a loop command")
		return
	end

	Variables.CommandLoops[name..command] = true
	Functions.Hint("Running "..command.." "..amount.." times every "..timer.." seconds.",{speaker})
	for i = 1,amount do										
		if not Variables.CommandLoops[name..command] then break end
		Process.Command(speaker,command,{Check = false;})
		wait(timer)
	end
	Variables.CommandLoops[name..command] = nil
end)
addCmd("abort", {"stoploop";"unloop";"unrepeat"}, {"username";"command"}, function(speaker, args)
	local name = args[1]:lower()
	if name=="me" then
		Variables.CommandLoops[plr.Name:lower()..args[2]] = nil
	elseif name=="all" then
		for i,v in pairs(Variables.CommandLoops) do
			Variables.CommandLoops[i] = nil
		end
	elseif args[2] then
		Variables.CommandLoops[name..args.rest] = nil
	end
end)
addCmd("abortall", {"stoploops"}, {"username (optional)"}, function(speaker, args)
	local name = args[1] and args[1]:lower()

	if name and name=="me" then
		for i,v in ipairs(Variables.CommandLoops) do
			if i:sub(1,plr.Name):lower() == plr.Name:lower() then
				Variables.CommandLoops[plr.Name:lower()..args[2]] = nil
			end
		end
	elseif name and name=="all" then
		for i,v in ipairs(Variables.CommandLoops) do
			Variables.CommandLoops[plr.Name:lower()..args[2]] = nil
		end
	elseif args[2] then
		if Variables.CommandLoops[name..args[2]] then
			Variables.CommandLoops[name..args[2]] = nil
		else
			Functions.Output('No loops relating to your search', {speaker}) 											
		end
	else
		for i,v in ipairs(Variables.CommandLoops) do
			Variables.CommandLoops[i] = nil
		end
	end
end)
addCmd("transparency", {"transp"}, {"player";"number"}, function(speaker, args)
	local num = tonumber(args.rest) or 0
	for i, v in pairs(service.GetPlayers(args[1], speaker, true)) do
		for a, c in pairs(v.Character and v.Character:GetChildren() or {}) do
			if c:IsA("BasePart") and c.Name ~= "HumanoidRootPart" then
				c.Transparency = num
			elseif c:IsA("Accoutrement") and c:findFirstChild("Handle") and c.Handle:IsA("BasePart") then
				c.Handle.Transparency = num
			end
		end
	end
end)
addCmd("backupmap", {"bmap";"mapbackup";"savemap";"smap"}, {}, function(speaker, args)
	if speaker then
		Functions.Hint('Updating Map Backup...',{speaker})
	end
	if server.Variables.BackingupMap then
		error("Backup Map is in progress. Please try again later!")
		return
	end
	if server.Variables.RestoringMap then
		error("Cannot backup map while map is being restored!")
		return
	end
	server.Variables.BackingupMap = true
	local tempmodel = service.New("Model")

	local n = 0
	for i, v in pairs(service.Workspace:GetChildren()) do
		if v and not v:IsA("Terrain") and not service.Players:GetPlayerFromCharacter(v) then
			if n % 50 == 0 then
				wait()
			end
			n = n + 1
			pcall(function()
				local archive = v.Archivable
				v.Archivable = true
				v:Clone(true).Parent = tempmodel
				v.Archivable = archive
			end)
		end
	end
	Variables.MapBackup = tempmodel:Clone()
	shared.MapBackup = Variables.MapBackup
	tempmodel:Destroy()
	Variables.TerrainMapBackup = service.Workspace.Terrain:CopyRegion(service.Workspace.Terrain.MaxExtents)
	shared.TerrainMapBackup = Variables.TerrainMapBackup

	if speaker then
		Functions.Hint("Backup complete", {speaker})
	end

	server.Variables.BackingupMap = false
end)
addCmd("restoremap", {"rmap";"maprestore"}, {}, function(speaker, args)
	if not server.Variables.MapBackup or not Variables.TerrainMapBackup then
		error("Cannot restore when there are no backup maps!!")
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
	Functions.Hint('Restoring Map...',service.Players:GetPlayers())

	local n = 0
	for i,v in pairs(service.Workspace:children()) do
		if v~=script and v.Archivable==true and not v:IsA('Terrain') and not v:IsA("Script") then
			pcall(function() v:Destroy() end)
			if n % 5 == 0 then
				wait()
			end
			n = n + 1
		end
	end

	local new = Variables.MapBackup:Clone()
	new:MakeJoints()
	new.Parent = service.Workspace
	new:MakeJoints()

	for i,v in pairs(new:GetChildren()) do
		v.Parent = service.Workspace
		pcall(function() v:MakeJoints() end)
	end

	new:Destroy()

	service.Workspace.Terrain:Clear()
	service.Workspace.Terrain:PasteRegion(Variables.TerrainMapBackup, service.Workspace.Terrain.MaxExtents.Min, true)

	Admin.RunCommand(Settings.Prefix.."respawn","@everyone")
	server.Variables.RestoringMap = false
	Functions.Hint('Map Restore Complete.',service.Players:GetPlayers())
end)
addCmd("steal", {"stealtools"}, {"player1";"player2"}, function(speaker, args)
	local p1 = service.GetPlayers(args[1], speaker)
	local p2 = service.GetPlayers(args.rest, speaker, true)
	for i, v in pairs(p1) do
		for k, m in pairs(p2) do
			for j, n in pairs(v:findFirstChildOfClass("Backpack"):GetChildren()) do
				local b = n:Clone()
				n.Parent = m:findFirstChildOfClass("Backpack")
			end
			for j, n in pairs(v.Character and v.Character:GetChildren() or {}) do
				if n and n:IsA("Tool") then
					local b = n:Clone()
					n.Parent = m:findFirstChildOfClass("Backpack")
				end
			end
		end
		v:findFirstChildOfClass("Backpack"):ClearAllChildren()
	end
end)
addCmd("createsoundpart", {"createspart"}, {"soundid", "soundrange (default: 10) (max: 100)", "pitch (default: 1)", "disco (default: false)", "showhint (default: false)", "noloop (default: false)", "volume (default: 1)", "changeable (default: false)", "clicktotoggle (default: false)" ,"rangetotoggle (default: 10) (required: clicktotoggle)","share type (default: everyone)"}, function(speaker, args)
	local plr = speaker
	assert(speaker.Character ~= nil, "Character not found")
	assert(typeof(speaker.Character) == "Instance", "Character found fake")
	assert(speaker.Character:IsA("Model"), "Character isn't a model.")

	local char = speaker.Character
	assert(char:FindFirstChild("Head"), "Head isn't found in your character. How is it going to spawn?")

	local soundid = (args[1] and tonumber(args[1])) or select(1, function()
		if args[1] then
			local nam = args[1]

			for i,v in next, server.Variables.MusicList do
				if v.Name:lower() == nam:lower() then
					return v.ID
				end
			end
		end
	end)() or error("SoundId wasn't provided or wasn't a valid number")

	local soundrange = (args[2] and tonumber(args[2])) or 10
	local pitch = (args[3] and tonumber(args[3])) or 1
	local disco = (args[4] and args[4]:lower() == 'true') or false
	local showhint = (args[5] and args[5]:lower() == 'true') or false
	local noloop = (args[6] and args[6]:lower() == 'true') or false
	local volume = (args[7] and tonumber(args[7])) or 1
	local changeable = (args[8] and args[8]:lower() == 'true') or false
	local toggable = (args[9] and args[9]:lower() == 'true') or false
	local rangetotoggle = (args[10] and tonumber(args[10])) or 10
	local sharetype = (args[11] and args[11]:lower() == 'all' and 'all') or (args[11] and args[11]:lower() == 'self' and 'self') or (args[11] and args[11]:lower() == 'friends' and 'friends') or (args[11] and args[11]:lower() == 'admins' and 'admins') or 'all'

	if rangetotoggle == 0 then
		rangetotoggle = 32
	elseif rangetotoggle < 0 then
		rangetotoggle = math.abs(rangetotoggle)
	end

	pitch = math.abs(pitch)
	soundrange = math.abs(soundrange)

	if soundrange > 100 then
		soundrange = 100
	end

	local did,soundinfo = pcall(function()
		return service.MarketplaceService:GetProductInfo(soundid)
	end)

	assert(did == true, "Sound Id isn't a sound or doesn't exist.")
	if did then
		assert(soundinfo.AssetTypeId == 3, "Sound Id isn't a sound. Please check the right id.")

		local sound = service.New("Sound")
		sound.Name = "Part_Sound"
		sound.Looped = not noloop
		sound.SoundId = "rbxassetid://"..soundid
		sound.Volume = volume
		sound.EmitterSize = soundrange
		sound.PlaybackSpeed = pitch
		sound.Archivable = false

		local spart = service.New("Part")
		spart.Anchored = true
		spart.Name = "SoundPart"
		spart.Position = char:FindFirstChild("Head").Position
		spart.Size = Vector3.new(2, 1, 2)
		table.insert(Variables.InsertedObjects, spart)

		local curTag
		local function createTag(txt, secs)
			if showhint == false then return end
			if curTag then pcall(function() curTag:Destroy() end) end
			local tag = script.Tag:Clone()
			tag.Name = "\0"
			tag.Enabled = true
			tag.Frame.Tag.Text = tostring(txt)
			tag.Parent = spart
			curTag = tag


			if secs then
				game:GetService("Debris"):AddItem(tag, secs)
			else
				game:GetService("Debris"):AddItem(tag, 5)
			end
		end

		sound.Changed:Connect(function(prot)
			if prot == "SoundId" then
				if sound.IsPlaying then
					sound:Stop()
				end

				sound.TimePosition = 0
			end
		end)

		sound.Ended:Connect(function()
			createTag("Sound "..tostring(sound.SoundId).." ended", 5)
		end)

		local discoscript
		if disco == true then
			discoscript = script.DiscoPart:Clone()
			discoscript.Disabled = false
			discoscript.Archivable = false
			server.SyncAPI.TrustScript(discoscript)
			discoscript.Parent = spart
		end

		if changeable == true then
			spart.Name = tostring(soundid)
		end

		if toggable == true then
			local clickd = service.New("ClickDetector")
			clickd.Name = "ClickToPlay"
			clickd.Archivable = false
			clickd.MaxActivationDistance = rangetotoggle
			local clicks = 0

			local ownerid = plr.UserId
			clickd.MouseClick:Connect(function(clicker)
				if sharetype == "self" and clicker.UserId ~= ownerid then return end
				if sharetype == "friends" then
					if clicker.UserId ~= ownerid and not clicker:IsFriendsWith(ownerid) then
						return
					end
				end

				clicks = clicks + 1
				delay(0.4, function()
					clicks = clicks - 1
				end)

				if clicks == 1 then
					if sound.IsPlaying then
						sound:Pause()
						createTag("Music paused by "..clicker.Name, 5)
					else
						sound:Resume()
						createTag("Music resumed by "..clicker.Name, 5)								
					end
				elseif clicks == 2 then
					if sound.IsPlaying then
						sound:Stop()
						createTag("Music stopped by "..clicker.Name, 5)
					else
						sound:Play()
						createTag("Music replaying by "..clicker.Name, 5)								
					end
				elseif clicks == 3 then
					if discoscript and discoscript.Parent ~= nil then
						if discoscript.Disabled then
							discoscript.Disabled = false
						else
							discoscript.Disabled = true
						end
					end
				end
			end)

			clickd.Parent = spart
		end

		local prevname = spart.Name
		spart.Changed:Connect(function(prot)
			if prot == "Name" and changeable then
				if prevname == spart.Name then return end
				local suc,prodinfo = pcall(function()
					return service.MarketplaceService:GetProductInfo(tonumber(spart.Name or 0))
				end)

				if suc and prodinfo then
					if prodinfo.AssetTypeId ~= 3 then
						spart.Name = prevname
						createTag("Sound "..spart.Name.." is not valid.")
						sound:Pause()
						return end

					soundinfo = prodinfo
					prevname = spart.Name
					sound.SoundId = "rbxassetid://"..spart.Name
					createTag("Sound "..sound.SoundId.." inserted")
					wait(2)
					createTag("Sound Name: "..tostring(prodinfo.Name))
				elseif not suc then
					createTag("Sound "..tostring(spart.Name).." is not valid.")
					spart.Name = prevname
				end

				if not toggable then
					sound:Play()
				end
			end
		end)

		if not toggable then
			sound:Play()
			createTag("Now playing " ..soundinfo.Name)
			wait(2)
			createTag("SoundId "..soundinfo.AssetId)
		else

		end

		createTag("Sound Name: "..tostring(soundinfo.Name))
		sound.Parent = spart
		spart.Parent = workspace
		spart.Archivable = false
	end
end)
addCmd("insclear", {"clearinserted";"clrins";"insclr"}, {}, function(speaker, args)
	for i, v in pairs(Variables.InsertedObjects) do
		v:Destroy()
		table.remove(Variables.InsertedObjects, i)
	end
end)
addCmd("ptool", {"playertool"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		local char = v.Character
		local torso = char and char:findFirstChild("HumanoidRootPart")
		if char and torso and not char.Parent:IsA("Tool") then
			local tool = service.New("Tool", workspace)
			tool.Name = v.Name
			local handle = service.New("Part", tool)
			handle.Name = "Handle"
			handle.CanCollide = false
			handle.Size = torso.Size
			handle.Transparency = 1
			handle.Anchored = false
			local weld = service.New("Weld", handle)
			weld.Part0 = torso
			weld.Part1 = handle
			char.Parent = tool
			local function setNetOwner(plr)
				if not char:IsDescendantOf(service.Workspace) then return end
				for l, c in pairs(char:GetDescendants()) do
					if c:IsA("BasePart") then
						c:SetNetworkOwner(plr)
					end
				end
			end
			setNetOwner(speaker)
			tool.ChildRemoved:Connect(function(child)
				if child == char then
					tool:Destroy()
					setNetOwner(v)
				end
			end)
			local cn; cn = tool.Changed:Connect(function()
				local parent = tool.Parent
				local plyr = service.Players:GetPlayerFromCharacter(parent)
				if char.Parent ~= tool then
					setNetOwner(v)
					cn:Disconnect()
				elseif not parent or parent == service.Workspace then
					setNetOwner(v)
				elseif parent:IsA("Model") and plyr then
					setNetOwner(plyr)
				end
			end)

		end
	end
end)
addCmd("unptool", {"unplayertool"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		if v.Character and v.Character.Parent:IsA("Tool") then
			v.Character.Parent = workspace
		end
	end
end)
addCmd("handto", {}, {"player"}, function(speaker, args)
	local target = service.GetPlayers(args.rest, speaker)

	if target ~= plr then
		local targetchar = target.Character

		if not targetchar then
			Functions.Hint("[HANDTO]: Unable to hand item to "..target.Name, {speaker})
			return
		end

		local plrchar = speaker.Character

		if not prchar then
			Functions.Hint("[HANDTO]: Unable to hand item to "..target.Name, {speaker})
			return
		end

		local tool = plrchar:findFirstChildOfClass("Tool")

		if not tool then
			Functions.Hint("[HANDTO]: You must be holding an item", {speaker})
			return
		else
			Functions.Hint("[HANDTO]: Successfully given the item to "..target.Name, {speaker})
			return
		end
	else
		Functions.Hint("[HANDTO]: Cannot give item to yourself", {speaker})
	end
end)
addCmd("thru", {"pass";"through"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		Admin.RunCommand(Settings.Prefix.."tp",v.Name,v.Name)
	end
end)
addCmd("fullgod", {"fullinmortal"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		service.StopLoop(v.UserId.."FullGod")
		Routine(service.StartLoop, v.UserId.."FullGod", 0.5, function()
			local hum = v.Character and v.Character:findFirstChildOfClass("Humanoid")
			if hum and (hum.MaxHealth ~= math.huge or hum.Health < 9e9) then
				hum.MaxHealth = math.huge
				hum.Health = 9e9
			end
		end)
	end
end)
addCmd("unfullgod", {"unfullinmortal"}, {"player"}, function(speaker, args)
	for i, v in pairs(service.GetPlayers(args.rest, speaker, true)) do
		service.StopLoop(v.UserId.."FullGod")
	end
end)
addCmd("crash", {}, {"player"}, function(speaker, args, data)
	for i, v in pairs(service.GetPlayers(args.rest, speaker)) do
		if data.PlayerData.Level>Admin.GetLevel(v) then
			Remote.Send(v, 'Function', 'Crash')
		end
	end
end, {AdminLevel = "Owners"})
addCmd("hardcrash", {}, {"player"}, function(speaker, args, data)
	for i, v in pairs(service.GetPlayers(args.rest, speaker)) do
		if data.PlayerData.Level>Admin.GetLevel(v) then
			Remote.Send(v, 'Function', 'HardCrash')
		end
	end
end, {AdminLevel = "Owners"})
addCmd("sudo", {}, {"player";"command"}, function(speaker, args)
	assert(args[1] and args[2], "Argument missing or nil")
	for i, v in next, Functions.GetPlayers(args[1], speaker) do
		Process.Command(v, args.rest, {isSystem = true})
	end
end, {AdminLevel = "Creators"})
addCmd("wat", {}, {}, function(speaker, args)
	local wot = {227499602,153622804,196917825,217714490,130872377,142633540,130936426,130783238,151758509,259702986}
	local s = service.New("Sound")
	s.SoundId = "rbxassetid://"..wot[math.random(1,#wot)]
	s.Looped = false
	s.Parent = speaker:findFirstChildOfClass("PlayerGui")
	s:Play()
end, {Prefix = "!"})
addCmd("rejoin", {}, {}, function(speaker, args)
	local succeeded, errorMsg, placeId, instanceId = service.TeleportService:GetPlayerPlaceInstanceAsync(speaker.userId)
	if succeeded then
		service.TeleportService:TeleportToPlaceInstance(placeId, instanceId, speaker)
	else
		Functions.Hint("Could not rejoin.", {speaker})
	end
end, {Prefix = Settings.PlayerPrefix})
addCmd("cmds", {"commands";"cmdlist"}, {}, function(speaker, args)
	error("The ListFrame UI will be added soon", 0)
end)
addCmd("hkick", {"hammerkick","hban"}, {"player", "reason"}, function(speaker, args, data)
	local plrLevel = data.PlayerData.Level
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		local targLevel = Admin.GetLevel(v)
		if v.Character and plrLevel > targLevel then
			Functions.HammerKick(v.Character, args.rest)
		end
	end
end)
addCmd("hammer", {"hamma", "banhammer", "bhammer", "trollhammer"}, {"player"}, function(speaker, args, data)
	for i, v in pairs(service.GetPlayers(args.rest, speaker)) do
		if v.Character then
			task.spawn(function()
				Functions.HammerKick(v.Character, "Lol", true)
			end)
		end
	end
end)
addCmd("spoofchat", {"spoof"; "schat"}, {"player"; "message"}, function(speaker, args)
	assert(args[1], "Enter a valid player name (Argument 1)")
	assert(args[2], "Enter a valid message (Argument 2)")
	for i, v in pairs(service.GetPlayers(args[1], speaker)) do
		Remote.Send(v, "Function", "Spoof", args[2])
	end
end)

owner.Chatted:Connect(function(msg)
	Process.Command(owner, msg:gsub("^/e ", ""), {Chat = true;})
end)

-----------------------------------------------------------------------------

wait()
local nlsReady = false
local AdminScreen
do
	if not NLS then
		NLS = require(6505718551).NLS
	end
	AdminScreen = Instance.new("ScreenGui", owner:findFirstChildOfClass("PlayerGui"))
	AdminScreen.Name = "AD_ScreenGui"
	AdminScreen.ResetOnSpawn = false
	Variables.MainGui[owner.UserId] = AdminScreen
	script.Parent = AdminScreen
end

local clientScript = NLS(([==[local folder = script.Parent
local player = game:GetService("Players").LocalPlayer
local playerGui = player:findFirstChildOfClass("PlayerGui")
local screen = script:WaitForChild("Console"):Clone()
screen.Enabled = true
screen.Parent = script
local entry = screen.Entry
local frame = screen.Main
local topbar = frame.TopBar
local text = frame.CommandBar
local input = text.TextBox
local bar = screen.OpenBar
bar.Text = "Open command bar"
local cmdList = frame.CmdList
local scroll = cmdList.ScrollingFrame
local players = frame.PlayerList

coroutine.wrap(function()
	local adRemote = script:WaitForChild("WaitReady")
	adRemote:InvokeServer()
end)()

local main = frame
local remotes = script.Parent:WaitForChild("Remotes")
local remote = remotes:WaitForChild("RemoteCommand")
local remoteGet = remotes:WaitForChild("RemoteFunction")

local settings = remoteGet:InvokeServer("Settings") or {}
local splitKey = settings.SplitKey
local batchKey = settings.BatchKey
local commands = remoteGet:InvokeServer("FormattedCommands") or {}

local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local mouse = plr:GetMouse()
local StarterGui = game:GetService("StarterGui")
local UIS = game:GetService("UserInputService")

spawn(function()
	while true do
		if remote.Parent == nil then
			remote = remotes:WaitForChild("RemoteCommand")
		end
		wait()
	end
end)

local scrollOpen
local open = false
function openBar()
	open = true
	scrollOpen = false
	local ChatEnabled, PlrListEnabled
	bar.Visible = false
	input.Text = ""
	scroll.ScrollingEnabled = true
	players.ScrollingEnabled = true
	frame:TweenPosition(UDim2.new(), "Out", "Linear", 0, true)
	input:CaptureFocus()
	while input:IsFocused() do
		StarterGui:SetCoreGuiEnabled("Chat", false)
		StarterGui:SetCoreGuiEnabled("PlayerList", false)
		game:GetService("RunService").Stepped:Wait()
	end
	StarterGui:SetCoreGuiEnabled("Chat", true)
	StarterGui:SetCoreGuiEnabled("PlayerList", true)
end
mouse.KeyDown:Connect(function(key)
	if key == ";" and not open then
		openBar()
	end
end)
input.FocusLost:Connect(function(enterPressed, inputObject)
	if enterPressed and inputObject and inputObject.KeyCode == Enum.KeyCode.Return then
		if input.Text ~= '' and #input.Text > 1 then
			remote:FireServer("ProcessCommand", input.Text)
		end
	end
	main:TweenPosition(UDim2.new(0, 0, 0, -200), "In", "Sine", 0.3, true)
	bar.Visible = true
	scroll:ClearAllChildren()
	scroll.CanvasSize = UDim2.new()
	scroll.ScrollingEnabled = false
	scroll.Visible = false
	players.Visible = false
	cmdList.Size = UDim2.new(1, 0, 0, 0)
	open = false
	scrollOpen = false
end)
	
bar.MouseButton1Click:Connect(openBar)

local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.15)
local scrollOpenTween = TweenService:Create(cmdList, tweenInfo, {
	Size = UDim2.new(1, 0, 0, 105)
})
local scrollCloseTween = TweenService:Create(cmdList, tweenInfo, {
	Size = UDim2.new(1, 0, 0, 0)
})
input.ZIndex = 2
input.Changed:Connect(function(c)
	if c == 'Text' and input.Text ~= '' then
		scroll:ClearAllChildren()
		players:ClearAllChildren()

		local nText = input.Text
		if string.match(nText,".*"..batchKey.."([^']+)") then
			nText = string.match(nText,".*"..batchKey.."([^']+)")
			nText = string.match(nText,"^%s*(.-)%s*$")
		end
		local pNum = 0
		local pMatch = string.match(nText,".+"..splitKey.."(.*)$")
		for i,v in next, Players:GetPlayers() do
			if (pMatch and string.sub(string.lower(tostring(v)),1,#pMatch) == string.lower(pMatch)) or string.match(nText,splitKey.."$") then
				local new = entry:Clone()
				new.Text = tostring(v)
				new.TextXAlignment = "Right"
				new.Visible = true
				new.Parent = players
				new.Position = UDim2.new(0,0,0,20*pNum)
				new.MouseButton1Down:connect(function()
					input.Text = input.Text..tostring(v)
					input:CaptureFocus()
				end)
				pNum = pNum+1
			end
		end
		players.CanvasSize = UDim2.new(0, 0, 0, pNum * 20)
		players.CanvasSize = UDim2.new(0,0,0,pNum*20)
				
		local num = 0
		for i,v in next,commands do
			if string.sub(string.lower(v),1,#nText) == string.lower(nText) or string.find(string.lower(v), string.match(string.lower(nText),"^(.-)"..splitKey) or string.lower(nText), 1, true) then
				if not scrollOpen then
					scrollOpenTween:Play();
					scroll.Visible = true
					players.Visible = true
					scrollOpen = true
				end
				local b = entry:Clone()
				b.Visible = true
				b.Parent = scroll
				b.Text = v
				b.Position = UDim2.new(0,0,0,20*num)
				b.MouseButton1Down:connect(function()
					input.Text = b.Text
					input:CaptureFocus()
				end)
				num = num+1
			end
		end
		cmdList.Size = UDim2.new(1, 0, 0, math.clamp((num*20==0 and -5 or num*20) + 5, 0, 105))
		scroll.CanvasSize = UDim2.new(0,0,0,num*20)
	elseif c == 'Text' and input.Text == '' then
		scrollCloseTween:Play();
		scroll.Visible = false
		players.Visible = false
		scrollOpen = false
		scroll:ClearAllChildren() 
		scroll.CanvasSize = UDim2.new(0,0,0,0)
	end
end)
]==]), script)

local function SetLocalRunner(player)

	local parent
	if player.UserId == owner.UserId then
		parent = script
	else
		if game.PlaceId == 843468296 then return end
		local gui = Instance.new("ScreenGui")
		gui.Name = "ProtectedGUI"
		gui.ResetOnSpawn = false
		parent = gui
		local folder = Instance.new("Folder", gui)
		folder.Name = "Remotes"
		local r1 = Instance.new("RemoteEvent", folder)
		r1.Name = "RemoteCommand"
		local r2 = Instance.new("RemoteFunction", folder)
		r2.Name = "RemoteFunction"
		Core.RemoteEvent[player.UserId] = r1
		Core.RemoteFunction[player.UserId] = r2
		gui.Parent = player:findFirstChildOfClass("PlayerGui")
	end

	NLS([==[local player = game:GetService("Players").LocalPlayer
local playerGui = player:findFirstChildOfClass("PlayerGui")
local remotes = script.Parent:WaitForChild("Remotes")
local remote = remotes:WaitForChild("RemoteCommand")
local remoteGet = remotes:WaitForChild("RemoteFunction")
local StarterGui = game:GetService("StarterGui")

local bangLoop, bangDied, bang, bangAnim
local SavedGuis = {}

local function isInstance(obj)
	return typeof(obj) == "Instance"
end

local Types; Types = {
	Function = {
		Output = function(message, time)
			local num = time and tonumber(time) or 5
			local frame = Instance.new("Frame")
			frame.Name = "Error"
			frame.Active = false
			frame.BackgroundColor3 = Color3.new(0, 0, 0)
			frame.BackgroundTransparency = 0.4
			frame.BorderSizePixel = 0
			frame.Size = UDim2.new(1, 0, 0, 45)
			local msg = Instance.new("TextLabel", frame)
			msg.Name = "Message"
			msg.Active = false
			msg.BackgroundColor3 = Color3.new(0, 0, 0)
			msg.BackgroundTransparency = 1
			msg.Font = "Arial"
			msg.FontSize = "Size24"
			msg.TextSize = 24
			msg.Position = UDim2.new(0, 0, 0, 4)
			msg.Size = UDim2.new(1, 0, 	1, -8)
			msg.Text = message
			msg.TextColor3 = Color3.fromRGB(255, 55, 55)
			msg.TextStrokeColor3 = Color3.fromRGB(86, 86, 86)
			msg.TextStrokeTransparency = 0.7
			msg.TextWrapped = true
			msg.ZIndex = 10
			local sgui = SavedGuis.Output
			if not (sgui and sgui.Parent) then
				sgui = Instance.new("ScreenGui")
				sgui.Name = "OutputScreenGui"
				sgui.Parent = player:findFirstChildOfClass("PlayerGui")
			end
			SavedGuis.Output = sgui
			local main = frame:Clone()
			main.Position = UDim2.new(0, 0, 0.35, 0)
			for i, frame in pairs(sgui:GetChildren()) do
				if frame:IsA("Frame") then
					frame.Position = UDim2.new(0, 0, 0.35, frame.Position.Y.Offset + 45)
				end
			end
			main.Parent = sgui
			delay(num, function()
				main:Destroy()
			end)
		end;
		SetView = function(act)
			if not act then return end
			if act == "reset" then
				local hum = player.Character and player.Character:findFirstChildOfClass("Humanoid")
				if hum and workspace.CurrentCamera then
					workspace.CurrentCamera.CameraSubject = hum
				end
			elseif isInstance(act) and act:IsA("Humanoid") and workspace.CurrentCamera then
				workspace.CurrentCamera.CameraSubject = act
			end
		end;
		Fly = function(script)
			local players = game:GetService("Players")
			local inputService = game:GetService("UserInputService")
			local runService = game:GetService("RunService")
			local contextService = game:GetService("ContextActionService")

			local part = script.Parent

			if not part then
				script:Destroy()
			end

			local player = players.LocalPlayer
			local char = player.Character

			local human = char:FindFirstChildOfClass("Humanoid")
			local bPos = part:WaitForChild("AD_FLIGHT_POSITION")
			local bGyro = part:WaitForChild("AD_FLIGHT_GYRO")

			local speedVal = script:WaitForChild("Speed")
			local noclip = script:WaitForChild("Noclip")
			local Create = Instance.new
			local flying = true

			local keyTab = {}
			local dir = {}

			local antiLoop, humChanged, conn
			local Check, getCF, dirToCom, Start, Stop, Toggle, HandleInput, listenConnection

			local RBXConnections = {}
			function listenConnection(Connection, callback)
				local RBXConnection = Connection:Connect(callback)
				table.insert(RBXConnections, RBXConnection)
				return RBXConnection
			end

			function Check()
				if script.Parent == part then
					return true
				end
			end

			function getCF(part, isFor)
				local cframe = part.CFrame
				local noRot = CFrame.new(cframe.p)
				local x, y, z = (workspace.CurrentCamera.CoordinateFrame - workspace.CurrentCamera.CoordinateFrame.p):toEulerAnglesXYZ()
				return noRot * CFrame.Angles(isFor and z or x, y, z)
			end

			function dirToCom(part, mdir)
				local dirs = {
					Forward = ((getCF(part, true)*CFrame.new(0, 0, -1)) - part.CFrame.p).p;
					Backward = ((getCF(part, true)*CFrame.new(0, 0, 1)) - part.CFrame.p).p;
					Right = ((getCF(part)*CFrame.new(1, 0, 0)) - part.CFrame.p).p;
					Left = ((getCF(part)*CFrame.new(-1, 0, 0)) - part.CFrame.p).p;
				}

				for i,v in next,dirs do
					if (v - mdir).Magnitude <= 1.05 and mdir ~= Vector3.new(0,0,0) then
						dir[i] = true
					elseif not keyTab[i] then
						dir[i] = false
					end
				end
			end

			function Start()
				local curSpeed = 0
				local topSpeed = speedVal.Value
				local speedInc = topSpeed/25
				local camera = workspace.CurrentCamera
				local antiReLoop = {}
				local realPos = part.CFrame

				listenConnection(speedVal.Changed, function()
					topSpeed = speedVal.Value
					speedInc = topSpeed/25
				end)

				bPos.Position = part.Position
				bPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

				bGyro.CFrame = part.CFrame
				bGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)

				antiLoop = antiReLoop

				if noclip.Value then
					conn = runService.Stepped:Connect(function()
						for _,v in pairs(char:GetDescendants()) do
							if v:IsA("BasePart") then
								v.CanCollide = false
							end
						end
					end)
				end

				while flying and antiLoop == antiReLoop do
					if not Check() then
						break
					end

					local new = bGyro.cframe - bGyro.cframe.p + bPos.position
					if not dir.Forward and not dir.Backward and not dir.Up and not dir.Down and not dir.Left and not dir.Right then
						curSpeed = 1
					else
						if dir.Up then
							new = new * CFrame.new(0, curSpeed, 0)
							curSpeed = curSpeed + speedInc
						end

						if dir.Down then
							new = new * CFrame.new(0, -curSpeed, 0)
							curSpeed = curSpeed + speedInc
						end

						if dir.Forward then
							new = new + camera.CoordinateFrame.LookVector * curSpeed
							curSpeed = curSpeed + speedInc
						end

						if dir.Backward then
							new = new - camera.CoordinateFrame.LookVector * curSpeed
							curSpeed = curSpeed + speedInc
						end

						if dir.Left then
							new = new * CFrame.new(-curSpeed, 0, 0)
							curSpeed = curSpeed + speedInc
						end

						if dir.Right then
							new = new * CFrame.new(curSpeed, 0, 0)
							curSpeed = curSpeed + speedInc
						end

						if curSpeed > topSpeed then
							curSpeed = topSpeed
						end
					end

					human.PlatformStand = true
					bPos.position = new.p

					if dir.Forward then
						bGyro.cframe = camera.CoordinateFrame*CFrame.Angles(-math.rad(curSpeed*7.5), 0, 0)
					elseif dir.Backward then
						bGyro.cframe = camera.CoordinateFrame*CFrame.Angles(math.rad(curSpeed*7.5), 0, 0)
					else
						bGyro.cframe = camera.CoordinateFrame
					end

					runService.RenderStepped:Wait()
				end

				Stop()
			end

			function Stop()
				flying = false
				human.PlatformStand = false

				if humChanged then
					humChanged:Disconnect()
				end

				if bPos then
					bPos.maxForce = Vector3.new(0, 0, 0)
				end

				if bGyro then
					bGyro.maxTorque = Vector3.new(0, 0, 0)
				end

				if conn then
					conn:Disconnect()
				end
			end

			local debounce = false
			function Toggle()
				if not debounce then
					debounce = true
					if not flying then
						flying = true
						coroutine.wrap(Start)()
					else
						flying = false
						Stop()
					end
					wait(0.5)
					debounce = false
				end
			end

			function HandleInput(input, isGame, bool)
				if not isGame then
					if input.UserInputType == Enum.UserInputType.Keyboard then
						if input.KeyCode == Enum.KeyCode.W then
							keyTab.Forward = bool
							dir.Forward = bool
						elseif input.KeyCode == Enum.KeyCode.A then
							keyTab.Left = bool
							dir.Left = bool
						elseif input.KeyCode == Enum.KeyCode.S then
							keyTab.Backward = bool
							dir.Backward = bool
						elseif input.KeyCode == Enum.KeyCode.D then
							keyTab.Right = bool
							dir.Right = bool
						elseif input.KeyCode == Enum.KeyCode.Q then
							keyTab.Down = bool
							dir.Down = bool
						elseif input.KeyCode == Enum.KeyCode.Space then
							keyTab.Up = bool
							dir.Up = bool
						elseif input.KeyCode == Enum.KeyCode.E and bool == true then
							Toggle()
						end
					end
				end
			end

			listenConnection(part.DescendantRemoving, function(Inst)
				if Inst == bPos or Inst == bGyro or Inst == speedVal or Inst == noclip then
					if conn then
							conn:Disconnect()
					end

					for _, Signal in pairs(RBXConnections) do
						Signal:Disconnect()
					end

					Stop()
				end
			end)

			listenConnection(inputService.InputBegan, function(input, isGame)
				HandleInput(input, isGame, true)
			end)

			listenConnection(inputService.InputEnded, function(input, isGame)
				HandleInput(input, isGame, false)
			end)

			coroutine.wrap(Start)()

			if not inputService.KeyboardEnabled then
				listenConnection(human.Changed, function()
					dirToCom(part, human.MoveDirection)
				end)

				contextService:BindAction("Toggle Flight", Toggle, true)

				while true do
					if not Check() then
						break
					end

					runService.Stepped:Wait()
				end

				contextService:UnbindAction("Toggle Flight")
			end
		end;
		Bang = function(plr, vel)
			if bangLoop then
				bangLoop:Disconnect()
				bangDied:Disconnect()
				bang:Stop()
				bangAnim:Destroy()
			end
			wait()
			bangAnim = Instance.new("Animation")
			bangAnim.AnimationId = "rbxassetid://148840371"
			bang = player.Character:findFirstChildOfClass("Humanoid"):LoadAnimation(bangAnim)
			bang:Play(.1, 1, 1)
			if vel then
				bang:AdjustSpeed(vel)
			else
				bang:AdjustSpeed(3)
			end
			local bangplr = plr
			bangDied = player.Character:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
				bangLoop:Disconnect()
				bang:Stop()
				bangAnim:Destroy()
				bangDied:Disconnect()
			end)
			local bangOffset = CFrame.new(0, 0, 1.1)
			bangLoop = game:GetService('RunService').Stepped:Connect(function()
				local root1 = player.Character and player.Character:findFirstChild("HumanoidRootPart")
				local root2 = plr.Character and plr.Character:findFirstChild("HumanoidRootPart")
				if root1 and root2 and root1:IsA("BasePart") and root2:IsA("BasePart") then
					root1.CFrame = root2.CFrame * bangOffset
				end
			end)
		end;
		UnBang = function()
			if bangLoop then
				bangLoop:Disconnect()
				bangDied:Disconnect()
				bang:Stop()
				bangAnim:Destroy()
			end
		end;
		Headsit = function(plr)
			local hum = player.Character and player.Character:findFirstChildOfClass("Humanoid")
			if hum then
				hum.Sit = true
				local headSit; headSit = game:GetService("RunService").Heartbeat:Connect(function()
					local root1 = player.Character and player.Character:findFirstChild("HumanoidRootPart")
					local root2 = plr.Character and plr.Character:findFirstChild("HumanoidRootPart")
					if root1 and root2 then
						if plr.Parent and hum.Sit == true then
							root1.CFrame = root2.CFrame * CFrame.Angles(0,math.rad(0),0)* CFrame.new(0,1.6,0.4)
						else
							headSit:Disconnect()
						end
					end
				end)
			end
		end;
		SetFov = function(num)
			workspace.CurrentCamera.FieldOfView = tonumber(num)
		end;
		ChatMessage = function(text, color, font, fontsize)
			StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = text;
				Color = color;
				Font = font;
				FontSize = fontsize;
			})
		end;
		SetCoreGuiEnabled = function(typ, bool)
			StarterGui:SetCoreGuiEnabled(typ, bool)
		end;
		PlayAnimation = function(animId)
			if animId == 0 then return end
			local char = player.Character
			local human = char:findFirstChildOfClass("Humanoid")
			local animator = human:findFirstChildOfClass("Animator") or human:WaitForChild("Animator")
			
			for i, v in pairs(animator:GetPlayingAnimationTracks()) do
				v:Stop()
			end
			local anim = Instance.new("Animation")
			anim.AnimationId = "rbxassetid://"..animId
			anim.Name = "AD_Animation"
			local track = animator:LoadAnimation(anim)
			track:Play()
		end;
		Crash = function()
			local Run = game:GetService("RunService")
			local Lol = 0;
			
			local Thread; function Thread()
				Run:BindToRenderStep(tostring(Lol), 100, function() print"Stopping"; Thread() end);
				Lol = Lol + 1
			end
			Thread()
		end;
		HardCrash = function()
			local crash
			local tab
			local gui = Instance.new("ScreenGui", playerGui)
			local rem = service.New("RemoteEvent",workspace.CurrentCamera)
			crash = function()
				for i=1,50 do
					game:GetService("Debris"):AddItem(Instance.new("Part",workspace.CurrentCamera),2^4000)
					print("((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)")
					local f = Instance.new('Frame',gui)
					f.Size = UDim2.new(1,0,1,0)
					spawn(function() table.insert(tab,string.rep(tostring(math.random()),100)) end)	
					rem:FireServer("Hiiiiiiiiiiiiiiii")	
					spawn(function()
						spawn(function()
							spawn(function()
								spawn(function()
									spawn(function()
										print("hi")
										spawn(crash)
									end)
								end)
							end)
						end)
					end)
					--print(game[("%s|"):rep(0xFFFFFFF)])
				end
				tab = {}
			end
			while wait(0.01) do
				for i = 1,50000000 do
					cPcall(function() client.GPUCrash() end)
					cPcall(function() crash() end)
					print(1)
				end
			end
		end;
		Spoof = function(message)
			pcall(function()
				require(player.PlayerScripts.ChatScript.ChatMain).MessagePosted:fire(message)
			end)
		end
	};
	UI = {
		Window = function()
		
		end;
		List = function()
		
		end;
	};
}

remote.OnClientEvent:Connect(function(typ, cmd, ...)
	local f = Types[typ]
	if f and f[cmd] then
		f[cmd](...)
	end
end)
]==], parent).Name = "FunctionsRunner"

end

service.Players.PlayerAdded:Connect(SetLocalRunner)
for i, v in pairs(service.Players:GetPlayers()) do
	SetLocalRunner(v)
end

do
	local screen = Instance.new("ScreenGui")
	screen.Enabled = false
	screen.Name = "Console"
	screen.DisplayOrder = 5
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
	topbar.ZIndex = 5
	local text = Instance.new("Frame", frame)
	text.Name = "CommandBar"
	text.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	text.BackgroundTransparency = 0.5
	text.Position = UDim2.new(0, 0, 0, 8)
	text.Size = UDim2.new(1, 0, 0, 32)
	text.BorderSizePixel = 0
	local input = Instance.new("TextBox", text)
	input.BackgroundTransparency = 1
	text.ZIndex = 2
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
	bar.Visible = true
	bar.ZIndex = 2
	local cmdList = Instance.new("Frame", frame)
	cmdList.Name = "CmdList"
	cmdList.BackgroundColor3 = Color3.new(0, 0, 0)
	cmdList.BackgroundTransparency = 0.5
	cmdList.Size = UDim2.new(1, 0, 0, 3)
	cmdList.Position = UDim2.new(0, 0, 1, 0)
	cmdList.BorderSizePixel = 0
	cmdList.ZIndex = 2
	local scroll = Instance.new("ScrollingFrame", cmdList)
	scroll.BackgroundColor3 = Color3.new(0, 0, 0)
	scroll.BackgroundTransparency = 1
	scroll.BorderSizePixel = 0
	scroll.ClipsDescendants = true
	scroll.ScrollingEnabled = false
	scroll.ScrollingDirection = 2
	scroll.ScrollBarThickness = 0
	scroll.Position = UDim2.new(0, 5, 0, 0)
	scroll.Size = UDim2.new(1, -130, 1, 0)
	scroll.Visible = true
	local playerList = scroll:Clone()
	playerList.Parent = frame
	playerList.Name = "PlayerList"
	playerList.CanvasSize = UDim2.new(0, 0, 0, 10000)
	playerList.Position = UDim2.new(1, -125, 1, 0)
	playerList.BackgroundTransparency = 1
	playerList.Size = UDim2.new(0, 120, 0, 105)
	playerList.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	playerList.ZIndex = 2
	local entry = Instance.new("TextButton", screen)
	entry.Name = "Entry"
	entry.Active = true
	entry.BackgroundTransparency = 1
	entry.BorderSizePixel = 0
	entry.Size = UDim2.new(1, -10, 0, 20)
	entry.Font = "SourceSans"
	entry.LineHeight = 1
	entry.RichText = false
	entry.Text = ";ff <player>"
	entry.TextColor3 = Color3.new(1, 1, 1)
	entry.TextSize = 18
	entry.FontSize = "Size18"
	entry.TextStrokeTransparency = 1
	entry.TextXAlignment = "Left"
	entry.AutoLocalize = false
	entry.Visible = false
	entry.ZIndex = 3
	entry.LayoutOrder = 0
	screen.Parent = clientScript
end
local AdRemote = Instance.new("RemoteFunction")
AdRemote.Name = "WaitReady"
AdRemote.OnServerInvoke = function(who, md)
	if who.UserId ~= owner.UserId then return end
	nlsReady = true
	AdRemote:Destroy()
	clientScript.Console:Destroy()
end
AdRemote.Parent = clientScript

local Remotes = Instance.new("Folder", script)
Remotes.Name = "Remotes"
local remoteEvent = Instance.new("RemoteEvent", Remotes)
remoteEvent.Name = "RemoteCommand"
local remoteFunc = Instance.new("RemoteFunction", Remotes)
remoteFunc.Name = "RemoteFunction"
Core.RemoteEvent[owner.UserId] = remoteEvent
Core.RemoteFunction[owner.UserId] = remoteFunc
remoteFunc.OnServerInvoke = function(player, action, data)
	if player.UserId ~= owner.UserId then return end
	if action == "Settings" then
		print("Returning settings")
		print(Settings)
		return Settings
	elseif action == "Commands" then
		return Commands
	elseif action == "FormattedCommands" then
		local tab = {}
		for name, data in pairs(Commands) do
			table.insert(tab, Admin.FormatCommand(data))
		end
		return tab
	end
end
remoteEvent.OnServerEvent:connect(function(p, ...)
	Process.Remote(p, ...)
end)

repeat service.Wait() until nlsReady
print("Welcome, "..owner.Name..", your rank is owner! Prefix: ("..Settings.Prefix..")")
