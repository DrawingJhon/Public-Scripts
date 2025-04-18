script.Parent = owner.PlayerGui

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local InsertService = game:GetService("InsertService")

local DummyTemplate

pcall(function()
	DummyTemplate = InsertService:LoadAsset(1664543044):GetChildren()[1]
end)

if not DummyTemplate then
	local Character = owner.Character
	Character.Archivable = true

	local Dummy = Character:Clone()
	for _, child in Dummy:GetDescendants() do
		if child:IsA("Accoutrement") or child:IsA("Shirt") or child:IsA("Pants") or child:IsA("TemplateShirt") or child:IsA("BodyColors") or child:IsA("Tool") then
			child:Destroy()
		end
	end
	Dummy.Name = " "
	Dummy.Humanoid.DisplayName = " "

	DummyTemplate = Dummy
end

local OutfitsFolder = workspace:FindFirstChild("Outfits") or Instance.new("Folder")
OutfitsFolder.Name = "Outfits"
OutfitsFolder.Parent = workspace

OutfitsFolder:ClearAllChildren()

local function createSimpleGuiObject(className, props)
	local obj = Instance.new(className)
	--obj.BorderSizePixel = 0
	obj.BackgroundColor3 = Color3.new(1, 1, 1)
	pcall(function()
		obj.TextSize = 16
	end)
	for prop, val in props do
		if prop ~= "Parent" then
			obj[prop] = val
		end
	end
	obj.Parent = props.Parent
	return obj
end

local sg = Instance.new("ScreenGui")
sg.Name = "CostumesGui"
sg.ResetOnSpawn = false

local mainFrame = createSimpleGuiObject("Frame", {
	Name = "Main",
	AnchorPoint = Vector2.new(1, 0.5),
	Position = UDim2.new(1, 0, 0.5, 0),
	Size = UDim2.new(0, 250, 0, 110),
	Parent = sg
})

local input = createSimpleGuiObject("TextBox", {
	Name = "Input",
	AnchorPoint = Vector2.new(0.5, 0),
	Position = UDim2.new(0.5, 0, 0, 10),
	Size = UDim2.new(1, -20, 0, 40),
	PlaceholderText = "Username",
	Text = "",
	Parent = mainFrame
})

local submit = createSimpleGuiObject("TextButton", {
	Name = "Submit",
	AnchorPoint = Vector2.new(0.5, 0),
	Position = UDim2.new(0.5, 0, 0, 60),
	Size = UDim2.new(1, -20, 0, 40),
	BackgroundColor3 = Color3.fromRGB(100, 150, 255),
	TextColor3 = Color3.new(1, 1, 1),
	Text = "Submit",
	Parent = mainFrame
})

local function loadOutfit(username)
	print("Loading "..username.."...")
	local userId = Players:GetUserIdFromNameAsync(username)
	--local response = HttpService:GetAsync("https://avatar.roproxy.com/v1/users/"..userId.."/outfits?page=1&itemsPerPage=100")
	local response = HttpService:GetAsync(`https://avatar.roproxy.com/v2/avatar/users/{userId}/outfits?page=1&itemsPerPage=100&isEditable=true`)
	local result = HttpService:JSONDecode(response)

	local data = result.data

	OutfitsFolder:ClearAllChildren()

	for i, outfitData in data do
		local dummy = DummyTemplate:Clone()
		local humanoid = dummy.Humanoid
		local root = dummy.HumanoidRootPart

		humanoid.DisplayName = outfitData.name
		root.Anchored = true
		root.CFrame = CFrame.new(i * 6, 3, 0)

		dummy.Parent = OutfitsFolder

		local desc = Players:GetHumanoidDescriptionFromOutfitId(outfitData.id)
		local success, err = pcall(function()
			humanoid:ApplyDescription(desc)
		end)

		if not success then
			warn(`Couldn't load an outfit ({outfitData.id}) -> {err}`)
			continue
		end
		
		local height = dummy:GetExtentsSize().Y

		dummy:MoveTo(Vector3.new(i * 6, height / 2, 0))

		local prompt = Instance.new("ProximityPrompt")
		prompt.RequiresLineOfSight = false
		prompt.ActionText = ""
		prompt.Triggered:Connect(function(player)
			local human = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
			if human then
				human:ApplyDescription(desc)
			end
		end)
		prompt.Parent = root
	end
	print("Done!")
end

local remote = Instance.new("RemoteEvent")
remote.Name = "SetOutfits"
remote.OnServerEvent:Connect(function(player, username)
	if player ~= owner then return end
	
	loadOutfit(getPlayer(username))
end)

remote.Parent = NLS([==[
local mainFrame = script.Parent:WaitForChild("Main")
local input = mainFrame:WaitForChild("Input")
local submit = mainFrame:WaitForChild("Submit")

local remote = script:WaitForChild("SetOutfits")

submit.MouseButton1Click:Connect(function()
	remote:FireServer(input.Text)
end)
]==], sg)

local queue = {}
local processingOutfits = false
local cooldown = 15

local function processOutfits()
	if processingOutfits then return end

	local start = tick()

	processingOutfits = true

	while #queue > 0 do
		local username = table.remove(queue, 1)
		loadOutfit(username)
		
		repeat task.wait() until tick() - start > cooldown
	end

	processingOutfits = false
end

function getPlayer(name)
	if name:sub(1, 1) == "@" then
		return name:sub(2)
	end

	for _, player in Players:GetPlayers() do
		if player.DisplayName:sub(1, #name):lower() == name:lower() then
			return player.Name
		end
	end

	for _, player in Players:GetPlayers() do
		if player.Name:sub(1, #name):lower() == name:lower() then
			return player.Name
		end
	end
end

local function handlePlayer(player)
	local loadCmd = ".load"
	local cdCmd = ".cd"

	player.Chatted:Connect(function(message)
		if message:sub(1, #loadCmd + 1) == loadCmd.." " then
			local username = getPlayer(message:sub(#loadCmd + 2))
					
			table.insert(queue, username)
			processOutfits()
		end

		if message:sub(1, #cdCmd + 1) == cdCmd.." " then
			local cd = tonumber(message:sub(#cdCmd + 2))

			if cd then
				cooldown = cd
				print("Set cooldown to "..cooldown)
			else
				print("Error: Invalid number")
			end
		end
	end)
end

for _, player in Players:GetPlayers() do
	task.spawn(handlePlayer, player)
end

Players.PlayerAdded:Connect(handlePlayer)

sg.Parent = script
