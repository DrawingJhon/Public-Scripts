--[[local part = workspace.Part
game:GetService("TweenService"):Create(part, TweenInfo.new(5), {CFrame = CFrame.new(0, 50, 0)}):Play()]]

local TweenService = game:GetService("TweenService")

local part = Instance.new("Part", workspace)
part.Anchored = true
part.Position = Vector3.new(0, 1, 0)
part.TopSurface = "Smooth"
part.BottomSurface = "Smooth"

local info = TweenInfo.new(
	4,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.Out,
	1,
	true,
	0
)

local goal = {
	Position = Vector3.new(0, 50, 0)
}

local Tween = TweenService:Create(part, info, goal)
Tween:Play()

owner.Chatted:Connect(function(msg)
	if msg:lower() == "/cancel" then
		Tween:Cancel()
	elseif msg:lower() == "/pause" then
		Tween:Pause()
	elseif msg:lower() == "/play" then
		Tween:Play()
	end
end)