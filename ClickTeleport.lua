local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()

local tool = Instance.new("Tool", plr.Backpack)
tool.Name = "ClickTeleport"
tool.RequiresHandle = false

local connection
tool.Equipped:Connect(function()
	connection = tool.Activated:Connect(function()
		if plr.Character then
			plr.Character:MoveTo(mouse.Hit.Position)
		end
	end)
end)

tool.Unequipped:Connect(function()
	connection:Disconnect()
end)