NLS([[local remote = script.Parent:WaitForChild("HumanoidRemote")
remote.OnClientEvent:Connect(function(hum)
	workspace.CurrentCamera.CameraSubject = hum
end)]], script)

local dum
do
	local rootPart = owner.Character:findFirstChild("HumanoidRootPart")
	local dist = math.huge
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA("Model") and v.Name == "Default Dummy" and v ~= owner.Character then
			local torso = v:findFirstChild("Torso")
			if torso and torso:findFirstChild("Weld") then
				local magn = (rootPart.Position - torso.Position).magnitude
				if magn < dist then
					dist = magn
					dum = v
				end
			end
		end
	end
end
assert(dum, "No dummy found or dummy is died :(")
local animate = owner.Character:findFirstChild("Animate")
animate.Parent = nil
local lastCF = dum.Torso.CFrame
if dum:findFirstChild("Animate") then
	dum.Animate:Destroy()
end
dum:findFirstChildOfClass("Humanoid"):Destroy()
local h = Instance.new("Part", dum)
h.Size = Vector3.new(2, 2, 1)
h.Transparency = 1
h.Parent = dum
h.CanCollide = false
h.Name = "HumanoidRootPart"
local hum = Instance.new("Humanoid", dum)
local animator = owner.Character:findFirstChildOfClass("Humanoid"):findFirstChild("Animator"):Clone()
animator.Parent = hum
dum.Torso.Weld:Destroy()

local f = Instance.new("Motor6D", h)
f.Name = "RootJoint"
f.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
f.C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
f.MaxVelocity = 0.1
f.Part0 = h
f.Part1 = dum.Torso

local function createMotor6D(name, partOfDum)
	dum.Torso[name]:Destroy()
	local RS = Instance.new("Motor6D", dum.Torso)
	RS.Name = name
	RS.C0 = owner.Character.Torso[name].C0
	RS.C1 = owner.Character.Torso[name].C1
	RS.Part0 = dum.Torso
	RS.Part1 = dum[partOfDum]
	RS.MaxVelocity = 0.1
end
createMotor6D("Right Shoulder", "Right Arm")
createMotor6D("Left Shoulder", "Left Arm")
createMotor6D("Right Hip", "Right Leg")
createMotor6D("Left Hip", "Left Leg")
createMotor6D("Neck", "Head")
local torso = dum:findFirstChild("Torso")

local b = Instance.new("Attachment", h)
b.Name = "RootAttachment"
b.CFrame = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
b.Axis = Vector3.new(1, 0, 0)
b.SecondaryAxis = Vector3.new(0, 1, 0)

local BodyColors = Instance.new("BodyColors")
for i, v in pairs(dum:GetChildren()) do
	if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
		pcall(function()
			BodyColors[table.concat(v.Name:split(' ')).."Color"] = v.BrickColor
		end)
	end
end
BodyColors.Parent = dum
wait()
owner.Character = dum
dum.Humanoid.PlatformStand = false
dum.HumanoidRootPart.CFrame = lastCF
script.Parent = owner.Character
local remote = Instance.new("RemoteEvent", script)
remote.Name = "HumanoidRemote"
remote:FireClient(owner, hum)
animate:Clone().Parent = dum