owner.Character.Archivable = true
local char = owner.Character:Clone()
char.Parent = workspace

local remoteGet = Instance.new("RemoteFunction")
remoteGet.Name = "GetChar"
remoteGet.OnServerInvoke = function(plr)
	if plr ~= owner then return end
	for i, v in pairs(char:GetDescendants()) do
		if v:IsA("BasePart") then
			v:SetNetworkOwner(owner)
		end
	end
	return char
end

local remoteEvent = Instance.new("RemoteEvent")
remoteEvent.Name = "CharEvent"
remoteEvent.OnServerEvent:Connect(function(plr, id, fadeTime, weight, speed)
	if plr ~= owner then return end
	local animator = char:findFirstChildOfClass("Humanoid").Animator
	local anim = Instance.new("Animation")
	anim.AnimationId = id
	local track = animator:LoadAnimation(anim)
	track:Play(fadeTime, weight, speed)
end)

local scr = NLS([==[
local remote = script:WaitForChild("CharEvent")
local char = script:WaitForChild("GetChar"):InvokeServer()
local humanoid = char:FindFirstChildOfClass("Humanoid")
local animator = humanoid.Animator:Clone()
humanoid.Animator:Destroy()
animator.Parent = humanoid
owner.Character = char
workspace.CurrentCamera.CameraSubject = humanoid
char.Animate.Disabled = true
char.Animate.Disabled = false

animator.AnimationPlayed:Connect(function(track)
	remote:FireServer(track.Animation.AnimationId, track.TimePosition, track.WeightCurrent, track.Speed)
end)

]==], owner.PlayerGui)

remoteGet.Parent = scr
remoteEvent.Parent = scr