local owner: Player = getfenv().owner
local NLS: () -> () = getfenv().NLS

local remote = Instance.new("RemoteEvent")
remote.Name = "HitDummy"
remote.OnServerEvent:Connect(function(player, dummy)
	if player ~= owner then return end
	
	local head = dummy.Head
	
	local weld = Instance.new("Weld")
	weld.Part0 = owner.Character["Right Arm"]
	weld.Part1 = head
	weld.C0 = CFrame.new(0, -1, 0)
	weld.C1 = CFrame.new(0, 0.5, 0)
	weld.Parent = head
	
	for _, part in dummy:GetDescendants() do
		if part:IsA("BasePart") then
			part:SetNetworkOwner(player)
		end
	end
end)

remote.Parent = NLS([==[
local mouse = owner:GetMouse()
local remote = script:WaitForChild("HitDummy")

mouse.Button1Down:Connect(function()
	if mouse.Target.Parent:FindFirstChildOfClass("Humanoid") then
		remote:FireServer(mouse.Target.Parent)
		
	end
end)

]==], owner.Character)