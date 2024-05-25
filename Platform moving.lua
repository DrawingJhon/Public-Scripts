local part = Instance.new("Part", workspace)
part.Size = Vector3.new(4, 1, 4)
part.TopSurface = "Smooth"
part.BottomSurface = "Smooth"
part:SetNetWorkOwnership()
local gyro = Instance.new("BodyGyro", part)
gyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
local vel = Instance.new("BodyPosition", part)
vel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
wait(3)
local Tween = game:GetService("TweenService")

local info = TweenInfo.new(
	10,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.Out,
	5,
	true,
	0
)

local tween = Tween:Create(vel, info, {Position = Vector3.new(0, 50, -100)})
tween:Play()