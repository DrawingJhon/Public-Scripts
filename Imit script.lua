script.Parent = owner.PlayerGui
NLS([==[local remote = script.Parent:WaitForChild("xd")
remote.OnClientInvoke = function()
	for i, v in pairs(owner.Character:findFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks()) do
		v:Stop()
	end
end]==], script)
local RunService = game:GetService("RunService")
local remote = Instance.new("RemoteFunction", script)
remote.Name = "xd"

local Imitating = false

function play(plr)
	if plr.Character and owner.Character and not Imitating then
		Imitating = plr
		local FINISHED = false
		local plrName = plr.Name
		local plrCharacter = plr.Character
		local root = plr.Character:findFirstChild("HumanoidRootPart")
		local torso = plr.Character:findFirstChild("Torso")
		local hum = plr.Character:findFirstChildOfClass("Humanoid")

		local ownerCharacter = owner.Character
		local ownerRoot = owner.Character:findFirstChild("HumanoidRootPart")
		local ownerTorso = owner.Character:findFirstChild("Torso")
		local ownerHum = owner.Character:findFirstChildOfClass("Humanoid")
		local animate = owner.Character:findFirstChild("Animate")
		if animate and animate:IsA("Script") then
			animate.Disabled = true
		end
		local list = {"Right Arm", "Left Arm", "Right Leg", "Left Leg", "Head"}
		local CreatedWelds = {}
		for i, v in pairs(ownerHum:GetPlayingAnimationTracks()) do
			v:Stop()
		end
		remote:InvokeClient(owner)

		local function CopyAnimation(track)
			if FINISHED then return end
			if not track then return end
			local newTrack = ownerHum:LoadAnimation(track.Animation)
			newTrack.Looped = track.Looped
			newTrack:Play()
			newTrack.Stopped:Connect(function()
				newTrack:Stop()
			end)
			coroutine.wrap(function()
				repeat game:GetService("RunService").Stepped:Wait()
					newTrack:AdjustSpeed(track.Speed)
				until FINISHED or not track.IsPlaying
				newTrack:Stop()
			end)()
		end

		for i, v in pairs(hum:GetPlayingAnimationTracks()) do
			CopyAnimation(v)
		end
		hum.AnimationPlayed:Connect(function(track)
			CopyAnimation(track)
		end)
		local function find(torso, part)
			local completed = false
			local wht
			for _, child in pairs(torso:GetChildren()) do
				if completed then break end
				if child:IsA("Motor6D") then
					if child.Part1 ~= nil then
						if child.Part1.Name == part then
							wht = child
							completed = true
						end
					end
				end
			end
			if part == "Torso" then wht = torso end
			return wht
		end
		local function findRoot(root)
			local aw = root:findFirstChildOfClass("Motor6D")
			if aw then
				if aw.Part0 ~= nil then
					if aw.Part0.Name == "HumanoidRootPart" then
						return aw
					end
				end
			end
		end
		local function onWeld(weld)
			if not weld:IsA("Weld") or FINISHED then return end
			local newWeld = Instance.new("Weld", ownerCharacter:findFirstChild(weld.Parent.Name))
			table.insert(CreatedWelds, newWeld)
			newWeld.Part0 = ownerCharacter:findFirstChild(weld.Part0.Name)
			newWeld.Part1 = ownerCharacter:findFirstChild(weld.Part1.Name)
			local conn
			conn = game:GetService("RunService").Stepped:Connect(function()
				if plrCharacter.Parent == nil or ownerCharacter.Parent == nil then FINISHED = true conn:Disconnect() return end
				newWeld.C0 = weld.C0
				newWeld.C1 = weld.C1
			end)
		end
		local conn
		conn = game:GetService("RunService").Stepped:Connect(function()
			if plrCharacter.Parent == nil or ownerCharacter.Parent == nil then FINISHED = true conn:Disconnect() return end
			for i, v in pairs(list) do
				pcall(function()
					find(ownerTorso, v).C0 = find(torso, v).C0
					find(ownerTorso, v).C1 = find(torso, v).C1
				end)
			end
			pcall(function()
				ownerHum.HipHeight = hum.HipHeight
				findRoot(ownerRoot).C0 = findRoot(root).C0
				findRoot(ownerRoot).C1 = findRoot(root).C1
			end)
		end)
		for i, v in pairs(list) do
			for _, weld in pairs(plrCharacter[v]:GetChildren()) do
				pcall(onWeld, weld)
			end
			plrCharacter[v].ChildAdded:Connect(onWeld)
		end
		for i, v in pairs(torso:GetChildren()) do
			pcall(function()
				onWeld(v)
			end)
		end
		torso.ChildAdded:Connect(function(p)
			pcall(function()
				onWeld(p)
			end)
		end)
		repeat wait() until FINISHED
		Imitating = false
		print(plrName.."'s animations ended")
		for i, v in pairs(CreatedWelds) do
			v:Destroy()
		end
		animate.Disabled = false
		ownerHum.HipHeight = 0
	elseif Imitating then
		warn("You are already imitating someone: "..Imitating.Name, 0)
	else
		error("No character found", 0)
	end
end

owner.Chatted:Connect(function(msg)
	if msg:sub(1, 3) == "/e " then
		for i, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name:lower():match("^"..msg:sub(4):lower()) and msg:sub(4) ~= "" then
				if v == owner then
					error("You can't imitate yourself lmao", 0)
				end
				print("HELLO "..v.Name)
				play(v)
			end
		end
	end
end)