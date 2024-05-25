local owner = game:GetService("Players").LocalPlayer
local character = owner.Character
local humanoid = character:findFirstChildOfClass("Humanoid")
local rootpart = character.HumanoidRootPart
rootpart.Transparency = 0
rootpart.CanCollide = true
character.Head.CanCollide = true
local phs = game:GetService("PhysicsService")

humanoid.BreakJointsOnDeath = false

local key = "BodyParts"

pcall(function()
	phs:CreateCollisionGroup(key)
end)

function ragdoll()
	humanoid.PlatformStand = true
	humanoid.Sit = true
	humanoid:ChangeState(16)
	for i, child in pairs(character:GetDescendants()) do
		if child:IsA("Motor6D") then
			if child.Part0 ~= rootpart then
				local socket = Instance.new("BallSocketConstraint")
				local a1 = Instance.new("Attachment")
				local a2 = Instance.new("Attachment")
				socket.Parent = child.Parent
				a1.Parent = child.Part0
				a2.Parent = child.Part1
				socket.Attachment0 = a1
				socket.Attachment1 = a2
				a1.CFrame = child.C0
				a2.CFrame = child.C1
				local noCollision = Instance.new("NoCollisionConstraint")
				noCollision.Parent = child
				noCollision.Part0 = child.Parent
				noCollision.Part1 = character.HumanoidRootPart
				child.Enabled = false
			end
		end
	end
end

ragdoll()
--humanoid.Died:Connect(ragdoll)