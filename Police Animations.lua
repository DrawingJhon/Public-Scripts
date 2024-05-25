local function SetAnims(owner)
	local conn
	local function SetChar(character)
		local backpack = owner:findFirstChildOfClass("Backpack")
		if conn then conn:Disconnect() end
		local torso = character:WaitForChild("Torso")
		local rightArm = character["Right Arm"]
		local rightShoulder = torso["Right Shoulder"]

		local starterPoint = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)

		local function setNormal()
			if torso:FindFirstChild("Salute") then
				torso.Salute:Destroy()
			end
		end

		local function salute()
			local weld = Instance.new("Weld")
			weld.Name = "Salute"
			weld.Parent = torso
			weld.Part0 = torso
			weld.Part1 = rightArm
			weld.C1 = rightShoulder.C1
			weld.C0 = starterPoint * CFrame.Angles(math.rad(-25), 0, math.rad(180)) * CFrame.new(-0.5, 0, 0)
		end

		local saluteBin = Instance.new("Tool")
		saluteBin.CanBeDropped = false
		saluteBin.RequiresHandle = false
		saluteBin.Name = "Salute"
		conn = saluteBin:GetPropertyChangedSignal("Parent"):Connect(function()
			if saluteBin.Parent == character then
				salute()
			elseif saluteBin.Parent == backpack then
				setNormal()
			end
		end)
		saluteBin.Parent = backpack
	end
	if owner.Character then
		coroutine.wrap(SetChar)(owner.Character)
	end
	owner.CharacterAdded:Connect(SetChar)
end

for i, v in pairs(game:GetService("Players"):GetPlayers()) do
	spawn(function() SetAnims(v) end)
end
game:GetService("Players").PlayerAdded:Connect(SetAnims)