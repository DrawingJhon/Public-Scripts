local ClassProperties do

	ClassProperties = {}
	local HttpService = game:GetService("HttpService")

	local Data = HttpService:JSONDecode(HttpService:GetAsync("https://anaminus.github.io/rbx/json/api/latest.json"))

	for i = 1, #Data do
		local Table = Data[i]
		local Type = Table.type

		if Type == "Class" then
			local ClassData = {}

			local Superclass = ClassProperties[Table.Superclass]

			if Superclass then
				for j = 1, #Superclass do
					ClassData[j] = Superclass[j]
				end
			end

			ClassProperties[Table.Name] = ClassData
		elseif Type == "Property" then
			if not next(Table.tags) then
				local Class = ClassProperties[Table.Class]
				local Property = Table.Name
				local Inserted

				for j = 1, #Class do
					if Property < Class[j] then -- Determine whether `Property` precedes `Class[j]` alphabetically
						Inserted = true
						table.insert(Class, j, Property)
						break
					end
				end

				if not Inserted then
					table.insert(Class, Property)
				end
			end
		elseif Type == "Function" then
		elseif Type == "YieldFunction" then
		elseif Type == "Event" then
		elseif Type == "Callback" then
		elseif Type == "Enum" then
		elseif Type == "EnumItem" then
		end
	end
end

if game:GetService("RunService"):IsStudio() then
	return;
end
print("Initializating Build System script...")

local http = game:GetService("HttpService")
local DataStore = game:GetService("DataStoreService"):GetDataStore("MapHistoryLog")
local Players = game:GetService("Players")
--local current = DataStore:GetAsync("CurrentMap")
--local history = DataStore:GetAsync("History") or {}
local localSave = {}

local initialMap = {workspace:FindFirstChild("Base")} -- workspace:GetChildren()
local dataTypes = {"Axes", "BrickColor", "CatalogSearchParams", "CFrame", "Color3", "ColorSequence", "ColorSequenceKeypoint",
	"DateTime", "DockWidgetPluginGuiInfo", "Enum", "EnumItem", "Enums", "Faces", "FloatCurveKey", "Instance", "NumberRange",
	"NumberSequence", "NumberSequenceKeypoint", "OverlapParams", "PathWaypoint", "PhysicalProperties", "Random", "Ray",
	"RaycastParams", "RaycastResult", "RBXScriptConnection", "RBXScriptSignal", "Rect", "Region3", "Region3int16", "TweenInfo",
	"UDim", "UDim2", "Vector2", "Vector2int16", "Vector3", "Vector3int16", "string", "number", "nil", "boolean"
}

local function encode(tab)
	return http:JSONEncode({http:JSONEncode(tab)})
end

local function decode(str)
	return http:JSONDecode(http:JSONDecode(str)[1])
end

local function abs(n, m)
	m = m or 4
	return math.floor(n * 10^m) / 10^m
end

local function bindPlayers(func)
	for i, v in pairs(Players:GetChildren()) do
		coroutine.wrap(func)(v)
	end
	Players.PlayerAdded:Connect(func)
end

local function wrap(obj)
	local typ = typeof(obj)
	if typ == "CFrame" then
		local x, y, z = obj:ToEulerAnglesXYZ()
		return {abs(obj.Position.X), abs(obj.Position.Y), abs(obj.Position.Z), abs(x, 10), abs(y, 10), abs(z, 10)}
	elseif typ == "UDim2" then
		return {wrap(obj.X),wrap(obj.Y)}
	elseif typ == "UDim" then
		return {obj.Scale,obj.Offset}
	elseif typ == "Vector3" then
		return {abs(obj.x),abs(obj.y),abs(obj.z)}
	elseif typ == "Vector2" then
		return {abs(obj.x),abs(obj.y)}
	elseif typ == "EnumItem" then
		return {table.find(Enum:GetEnums(), obj.EnumType), table.find(obj.EnumType:GetEnumItems(), obj)}
	elseif typ == "BrickColor" then
		return obj.Number
	elseif typ == "Color3" then
		return {obj.R, obj.G, obj.B}
	elseif typ == "Faces" then
		local tab = {}
		for i, v in pairs({"Top", "Bottom", "Left", "Right", "Back", "Front"}) do
			if obj[v] then
				table.insert(tab, wrap(Enum.NormalId[v]))
			end
		end
		return tab
	elseif typ == "Instance" then
		return nil
	elseif typ == "Rect" then
		return {obj.Min.X, obj.Min.Y, obj.Max.X, obj.Max.Y}
	elseif typ == "ColorSequenceKeypoint" then
		return {obj.Time, wrap(obj.Value)}
	elseif typ == "NumberSequenceKeypoint" then
		return {obj.Time, obj.Value, obj.Envelope}
	elseif typ == "ColorSequence" then
		local tab = {}
		for i, v in pairs(obj.Keypoints) do
			table.insert(tab, wrap(v))
		end
		return tab
	elseif typ == "NumberSequence" then
		local tab = {}
		for i, v in pairs(obj.Keypoints) do
			table.insert(tab, wrap(v))
		end
		return tab
	elseif typ == "NumberRange" then
		return {obj.Min, obj.Max}
	elseif typ == "PhysicalProperties"  then
		return {obj.Density, obj.Friction, obj.Elasticity, obj.FrictionWeight, obj.ElasticityWeight}
	elseif typ == "boolean" then
		return obj == true and 1 or 0
	end
	
	local valid = {"number", "string", "array", "nil", "boolean"}
	if not table.find(valid, typ) then
		warn("Unknown type: "..typ)
	end
	
	return obj
end

local function unwrap(typ, obj)
	if typ == "CFrame" then
		return CFrame.new(obj[1], obj[2], obj[3]) * CFrame.fromEulerAnglesXYZ(obj[4] or 0, obj[5] or 0, obj[6] or 0)
	elseif typ == "UDim2" then
		return UDim2.new(unpack(obj))
	elseif typ == "UDim" then
		return UDim(unpack(obj))
	elseif typ == "Vector3" then
		return Vector3.new(unpack(obj))
	elseif typ == "Vector2" then
		return Vector2.new(unpack(obj))
	elseif typ == "BrickColor" then
		return BrickColor.new(obj)
	elseif typ == "Color3" then
		return Color3.new(unpack(obj))
	elseif typ == "EnumItem" then
		local one = Enum:GetEnums()[obj[1]]
		local two = one:GetEnumItems()[obj[2]]
		return two
	elseif typ == "Faces" then
		local tab = {}
		for i, v in pairs(obj) do
			table.insert(tab, unwrap("EnumItem", v))
		end
		return Faces.new(unpack(tab))
	elseif typ == "Rect" then
		return Rect.new(unpack(obj))
	elseif typ == "ColorSequenceKeypoint" then
		return ColorSequenceKeypoint.new(obj[1], unwrap("Color3", obj[2]))
	elseif typ == "NumberSequenceKeypoint" then
		return NumberSequenceKeypoint.new(unpack(obj))
	elseif typ == "ColorSequence" then
		local tab = {}
		for i, v in pairs(obj) do
			table.insert(tab, unwrap("ColorSequenceKeypoint", v))
		end
		return ColorSequence.new(tab)
	elseif typ == "NumberSequence" then
		local tab = {}
		for i, v in pairs(obj) do
			table.insert(tab, unwrap("NumberSequenceKeypoint", v))
		end
		return NumberSequence.new(tab)
	elseif typ == "NumberRange" then
		return NumberRange.new(unpack(obj))
	elseif typ == "PhysicalProperties" then
		return PhysicalProperties.new(unpack(obj))
	elseif typ == "boolean" then
		return obj == 1 and true or false
	end

	return obj
end

local function loadMap(inLocal)
	local instanceQueue = {}
	local objectIdCache = {}
	
	local n = 0
	local text = Instance.new("Hint", workspace)
	text.Text = "Loading objects..."
	
	local function loadObject(fakeObj, parent)
		local className, properties, children, objId = unpack(fakeObj)
		if not className or not properties or not children or not objId then
			warn("Missing data: ", unpack(fakeObj))
		end
		local obj
		pcall(function()
			obj = Instance.new(className)
		end)
		if obj == nil then return end
		n = n + 1
		text.Text = "Loading "..n.." objects..."
		if n % 5000 == 0 then wait() end
		objectIdCache[objId] = obj
		local classProps = ClassProperties[className]
		for i, v in pairs(properties or {}) do
			local prop = classProps[tonumber(i)]
			local success, err = pcall(function()
				local _type, result = dataTypes[v[1]] or v[1], v[2]
				if _type == "Instance" then
					table.insert(instanceQueue, {
						Object = obj;
						Property = prop;
						Id = result;
					})
				else
					obj[prop] = unwrap(_type, result)
				end
			end)
			if not success then
				warn("["..className.."."..prop.."] Property error: "..err)
			end
		end
		obj.Parent = parent
		for i, v in pairs(children or {}) do
			loadObject(v, obj)
		end
	end
	for i, v in pairs(inLocal and (localSave.Children or {}) or decode(DataStore:GetAsync("CurrentMap")).Children or {}) do
		loadObject(v, workspace)
	end
	for _, data in pairs(instanceQueue) do
		local obj = objectIdCache[data.Id]
		if obj then
			data.Object[data.Property] = obj
		end
	end
	text.Text = "Loaded "..n.." objects"
	wait(3)
	text:Destroy()
end

local function saveMap(map, inLocal)
	local Patterns = {}
	local PatternsFromObject = {}
	local instanceQueue = {}
	
	local n = 0
	local cId = 0
	local text = Instance.new("Hint", workspace)
	
	local applyChildrens; applyChildrens = function(obj, tab, ignoreList)
		n+=1
		text.Text = "Objects saved: "..n
		if n % 400 == 0 then
			wait()
		end
		if not tab[3] then
			tab.Children = {}
		end
		for _, child in pairs(obj:GetChildren()) do
			if ignoreList and table.find(ignoreList, child) then
				print("Ignored: ".. child:GetFullName())
				continue;
			end
			if Players:GetPlayerFromCharacter(child) then continue end
			local testObj;
			pcall(function()
				testObj = Instance.new(child.ClassName)
			end)
			if not testObj then
				continue;
			end
			cId +=1
			
			local tabObj = {
				child.ClassName; --ClassName
				{}; --Properties
				{}; --Children
				tostring(cId); --ObjectId
			}
			local propertiesList = ClassProperties[child.ClassName] or {}
			
			for i, v in pairs(propertiesList) do
				local res = child[v]
				if v ~= "Parent" and child[v] ~= testObj[v] and v ~= "Archivable" and v ~= "Origin Position" and v ~= "Origin Orientation" then
					if (v == "Orientation" or v == "Rotation" or v == "Position") and table.find(propertiesList, "CFrame") then
						continue;
					end
					if (v == "BrickColor" and table.find(propertiesList, "Color")) then
						continue;
					end
					if (v == "Color" and table.find(propertiesList, "Color3")) then
						continue;
					end
					if (v == "TextColor" and table.find(propertiesList, "TextColor3")) then
						continue;
					end
					if (v == "FontSize" and table.find(propertiesList, "TextSize")) then
						continue;
					end
					if typeof(res) == "Instance" then
						table.insert(instanceQueue, {
							Property = tostring(i);
							Object = tabObj;
							Request = res;
						})
					else
						tabObj[2][tostring(i)] = {
							table.find(dataTypes, typeof(res)) or typeof(res); -- Type
							wrap(child[v]); -- Result
						}
					end
				end
			end
			table.insert(tab.Children or tab[3], tabObj)
			PatternsFromObject[child] = tabObj
			applyChildrens(child, tabObj, initialMap)
		end
	end

	applyChildrens(map, Patterns, {unpack(initialMap), text})

	for _, data in pairs(instanceQueue) do
		local tabObj = PatternsFromObject[data.Request]
		if tabObj then
			data.Object[2][data.Property] = {
				table.find(dataTypes, "Instance");
				tabObj[4];
			}
		end
	end
	print(Patterns)
	text.Text = "Saving "..n.." objects..."
	
	wait()
	
	local success, err = pcall(function()
		if inLocal then
			localSave = Patterns
		else
			DataStore:SetAsync("CurrentMap", encode(Patterns))
		end
	end)
	
	if success then
		text.Text = "Successfully saved!"
		wait(3)
	else
		text.Text = "Error: "..err
		wait(4)
	end
	text:Destroy()
	
	--[[DataStore:UpdateAsync("history", function(tab)
		local hs = type(tab) == "table" and tab or {}
		table.insert(hs, Patterns)
		return hs
	end)]]
end

bindPlayers(function(player)
		player.Chatted:Connect(function(msg)
			if msg:lower() == ".savelocal" and player.UserId == owner.UserId then
				saveMap(workspace, true)
			end
			if msg:lower() == ".loadlocal" and player.UserId == owner.UserId then
				loadMap(true)
			end
			if msg:lower() == ".savemap" then
				saveMap(workspace)
			end
			if msg:lower() == ".loadmap" and player.UserId == owner.UserId then
				loadMap()
			end
		end)
end)

print("Build System script loaded!")

--[[game:BindToClose(function()
	saveMap()
end)]]