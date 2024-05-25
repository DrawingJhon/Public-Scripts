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

makeDrag(script.Parent)