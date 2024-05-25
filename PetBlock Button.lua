local Chat = game:GetService("Chat")

local function CreateButtonModel()
	--Converted with ttyyuu12345's model to script plugin v4
	Model0 = Instance.new("Model")
	Part1 = Instance.new("Part")
	Part2 = Instance.new("Part")
	Script3 = Instance.new("Script")
	ClickDetector4 = Instance.new("ClickDetector")
	Part5 = Instance.new("Part")
	Model0.Parent = mas
	Model0.PrimaryPart = Part5
	Part1.Parent = Model0
	Part1.CFrame = CFrame.new(-4.5, 11.624999, 20.9999981, 1, 0, 0, 0, 0.866025388, -0.5, 0, 0.5, 0.866025388)
	Part1.Orientation = Vector3.new(30, 0, 0)
	Part1.Position = Vector3.new(-4.5, 11.624999046325684, 20.999998092651367)
	Part1.Rotation = Vector3.new(30, 0, 0)
	Part1.Color = Color3.new(0.0352941, 0.537255, 0.811765)
	Part1.Size = Vector3.new(1.5, 0.75, 1.5)
	Part1.Anchored = true
	Part1.BottomSurface = Enum.SurfaceType.Smooth
	Part1.BrickColor = BrickColor.new("Electric blue")
	Part1.TopSurface = Enum.SurfaceType.Smooth
	Part1.brickColor = BrickColor.new("Electric blue")
	Part2.Name = "ButtonPart"
	Part2.Parent = Model0
	Part2.CFrame = CFrame.new(-4.5, 12.058012, 21.2499981, 1, 0, 0, 0, 0.866025388, -0.5, 0, 0.5, 0.866025388)
	Part2.Orientation = Vector3.new(30, 0, 0)
	Part2.Position = Vector3.new(-4.5, 12.058012008666992, 21.249998092651367)
	Part2.Rotation = Vector3.new(30, 0, 0)
	Part2.Color = Color3.new(0.0509804, 0.411765, 0.67451)
	Part2.Size = Vector3.new(1, 0.25, 1)
	Part2.Anchored = true
	Part2.BottomSurface = Enum.SurfaceType.Smooth
	Part2.BrickColor = BrickColor.new("Bright blue")
	Part2.TopSurface = Enum.SurfaceType.Smooth
	Part2.brickColor = BrickColor.new("Bright blue")
	Script3.Name = "OnClicked"
	Script3.Parent = Part2
	ClickDetector4.Parent = Part2
	Part5.Name = "SPart"
	Part5.Parent = Model0
	Part5.CFrame = CFrame.new(-4.5, 9.75, 21, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part5.Position = Vector3.new(-4.5, 9.75, 21)
	Part5.Color = Color3.new(0.0352941, 0.537255, 0.811765)
	Part5.Size = Vector3.new(1, 3.5, 1)
	Part5.Anchored = true
	Part5.BottomSurface = Enum.SurfaceType.Smooth
	Part5.BrickColor = BrickColor.new("Electric blue")
	Part5.TopSurface = Enum.SurfaceType.Smooth
	Part5.brickColor = BrickColor.new("Electric blue")
	return Model0
end

local function CreatePet()
	--Converted with ttyyuu12345's model to script plugin v4
	Model0 = Instance.new("Model")
	Part1 = Instance.new("Part")
	BodyPosition2 = Instance.new("BodyPosition")
	BodyGyro3 = Instance.new("BodyGyro")
	Humanoid4 = Instance.new("Humanoid")
	Model0.Name = "Pet"
	Model0.Parent = mas
	Part1.Name = "Head"
	Part1.Parent = Model0
	Part1.CFrame = CFrame.new(-11.75, 9, 36.75, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Part1.Position = Vector3.new(-11.75, 9, 36.75)
	Part1.Size = Vector3.new(1.5, 1.5, 1.5)
	Part1.Anchored = true
	Part1.BottomSurface = Enum.SurfaceType.Smooth
	Part1.CanCollide = false
	Part1.Material = Enum.Material.ForceField
	Part1.TopSurface = Enum.SurfaceType.Smooth
	BodyPosition2.Parent = Part1
	BodyPosition2.Position = Vector3.new(0, 0, 0)
	BodyPosition2.MaxForce = Vector3.one * math.huge
	BodyPosition2.maxForce = Vector3.one * math.huge
	BodyPosition2.position = Vector3.new(0, 0, 0)
	BodyGyro3.Parent = Part1
	BodyGyro3.MaxTorque = Vector3.one * math.huge
	BodyGyro3.maxTorque = Vector3.one * math.huge
	Humanoid4.Parent = Model0
	return Model0
end

local ButtonModel = CreateButtonModel()
local ButtonPart = ButtonModel.ButtonPart
local ClickDetector = ButtonPart.ClickDetector
local SPart = ButtonModel.SPart
local Pet = CreatePet()

local RunService = game:GetService("RunService")

ButtonModel.Parent = script
ButtonModel:PivotTo(CFrame.new(11, 1.75, -17.5))

local function Repeat(num, min, max)
	return num % (max - min) + min
end

local SavedPets = {}

local PetMessages = {"I'm hungry!", "sup", "grrrr", "hellooo", "<name> you suck",
	"<name> and I will conquer de world", "it's good to be alive", "stop touching me, pervert"}

local function SpawnPet(player, spawnPos)
	local character = player.Character

	if SavedPets[character] then
		return
	end
	print(player.Name.." has just got a pet!")

	local rootPart = character.HumanoidRootPart
	local pet = Pet:Clone()
	local petHuman = pet.Humanoid
	local part = pet.Head
	local bodyPos = part.BodyPosition
	local bodyGyro = part.BodyGyro

	part.Position = spawnPos

	local dead = false

	petHuman:GetPropertyChangedSignal("Health"):Connect(function()
		if petHuman.Health <= 0.01 and not dead then
			dead = true
			print(player.Name.."'s pet died :(")
			part.CanCollide = true
			bodyPos:Destroy()
			bodyGyro:Destroy()
			SavedPets[character] = nil
			pet.Parent = workspace
			part.Color = Color3.new(1, 0, 0)

			game:GetService("Debris"):AddItem(pet, 10)
		end
	end)

	bodyPos.Position = spawnPos
	part.Anchored = false
	pet.Name = player.Name.."'s pet"
	petHuman.DisplayName = " "
	SavedPets[character] = petHuman
	pet.Parent = script

	if player.UserId == 652513366 or player == owner then
		task.spawn(function()
			while part:IsDescendantOf(workspace) and not dead do
				part.Color = Color3.fromHSV(Repeat(tick(), 0, 1), 1, 1)
				RunService.Heartbeat:Wait()
			end
		end)
	end

	local offsetAngle = CFrame.new()

	coroutine.wrap(function()
		while rootPart:IsDescendantOf(workspace) and not dead do
			local cf = rootPart.CFrame * CFrame.new(2, 2, 3)
			bodyPos.Position = cf.Position
			bodyGyro.CFrame = cf * offsetAngle
			RunService.Heartbeat:Wait()
		end

		pet:Destroy()
		SavedPets[character] = nil
	end)()

	coroutine.wrap(function()
		local petName = player.Name.."'s pet"

		for i = 1, #petName do
			petHuman.DisplayName = petName:sub(1, i)
			task.wait(0.05)
		end
	end)()

	local clicked = false
	local cd = Instance.new("ClickDetector", part)
	
	local lastMessageTick = 0
	local messageInterval = 3
	
	cd.MouseClick:Connect(function(plr)
		if plr ~= player or clicked then
			return
		end
		clicked = true
		
		task.delay(0.5, function()
			if tick() - lastMessageTick >= messageInterval then
				lastMessageTick = tick()
				local message = PetMessages[math.random(#PetMessages)]:gsub("<name>", player.Name)
				Chat:Chat(part, message, Enum.ChatColor.White)
			end
		end)
		
		local startTick = tick()

		repeat
			offsetAngle = CFrame.Angles(0, 0, math.rad(math.sin(tick() * 40) * 60))
			RunService.Heartbeat:Wait()
		until tick() - startTick >= 0.6

		offsetAngle = CFrame.new()

		task.wait(0.5)

		clicked = false
	end)
end

local function OnClicked(player)
	ButtonPart.CFrame = ButtonPart.CFrame * CFrame.new(0, -ButtonPart.Size.Y + 0.1, 0)
	SpawnPet(player, SPart.Position + Vector3.new(0, 5, 0))
	task.wait(1.5)
	ButtonPart.CFrame = ButtonPart.CFrame * CFrame.new(0, ButtonPart.Size.Y - 0.1, 0)
end

local debounce = false
ClickDetector.MouseClick:Connect(function(player)
	if not debounce then
		debounce = true
		OnClicked(player)
		debounce = false
	end
end)