local UIS = game:GetService("UserInputService")
local character = game:GetService("Players").LocalPlayer.Character
local humanoid = character:findFirstChildOfClass("Humanoid")

local maxMultipleJumps = 1
local numJumps = 0
local lastJump = tick()

local function JumpRequest()
	if tick() - lastJump >= .2 then
		if humanoid:GetState() == Enum.HumanoidStateType.Freefall and numJumps < maxMultipleJumps then
			numJumps = numJumps + 1
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end

humanoid.StateChanged:Connect(function(old, new)
	if new == Enum.HumanoidStateType.Landed then
		numJumps = 0
	end
	if new == Enum.HumanoidStateType.Jumping then
		lastJump = tick()
	end
end)

UIS.JumpRequest:Connect(JumpRequest)