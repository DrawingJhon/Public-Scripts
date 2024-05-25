local LocalizationService = game:GetService("LocalizationService")
local PolicyService = game:GetService("PolicyService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local source = HttpService:GetAsync("https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/by-code.json")
local emojisData = HttpService:JSONDecode(source)

local function GetData(code)
	local data = emojisData[code]
	table.foreach(data, print)
	local emoji = data.emoji
	
	return emoji
end

local panel = Instance.new("Part", script)
panel.Size = Vector3.new(10, 14, 1)
panel.Position = Vector3.new(0, 7, 0)
panel.Anchored = true
panel.TopSurface = "Smooth"
panel.BottomSurface = "Smooth"
panel.Color = Color3.fromRGB(24, 41, 55)
local surface = Instance.new("SurfaceGui", panel)
surface.SizingMode = 1
local title = Instance.new("TextLabel", surface)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Players Region"
title.TextSize = 50
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = "SourceSansBold"
local line = Instance.new("Frame", title)
line.Position = UDim2.new(0, 0, 1, 0)
line.BorderSizePixel = 0
line.BackgroundColor3 = Color3.new(1, 1, 1)
line.Size = UDim2.new(1, 0, 0, 2)
local scroll = Instance.new("ScrollingFrame", surface)
scroll.BorderSizePixel = 0
scroll.Size = UDim2.new(1, -10, 1, -10 - 50)
scroll.Position = UDim2.new(0, 10, 0, 10 + 50)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.BackgroundTransparency = 1
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Instance.new("UIListLayout", scroll).Padding = UDim.new(0, 10)
local template = Instance.new("Frame")
template.BorderSizePixel = 0
template.Name = "Entry"
template.Size = UDim2.new(1, -10, 0, 110)
template.BackgroundTransparency = 0.4
template.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
local tb = Instance.new("TextLabel", template)
tb.Text = ""
tb.Name = "Username"
tb.BorderSizePixel = 0
tb.Size = UDim2.new(1, 0, 0, 35)
tb.Position = UDim2.new(0, 5, 0, 0)
tb.TextXAlignment = "Left"
tb.TextSize = 40
tb.TextColor3 = Color3.new(1, 1, 1)
tb.Font = "SourceSansBold"
tb.BackgroundTransparency = 1
local icon = Instance.new("TextLabel", template)
icon.Name = "Icon"
icon.BorderSizePixel = 0
icon.Size = UDim2.new(1, 0, 0, 30)
icon.Position = UDim2.new(0, 5, 0, 40)
icon.Text = ""
icon.TextColor3 = Color3.new(1, 1, 1)
icon.BackgroundTransparency = 1
icon.TextXAlignment = "Left"
icon.TextSize = 20
local code = Instance.new("TextLabel", template)
code.Name = "Code"
code.BackgroundTransparency = 1
code.TextColor3 = Color3.new(1, 1, 1)
code.Text = ""
code.TextSize = 20
code.Position = UDim2.new(0, 5, 0, 75)
code.TextXAlignment = "Left"
code.Size = UDim2.new(1, 0, 0, 30)

local Entries = {}

local function OnPlayerAdded(player)
	if Entries[player] then return end
	
	local result, code = pcall(function()
		return LocalizationService:GetCountryRegionForPlayerAsync(player)
	end)
	
	if result then
		print(player.Name.." added")
		local data = emojisData[code]
		local joinTime = os.time() - (player.AccountAge*86400)
		local month, year = os.date("%B", joinTime), os.date("!*t", joinTime).year
		local hasSafeChat
		local policyInfo = PolicyService:GetPolicyInfoForPlayerAsync(player)
		if policyInfo then
			hasSafeChat = type(policyInfo) == "string" and policyInfo or table.find(policyInfo.AllowedExternalLinkReferences, "Discord") and "13+" or "<13"
		else
			hasSafeChat = "Redacted"
		end

		local entry = template:Clone()
		entry.Username.Text = player.Name.." ("..player.DisplayName..")"
		entry.Icon.Text = data.name.." "..data.emoji
		entry.Code.Text = month.." "..year.." • "..hasSafeChat
		entry.Parent = scroll
		
		
		Entries[player] = entry
	else
		warn("GetCountryRegionForPlayerAsync failed for "..player.Name..": " ..tostring(code))
	end
end

local function OnPlayerRemoving(player)
	local entry = Entries[player]
	if entry then
		entry:Destroy()
	end
	Entries[player] = nil
end

for i, player in pairs(Players:GetPlayers()) do
	task.spawn(OnPlayerAdded, player)
end

Players.PlayerAdded:Connect(OnPlayerAdded)
Players.PlayerRemoving:Connect(OnPlayerRemoving)