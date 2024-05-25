script.Parent = owner.PlayerGui

--Converted with ttyyuu12345's model to script plugin v4
ScreenGui0 = Instance.new("ScreenGui")
ScreenGui0.ResetOnSpawn = false
Frame1 = Instance.new("Frame")
Frame2 = Instance.new("Frame")
ImageButton3 = Instance.new("ImageButton")
Frame4 = Instance.new("Frame")
ImageButton5 = Instance.new("ImageButton")
ScrollingFrame6 = Instance.new("ScrollingFrame")
Frame7 = Instance.new("Frame")
TextLabel8 = Instance.new("TextLabel")
TextBox9 = Instance.new("TextBox")
ScreenGui0.Name = "ScriptEditor"
ScreenGui0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Frame1.Name = "Main"
Frame1.Parent = ScreenGui0
Frame1.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame1.Size = UDim2.new(0, 600, 0, 350)
Frame1.AnchorPoint = Vector2.new(0.5, 0.5)
Frame1.BackgroundColor = BrickColor.new("Black")
Frame1.BackgroundColor3 = Color3.new(0.14902, 0.14902, 0.14902)
Frame1.BorderSizePixel = 0
Frame1.BackgroundTransparency = 0.2
Frame2.Name = "Control"
Frame2.Parent = Frame1
Frame2.Position = UDim2.new(0, 0, 0, 30)
Frame2.Size = UDim2.new(1, 0, 0, 30)
Frame2.BackgroundColor = BrickColor.new("Black")
Frame2.BackgroundColor3 = Color3.new(0.184314, 0.184314, 0.184314)
Frame2.BackgroundTransparency = 0.2
Frame2.BorderSizePixel = 0
ImageButton3.Name = "run_button"
ImageButton3.Parent = Frame2
ImageButton3.Position = UDim2.new(0.949319243, 0, 0.0648680925, 0)
ImageButton3.Size = UDim2.new(0, 30, 0, 30)
ImageButton3.BackgroundColor = BrickColor.new("Sea green")
ImageButton3.BackgroundColor3 = Color3.new(0.207843, 0.647059, 0.384314)
ImageButton3.BackgroundTransparency = 1
ImageButton3.LayoutOrder = 10
ImageButton3.ZIndex = 2
ImageButton3.Image = "rbxassetid://3926307971"
ImageButton3.ImageColor3 = Color3.new(0.172549, 1, 0.266667)
ImageButton3.ImageRectOffset = Vector2.new(764, 244)
ImageButton3.ImageRectSize = Vector2.new(36, 36)
Frame4.Name = "Top"
Frame4.Parent = Frame1
Frame4.Size = UDim2.new(1, 0, 0, 30)
Frame4.BackgroundColor = BrickColor.new("Black")
Frame4.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
Frame4.BackgroundTransparency = 1
Frame4.BorderSizePixel = 0
ImageButton5.Name = "close"
ImageButton5.Parent = Frame4
ImageButton5.Position = UDim2.new(1, -30, 0.5, 0)
ImageButton5.Size = UDim2.new(0, 20, 0, 20)
ImageButton5.AnchorPoint = Vector2.new(0, 0.5)
ImageButton5.BackgroundTransparency = 1
ImageButton5.ZIndex = 2
ImageButton5.Image = "rbxassetid://3926305904"
ImageButton5.ImageRectOffset = Vector2.new(284, 4)
ImageButton5.ImageRectSize = Vector2.new(24, 24)
ScrollingFrame6.Parent = Frame1
ScrollingFrame6.Name = "Editor"
ScrollingFrame6.Position = UDim2.new(0.5, 0, 0, 60)
ScrollingFrame6.Size = UDim2.new(1, -10, 1, -65)
ScrollingFrame6.Active = true
ScrollingFrame6.AnchorPoint = Vector2.new(0.5, 0)
ScrollingFrame6.BackgroundColor = BrickColor.new("Black metallic")
ScrollingFrame6.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
ScrollingFrame6.BorderSizePixel = 0
ScrollingFrame6.CanvasSize = UDim2.new()
ScrollingFrame6.BackgroundTransparency = 0.2
Frame7.Name = "Lines"
Frame7.Parent = ScrollingFrame6
Frame7.Size = UDim2.new(0, 30, 1, 0)
Frame7.BackgroundColor = BrickColor.new("Black")
Frame7.BackgroundTransparency = 0.4
Frame7.BackgroundColor3 = Color3.new(0.14902, 0.14902, 0.14902)
Frame7.BorderSizePixel = 0
TextLabel8.Parent = Frame7
TextLabel8.Name = "1"
TextLabel8.Position = UDim2.new(0, 0, 0, 4)
TextLabel8.Size = UDim2.new(1, 0, 0, 15)
TextLabel8.BackgroundColor = BrickColor.new("Institutional white")
TextLabel8.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel8.BackgroundTransparency = 1
TextLabel8.Font = Enum.Font.SourceSans
TextLabel8.FontSize = Enum.FontSize.Size18
TextLabel8.Text = "1"
TextLabel8.TextColor = BrickColor.new("Institutional white")
TextLabel8.TextColor3 = Color3.new(1, 1, 1)
TextLabel8.TextSize = 15
TextLabel8.TextYAlignment = Enum.TextYAlignment.Bottom
TextBox9.Parent = ScrollingFrame6
TextBox9.Position = UDim2.new(0, 34, 0, 4)
TextBox9.Size = UDim2.new(1, -34, 1, 0)
TextBox9.BackgroundColor = BrickColor.new("Dark taupe")
TextBox9.BackgroundColor3 = Color3.new(0.290196, 0.290196, 0.290196)
TextBox9.BackgroundTransparency = 1
TextBox9.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
TextBox9.Font = Enum.Font.Code
TextBox9.FontSize = Enum.FontSize.Size18
TextBox9.Text = ""
TextBox9.TextColor = BrickColor.new("Institutional white")
TextBox9.TextColor3 = Color3.new(1, 1, 1)
TextBox9.TextSize = 15
TextBox9.TextXAlignment = Enum.TextXAlignment.Left
TextBox9.TextYAlignment = Enum.TextYAlignment.Top
TextBox9.ClearTextOnFocus = false
TextBox9.MultiLine = true

local screengui = ScreenGui0

local remote = Instance.new("RemoteEvent", screengui)
remote.Name = "Execute"
remote.OnServerEvent:Connect(function(plr, action, source)
	if plr == owner and remote.Parent:IsDescendantOf(owner.PlayerGui) then
		if action == "Execute" then
			NS(source, workspace)
		elseif action == "Close" then
			screengui:Destroy()
		end
	end
end)

screengui.Parent = NLS([==[
local screengui = script.ScriptEditor
local runButton = screengui.Main.Control.run_button
local closeButton = screengui.Main.Top.close
local editor = screengui.Main.Editor
local textbox = editor.TextBox
local lineList = editor.Lines
local line = lineList["1"]

local remote = screengui.Execute
local tab = " " -- string.char(226)

textbox:GetPropertyChangedSignal("ContentText"):Connect(function()
	--textbox.Text = textbox.Text:gsub("\t", tab)
	lineList:ClearAllChildren()
	local index = 0
	
	for i = 1, #textbox.Text:split("\n") do
		local entry = line:Clone()
		entry.Name = i
		entry.Text = tostring(i)
		entry.Position = UDim2.new(0, 0, 0, index + 4)
		entry.Parent = lineList
		
		index = index + entry.AbsoluteSize.Y
	end
	
	editor.CanvasSize = UDim2.new(0, textbox.TextBounds.X + 5, 0, textbox.TextBounds.Y + 5)
end)

runButton.MouseButton1Click:Connect(function()
	if textbox.Text ~= "" then
		remote:FireServer("Execute", textbox.ContentText)
	end
end)

closeButton.MouseButton1Click:Connect(function()
	remote:FireServer("Close")
end)

local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
local tweenEffect = false

local function makeDrag(frame, focusObj)
	if focusObj == nil then 
		focusObj = frame
	end
	
	local mouseButton1, Touch = Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch
	local pressing = false

	local con1
	local con2
	con1 = focusObj.InputBegan:connect(function(input)
		pressing = true
		local lastPosition
		local dis = UDim2.new(0, mouse.X, 0, mouse.Y) - frame.Position
		local loop
		if input.UserInputType == mouseButton1 or input.UserInputType == Touch then
			loop = game:GetService("RunService").RenderStepped:Connect(function()
				if pressing == false then loop:Disconnect() return end
				local pos = UDim2.new(0, mouse.X, 0, mouse.Y) - dis
				if pos == lastPosition then return else lastPosition = pos end
				if tweenEffect then
					frame:TweenPosition(pos, "Out", "Sine", 0.1, true)
				else
					frame.Position = pos
				end
			end)
		end
	end)
	con2 = game:GetService("UserInputService").InputEnded:Connect(function(input)
		if input.UserInputType ~= mouseButton1 and input.UserInputType ~= Touch then return end
		pressing = false
	end)
end

makeDrag(screengui.Main, screengui.Main.Top)
]==], script)