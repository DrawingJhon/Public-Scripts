local Players = game:GetService("Players")

local tool = Instance.new("Tool")
tool.Name = "PaperNote"
tool.Grip = CFrame.new(1.21, -0.35, 0) * CFrame.Angles(math.rad(15), 0, 0)

local papernote = Instance.new("Part")
papernote.TopSurface = "Smooth"
papernote.BottomSurface = "Smooth"
papernote.Color = Color3.new(1, 1, 1)
papernote.Name = "Handle"
papernote.Size = Vector3.new(1.76, 2.68, 0.1)
papernote.Parent = tool

local sgui = Instance.new("SurfaceGui")
sgui.LightInfluence = 0
sgui.Face = Enum.NormalId.Back
sgui.SizingMode = "PixelsPerStud"
sgui.PixelsPerStud = 227.2727
sgui.Parent = papernote

local tl = Instance.new("TextLabel")
tl.BackgroundTransparency = 1
tl.Text = ""
tl.Size = UDim2.new(1, -20, 1, -20)
tl.TextSize = 14
tl.TextWrapped = true
tl.BorderSizePixel = 0
tl.AnchorPoint = Vector2.new(0.5, 0.5)
tl.Position = UDim2.new(0.5, 0, 0.5, 0)
tl.TextXAlignment = "Left"
tl.TextYAlignment = "Top"
tl.Parent = sgui

tool.Parent = owner.Backpack

local scr = nil

tool.Unequipped:Once(function()
	if scr then
		scr:Destroy()
		scr = nil
	end
end)

tool.Activated:Connect(function()
	if scr then return end

	local character = tool.Parent
	local player = Players:GetPlayerFromCharacter(character)

	local toolPointer = Instance.new("ObjectValue")
	toolPointer.Name = "ToolPointer"
	toolPointer.Value = tool

	local remote = Instance.new("RemoteEvent")
	remote.Name = "ChangeText"
	
	local myScr
	
	remote.OnServerEvent:Connect(function(sender, text)
		if sender ~= player then return end

		if text then
			tl.Text = text
		else
			myScr:Destroy()
			
			if scr == myScr then
				scr = nil
			end
		end
	end)

	myScr = NLS([==[
	local tool = script:WaitForChild("ToolPointer").Value
	local currentText = tool:WaitForChild("Handle"):WaitForChild("SurfaceGui"):WaitForChild("TextLabel").Text
	local remote = script:WaitForChild("ChangeText")
	
	local player = game:GetService("Players").LocalPlayer

	local function exit()
		remote:FireServer()
		script:Destroy()
	end
	
	if tool.Parent ~= player.Character then
		task.wait()
		exit()
		return
	end

	tool.Unequipped:Once(exit)

	local gui = Instance.new("ScreenGui")
	gui.Name = "PaperNote"

	local main = Instance.new("Frame")
	main.Name = "Main"
	main.AnchorPoint = Vector2.new(0.5, 1)
	main.Size = UDim2.new(0, 400, 0, 600)
	main.Position = UDim2.new(0.5, 0, 1, -70)
	main.BackgroundColor3 = Color3.new(1, 1, 1)
	main.BorderSizePixel = 0
	main.Parent = gui

	local uiScale = Instance.new("UIScale")
	uiScale.Parent = main
	
	local tb = Instance.new("TextBox")
	tb.AnchorPoint = Vector2.new(0.5, 0.5)
	tb.MultiLine = true
	tb.ClearTextOnFocus = false
	tb.TextSize = 14
	tb.Size = UDim2.new(1, -20, 1, -20)
	tb.Position = UDim2.new(0.5, 0, 0.5, 0)
	tb.BackgroundTransparency = 1
	tb.Text = currentText
	tb.TextXAlignment = "Left"
	tb.TextYAlignment = "Top"
	tb.TextWrapped = true
	tb.Parent = main

	local close = Instance.new("TextButton")
	close.Position = UDim2.new(1, 10, 0, 0)
	close.Size = UDim2.new(0, 30, 0, 30)
	close.BackgroundTransparency = 1
	close.TextColor3 = Color3.new(1, 1, 1)
	close.TextSize = 35
	close.Text = "x"
	close.Parent = main

	close.MouseButton1Click:Connect(exit)

	local function fixScale()
		local size = gui.AbsoluteSize
		local minHeight = main.Size.Y.Offset + 75
		
		uiScale.Scale = math.min(size.Y / minHeight, 1)
	end

	tb:GetPropertyChangedSignal("Text"):Connect(function()
		remote:FireServer(tb.Text)
	end)

	gui.Parent = script

	gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		fixScale()
	end)

	fixScale()
	]==], player:FindFirstChildOfClass("PlayerGui"))
	
	scr = myScr

	toolPointer.Parent = scr
	remote.Parent = scr
end)