local animations = {
	["Sit"] = {
		active = function(welds)
			welds.leftHip.C0 *= CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(10), 0) * CFrame.Angles(0, 0, math.rad(-90))
			welds.rightHip.C0 *= CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(-10), 0) * CFrame.Angles(0, 0, math.rad(90))
			welds.leftShoulder.C0 *= CFrame.Angles(math.rad(-10), 0, 0)
			welds.rightShoulder.C0 *= CFrame.Angles(math.rad(-10), 0, 0)
			welds.rootJoint.C0 *= CFrame.new(0, 0, -2)
		end
	},
	["Salute"] = {
		include = {"rightShoulder"},
		active = function(welds)
			welds.rightShoulder.C0 *= CFrame.Angles(0, 0, math.rad(125))
		end
	},
	["TPose"] = {
		active = function(welds)
			welds.leftShoulder.C0 *= CFrame.new(0, -0.5, 0.5) * CFrame.Angles(math.rad(-90), 0, 0)
			welds.rightShoulder.C0 *= CFrame.new(0, -0.5, 0.5) * CFrame.Angles(math.rad(-90), 0, 0)
		end	
	},
	["Cheer"] = {
		include = {"leftShoulder", "rightShoulder"},
		active = function(welds)
			welds.leftShoulder.C0 *= CFrame.new(0, -0.5, 0.5) * CFrame.Angles(math.rad(-120), 0, 0)
			welds.rightShoulder.C0 *= CFrame.new(0, -0.5, 0.5) * CFrame.Angles(math.rad(-120), 0, 0)
		end
	}
}

local function handleCharacter(player, character)
	local torso = character.Torso

	local origWelds = {
		leftHip = torso["Left Hip"],
		rightHip = torso["Right Hip"],
		leftShoulder = torso["Left Shoulder"],
		rightShoulder = torso["Right Shoulder"],
		rootJoint = character.HumanoidRootPart.RootJoint
	}

	for name, anim in animations do
		local tool = Instance.new("Tool")
		tool.RequiresHandle = false
		tool.CanBeDropped = false
		tool.Name = name

		local welds = {}
		
		tool.Equipped:Connect(function()
			for weldName, origWeld in origWelds do
				if anim.include and not table.find(anim.include, weldName) then
					continue
				end
				
				local weld = Instance.new("Weld")
				weld.C0 = origWeld.C0
				weld.C1 = origWeld.C1
				weld.Part0 = origWeld.Part0
				weld.Part1 = origWeld.Part1
				weld.Name = "Anim_"..origWeld.Name
				weld.Parent = origWeld.Parent
				welds[weldName] = weld
			end

			torso.CanCollide = false

			anim.active(welds)
		end)
		
		tool.Unequipped:Connect(function()
			torso.CanCollide = true
			for _, weld in welds do
				weld:Destroy()
			end
			table.clear(welds)
		end)

		tool.Parent = player.Backpack
	end
end

local function handlePlayer(player)
	if player.Character then
		task.spawn(handleCharacter, player, player.Character)
	end
	player.CharacterAdded:Connect(function(character)
		handleCharacter(player, character)
	end)
end

for _, player in game.Players:GetPlayers() do
	handlePlayer(player)
end

game.Players.PlayerAdded:Connect(handlePlayer)

print("Ok!")