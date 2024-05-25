local sg = Instance.new("ScreenGui")
sg.Name = "LogNotepad"
local main = Instance.new("Frame", sg)
main.Name = "Main"
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
main.BackgroundTransparency = 0.4
main.Size = UDim2.new(0, 400, 0, 400)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.5, -200, 0.5, -200)
local scroll = Instance.new("ScrollingFrame", main)
scroll.CanvasSize = UDim2.new()
scroll.AnchorPoint = Vector2.new(0.5, 0)
scroll.Position = UDim2.new(0.5, 0, 0, 25)
scroll.Size = UDim2.new(1, -10, 1, -30)
scroll.BorderSizePixel = 0
scroll.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
scroll.BackgroundTransparency = 0.4
scroll.ScrollBarThickness = 5
local tb = Instance.new("TextBox", scroll)
tb.Name = "Editor"
tb.AnchorPoint = Vector2.new(0.5, 0.5)
tb.Position = UDim2.new(0.5, 0, 0.5, 0)
tb.Size = UDim2.new(1, -6, 1, -6)
tb.BorderSizePixel = 0
tb.Font = "SourceSans"
tb.BackgroundTransparency = 1
tb.TextXAlignment = "Left"
tb.TextYAlignment = "Top"
tb.TextSize = 15
tb.TextColor3 = Color3.new(1, 1, 1)
tb.ClearTextOnFocus = false
tb.MultiLine = true
tb.TextWrapped = true
tb.Text = ""
tb.TextEditable = false
local button = Instance.new("TextButton", main)
button.AnchorPoint = Vector2.new(1, 0)
button.Position = UDim2.new(1, -5, 0, 0)
button.Size = UDim2.new(0, 30, 0, 20)
button.BorderSizePixel = 0
button.BackgroundColor3 = Color3.fromRGB(255, 10, 10)
button.BackgroundTransparency = 0.4
button.Text = "X"
button.TextColor3 = Color3.new(1, 1, 1)
local minimize = Instance.new("TextButton", main)
minimize.Name = "Minimize"
minimize.AnchorPoint = Vector2.new(1, 0)
minimize.Position = UDim2.new(1, -35, 0, 0)
minimize.Size = UDim2.new(0, 30, 0, 20)
minimize.BorderSizePixel = 0
minimize.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
minimize.BackgroundTransparency = 0.3
minimize.Text = "-"
minimize.TextColor3 = Color3.new(1, 1, 1)
local clear = Instance.new("TextButton", main)
clear.Name = "Clear"
clear.AnchorPoint = Vector2.new(1, 0)
clear.Position = UDim2.new(1, -70, 0, 0)
clear.BorderSizePixel = 0
local title = Instance.new("TextLabel", main)
title.Name = "Title"
title.TextXAlignment = "Left"
title.Position = UDim2.new(0, 8, 0, 2)
title.Size = UDim2.new(0, 80, 0, 20)
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Text = "Notepad"
title.Font = "SourceSans"
title.TextSize = 16

sg.Parent = game:GetService("CoreGui")

-- Variables
local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
local uis = game:GetService("UserInputService")

-- Draggable
local tweenEffect = false
	
local mouseButton1, Touch = Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch
local pressing = false

local function inputMouse(input)
	return input.UserInputType == mouseButton1 or input.UserInputType == Touch
end

local con1, con2
con1 = main.InputBegan:Connect(function(input)
	pressing = true
	local lastPosition
	local dis = UDim2.new(0, mouse.X, 0, mouse.Y) - main.Position
	local loop
	if input.UserInputType == mouseButton1 or input.UserInputType == Touch then
		loop = game:GetService("RunService").RenderStepped:Connect(function()
			if pressing == false then loop:Disconnect() return end
			local pos = UDim2.new(0, mouse.X, 0, mouse.Y) - dis
			if pos == lastPosition then return else lastPosition = pos end
			if tweenEffect then
				main:TweenPosition(pos, "Out", "Sine", 0.1, true)
			else
				main.Position = pos
			end
		end)
	end
end)
con2 = game:GetService("UserInputService").InputEnded:Connect(function(input)
	if inputMouse(input) then
		pressing = false
	end
end)

local Boards = workspace.Interactions.Whiteboard
local WhitelistBoards = {}

for i, v in pairs(Boards:GetChildren()) do
	table.insert(WhitelistBoards, v:FindFirstChild("Board"))
end

local function getTarget()
	local unitRay = mouse.UnitRay
	local castParams = RaycastParams.new()
	castParams.FilterDescendantsInstances = WhitelistBoards
	castParams.FilterType = Enum.RaycastFilterType.Whitelist

	local result = workspace:Raycast(unitRay.Origin, unitRay.Direction * 400, castParams)
	return result and result.Instance
end

local selection = Instance.new("SelectionBox")
local selected = nil
local infoConn

local inputConn; inputConn = uis.InputBegan:Connect(function(input)
	if not inputMouse(input) then return end

	local target = getTarget()
	if target and selected ~= target then
		local surfacegui = target:FindFirstChildOfClass("SurfaceGui")
		if surfacegui then
			selected = target
			print("Pointing to "..target:GetFullName())
			selection.Parent = target.Parent

			local itext = surfacegui.Frame.Content
			if infoConn then
				infoConn:Disconnect()
			end
			print(itext.Font)
			local text = itext.Text
			infoConn = itext:GetPropertyChangedSignal("ContentText"):Connect(function()
				text = text.."\n---------------------------------------\n"..itext.ContentText
				tb.Text = text
			end)
			tb.Text = text
		end
	end
end)

-- Textbox changed
local TextService = game:GetService("TextService")
local textConn = tb:GetPropertyChangedSignal("ContentText"):Connect(function()
	-- scroll.CanvasSize = UDim2.new(0, 0, 0, #string.split(tb.ContentText, "\n") * tb.TextSize)
	local sizeY = TextService:GetTextSize(tb.Text, tb.TextSize, tb.Font, Vector2.new(tb.AbsoluteSize.X, 999999999)).Y
	scroll.CanvasSize = UDim2.new(0, 0, 0, sizeY)
	print(sizeY)
end)

-- Minimize event
local debounce = true
local origSize = main.Size
local minConn = minimize.MouseButton1Down:Connect(function()
	if debounce then
		debounce = false
		minimize.Text = "+"
		scroll.Visible = false
		main.Size = UDim2.new(0, origSize.X.Offset, 0, 25)
	else
		debounce = true
		minimize.Text = "-"
		scroll.Visible = true
		main.Size = origSize
	end
end)

-- Close window event
button.MouseButton1Down:Connect(function()
	sg:Destroy()
	selection:Destroy()
	con1:Disconnect()
	con2:Disconnect()
	inputConn:Disconnect()
	textConn:Disconnect()
	infoConn:Disconnect()
	minConn:Disconnect()
end)