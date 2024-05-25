local player = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")
local mouse = player:GetMouse()
local g = Instance.new("ScreenGui", script)
g.Name = "Resizable"
local frame = Instance.new("Frame", g)
frame.Name = "Main"
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0, 300, 0, 500)
local buttonY = Instance.new("TextButton", frame)
buttonY.Name = "Button"
buttonY.Text = ""
buttonY.Size = UDim2.new(1, 0, 0, 30)
local pressing = false
local lastY = 0
local lastX = 0
local minY = 571
local maxY = 147
local minX = 150
local maxX = 650

buttonY.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		pressingY = true
		lastY = (mouse.Y - frame.Position.Y.Offset)
		lastX = (mouse.X - frame.Position.X.Offset)
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		pressingY = false
	end
end)

mouse.Move:Connect(function()
	if pressingY then
		local resultY = mouse.Y - lastY
		local x, y = mouse.X, math.min(math.max(resultY, maxY), minY)
		local sizeY = frame.Size.Y.Offset
		local posY = frame.Position.Y.Offset
		local newNum = posY - y
		frame.Position = UDim2.new(0, 300, 0, y)
		frame.Size = UDim2.new(0, 300, 0, sizeY + newNum)
	end
end)