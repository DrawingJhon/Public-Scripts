script.Parent = owner.PlayerGui

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local InsertService = game:GetService("InsertService")

local DummyTemplate = InsertService:LoadAsset(1664543044):GetChildren()[1]

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

local remote = Instance.new("RemoteEvent")
remote.Name = "SetOutfits"
remote.OnServerEvent:Connect(function(player, username)
	if player ~= owner then return end
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

sg.Parent = script