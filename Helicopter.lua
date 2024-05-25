local character = owner.Character

if character:findFirstChild("Animate") and character.Animate:IsA("Script") then
	character.Animate:Destroy()
end

NLS([[for i, v in pairs(owner.Character.Humanoid:GetPlayingAnimationTracks()) do v:Stop() end]], character)

local torso = character.Torso
local rarm = torso["Right Shoulder"]
local larm = torso["Left Shoulder"]

rarm.C0 = rarm.C0 * CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(0, -0.5, -0.5)
larm.C0 = larm.C0 * CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(0, -0.5, -0.5)

local bv = Instance.new("BodyAngularVelocity", torso)
bv.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
bv.AngularVelocity = Vector3.new(0, 20, 0)

local bg = Instance.new("BodyGyro", torso)
bg.MaxTorque = Vector3.new(math.huge, 0, math.huge)
bg.CFrame = CFrame.new() * CFrame.Angles(0, 0, 0)

local bb = Instance.new("BodyVelocity", torso)
bb.MaxForce = Vector3.new(0, math.huge, 0)
bb.Velocity = Vector3.new(0, 10, 0)

local sound = Instance.new("Sound", torso)
sound.Volume = 2
sound.Looped = true
sound.SoundId = "rbxassetid://7971906637"
sound:Play()