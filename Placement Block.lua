local scr = NLS([==[local player = game:GetService("Players").LocalPlayer
local root = player.Character.HumanoidRootPart
local mouse = player:GetMouse()
local TweenService = game:GetService("TweenService")
local remote = script:WaitForChild("PlaceBlock")
local objFolder = script:WaitForChild("Objects")
local tempBlock = objFolder:WaitForChild("Block").Value:Clone()
local blocksFolder = workspace:WaitForChild("BlocksAE")
local mainColor = tempBlock.Color
local tempFolder = Instance.new("Folder", script)
tempFolder.Name = "TempBlocks"
tempBlock.CanCollide = false
tempBlock.Transparency = 1 --0.6
local allowed = false
local placing = false
local removing = false
local selectingBlock = nil
local starting = true
local block = tempBlock:Clone()
block.Parent = nil

local blockTool = objFolder:WaitForChild("BlockTool").Value
blockTool.Name = "Block"
blockTool.Equipped:Connect(function()
	placing = true
	block = tempBlock:Clone()
	block.Parent = script
end)
blockTool.Unequipped:Connect(function()
	starting = true
	placing = false
	block.Parent = nil
end)

local removeTool = objFolder:WaitForChild("RemoveTool").Value
removeTool.Name = "Remove"
removeTool.Equipped:Connect(function()
	removing = true
end)
removeTool.Unequipped:Connect(function()
	removing = false
end)

function round(pos, offset)
	local result = {}
	for i, val in pairs{X=pos.X;Y=pos.Y;Z=pos.Z} do
		local def = val - (val%offset)
		result[i] = def
	end
	local finalPos = Vector3.new(result.X, result.Y, result.Z)
	return finalPos + (Vector3.new(offset,offset,offset)/2)
end

local lastPos = Vector3.new()
local tween

local offset = 3
local REACH = 100 --100

local blockCache = {}

mouse.Button1Down:Connect(function()
	if placing and allowed then
		local new = block:Clone()
		new.Position = lastPos
		new.Transparency = 0
		new.CanCollide = true
		local val = Instance.new("StringValue", new)
		val.Name = "TempBlock"
		new.Parent = tempFolder
		local id = tostring(math.random())
		blockCache[id] = new
		remote:FireServer("Place", lastPos, id)
	elseif removing and selectingBlock then
		selectingBlock:Destroy()
		remote:FireServer("Remove", selectingBlock)
	end
end)

blocksFolder.ChildAdded:Connect(function(part)
	local id = part:WaitForChild("ID").Value
	if part:IsA("BasePart") then
		local cache = blockCache[id]
		if cache then
			cache:Destroy()
			blockCache[id] = nil
		end
	end
end)

local lastBlock = nil
local selection = Instance.new("SelectionBox")
print(block)
selection.Adornee = block
selection.Visible = false
selection.Color3 = Color3.fromRGB(20, 20, 20)
selection.LineThickness = 0.02
selection.Transparency = 0.5
selection.Parent = script

while wait() do
	selection.Adornee = block
	local unitRay = mouse.UnitRay

	local castParams = RaycastParams.new()
	local children = player.Character:GetChildren()
	for i, v in pairs(children) do
		if v == script then
			table.remove(children, i)
		end
	end
	castParams.FilterDescendantsInstances = { children , block}

	-- automatically ignores the player's character
	
	local result = Workspace:Raycast(
		unitRay.Origin, unitRay.Direction * 10000000000000000000,
		castParams
	)

	if placing then
		selectingBlock = nil
		if result then
			local ttPos = round(result.Position, offset)
			local newPos = round(result.Position + result.Normal * 1.5, offset)
			--local newPos = round(result.Position, offset)
			if result.Normal.x < 0 or result.Normal.y < 0 or result.Normal.z < 0 then
				--warn("Resetting")
				--newPos = newPos + result.Normal * offset
			else
				local name, high
				for i, v in pairs{x=result.Normal.x,y=result.Normal.y,z=result.Normal.z} do
					if not high or math.abs(v) >= math.abs(high) then
						high = v
						name = i
					end
				end
				
				ttPos = ttPos - Vector3.new(name == "x" and high or 0, name == "y" and high or 0, name == "z" and high or 0) * offset
			end
			
			--print(result.Normal)

			if (root.Position - newPos).magnitude <= REACH then
				allowed = true
				selection.Color3 = Color3.fromRGB(20, 20, 20)
			else
				allowed = false
				selection.Color3 = Color3.fromRGB(255, 0, 0)
			end

			block.Position = ttPos
			lastPos = newPos
			selection.Visible = true
			
			--[[if (root.Position - newPos).magnitude <= REACH then
				allowed = true
				block.Color = mainColor
			else
				allowed = false
				block.BrickColor = BrickColor.new("Really red")
			end
			if (lastPos-newPos).magnitude > .5 and tween then
				tween:Cancel()
			end
			lastPos = newPos
			if not starting then
				tween = TweenService:Create(block, TweenInfo.new(0.1), {Position = newPos})
			else
				starting = false
				block.Position = newPos
			end
			if tween then
				tween:Play()
			end]]
		else
			allowed = false
			selection.Visible = false
			local newPos = mouse.Hit.Position
			lastPos = newPos
			--[[block.BrickColor = BrickColor.new("Really red")
			local newPos = mouse.Hit.Position
			if (lastPos-newPos).magnitude > .5 and tween then
				tween:Cancel()
			end
			lastPos = newPos
			tween = TweenService:Create(block, TweenInfo.new(0.1), {Position = newPos})
			tween:Play()]]
		end
	elseif removing and result then
		selection.Visible = false
		local obj = result.Instance
		if obj and obj:findFirstChild("TempBlock") then
			obj.BrickColor = BrickColor.new("Bright red")
			selectingBlock = obj
			if lastBlock and lastBlock ~= selectingBlock then
				lastBlock.Color = mainColor
			end
			lastBlock = obj
		else
			selectingBlock = nil
		end
	else
		selection.Visible = false
		selectingBlock = nil
	end

	if lastBlock and lastBlock ~= selectingBlock then
		lastBlock.Color = mainColor
		lastBlock = selectingBlock
	end
end]==], owner.Character)

local block = Instance.new("Part")
block.Name = "SimpleBlock"
block.Anchored = true
block.Size = Vector3.new(3, 3, 3)
block.TopSurface = "Smooth"
block.BottomSurface = "Smooth"
block.BrickColor = BrickColor.new("Bright yellow")
block.Material = Enum.Material.SmoothPlastic

for _, normal in Enum.NormalId:GetEnumItems() do
	local decal = Instance.new("Decal")
	decal.Texture = "rbxassetid://9267089500"
	decal.Face = normal
	decal.Parent = block
end

local asdf = workspace:findFirstChild("BlocksAE") or Instance.new("Folder", workspace)
asdf.Name = "BlocksAE"

local function onChanged(obj)
	if obj.Parent == nil then
		asdf = Instance.new("Folder")
		asdf.Name = "BlocksAE"
		asdf.Parent = workspace
	end
end

local cn; cn = asdf.Changed:Connect(function()
	onChanged(asdf)
end)

local remote = Instance.new("RemoteEvent")
remote.Name = "PlaceBlock"
remote.OnServerEvent:Connect(function(p, act, obj, id)
	if p == owner then
		if act == "Place" then
			local new = block:Clone()
			new.Position = obj
			local val = Instance.new("StringValue", new)
			val.Name = "TempBlock"
			local idVal = Instance.new("StringValue", new)
			idVal.Name = "ID"
			idVal.Value = tostring(id)
			new.Parent = asdf
		elseif act == "Remove" then
			if obj and obj:findFirstChild("TempBlock") then
				obj:Destroy()
			end
		end
	end
end)

local objects = Instance.new("Folder", scr)
objects.Name = "Objects"

local function repObj(obj, name)
	local val = Instance.new("ObjectValue")
	val.Name = name or obj.Name
	val.Value = obj
	val.Parent = objects
end

local tool = Instance.new("Tool")
tool.Name = "Block"
tool.RequiresHandle = false
tool.Enabled = true
tool.CanBeDropped = false
tool.Parent = owner.Backpack
repObj(tool, "BlockTool")

local rTool = Instance.new("Tool")
rTool.Name = "Remove"
rTool.RequiresHandle = false
rTool.Enabled = true
rTool.CanBeDropped = false
rTool.Parent = owner.Backpack
repObj(rTool, "RemoveTool")

remote.Parent = scr
local rePart = block:Clone()
rePart.Parent = game:GetService("ReplicatedStorage")
repObj(rePart, "Block")