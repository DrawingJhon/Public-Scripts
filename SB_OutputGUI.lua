local plr = owner
local screen = Instance.new("ScreenGui")
screen.Name = "OutputGUI"

local MainFrame = Instance.new("Frame", screen)
MainFrame.Name = "Main"
MainFrame.Active = false
MainFrame.BackgroundColor3 = Color3.fromRGB()
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0, 6, 1, -241) -- Default Position
MainFrame.Size = UDim2.new(0, 550, 0, 206)
MainFrame.Style = "DropShadow"
do
	local ScriptList = Instance.new("Frame", MainFrame)
	ScriptList.Name = "ScriptList"
	ScriptList.BackgroundTransparency = 1
	ScriptList.BorderSizePixel = 0
	ScriptList.Position = UDim2.new(0, 0, 0, 24)
	ScriptList.Size = UDim2.new(0, 80, 1, -24)
	do
		local Title = Instance.new("TextLabel", ScriptList)
		Title.Name = "Title"
		Title.BackgroundTransparency = 1
		Title.Font = "SourceSans"
		Title.FontSize = "Size24"
		Title.Position = UDim2.new(0, 0, 0,- 26)
		Title.Size = UDim2.new(1, 0, 0, 24)
		Title.Text = "Scripts"
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 24
		Title.TextStrokeTransparency = 1
		Title.TextXAlignment = "Center"
		Title.TextYAlignment = "Top"
		local Horizontal = Instance.new("Frame", ScriptList)
		Horizontal.Name = "HorizontalLine"
		Horizontal.BackgroundColor3 = Color3.fromRGB(209, 209, 209)
		Horizontal.BackgroundTransparency = 0.9
		Horizontal.BorderSizePixel = 0
		Horizontal.Position = UDim2.new(0, 0, 0, 2)
		Horizontal.Size = UDim2.new(1, 0,  0, 1)
		Horizontal.ZIndex = 2
		local NoCreated = Instance.new("TextLabel", ScriptList)
		NoCreated.Name ="NoCreated"
		NoCreated.BackgroundTransparency = 1
		NoCreated.Font = "Arial"
		NoCreated.FontSize = "Size14"
		NoCreated.Position = UDim2.new()
		NoCreated.Size = UDim2.new(1, 0, 1, 0)
		NoCreated.Text = "No scripts created"
		NoCreated.TextColor3 = Color3.fromRGB(255, 255, 255)
		NoCreated.TextSize = 14
		NoCreated.TextStrokeTransparency = 1
		NoCreated.TextWrapped = true
		NoCreated.TextXAlignment = "Center"
		NoCreated.TextYAlignment = "Top"
		NoCreated.Visible = true -- Change manual
		local MainList = Instance.new("ScrollingFrame", ScriptList)
		MainList.Name = "MainList"
		MainList.BackgroundTransparency = 1
		MainList.BorderSizePixel = 0
		MainList.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
		MainList.CanvasPosition = Vector2.new()
		MainList.CanvasSize = UDim2.new() --  Change manual
		MainList.ClipsDescendants = true
		MainList.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		MainList.Position = UDim2.new(0, 0, 0, 5)
		MainList.ScrollBarThickness = 6 -- Change manual
		MainList.ScrollingEnabled = true
		MainList.Selectable = true
		MainList.Size = UDim2.new(1, 0, 1, -5)
		MainList.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
		do
			local ExampleText = Instance.new("TextButton", MainList)
			ExampleText.Name = "Script"
			ExampleText.BackgroundTransparency = 1
			ExampleText.Font = "Arial"
			ExampleText.FontSize = "Size14"
			ExampleText.Modal = false
			ExampleText.Position = UDim2.new() -- Change manual
			ExampleText.Selectable = true
			ExampleText.Size = UDim2.new(1, 0, 0, 14)
			ExampleText.Text = "ExampleScript"
			ExampleText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ExampleText.TextScaled = true
			ExampleText.TextStrokeTransparency = 1
			ExampleText.TextWrapped = true
			ExampleText.TextXAlignment = "Center"
			ExampleText.TextYAlignment = "Center"
			ExampleText.Visible = false -- Change manual
		end
	end
	local Output = Instance.new("Frame", MainFrame)
	Output.Name = "Output"
	Output.BackgroundColor3 = Color3.fromRGB(6, 6, 6)
	Output.BackgroundTransparency = 0.2
	Output.BorderSizePixel = 0
	Output.Position = UDim2.new(0, 85, 0, 30)
	Output.Size = UDim2.new(1, -85, 1, -30)
	do
		local Title = Instance.new("TextLabel", Output)
		Title.Name = "Title"
		Title.BackgroundTransparency = 1
		Title.Font = "SourceSans"
		Title.FontSize = "Size24"
		Title.Position = UDim2.new(0, 2, 0, -32)
		Title.Size = UDim2.new(1, 0, 0, 24)
		Title.Text = "Output"
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextStrokeTransparency = 1
		Title.TextXAlignment = "Left"
		Title.TextYAlignment = "Top"
		do
			local FPS = Instance.new("TextLabel", Title)
			FPS.Name = "FPS"
			FPS.BackgroundTransparency = 1
			FPS.Font = "Arial"
			FPS.FontSize = "Size14"
			FPS.Position = UDim2.new(0, 77, 0, 7)
			FPS.Size = UDim2.new(0, 200, 0, 18)
			FPS.Text = "FPS: 60" -- Change manual
			FPS.TextColor3 = Color3.fromRGB(255, 255, 255)
			FPS.TextStrokeTransparency = 1
			FPS.TextXAlignment = "Left"
			FPS.TextYAlignment = "Top"
			local Line = Instance.new("Frame", Title)
			Line.Name = "Line"
			Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Line.BackgroundTransparency = 0.8
			Line.BorderSizePixel = 0
			Line.Position = UDim2.new(0, 72, 0, 7)
			Line.Size = UDim2.new(0, 1, 0, 15)
			Line.ZIndex = 2
		end
		local Line = Instance.new("Frame", Output)
		Line.Name = "Line"
		Line.BackgroundColor3 = Color3.fromRGB(209, 209, 209)
		Line.BackgroundTransparency = 0.9
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(0, 0, 0, -4)
		Line.Size = UDim2.new(1, 0, 0, 1)
		Line.ZIndex = 2
		local Content = Instance.new("ScrollingFrame", Output)
		Content.Name = "Content"
		Content.BackgroundTransparency = 1
		Content.BorderSizePixel = 0
		Content.CanvasPosition = Vector2.new() -- Change manual
		Content.CanvasSize = UDim2.new(0, 447, 0, 112) -- Change manual
		Content.ClipsDescendants = true
		Content.Position = UDim2.new()
		Content.ScrollBarThickness = 5
		Content.ScrollingEnabled = true
		Content.Selectable = true
		Content.Size = UDim2.new(1, 0, 1, 0)
		do
			local Welcome = Instance.new("TextButton", Content)
			Welcome.Name = "Output"
			Welcome.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
			Welcome.BackgroundTransparency = 1
			Welcome.Font = "Arial"
			Welcome.FontSize = "Size14"
			Welcome.Position = UDim2.new(0, 2, 0, 0) -- Change manual
			Welcome.Selectable = true
			Welcome.Size = UDim2.new(0, 442, 0, 14)
			Welcome.Text = "20:31:02 - Welcome to Voidacity's Script Builder. Please don't abuse. Enjoy!" --Change manual (time)
			Welcome.TextColor3 = Color3.fromRGB(0, 255, 0)
			Welcome.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
			Welcome.TextStrokeTransparency = 1
			Welcome.TextXAlignment = "Left"
			Welcome.TextYAlignment = "Center"
		end
	end
	local Control = Instance.new("Frame", MainFrame)
	Control.Name = "Control"
	Control.BackgroundTransparency = 1
	Control.BorderSizePixel = 0
	Control.Position = UDim2.new()
	Control.Size = UDim2.new(1, 0, 0, 24)
	do
		local Exit = Instance.new("TextButton", Control)
		Exit.Name = "Exit"
		Exit.AutoButtonColor = true
		Exit.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Exit.BackgroundTransparency = 0
		Exit.Font = "SourceSans"
		Exit.FontSize = "Size18"
		Exit.Position = UDim2.new(1, -26, 0, 0)
		Exit.Selectable = true
		Exit.Size = UDim2.new(0, 26, 1, 0)
		Exit.Style = "RobloxButton"
		Exit.Text = "X"
		Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
		Exit.TextStrokeTransparency = 1
		Exit.ZIndex = 2
		local Clear = Instance.new("TextButton", Control)
		Clear.Name = "Clear"
		Clear.AutoButtonColor = true
		Clear.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Clear.BackgroundTransparency = 0
		Clear.Font = "Arial"
		Clear.FontSize = "Size14"
		Clear.Position = UDim2.new(1, -74, 0, 0)
		Clear.Selectable = true
		Clear.Size = UDim2.new(0, 50, 1, 0)
		Clear.Style = "RobloxButton"
		Clear.Text = "Clear"
		Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
		Clear.TextStrokeTransparency = 1
		Clear.ZIndex = 2
		local ToolMode = Instance.new("TextButton", Control)
		ToolMode.Name = "ToolMode"
		ToolMode.AutoButtonColor = true
		ToolMode.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		ToolMode.BackgroundTransparency = 0
		ToolMode.Font = "Arial"
		ToolMode.FontSize = "Size14"
		ToolMode.Position = UDim2.new(1, -149, 0, 0)
		ToolMode.Selectable = true
		ToolMode.Selected = false -- Change manual
		ToolMode.Size = UDim2.new(0, 77, 1, 0)
		ToolMode.Style = "RobloxButton"
		ToolMode.Text = "Tool Mode"
		ToolMode.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToolMode.TextStrokeTransparency = 1
		ToolMode.ZIndex = 2
	end
	local Line = Instance.new("Frame", MainFrame)
	Line.Name = "Line"
	Line.BackgroundColor3 = Color3.fromRGB(209, 209, 209)
	Line.Transparency = 0.9
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 82, 0, 0)
	Line.Size = UDim2.new(0, 1, 1, 0)
	Line.ZIndex = 2
end
local CommandBar = Instance.new("Frame", screen)
CommandBar.Name = "CommandBar"
CommandBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CommandBar.Transparency = 0
CommandBar.Position = UDim2.new(0, 65, 1, -35)
CommandBar.Size = UDim2.new(0, 400, 0, 30)
CommandBar.Style = "DropShadow"
do
	local Open = Instance.new("TextButton", CommandBar)
	Open.Name = "Open"
	Open.Active = true
	Open.AutoButtonColor = true
	Open.BackgroundColor3 = Color3.fromRGB(170, 255, 255)
	Open.BackgroundTransparency = 1
	Open.BorderSizePixel = 0
	Open.Font = "SourceSans"
	Open.FontSize = "Size14"
	Open.Position = UDim2.new(0, -3, 0, -3)
	Open.Size = UDim2.new(0, 75, 0, 20)
	Open.Text = "Close Output" -- Change manual
	Open.TextColor3 = Color3.fromRGB(255, 255, 255)
	Open.TextStrokeTransparency = 1
	local Line = Instance.new("Frame", CommandBar)
	Line.Name = "Line"
	Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Line.BackgroundTransparency = 0.8
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 75, 0, 0)
	Line.Size = UDim2.new(0, 1, 1, 0)
	Line.ZIndex = 2
	local Input = Instance.new("TextBox", CommandBar)
	Input.Name = "Input"
	Input.Active = true
	Input.BackgroundTransparency = 1
	Input.BorderSizePixel = 0
	Input.ClearTextOnFocus = true -- Yes?
	Input.Font = "SourceSans"
	Input.FontSize = "Size14"
	Input.MultiLine = false
	Input.Position = UDim2.new(0, 80, 0, -3)
	Input.Selectable = true
	Input.Size = UDim2.new(1, -77, 0, 20)
	Input.Text = "Click here or press (') to run a command" -- Change manual
	Input.TextColor3 = Color3.fromRGB(255, 255, 255)
	Input.TextStrokeTransparency = 1
	Input.TextXAlignment = "Left"
	Input.Visible = true
end
local Description = Instance.new("TextLabel", screen)
Description.Name = "Description"
Description.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Description.BorderSizePixel = 0
Description.Font = "SourceSans"
Description.FontSize = "Size14"
Description.Position = UDim2.new() -- Change manual
Description.Size = UDim2.new(0, 53, 0, 16)
Description.Text = "Example"
Description.TextColor3 = Color3.fromRGB(255, 255, 255)
Description.TextStrokeTransparency = 1
Description.ZIndex = 2
Description.Visible = false -- Change manual
screen.Parent = plr.PlayerGui