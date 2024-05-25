local gui = Instance.new("BillboardGui", game.Players.LocalPlayer.Character.Head)
gui.Enabled = true
gui.Size = UDim2.new(40, 35, 2, 35)
gui.StudsOffset = Vector3.new(0, 2, 0)
local tb = Instance.new("TextLabel", gui)
tb.Active = false
tb.BackgroundTransparency = 1
tb.Font = "Cartoon"
tb.FontSize = "Size32"
tb.Position = UDim2.new(0, 0, 0.05, 0)
tb.Size = UDim2.new(1, 0, 0.4, 0)
tb.TextColor = BrickColor.new(255, 255, 255)
tb.TextStrokeTransparency = 0
tb.TextScaled = true
tb.Text = "lol"

while wait() do
	local ran1 = math.random(-10, 10)
	local ran2 = math.random(-10, 10)
	tb.Position = UDim2.new(0, ran1, 0.05, ran2)
	tb.Rotation = math.random(0, 1)
end