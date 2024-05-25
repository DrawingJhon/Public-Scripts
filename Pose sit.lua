local torso = owner.Character.Torso
local hum = owner.Character.Humanoid
hum.PlatformStand = true
owner.Character.Animate.Parent = nil
local rh = torso["Right Hip"]
local lh = torso["Left Hip"]
local hf = torso["Neck"]
local leftArm = torso["Left Shoulder"]
local rightArm = torso["Right Shoulder"]
rh.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0) * CFrame.Angles(0, math.rad(-25), math.rad(90))
lh.C0 = CFrame.new(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0) * CFrame.Angles(0, math.rad(25), math.rad(-90))
hf.C0 = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0) * CFrame.Angles(0, math.rad(12), 0)
leftArm.C0 = CFrame.new(-1, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0) * CFrame.Angles(0, 0, math.rad(-90))
rightArm.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0) * CFrame.Angles(0, 0, math.rad(90))

local dum = workspace["Default Dummy"]
local dTorso = dum.Torso
local lastCFrame = dTorso.CFrame

local weld = Instance.new("Weld", workspace)
weld.Part1 = dTorso
weld.Part0 = torso
weld.C0 = CFrame.new(0, -1.75, -1)
dTorso.CFrame = lastCFrame