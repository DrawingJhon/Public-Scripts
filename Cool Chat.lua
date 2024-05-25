local sg = Instance.new("ScreenGui", game.CoreGui)
sg.Name = "CoolChat"
local main = Instance.new("Frame", sg)
main.Name = "Main"
main.AnchorPoint = Vector2.new(0, 1)
main.Position = UDim2.new(0, 40, 1, -40)
main.Size = UDim2.new(0, 400, 0, 200)
main.BorderSizePixel = 0
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BackgroundTransparency = 0.3
local top = Instance.new("Frame", main)
top.Name = "Top"
top.Size = UDim2.new(1, 0, 0, 25)
top.BorderSizePixel = 0
top.BackgroundColor3 = Color3.new()
top.BackgroundTransparency = 1
local close = Instance.new("TextButton", top)
close.Name = "Close"
close.AnchorPoint = Vector2.new(1, 0)
close.Position = UDim2.new(1, -5, 0, 0)
close.Size = UDim2.new(0, 30, 0, 20)
close.BackgroundColor3 = Color3.new(1, 0, 0)
close.BackgroundTransparency = 0.3
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1) 
close.BorderSizePixel = 0
local control = Instance.new("Frame", main)
control.Name = "Control"
control.AnchorPoint = Vector2.new(0.5, 0)
control.Position = UDim2.new(0.5, 0, 0, 25)
control.Size = UDim2.new(1, -10, 1, -30)
control.BorderSizePixel = 0
control.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

local uis = game:GetService("UserInputService")
local replicated = game:GetService("ReplicatedStorage")

-- Events
close.MouseButton1Click:Connect(function()
	sg:Destroy()
end)

-- Draggable
local pressing = false
local pressOffset = UDim2.new()

main.InputBegan:Connect(function(input)
	if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
	pressOffset = UDim2.new(0, input.Position.X, 0, input.Position.Y) - main.Position
	pressing = true
end)

uis.InputEnded:Connect(function(input)
	if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
	pressing = false
end)

uis.InputChanged:Connect(function(input)
	if input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
	if pressing then
		main.Position = UDim2.new(0, input.Position.X, 0, input.Position.Y) - pressOffset
	end
end)