for i, plr in pairs(game:GetService("Players"):GetPlayers()) do
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "SG"
local frame = Instance.new("ImageLabel", gui)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Size = UDim2.new(0, 400, 0, 215)
frame.Position = UDim2.new(0.5, 0, 0.45, 0)
frame.BorderSizePixel = 0
frame.Image = "rbxassetid://3438233075"
local blur = Instance.new("BlurEffect", game:GetService("Lighting"))
end