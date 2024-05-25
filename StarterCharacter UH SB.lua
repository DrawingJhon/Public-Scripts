workspace.ChildAdded:Connect(function(d)
	if d:IsA("Model") and d:findFirstChildOfClass("Humanoid") then
		if d:findFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 then
			d:waitForChild("Torso").CFrame = CFrame.new(0, 1000000000, 0)
		end
	end
end)

local Dum = workspace:findFirstChild("StarterCharacter")
if not Dum or not Dum:IsA("Model") then repeat wait() until workspace:findFirstChild("StarterCharacter") end
local Dum = workspace:findFirstChild("StarterCharacter")

script.Parent = owner.Character
local remote = Instance.new("RemoteEvent", script)
remote.Name = "Bruh"
remote.OnServerEvent:Connect(function(who, uh)
	if uh:findFirstChild("StarterCharacter") then uh.StarterCharacter:Destroy() print("Changed StarterCharacter") end
	print(uh, uh.Parent)
	Dum.Parent = uh
	print(Dum.Parent)
	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		v:LoadCharacter()
	end
end)
NLS([==[local remote = script.Parent:WaitForChild("Bruh")
remote:FireServer(game:GetService("StarterPlayer"))
]==], script)