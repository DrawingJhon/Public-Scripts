local screen = Instance.new("ScreenGui", owner.PlayerGui)
screen.Name = "ScriptExecuter"
local frame = Instance.new("Frame", screen)
frame.Name = "Main"
frame.Size = UDim2.new(0, 350, 0, 200)
frame.Position = UDim2.new(0, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
local db = Instance.new("TextButton", frame)
db.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
db.Position = UDim2.new(1, 0, 0, 0)
db.Size = UDim2.new(0, 20, 1, 0)
local tb = Instance.new("TextBox", frame)
tb.AnchorPoint = Vector2.new(0.5, 0)
tb.Position = UDim2.new(0.5, 0, 0.1, 0)
tb.Size = UDim2.new(0, 300, 0, 75)
tb.Font = "Code"
tb.ClearTextOnFocus = false
tb.BorderSizePixel = 3
tb.BorderColor3 = Color3.fromRGB(100, 100, 100)
tb.TextScaled = true
local execButton = Instance.new("TextButton", frame)
execButton.Name = "ExecutionButton"
execButton.Position = UDim2.new(0.1, 0, 0.6, 0)
execButton.Size = UDim2.new(0, 150, 0, 50)
execButton.Text = "Execute"
execButton.TextScaled = true