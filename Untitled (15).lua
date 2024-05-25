local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

function onDummy(dummy)
	repeat wait() until dummy:findFirstChildOfClass("Humanoid")
	local humanoid = dummy:findFirstChildOfClass("Humanoid")
	local torso = dummy:WaitForChild("Torso")
	local minDistance = math.huge
	local followThing
	local function follow(plr)
		RunService.Heartbeat:Connect(function()
			humanoid.WalkSpeed = 14
			if plr.Character then
				local plrTorso = plr.Character:findFirstChild("HumanoidRootPart")
				if plrTorso then
					local distance = (plrTorso.Position - torso.Position).magnitude
					if distance < minDistance then
						followThing = plrTorso
						minDistance = distance
					end
				end
			end
		end)
	end

	torso.Touched:Connect(function(hit)
		local hum = hit.Parent:findFirstChildOfClass("Humanoid")
		if hum and hum.Parent.Name ~= "Default Dummy" then
			hum:TakeDamage(10)
		end
	end)

	for _, plr in pairs(Players:GetPlayers()) do
		follow(plr)
	end
	Players.PlayerAdded:Connect(follow)
	RunService.Heartbeat:Connect(function()
		if not followThing or followThing.Parent == nil then followThing = nil minDistance = math.huge return end
		humanoid:MoveTo(followThing.Position)
	end)
end

for i, v in pairs(workspace:GetChildren()) do
	if v.Name == "Default Dummy" and v:IsA("Model") then
		onDummy(v)
	end
end

workspace.ChildAdded:Connect(function(obj)
	if obj.Name == "Default Dummy" and v:IsA("Model") then
		onDummy(obj)
	end
end)