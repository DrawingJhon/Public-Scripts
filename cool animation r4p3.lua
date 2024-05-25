local function inject(owner)

local nls = NLS([==[local owner = game:service("Players").LocalPlayer
local remote = script:WaitForChild("REEE")
local OpRemote = script:WaitForChild("LOL")
local mouse = owner:GetMouse()
local db = true

remote.OnClientInvoke = function()
	if owner.Character then
		local hum = owner.Character:findFirstChildOfClass("Humanoid")
		if hum then
			for i, v in pairs(hum:GetPlayingAnimationTracks()) do
				v:Stop()
			end
		end
	end
end
mouse.KeyDown:Connect(function(key)
	if key:lower() == "e" then
		if db == true then
			OpRemote:FireServer("bang")
			db = false
		else
			OpRemote:FireServer("unbang")
			db = true
		end
	end
end)

]==], owner)

nls.Name = "BruhMoment"
NLS([[local plr = game:GetService("Players").LocalPlayer
local da = plr:WaitForChild("BruhMoment")
da.Parent = plr:findFirstChildOfClass("PlayerScripts")]], owner:findFirstChildOfClass("PlayerGui"))

local remote = Instance.new("RemoteFunction", nls)
remote.Name = "REEE"

local doRemote = Instance.new("RemoteEvent", nls)
doRemote.Name = "LOL"

local loop = true

local function getParts(torso, rootPart)
	return {
		TTorso = rootPart.RootJoint;
		RArm = torso:findFirstChild("Right Shoulder");
		LArm = torso:findFirstChild("Left Shoulder");
		RLeg = torso:findFirstChild("Right Hip");
		LLeg = torso:findFirstChild("Left Hip");
		neck = torso:findFirstChild("Neck");
	}
end

local function CFAngles(n1, n2, n3)
	return CFrame.Angles(math.rad(n1 or 0), math.rad(n2 or 0), math.rad(n3 or 0))
end

local function animate(cfs, da, parts)
	for p, cf in pairs(cfs) do
		local p =game:GetService("TweenService"):Create(parts[p], TweenInfo.new(da), {C0 = cf})
		p:Play()
		coroutine.wrap(function()
			repeat game:GetService("RunService").Heartbeat:Wait() until not loop
			p:Pause()
		end)()
	end
	wait(da)
end

local function pos(cfs, parts)
	for p, cf in pairs(cfs) do
		parts[p].C0 = cf
	end
end


local defCF = {
	TTorso = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0);
	RArm = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0);
	LArm = CFrame.new(-1, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0);
	RLeg = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0);
	LLeg = CFrame.new(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0);
	neck = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0);
}

local animator
local function setDefault(plr)
	loop = false
	if plr.Character then
		local hum = plr.Character:findFirstChildOfClass("Humanoid")
		if hum then
			animator.Parent = hum
		end
		local animate = plr.Character:findFirstChild("Animate")
		if animate and animate:IsA("Script") then
			animate.Disabled = false
		end
		local parts = getParts(plr.Character.Torso, plr.Character.HumanoidRootPart)
		wait()
		for i, v in pairs(defCF) do
			parts[i].C0 = v
		end
	end
end

local function bang(plr)
	local Character = plr.Character
	if Character then
		local humanoid = Character:findFirstChildOfClass("Humanoid")
		if not humanoid then return end
		for i, v in pairs(humanoid:GetPlayingAnimationTracks()) do
			v:Stop()
		end
		remote:InvokeClient(plr)
		animator = humanoid:findFirstChild("Animator")
		pcall(function()
			animator.Parent = nil
		end)
		local animatexd = plr.Character:findFirstChild("Animate")
		local torso = Character:findFirstChild("Torso")
		local rootPart = Character:findFirstChild("HumanoidRootPart")
		if not torso or not rootPart then return end
		local parts = getParts(torso, rootPart)		

		animatexd.Disabled = true
		wait()
	
		
		local cframes1 = {
			RArm = defCF["RArm"] * CFrame.Angles(0, 0, math.rad(53));
			LArm = defCF["LArm"] * CFrame.Angles(0, 0, math.rad(-53));
			TTorso = defCF.TTorso * CFrame.Angles(math.rad(8), 0, 0);
			RLeg = defCF.RLeg * CFrame.Angles(0, 0, math.rad(8));
			LLeg = defCF.LLeg * CFrame.Angles(0, 0, math.rad(-8));
			neck = defCF.neck * CFrame.Angles(math.rad(15.5), 0, 0);
		}

		local cframes2 = {
			RArm = defCF["RArm"] * CFrame.Angles(0, 0, math.rad(35));
			LArm = defCF["LArm"] * CFrame.Angles(0, 0, math.rad(-35));
			TTorso = defCF.TTorso * CFrame.Angles(math.rad(-13), 0, 0);
			RLeg = defCF.RLeg * CFrame.Angles(0, 0, math.rad(-21));
			LLeg = defCF.LLeg * CFrame.Angles(0, 0, math.rad(21));
			neck = defCF.neck * CFrame.Angles(math.rad(18.5), 0, 0);
		}
		pos(cframes1, parts)
		while loop do
			animate(cframes2, 0.35, parts)
			if not loop then return end
			animate(cframes1, 0.4, parts)
		end
	end
end

local function dog(plr)
	local Character = plr.Character
	if Character then
		local humanoid = Character:findFirstChildOfClass("Humanoid")
		if not humanoid then return end
		for i, v in pairs(humanoid:GetPlayingAnimationTracks()) do
			v:Stop()
		end
		remote:InvokeClient(plr)
		animator = humanoid:findFirstChild("Animator")
		pcall(function()
			animator.Parent = nil
		end)
		local animatexd = plr.Character:findFirstChild("Animate")
		local torso = Character:findFirstChild("Torso")
		local rootPart = Character:findFirstChild("HumanoidRootPart")
		if not torso or not rootPart then return end
		local parts = getParts(torso, rootPart)		

		animatexd.Disabled = true
		wait()

		local cframes1 = {
			RArm = defCF["RArm"] * CFAngles();
			LArm = defCF["LArm"] * CFAngles();
			TTorso = defCF.TTorso * CFAngles(90, 0, 0);
			RLeg = defCF.RLeg * CFAngles(0, 0, 90);
			LLeg = defCF.LLeg * CFAngles(0, 0, -90);
			neck = defCF.neck * CFAngles();
		}
		pos(cframes1, parts)	
	end
end

doRemote.OnServerEvent:Connect(function(plr, action)
	if plr ~= owner then return end
	if action == "bang" then
		loop = true
		bang(owner)
	elseif action == "unbang" then
		setDefault(plr)
	end
end)

end

local Players = game:GetService("Players")

for _, plr in pairs(Players:GetPlayers()) do
	coroutine.wrap(inject)(plr)
end

Players.PlayerAdded:Connect(inject)