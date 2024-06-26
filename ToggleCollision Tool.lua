local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()

local tool = Instance.new("Tool")
tool.Name = "ToggleTouch"
tool.RequiresHandle = false
tool.CanBeDropped = false
tool.Parent = player.Backpack

local backup = _G.TiBackup or {}
local conns = _G.TiConns or {}
_G.TiBackup = backup
_G.TiConns = conns

tool.Activated:Connect(function()
	local part = mouse.Target
	if not part then return end
	
	local saved = backup[part]
	if saved then
		part.Color = saved.Color
		saved.Clone:Destroy()
		conns[part] = part.Touched:Connect(function() end)
		backup[part] = nil
	else 	
		local ti = part:FindFirstChildOfClass("TouchTransmitter")
		if not ti then return end
		local conn = conns[part]
		if conn then
			conn:Disconnect()
		end
		ti:Destroy()
		local clone = part:Clone()
		clone.Name = part.Name.."'s clone"
		clone.Transparency = 1
		clone.Parent = workspace
		backup[part] = {
			Color = part.Color,
			Clone = clone
		}
		part.Color = Color3.new(1, 0, 0)
	end
end)