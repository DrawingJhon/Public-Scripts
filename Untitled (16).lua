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

local animations = {}

function insertTools(plr)
	local backpack = plr:findFirstChildWhichIsA("Backpack")
	local function ins()
		for i = 1,#animations do
			local anm = animations[i]
			local func = anm[Func]
			local tool = Instance.new("Tool")
			tool.RequiresHandle = false
			tool.Name = anm[Name]
			tool.Equipped:Connect(function()
				local animate = plr.Character:findFirstChild("Animate")
				local hum = plr.Character:findFirstChildOfClass("Humanoid")
				if animate and animate:IsA("Script") then
					animate.Disabled = true
				end
				local animation = Instance.new("Animation")
				animation.AnimationId = "rbxassetid://31319431"
				local track = hum:LoadAnimation(animation)
				track:Play()
				getfenv(func)[plr.Name] = true
				coroutine.wrap(anm[Func])(plr)
				tool.Unequipped:Wait()
				getfenv(func)[plr.Name] = false
				for i, v in pairs(plr.Character:GetDescendants()) do
					if v:IsA("Sound") then
						v:Destroy()
					end
				end
				animate.Disabled = false
				track:Stop()
			end)
		end
	end
	ins()
	plr.CharacterAdded:Connect(function()
		ins()
	end)
end

function newAnimation(name, func)
	animations[#animations + 1] = {
		Name = name or "Animation"..tostring(#animations);
		Func = func or error("Needs function");
	}
end

newAnimation("Get Distraction", function(plr)
 
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
end
local so = IT("Sound")
so.SoundId = "rbxassetid://5599347184"
so.Looped = true
so.Volume = 4
so.Parent = Root
repeat wait() until so.IsLoaded
local function co(f)
    coroutine.resume(coroutine.create(f))
end
local function Clerp(joint,cf,bool)
	if getfenv()[plr.Name] == false then return end
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
local function swait(NUMBER)
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
while getfenv()[plr.Name] do
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
 
end)

insertTools(owner)