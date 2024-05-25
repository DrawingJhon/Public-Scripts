--//FE Compatibilized by DrawingJhon
print("FE compatibility by DrawingJhon EZ")
if game:GetService("RunService"):IsClient() then error("Script must be server sided to work, say h/ and not hl/", 0) end

local plr = owner
repeat wait() until plr.Character
script.Parent = plr.Character
plr = owner
char = plr.Character
torso = char.Torso
head = char.Head
neck = torso.Neck
head.face:Destroy()
sound = Instance.new("Sound", head)
sound.SoundId = "rbxassetid://"
sound.Volume = 100
sound:Play()
sound.Looped = true
plr.Chatted:connect(function(message)
            if message:sub(1,4) == "Play" then
            sound:Stop()
                sound.SoundId = "http://www.roblox.com/asset/?id="..message:sub(6)
    sound:Play()
    end
end)

---- [[ Left Eye]] ----

eye1 = Instance.new("Part", workspace)
eye1.Anchored = false
eye1.Parent = head
eye1.TopSurface = 0
eye1.BrickColor = BrickColor.new("Black")
eye1.BottomSurface = 0
eye1m = Instance.new("SpecialMesh", eye1)
eye1m.MeshType = Enum.MeshType.Sphere
eye1m.Scale = Vector3.new(0.02,0.12,0.03)
ogsize = eye1m.Scale
weld = Instance.new("Weld", head)
weld.Part0 = eye1
weld.Part1 = head
weld.C1 = CFrame.new(-.17,.14,-.57)



---- [[ Right Eye ]] ----


eye2 = Instance.new("Part", workspace)
eye2.Anchored = false
eye2.Parent = head
eye2.TopSurface = 0
eye2.BrickColor = BrickColor.new("Black")
eye2.BottomSurface = 0
eye2m = Instance.new("SpecialMesh", eye2)
eye2m.MeshType = Enum.MeshType.Sphere
eye2m.Scale = Vector3.new(0.02,0.12,0.03)
ogsize = eye2m.Scale
weld = Instance.new("Weld", head)
weld.Part0 = eye2
weld.Part1 = head
weld.C1 = CFrame.new(.17,.14,-.57)



---- [[ Mouth ]] ----

mouth = Instance.new("Part", workspace)
mouth.Anchored = false
mouth.Parent = head
mouth.TopSurface = 0
mouth.BrickColor = BrickColor.new("Black")
mouth.BottomSurface = 0
mouth.Material = "SmoothPlastic"
mouthm = Instance.new("SpecialMesh", mouth)
mouthm.MeshType = Enum.MeshType.Sphere
mouthm.Scale = Vector3.new(.13,0.1,0.05)
ogsize = mouthm.Scale
weld = Instance.new("Weld", head)
weld.Part0 = mouth
weld.Part1 = head
weld.C1 = CFrame.new(0,-.25,-.6)

local soundValue = Instance.new("ObjectValue")
soundValue.Name = "SoundVal"
soundValue.Value = sound
local remote = Instance.new("RemoteEvent")
remote.Name = "LoudnessRemote"
remote.OnServerEvent:Connect(function(player, loudness)
	if player ~= plr then return end
	local sound = {PlaybackLoudness=loudness}
	mouthm.Scale = mouthm.Scale:lerp(Vector3.new(ogsize.X+sound.PlaybackLoudness/20000,sound.PlaybackLoudness/1000,ogsize.Z),0.8)
	neck.C0 = neck.C0:lerp(CFrame.new(0,1,0)*CFrame.Angles(math.rad(mouthm.Scale.Y*100)    +math.rad(-90),0,math.rad(180)),0.1)
end)
local LS = NLS([==[local remote = script:WaitForChild("LoudnessRemote")
local plr = owner or game:GetService("Players").LocalPlayer
local char = plr.Character
local sound = script:WaitForChild("SoundVal").Value
game:GetService("RunService").RenderStepped:Connect(function()
	if remote and remote:IsA("RemoteEvent") and remote.Parent then
		remote:FireServer(sound.PlaybackLoudness)
	end
end)]==], script)
remote.Parent = LS
soundValue.Parent = LS