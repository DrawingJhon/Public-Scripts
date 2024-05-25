local scr = NLS([==[
-- Services
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Tools
local placeTool = script:WaitForChild("Place").Value
local removeTool = script:WaitForChild("Remove").Value
local colorBucketTool = script:WaitForChild("Color Bucket").Value

-- Settings
local blockSize = script:WaitForChild("BlockSize").Value

local function getEquippedTool()
	if not LocalPlayer.Character then return nil end

	local possibleTools = {placeTool, removeTool, colorBucketTool}
	
	for _, tool in pairs(possibleTools) do
		if tool.Parent == LocalPlayer.Character then
			return tool
		end
	end
	
	return nil
end

local function loop(func)
	func()
	return RunService.RenderStepped:Connect(func)
end

placeTool.Equipped:Connect(function()

end)

removeTool.Equipped:Connect(function()

end)

local selectionBox = Instance.new("SelectionBox")
selectionBox.Thickness = 0.02
selectionBox.Color3 = Color3.fromRGB(20, 20, 20)
selectionBox.Transparency = 0.5
selectionBox.Parent = removeTool

RunService.RenderStepped:Connect(function()
	local equippedTool = getEquippedTool()
	
	
end)

]==], owner.PlayerGui)

local function replicate(obj)
	local val = Instance.new("ObjectValue")
	val.Name = obj.Name
	val.Value = obj
	val.Parent = scr
end

local placeTool = Instance.new("Tool")
placeTool.Name = "Place"
placeTool.CanBeDropped = false

local blockSize = Instance.new("IntValue")
blockSize.Value = 3
blockSize.Name = "BlockSize"
blockSize.Parent = scr

replicate(placeTool)
replicate(removeTool)
replicate(colorBucketTool)