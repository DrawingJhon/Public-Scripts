local hazDrag = false

local function makeDrag(frame)
local mouse = owner:GetMouse()
local mouseButton1, Touch = Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch

local pressing = false

local con1
local con2
con1 = frame.InputBegan:connect(function(input)
	pressing = true
	local lastPosition
	local dis = UDim2.new(0, mouse.X, 0, mouse.Y) - frame.Position
	local loop
	if input.UserInputType == mouseButton1 or input.UserInputType == Touch then
		loop = game:GetService("RunService").RenderStepped:Connect(function()
			if pressing == false then loop:Disconnect() return end
			local pos = UDim2.new(0, mouse.X, 0, mouse.Y) - dis
			if pos == lastPosition then return else lastPosition = pos end
			frame:TweenPosition(pos, "Out", "Sine", 0.1, true)
		end)
	end
	if input.KeyCode == Enum.KeyCode.X then
		frame:Destroy()
		con1:Disconnect()
		con2:Disconnect()
	end
end)
con2 = game:GetService("UserInputService").InputEnded:Connect(function(input)
	if input.UserInputType ~= mouseButton1 and input.UserInputType ~= Touch then return end
	pressing = false
end)
end

for _, child in pairs(owner.PlayerGui:GetDescendants()) do
	if child.Name == "DragZZ" then
		if child.ClassName == "Frame" or child.ClassName == "TextButton" or child.ClassName == "TextLabel" or child.ClassName == "ImageLabel" then
			hazDrag = true
			makeDrag(child)
		end
	end
end

if hazDrag then return end
local screen = Instance.new("ScreenGui", owner.PlayerGui)
screen.Name = "DrGui"
local frame = Instance.new("TextLabel", screen)
frame.Text = "BRUH"
frame.Font = "Cartoon"
frame.TextScaled = true
frame.Name = "Draggable"
frame.Size = UDim2.new(0, 200, 0, 100)

makeDrag(frame)