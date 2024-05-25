------------------------------------
-- Thomas the Train --
-- Compatibility by me ---
------------------------------------
local filter = false
if game.PlaceId == 843468296 then
	filter = true
elseif game.PlaceId == 843495510 and owner then
	filter = true
end

local owner = owner or game:GetService("Players").LocalPlayer or game:GetService("Players"):GetPlayerFromCharacter(script.Parent) or error("Not player found in script")
local p = owner.Character
script.Parent = p
local weld = Instance.new("Weld",p.Torso)
weld.Part0 = p.Torso
local train = Instance.new("Part",p.Torso)
train.Anchored = true
train.CanCollide = false
train.Size = Vector3.new(3,2,6)
train.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
weld.Part1 = train
weld.C1 = CFrame.new(0,0,0) * CFrame.Angles(0,math.rad(180),0)
train.Anchored = false
local TrainMesh = Instance.new("SpecialMesh",train)
TrainMesh.MeshType = Enum.MeshType.FileMesh
TrainMesh.Scale = Vector3.new(0.020,0.020,0.015)
TrainMesh.MeshId = "rbxassetid://431017802"
TrainMesh.TextureId = "rbxassetid://431017809"
local weld2 = Instance.new("Weld",p.Torso)
weld2.Part0 = p.Torso
local Smoke = Instance.new("Part",p.Torso)
Smoke.Anchored = true
Smoke.CanCollide = false
Smoke.Size = Vector3.new(1,1,1)
Smoke.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
weld2.Part1 = Smoke
weld2.C1 = CFrame.new(0,-4,3.5)-- * CFrame.Angles(0,math.rad(180),0)
Smoke.Anchored = false
Smoke.Transparency = 1;
local Particle = Instance.new("ParticleEmitter",Smoke)
Particle.Rate = 50;
Particle.Speed = NumberRange.new(30,60);
Particle.VelocitySpread = 4;
Particle.Texture = "rbxassetid://133619974"
local Light = Instance.new("SpotLight",train)
Light.Angle = 45;
Light.Brightness = 100;
Light.Face = Enum.NormalId.Back;
Light.Range = 30;
p.Humanoid.WalkSpeed = 60;
for i,v in pairs(p:GetChildren()) do
	if v:IsA("Part") then
		v.Transparency = 1;
	elseif v:IsA("Hat") then
		v:Destroy()
	elseif v:IsA("Model") then
		v:Destroy()
	end
end
local folder
if filter then
	folder = Instance.new("Folder", p.Torso)
	folder.Name = "Cuacks"
	for i = 1,25 do
		local s = Instance.new("Sound", folder)
		s.SoundId = "rbxassetid://475073913"
		s.Volume = 1
	end
end
local function SFX(id) local s=Instance.new("Sound",p.Torso); s.SoundId = "rbxassetid://"..id; s.Volume = 1; return s; end
train.Touched:connect(function(hit)
	if hit.Parent then
		if hit.Parent:IsA("Model") and hit.Parent:findFirstChildOfClass("Humanoid") then
			local ple = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
			if ple then
				if ple == owner then return end
			end
			hit.Parent:BreakJoints()
			if not filter then
				local Whistle = SFX(475073913)
				Whistle:Play()
				return
			end
			local sound
			local tm = 0
			for i, v in pairs(folder:GetChildren()) do
				if v:IsA("Sound") then
					if not v.IsPlaying then
						sound = v
						break
					elseif v.TimePosition >= tm then
						sound = v
						tm = v.TimePosition
					end	
				end
			end
			if sound then
				sound:Play()
			end
		end
	end
end)
local Music = SFX(250633339)
Music.Looped = true;
Music.Volume = 10
wait(1)
Music:Play();