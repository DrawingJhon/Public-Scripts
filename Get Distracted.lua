IT = Instance.new
CF = CFrame.new
VT = Vector3.new
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
NS = NumberSequence.new
NSK = NumberSequenceKeypoint.new
RAY = Ray.new
CS = ColorSequence.new
NR = NumberRange.new
TI = TweenInfo.new
RAND = Random.new
ANGLES = CFrame.Angles
COS = math.cos
ACOS = math.acos
RAD = math.rad
SIN = math.sin
MRANDOM = math.random
MHUGE = math.huge
FLOOR = math.floor
SQRT = math.sqrt
CEIL = math.ceil

local function distract(plr)

local Character = plr.Character
local Torso = Character.Torso
local Root = Character.HumanoidRootPart
local Neck = Torso.Neck
local RootJoint = Root.RootJoint
local RightShoulder = Torso["Right Shoulder"]
local LeftShoulder = Torso["Left Shoulder"]
local RightHip = Torso["Right Hip"]
local LeftHip = Torso["Left Hip"]
--values and other stuff
local NeckOrg = CF(0,-.5,0) * ANGLES(RAD(-90),0,RAD(180))
local RootJointOrg = CF(0,0,0) * ANGLES(RAD(-90),0,RAD(180))
local LeftShoulderOrg = CF(.5,.5,0) * ANGLES(0,RAD(-90),0)
local RightShoulderOrg = CF(-.5,.5,0) * ANGLES(0,RAD(90),0)
local LeftHipOrg = CF(-.5,1,0) * ANGLES(0,RAD(-90),0)
local RightHipOrg = CF(.5,1,0) * ANGLES(0,RAD(90),0)
local HB = game["Run Service"].Heartbeat
do
	local animate = plr.Character:findFirstChild("Animate")
	if animate then
		animate.Disabled = true
	end
	local animation = Instance.new("Animation")
	animation.AnimationId = "rbxassetid://31319431"
	local track = plr.Character:findFirstChildOfClass("Humanoid"):LoadAnimation(animation)
	track:Play()
	if animation:findFirstChild("Animator") then
		wait()
		animation.Animator:Destroy()
	end
end
local so = IT("Sound")
if plr == owner then
so.SoundId = "rbxassetid://5599347184"
end
so.Looped = true
so.Volume = 4
so.Parent = Root
repeat wait() until so.IsLoaded or plr ~= owner
local function co(f)
	coroutine.resume(coroutine.create(f))
end
local function Clerp(joint,cf,bool)
	local s = .45/1.825
	local dir = Enum.EasingDirection.Out
	if bool == false then
		dir = Enum.EasingDirection.In
		s = .35/1.825
	end
	game.TweenService:Create(joint,TweenInfo.new(s,Enum.EasingStyle.Sine,dir),{C1 = cf}):Play()
	if joint == RightHip then
		wait(s)
	end
end
function swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		HB:Wait()
	else
		for i=1,NUMBER do
			HB:Wait()
		end
	end
end
Clerp(Neck,NeckOrg,false)
Clerp(RootJoint,RootJointOrg * CF(0,0,.5),false)
Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(60),0,RAD(15)),false)
Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(60),0,RAD(-15)),false)
Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0),false)
Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0),false)
so:Play()
while true do
	Clerp(Neck,NeckOrg)
	Clerp(RootJoint,RootJointOrg * ANGLES(0,0,RAD(-45)))
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(105),0,RAD(120)))
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(105),0,RAD(-120)))
	Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0))
	Clerp(RightHip,RightHipOrg)
	
	Clerp(Neck,NeckOrg,false)
	Clerp(RootJoint,RootJointOrg * CF(0,0,.5),false)
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(-45),0,RAD(120)),false)
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(-45),0,RAD(-120)),false)
	Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0),false)
	Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0),false)
	
	Clerp(Neck,NeckOrg)
	Clerp(RootJoint,RootJointOrg * ANGLES(0,0,RAD(45)))
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(0,0,RAD(120)))
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(0,0,RAD(-120)))
	Clerp(LeftHip,LeftHipOrg)
	Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0))
	
	Clerp(Neck,NeckOrg,false)
	Clerp(RootJoint,RootJointOrg * CF(0,0,.5),false)
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(25),0,0),false)
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(25),0,0),false)
	Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0),false)
	Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0),false)
	
	Clerp(Neck,NeckOrg)
	Clerp(RootJoint,RootJointOrg * ANGLES(0,0,RAD(-45)))
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(60),0,RAD(15)))
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(60),0,RAD(-15)))
	Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0))
	Clerp(RightHip,RightHipOrg)
	
	Clerp(Neck,NeckOrg,false)
	Clerp(RootJoint,RootJointOrg * CF(0,0,.5),false)
	Clerp(LeftShoulder,LeftShoulderOrg * CF(0,-.5,0) * ANGLES(RAD(-45),0,RAD(15)),false)
	Clerp(RightShoulder,RightShoulderOrg * CF(0,-.5,0) * ANGLES(RAD(-45),0,RAD(-15)),false)
	Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0),false)
	Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0),false)
	
	Clerp(Neck,NeckOrg)
	Clerp(RootJoint,RootJointOrg * ANGLES(0,0,RAD(45)))
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(-105),0,RAD(20)))
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(-105),0,RAD(-20)))
	Clerp(LeftHip,LeftHipOrg)
	Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0))
	
	Clerp(Neck,NeckOrg,false)
	Clerp(RootJoint,RootJointOrg * CF(0,0,.5),false)
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(60),0,RAD(15)),false)
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(60),0,RAD(-15)),false)
	Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0),false)
	Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0),false)
end

end

coroutine.wrap(distract)(owner)

--[[wait(2)
local ds = {}
local ownerRoot = owner.Character.HumanoidRootPart
game:GetService("RunService").Heartbeat:Connect(function()
	for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
		if plr.Character and plr ~= owner then
			local root = plr.Character:FindFirstChild("HumanoidRootPart")
			local hum = plr.Character:findFirstChildOfClass("Humanoid")
			if root and hum then
				if (ownerRoot.Position - root.Position).magnitude <= 10 and not ds[plr.Character] then
					ds[plr.Character] = true
					distract(plr)
				end	
				
			end
		end
	end
end)]]