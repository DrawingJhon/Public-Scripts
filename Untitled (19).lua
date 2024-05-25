--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
ScreenGui0 = Instance.new("ScreenGui")
Frame1 = Instance.new("Frame")
LocalScript2 = Instance.new("LocalScript")
ModuleScript3 = Instance.new("ModuleScript")
Frame4 = Instance.new("Frame")
TextLabel5 = Instance.new("TextLabel")
TextBox6 = Instance.new("TextBox")
BindableFunction7 = Instance.new("BindableFunction")
BindableFunction8 = Instance.new("BindableFunction")
BindableEvent9 = Instance.new("BindableEvent")
Frame10 = Instance.new("Frame")
BindableEvent11 = Instance.new("BindableEvent")
BindableFunction12 = Instance.new("BindableFunction")
BindableFunction13 = Instance.new("BindableFunction")
BindableFunction14 = Instance.new("BindableFunction")
BindableFunction15 = Instance.new("BindableFunction")
LocalScript16 = Instance.new("LocalScript")
BindableFunction17 = Instance.new("BindableFunction")
LocalScript18 = Instance.new("LocalScript")
Frame19 = Instance.new("Frame")
TextButton20 = Instance.new("TextButton")
TextLabel21 = Instance.new("TextLabel")
TextLabel22 = Instance.new("TextLabel")
ImageLabel23 = Instance.new("ImageLabel")
Frame24 = Instance.new("Frame")
Frame25 = Instance.new("Frame")
Frame26 = Instance.new("Frame")
TextButton27 = Instance.new("TextButton")
ImageLabel28 = Instance.new("ImageLabel")
TextButton29 = Instance.new("TextButton")
ImageLabel30 = Instance.new("ImageLabel")
TextButton31 = Instance.new("TextButton")
ImageLabel32 = Instance.new("ImageLabel")
TextButton33 = Instance.new("TextButton")
ImageLabel34 = Instance.new("ImageLabel")
TextButton35 = Instance.new("TextButton")
ImageLabel36 = Instance.new("ImageLabel")
Frame37 = Instance.new("Frame")
Frame38 = Instance.new("Frame")
TextLabel39 = Instance.new("TextLabel")
BindableFunction40 = Instance.new("BindableFunction")
Frame41 = Instance.new("Frame")
TextLabel42 = Instance.new("TextLabel")
TextLabel43 = Instance.new("TextLabel")
TextButton44 = Instance.new("TextButton")
TextLabel45 = Instance.new("TextLabel")
TextLabel46 = Instance.new("TextLabel")
Frame47 = Instance.new("Frame")
Frame48 = Instance.new("Frame")
TextLabel49 = Instance.new("TextLabel")
Frame50 = Instance.new("Frame")
TextButton51 = Instance.new("TextButton")
TextLabel52 = Instance.new("TextLabel")
TextButton53 = Instance.new("TextButton")
TextBox54 = Instance.new("TextBox")
TextButton55 = Instance.new("TextButton")
TextLabel56 = Instance.new("TextLabel")
TextLabel57 = Instance.new("TextLabel")
Frame58 = Instance.new("Frame")
TextLabel59 = Instance.new("TextLabel")
Frame60 = Instance.new("Frame")
TextButton61 = Instance.new("TextButton")
TextLabel62 = Instance.new("TextLabel")
TextButton63 = Instance.new("TextButton")
Frame64 = Instance.new("Frame")
TextLabel65 = Instance.new("TextLabel")
Frame66 = Instance.new("Frame")
TextLabel67 = Instance.new("TextLabel")
TextButton68 = Instance.new("TextButton")
Frame69 = Instance.new("Frame")
TextLabel70 = Instance.new("TextLabel")
Frame71 = Instance.new("Frame")
TextLabel72 = Instance.new("TextLabel")
ScrollingFrame73 = Instance.new("ScrollingFrame")
TextButton74 = Instance.new("TextButton")
TextLabel75 = Instance.new("TextLabel")
TextLabel76 = Instance.new("TextLabel")
TextButton77 = Instance.new("TextButton")
TextButton78 = Instance.new("TextButton")
Frame79 = Instance.new("Frame")
TextButton80 = Instance.new("TextButton")
TextBox81 = Instance.new("TextBox")
TextButton82 = Instance.new("TextButton")
TextButton83 = Instance.new("TextButton")
Frame84 = Instance.new("Frame")
Frame85 = Instance.new("Frame")
TextButton86 = Instance.new("TextButton")
ScrollingFrame87 = Instance.new("ScrollingFrame")
Frame88 = Instance.new("Frame")
TextLabel89 = Instance.new("TextLabel")
TextLabel90 = Instance.new("TextLabel")
TextLabel91 = Instance.new("TextLabel")
Frame92 = Instance.new("Frame")
TextLabel93 = Instance.new("TextLabel")
Frame94 = Instance.new("Frame")
Frame95 = Instance.new("Frame")
Frame96 = Instance.new("Frame")
ImageButton97 = Instance.new("ImageButton")
Frame98 = Instance.new("Frame")
Frame99 = Instance.new("Frame")
Frame100 = Instance.new("Frame")
Frame101 = Instance.new("Frame")
Frame102 = Instance.new("Frame")
ImageButton103 = Instance.new("ImageButton")
Frame104 = Instance.new("Frame")
Frame105 = Instance.new("Frame")
Frame106 = Instance.new("Frame")
Frame107 = Instance.new("Frame")
Frame108 = Instance.new("Frame")
TextButton109 = Instance.new("TextButton")
Frame110 = Instance.new("Frame")
Frame111 = Instance.new("Frame")
TextButton112 = Instance.new("TextButton")
TextButton113 = Instance.new("TextButton")
BindableEvent114 = Instance.new("BindableEvent")
LocalScript115 = Instance.new("LocalScript")
TextButton116 = Instance.new("TextButton")
Frame117 = Instance.new("Frame")
Frame118 = Instance.new("Frame")
ImageLabel119 = Instance.new("ImageLabel")
Frame120 = Instance.new("Frame")
ImageLabel121 = Instance.new("ImageLabel")
TextLabel122 = Instance.new("TextLabel")
TextLabel123 = Instance.new("TextLabel")
TextLabel124 = Instance.new("TextLabel")
Frame125 = Instance.new("Frame")
Frame126 = Instance.new("Frame")
TextLabel127 = Instance.new("TextLabel")
Frame128 = Instance.new("Frame")
Frame129 = Instance.new("Frame")
TextLabel130 = Instance.new("TextLabel")
TextLabel131 = Instance.new("TextLabel")
TextButton132 = Instance.new("TextButton")
TextLabel133 = Instance.new("TextLabel")
TextLabel134 = Instance.new("TextLabel")
Frame135 = Instance.new("Frame")
TextLabel136 = Instance.new("TextLabel")
TextLabel137 = Instance.new("TextLabel")
TextButton138 = Instance.new("TextButton")
TextLabel139 = Instance.new("TextLabel")
TextLabel140 = Instance.new("TextLabel")
Frame141 = Instance.new("Frame")
TextLabel142 = Instance.new("TextLabel")
TextLabel143 = Instance.new("TextLabel")
TextButton144 = Instance.new("TextButton")
TextLabel145 = Instance.new("TextLabel")
TextLabel146 = Instance.new("TextLabel")
Frame147 = Instance.new("Frame")
TextLabel148 = Instance.new("TextLabel")
TextLabel149 = Instance.new("TextLabel")
TextButton150 = Instance.new("TextButton")
TextLabel151 = Instance.new("TextLabel")
TextLabel152 = Instance.new("TextLabel")
TextLabel153 = Instance.new("TextLabel")
Frame154 = Instance.new("Frame")
Frame155 = Instance.new("Frame")
TextLabel156 = Instance.new("TextLabel")
TextButton157 = Instance.new("TextButton")
TextBox158 = Instance.new("TextBox")
Frame159 = Instance.new("Frame")
TextButton160 = Instance.new("TextButton")
TextLabel161 = Instance.new("TextLabel")
TextLabel162 = Instance.new("TextLabel")
Frame163 = Instance.new("Frame")
Frame164 = Instance.new("Frame")
TextLabel165 = Instance.new("TextLabel")
BindableFunction166 = Instance.new("BindableFunction")
TextLabel167 = Instance.new("TextLabel")
Frame168 = Instance.new("Frame")
ImageLabel169 = Instance.new("ImageLabel")
TextLabel170 = Instance.new("TextLabel")
TextLabel171 = Instance.new("TextLabel")
TextLabel172 = Instance.new("TextLabel")
ImageButton173 = Instance.new("ImageButton")
TextLabel174 = Instance.new("TextLabel")
ScreenGui0.Name = "Dex"
ScreenGui0.Parent = mas
Frame1.Name = "PropertiesFrame"
Frame1.Parent = ScreenGui0
Frame1.Position = UDim2.new(1, 0, 0.5, 36)
Frame1.Transparency = 0.10000000149012
Frame1.Size = UDim2.new(0, 300, 0.5, -36)
Frame1.Active = true
Frame1.BackgroundColor = BrickColor.new("Institutional white")
Frame1.BackgroundColor3 = Color3.new(1, 1, 1)
Frame1.BackgroundTransparency = 0.10000000149012
Frame1.BorderColor = BrickColor.new("Sand violet metallic")
Frame1.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame1.BorderSizePixel = 0
LocalScript2.Name = "Properties"
LocalScript2.Parent = Frame1
table.insert(cors,sandbox(LocalScript2,function()
--[[
	
Change log:

09/18
	Fixed checkbox mouseover sprite
	Encapsulated checkbox creation into separate method
	Fixed another checkbox issue

09/15
	Invalid input is ignored instead of setting to default of that data type
	Consolidated control methods and simplified them
	All input goes through ToValue method
	Fixed position of BrickColor palette
	Made DropDown appear above row if it would otherwise exceed the page height
	Cleaned up stylesheets

09/14
	Made properties window scroll when mouse wheel scrolled
	Object/Instance and Color3 data types handled properly
	Multiple BrickColor controls interfering with each other fixed
	Added support for Content data type
	
--]]

wait(0.2)

local Gui = script.Parent.Parent
local PropertiesFrame = Gui:WaitForChild("PropertiesFrame")
local ExplorerFrame = Gui:WaitForChild("ExplorerPanel")
print = ExplorerFrame:WaitForChild("GetPrint"):Invoke()


-- Services
local Teams = game:GetService("Teams")
local Workspace = game:GetService("Workspace")
local Debris = game:GetService("Debris")
local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Functions
function httpGet(url)
	return game:GetService("HttpService"):GetAsync(url)
end

-- RbxApi Stuff

local apiUrl = "http://anaminus.github.io/rbx/json/api/latest.json"
local maxChunkSize = 100 * 1000
local ApiJson
if script:FindFirstChild("RawApiJson") then
	ApiJson = script.RawApiJson
else
	ApiJson = ""
end

function getLocalApiJson()
	print(ApiJson)
	local usels = false
	local s = pcall(function() if ApiJson.Source ~= "" then usels = true end end)
	if usels then
		return loadstring(ApiJson.Source)()()
	else
		return require(ApiJson)()
	end
end

function getCurrentApiJson()
	local jsonStr = nil
	if readfile and getelysianpath then
		if readfile(getelysianpath().."Xpl0rerApi.txt") then
			print("Api found in folder!")
			jsonStr = readfile(getelysianpath().."Xpl0rerApi.txt")
			return jsonStr
		end
	end
	local success
	if not SetGlobal then
		success = pcall(function()
			jsonStr = httpGet(apiUrl)
			print("Fetched json successfully")
		end)
	end
	if success then
		print("Returning json")
		--print(jsonStr:sub(1,500))
		return jsonStr
	else
		print("Error fetching json: " .. tostring(err))
		print("Falling back to local copy")
		return getLocalApiJson()
	end
end

function splitStringIntoChunks(jsonStr)
	-- Splits up a string into a table with a given size
	local t = {}
	for i = 1, math.ceil(string.len(jsonStr)/maxChunkSize) do
		local str = jsonStr:sub((i-1)*maxChunkSize+1, i*maxChunkSize)
		table.insert(t, str)
	end
	return t
end

local jsonToParse = getCurrentApiJson()
local apiChunks = splitStringIntoChunks(jsonToParse)

function getRbxApi()
--[[
	Api.Classes
	Api.Enums
	Api.GetProperties(className)
	Api.IsEnum(valueType)
--]]

-- Services
local HttpService = game:GetService("HttpService")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Remotes
--local Remotes = ReplicatedStorage:WaitForChild("OnlineStudio"):WaitForChild("Remotes")
--local GetApiJsonFunction = Remotes:WaitForChild("GetApiJson")

-- Functions
local JsonDecode = function(s) return HttpService:JSONDecode(s) end

local function GetApiRemoteFunction(index)
	if (apiChunks[index]) then 
		return apiChunks[index], #apiChunks
	else
		print("Bad index for GetApiJson")
		return nil
	end
end

local function getApiJson()
	local apiTable = {}
	local firstPage, pageCount = GetApiRemoteFunction(1)
	table.insert(apiTable, firstPage)
	for i = 2, pageCount do
		--print("Fetching API page # " .. tostring(i))
		local result = GetApiRemoteFunction(i)
		table.insert(apiTable, result)
	end
	return table.concat(apiTable)
end

local json = getApiJson()
local apiDump =  JsonDecode(json)

local Classes = {}
local Enums = {}

local function sortAlphabetic(t, property)
	table.sort(t, 
		function(x,y) return x[property] < y[property]
	end)
end

local function isEnum(name)
	return Enums[name] ~= nil
end

local function getProperties(className)
	local class = Classes[className]
	local properties = {}
	
	if not class then return properties end
	
	while class do
		for _,property in pairs(class.Properties) do
			table.insert(properties, property)
		end
		class = Classes[class.Superclass]
	end
	
	sortAlphabetic(properties, "Name")

	return properties
end

for _,item in pairs(apiDump) do
	local itemType = item.type
-- Classes --
	if (itemType == 'Class') then
		Classes[item.Name] = item
		item.Properties = {}
		item.Functions = {}
		item.YieldFunctions = {}
		item.Events = {}
		item.Callbacks = {}
-- Members --
	elseif (itemType == 'Property') then
		table.insert(Classes[item.Class].Properties, item)
	elseif (itemType == 'Function') then
		table.insert(Classes[item.Class].Functions, item)
	elseif (itemType == 'YieldFunction') then
		table.insert(Classes[item.Class].YieldFunctions, item)
	elseif (itemType == 'Event') then
		table.insert(Classes[item.Class].Events, item)
	elseif (itemType == 'Callback') then
		table.insert(Classes[item.Class].Callbacks, item)
-- Enums --
	elseif (itemType == 'Enum') then
		Enums[item.Name] = item
		item.EnumItems = {}
	elseif (itemType == 'EnumItem') then
		Enums[item.Enum].EnumItems[item.Name] = item
	end
end

return {
	Classes = Classes;
	Enums = Enums;
	GetProperties = getProperties;
	IsEnum = isEnum;
}
end

-- Modules
local Permissions = {CanEdit = true}
local RbxApi = getRbxApi()

--[[
	RbxApi.Classes
	RbxApi.Enums
	RbxApi.GetProperties(className)
	RbxApi.IsEnum(valueType)
--]]

-- Styles

local function CreateColor3(r, g, b) return Color3.new(r/255,g/255,b/255) end

local Styles = {
	Font = Enum.Font.Arial;
	Margin = 5;
	Black = CreateColor3(0,0,0);
	White = CreateColor3(255,255,255);
}

local Row = {
	Font = Styles.Font;
	FontSize = Enum.FontSize.Size14;
	TextXAlignment = Enum.TextXAlignment.Left;
	TextColor = Styles.Black;
	TextColorOver = Styles.White;
	TextLockedColor = CreateColor3(120,120,120);
	Height = 24;
	BorderColor = CreateColor3(216,216,216);
	BackgroundColor = Styles.White;
	BackgroundColorAlternate = CreateColor3(246,246,246);
	BackgroundColorMouseover = CreateColor3(211,224,244);
	TitleMarginLeft = 15;
}

local DropDown = {
	Font = Styles.Font;
	FontSize = Enum.FontSize.Size14;
	TextColor = CreateColor3(0,0,0);
	TextColorOver = Styles.White;
	TextXAlignment = Enum.TextXAlignment.Left;
	Height = 16;
	BackColor = Styles.White;
	BackColorOver = CreateColor3(86,125,188);
	BorderColor = CreateColor3(216,216,216);
	BorderSizePixel = 2;
	ArrowColor = CreateColor3(160,160,160);
	ArrowColorOver = Styles.Black;
}

local BrickColors = {
	BoxSize = 13;
	BorderSizePixel = 1;
	BorderColor = CreateColor3(160,160,160);
	FrameColor = CreateColor3(160,160,160);
	Size = 20;
	Padding = 4;
	ColorsPerRow = 8;
	OuterBorder = 1;
	OuterBorderColor = Styles.Black;
}

wait(1)

local bindGetSelection = ExplorerFrame.GetSelection
local bindSelectionChanged = ExplorerFrame.SelectionChanged
local bindGetApi = PropertiesFrame.GetApi
local bindGetAwait = PropertiesFrame.GetAwaiting
local bindSetAwait = PropertiesFrame.SetAwaiting

local ContentUrl = ContentProvider.BaseUrl .. "asset/?id="

local SettingsRemote = Gui:WaitForChild("SettingsPanel"):WaitForChild("GetSetting")

local propertiesSearch = PropertiesFrame.Header.TextBox

local AwaitingObjectValue = false
local AwaitingObjectObj
local AwaitingObjectProp

function searchingProperties()
	if propertiesSearch.Text ~= "" and propertiesSearch.Text ~= "Search Properties" then
		return true
	end
	return false
end

local function GetSelection()
	local selection = bindGetSelection:Invoke()
	if #selection == 0 then
		return nil
	else
		return selection
	end 
end

-- Number

local function Round(number, decimalPlaces)
	return tonumber(string.format("%." .. (decimalPlaces or 0) .. "f", number))
end

-- Strings

local function Split(str, delimiter)
	local start = 1
	local t = {}
	while true do
		local pos = string.find (str, delimiter, start, true)
		if not pos then
			break
		end
		table.insert (t, string.sub (str, start, pos - 1))
		start = pos + string.len (delimiter)
	end
	table.insert (t, string.sub (str, start))
	return t
end

-- Data Type Handling

local function ToString(value, type)
	if type == "float" then
		return tostring(Round(value,2))
	elseif type == "Content" then
		if string.find(value,"/asset") then
			local match = string.find(value, "=") + 1
			local id = string.sub(value, match)
			return id
		else
			return tostring(value)
		end
	elseif type == "Vector2" then
		local x = value.x
		local y = value.y
		return string.format("%g, %g", x,y)
	elseif type == "Vector3" then
		local x = value.x
		local y = value.y
		local z = value.z
		return string.format("%g, %g, %g", x,y,z)
	elseif type == "Color3" then
		local r = value.r
		local g = value.g
		local b = value.b
		return string.format("%d, %d, %d", r*255,g*255,b*255)
	elseif type == "UDim2" then
		local xScale = value.X.Scale
		local xOffset = value.X.Offset
		local yScale = value.Y.Scale
		local yOffset = value.Y.Offset
		return string.format("{%d, %d}, {%d, %d}", xScale, xOffset, yScale, yOffset)
	else
		return tostring(value)
	end
end

local function ToValue(value,type)
	if type == "Vector2" then
		local list = Split(value,",")
		if #list < 2 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		return Vector2.new(x,y)
	elseif type == "Vector3" then
		local list = Split(value,",")
		if #list < 3 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		local z = tonumber(list[3]) or 0
		return Vector3.new(x,y,z)
	elseif type == "Color3" then
		local list = Split(value,",")
		if #list < 3 then return nil end
		local r = tonumber(list[1]) or 0
		local g = tonumber(list[2]) or 0
		local b = tonumber(list[3]) or 0
		return Color3.new(r/255,g/255, b/255)
	elseif type == "UDim2" then
		local list = Split(string.gsub(string.gsub(value, "{", ""),"}",""),",")
		if #list < 4 then return nil end
		local xScale = tonumber(list[1]) or 0
		local xOffset = tonumber(list[2]) or 0
		local yScale = tonumber(list[3]) or 0
		local yOffset = tonumber(list[4]) or 0
		return UDim2.new(xScale, xOffset, yScale, yOffset)
	elseif type == "Content" then
		if tonumber(value) ~= nil then
			value = ContentUrl .. value
		end
		return value
	elseif type == "float" or type == "int" or type == "double" then
		return tonumber(value)
	elseif type == "string" then
		return value
	elseif type == "NumberRange" then
		local list = Split(value,",")
		if #list == 1 then
			if tonumber(list[1]) == nil then return nil end
			local newVal = tonumber(list[1]) or 0
			return NumberRange.new(newVal)
		end
		if #list < 2 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		return NumberRange.new(x,y)
	else
		return nil
	end
end


-- Tables

local function CopyTable(T)
  local t2 = {}
  for k,v in pairs(T) do
    t2[k] = v
  end
  return t2
end

local function SortTable(T)
	table.sort(T, 
		function(x,y) return x.Name < y.Name
	end)
end

-- Spritesheet
local Sprite = {
	Width = 13;
	Height = 13;
}

local Spritesheet = {
	Image = "http://www.roblox.com/asset/?id=128896947";
	Height = 256;
	Width = 256;
}

local Images = {
	"unchecked",
	"checked",
	"unchecked_over",
	"checked_over",
	"unchecked_disabled",
	"checked_disabled"
}

local function SpritePosition(spriteName)
	local x = 0
	local y = 0
	for i,v in pairs(Images) do
		if (v == spriteName) then
			return {x, y}
		end
		x = x + Sprite.Height
		if (x + Sprite.Width) > Spritesheet.Width then
			x = 0
			y = y + Sprite.Height
		end
	end
end

local function GetCheckboxImageName(checked, readOnly, mouseover)
	if checked then
		if readOnly then
			return "checked_disabled"
		elseif mouseover then
			return "checked_over"
		else
			return "checked"
		end
	else
		if readOnly then
			return "unchecked_disabled"
		elseif mouseover then
			return "unchecked_over"
		else
			return "unchecked"
		end
	end
end

local MAP_ID = 418720155

-- Gui Controls --

---- IconMap ----
-- Image size: 256px x 256px
-- Icon size: 16px x 16px
-- Padding between each icon: 2px
-- Padding around image edge: 1px
-- Total icons: 14 x 14 (196)
local Icon do
	local iconMap = 'http://www.roblox.com/asset/?id=' .. MAP_ID
	game:GetService('ContentProvider'):Preload(iconMap)
	local iconDehash do
		-- 14 x 14, 0-based input, 0-based output
		local f=math.floor
		function iconDehash(h)
			return f(h/14%14),f(h%14)
		end
	end

	function Icon(IconFrame,index)
		local row,col = iconDehash(index)
		local mapSize = Vector2.new(256,256)
		local pad,border = 2,1
		local iconSize = 16

		local class = 'Frame'
		if type(IconFrame) == 'string' then
			class = IconFrame
			IconFrame = nil
		end

		if not IconFrame then
			IconFrame = Create(class,{
				Name = "Icon";
				BackgroundTransparency = 1;
				ClipsDescendants = true;
				Create('ImageLabel',{
					Name = "IconMap";
					Active = false;
					BackgroundTransparency = 1;
					Image = iconMap;
					Size = UDim2.new(mapSize.x/iconSize,0,mapSize.y/iconSize,0);
				});
			})
		end

		IconFrame.IconMap.Position = UDim2.new(-col - (pad*(col+1) + border)/iconSize,0,-row - (pad*(row+1) + border)/iconSize,0)
		return IconFrame
	end
end

local function CreateCell()
	local tableCell = Instance.new("Frame")
	tableCell.Size = UDim2.new(0.5, -1, 1, 0)
	tableCell.BackgroundColor3 = Row.BackgroundColor
	tableCell.BorderColor3 = Row.BorderColor
	return tableCell
end
	
local function CreateLabel(readOnly)
	local label = Instance.new("TextLabel")
	label.Font = Row.Font
	label.FontSize = Row.FontSize
	label.TextXAlignment = Row.TextXAlignment
	label.BackgroundTransparency = 1
	
	if readOnly then
		label.TextColor3 = Row.TextLockedColor
	else
		label.TextColor3 = Row.TextColor
	end
	return label
end

local function CreateTextButton(readOnly, onClick)
	local button = Instance.new("TextButton")
	button.Font = Row.Font
	button.FontSize = Row.FontSize
	button.TextXAlignment = Row.TextXAlignment
	button.BackgroundTransparency = 1
	if readOnly then
		button.TextColor3 = Row.TextLockedColor
	else
		button.TextColor3 = Row.TextColor
		button.MouseButton1Click:connect(function()
			onClick()
		end)
	end
	return button
end

local function CreateObject(readOnly)
	local button = Instance.new("TextButton")
	button.Font = Row.Font
	button.FontSize = Row.FontSize
	button.TextXAlignment = Row.TextXAlignment
	button.BackgroundTransparency = 1
	if readOnly then
		button.TextColor3 = Row.TextLockedColor
	else
		button.TextColor3 = Row.TextColor
	end
	local cancel = Create(Icon('ImageButton',177),{
		Name = "Cancel";
		Visible = false;
		Position = UDim2.new(1,-20,0,0);
		Size = UDim2.new(0,20,0,20);
		Parent = button;
	})
	return button
end

local function CreateTextBox(readOnly)
	if readOnly then
		local box = CreateLabel(readOnly)
		return box
	else
		local box = Instance.new("TextBox")
		if not SettingsRemote:Invoke("ClearProps") then
			box.ClearTextOnFocus = false
		end
		box.Font = Row.Font
		box.FontSize = Row.FontSize
		box.TextXAlignment = Row.TextXAlignment
		box.BackgroundTransparency = 1
		box.TextColor3 = Row.TextColor
		return box
	end
end

local function CreateDropDownItem(text, onClick)
	local button = Instance.new("TextButton")
	button.Font = DropDown.Font
	button.FontSize = DropDown.FontSize
	button.TextColor3 = DropDown.TextColor
	button.TextXAlignment = DropDown.TextXAlignment
	button.BackgroundColor3 = DropDown.BackColor
	button.AutoButtonColor = false
	button.BorderSizePixel = 0
	button.Active = true
	button.Text = text
	
	button.MouseEnter:connect(function()
		button.TextColor3 = DropDown.TextColorOver
		button.BackgroundColor3 = DropDown.BackColorOver
	end)
	button.MouseLeave:connect(function()
		button.TextColor3 = DropDown.TextColor
		button.BackgroundColor3 = DropDown.BackColor
	end)
	button.MouseButton1Click:connect(function()
		onClick(text)
	end)	
	return button
end

local function CreateDropDown(choices, currentChoice, readOnly, onClick)
	local frame = Instance.new("Frame")	
	frame.Name = "DropDown"
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundTransparency = 1
	frame.Active = true
	
	local menu = nil
	local arrow = nil
	local expanded = false
	local margin = DropDown.BorderSizePixel;
	
	local button = Instance.new("TextButton")
	button.Font = Row.Font
	button.FontSize = Row.FontSize
	button.TextXAlignment = Row.TextXAlignment
	button.BackgroundTransparency = 1
	button.TextColor3 = Row.TextColor
	if readOnly then
		button.TextColor3 = Row.TextLockedColor
	end
	button.Text = currentChoice
	button.Size = UDim2.new(1, -2 * Styles.Margin, 1, 0)
	button.Position = UDim2.new(0, Styles.Margin, 0, 0)
	button.Parent = frame
	
	local function showArrow(color)
		if arrow then arrow:Destroy() end
		
		local graphicTemplate = Create('Frame',{
			Name="Graphic";
			BorderSizePixel = 0;
			BackgroundColor3 = color;
		})
		local graphicSize = 16/2
		
		arrow = ArrowGraphic(graphicSize,'Down',true,graphicTemplate)
		arrow.Position = UDim2.new(1,-graphicSize * 2,0.5,-graphicSize/2)
		arrow.Parent = frame
	end
	
	local function hideMenu()
		expanded = false
		showArrow(DropDown.ArrowColor)
		if menu then menu:Destroy() end
	end
	
	local function showMenu()
		expanded = true
		menu = Instance.new("Frame")
		menu.Size = UDim2.new(1, -2 * margin, 0, #choices * DropDown.Height)
		menu.Position = UDim2.new(0, margin, 0, Row.Height + margin)
		menu.BackgroundTransparency = 0
		menu.BackgroundColor3 = DropDown.BackColor
		menu.BorderColor3 = DropDown.BorderColor
		menu.BorderSizePixel = DropDown.BorderSizePixel
		menu.Active = true
		menu.ZIndex = 5
		menu.Parent = frame
		
		local parentFrameHeight = menu.Parent.Parent.Parent.Parent.Size.Y.Offset
		local rowHeight = menu.Parent.Parent.Parent.Position.Y.Offset
		if (rowHeight + menu.Size.Y.Offset) > math.max(parentFrameHeight,PropertiesFrame.AbsoluteSize.y) then
			menu.Position = UDim2.new(0, margin, 0, -1 * (#choices * DropDown.Height) - margin)
		end
			
		local function choice(name)
			onClick(name)
			hideMenu()
		end
		
		for i,name in pairs(choices) do
			local option = CreateDropDownItem(name, function()
				choice(name)
			end)
			option.Size = UDim2.new(1, 0, 0, 16)
			option.Position = UDim2.new(0, 0, 0, (i - 1) * DropDown.Height)
			option.ZIndex = menu.ZIndex
			option.Parent = menu
		end
	end
	
	showArrow(DropDown.ArrowColor)
	
	if not readOnly then
		
		button.MouseEnter:connect(function()
			button.TextColor3 = Row.TextColor
			showArrow(DropDown.ArrowColorOver)
		end)
		button.MouseLeave:connect(function()
			button.TextColor3 = Row.TextColor
			if not expanded then
				showArrow(DropDown.ArrowColor)
			end
		end)
		button.MouseButton1Click:connect(function()
			if expanded then
				hideMenu()
			else
				showMenu()
			end
		end)
	end
	
	return frame,button
end

local function CreateBrickColor(readOnly, onClick)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1,0,1,0)
	frame.BackgroundTransparency = 1
	
	local colorPalette = Instance.new("Frame")
	colorPalette.BackgroundTransparency = 0
	colorPalette.SizeConstraint = Enum.SizeConstraint.RelativeXX
	colorPalette.Size = UDim2.new(1, -2 * BrickColors.OuterBorder, 1, -2 * BrickColors.OuterBorder)
	colorPalette.BorderSizePixel = BrickColors.BorderSizePixel
	colorPalette.BorderColor3 = BrickColors.BorderColor
	colorPalette.Position = UDim2.new(0, BrickColors.OuterBorder, 0, BrickColors.OuterBorder + Row.Height)
	colorPalette.ZIndex = 5
	colorPalette.Visible = false
	colorPalette.BorderSizePixel = BrickColors.OuterBorder
	colorPalette.BorderColor3 = BrickColors.OuterBorderColor
	colorPalette.Parent = frame
	
	local function show()
		colorPalette.Visible = true
	end
	
	local function hide()
		colorPalette.Visible = false
	end
	
	local function toggle()
		colorPalette.Visible = not colorPalette.Visible
	end
	
	local colorBox = Instance.new("TextButton", frame)
	colorBox.Position = UDim2.new(0, Styles.Margin, 0, Styles.Margin)
	colorBox.Size = UDim2.new(0, BrickColors.BoxSize, 0, BrickColors.BoxSize)
	colorBox.Text = ""
	colorBox.MouseButton1Click:connect(function()
		if not readOnly then
			toggle()
		end
	end)
	
	if readOnly then
		colorBox.AutoButtonColor = false
	end
	
	local spacingBefore = (Styles.Margin * 2) + BrickColors.BoxSize
	
	local propertyLabel = CreateTextButton(readOnly, function()
		if not readOnly then
			toggle()
		end
	end)
	propertyLabel.Size = UDim2.new(1, (-1 * spacingBefore) - Styles.Margin, 1, 0)
	propertyLabel.Position = UDim2.new(0, spacingBefore, 0, 0)
	propertyLabel.Parent = frame
	
	local size = (1 / BrickColors.ColorsPerRow)
	
	for index = 0, 127 do
		local brickColor = BrickColor.palette(index)
		local color3 = brickColor.Color
		
		local x = size * (index % BrickColors.ColorsPerRow)
		local y = size * math.floor(index / BrickColors.ColorsPerRow)
	
		local brickColorBox = Instance.new("TextButton")
		brickColorBox.Text = ""
		brickColorBox.Size = UDim2.new(size,0,size,0)
		brickColorBox.BackgroundColor3 = color3
		brickColorBox.Position = UDim2.new(x, 0, y, 0)
		brickColorBox.ZIndex = colorPalette.ZIndex
		brickColorBox.Parent = colorPalette
	
		brickColorBox.MouseButton1Click:connect(function()
			hide()
			onClick(brickColor)
		end)
	end
	
	return frame,propertyLabel,colorBox
end

local function CreateColor3Control(readOnly, onClick)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1,0,1,0)
	frame.BackgroundTransparency = 1
	
	local colorBox = Instance.new("TextButton", frame)
	colorBox.Position = UDim2.new(0, Styles.Margin, 0, Styles.Margin)
	colorBox.Size = UDim2.new(0, BrickColors.BoxSize, 0, BrickColors.BoxSize)
	colorBox.Text = ""
	colorBox.AutoButtonColor = false
	
	local spacingBefore = (Styles.Margin * 2) + BrickColors.BoxSize
	local box = CreateTextBox(readOnly)
	box.Size = UDim2.new(1, (-1 * spacingBefore) - Styles.Margin, 1, 0)
	box.Position = UDim2.new(0, spacingBefore, 0, 0)
	box.Parent = frame
	
	return frame,box,colorBox
end

function CreateCheckbox(value, readOnly, onClick)
	local checked = value
	local mouseover = false

	local checkboxFrame = Instance.new("ImageButton")
	checkboxFrame.Size = UDim2.new(0, Sprite.Width, 0, Sprite.Height)
	checkboxFrame.BackgroundTransparency = 1
	checkboxFrame.ClipsDescendants = true
	--checkboxFrame.Position = UDim2.new(0, Styles.Margin, 0, Styles.Margin)

	local spritesheetImage = Instance.new("ImageLabel", checkboxFrame)
	spritesheetImage.Name = "SpritesheetImageLabel"
	spritesheetImage.Size = UDim2.new(0, Spritesheet.Width, 0, Spritesheet.Height)
	spritesheetImage.Image = Spritesheet.Image
	spritesheetImage.BackgroundTransparency = 1
	
	local function updateSprite()
		local spriteName = GetCheckboxImageName(checked, readOnly, mouseover)
		local spritePosition = SpritePosition(spriteName)
		spritesheetImage.Position = UDim2.new(0, -1 * spritePosition[1], 0, -1 * spritePosition[2])
	end
	
	local function setValue(val)
		checked = val
		updateSprite()
	end

	if not readOnly then
		checkboxFrame.MouseEnter:connect(function() mouseover = true updateSprite() end)
		checkboxFrame.MouseLeave:connect(function() mouseover = false updateSprite() end)
		checkboxFrame.MouseButton1Click:connect(function()
			onClick(checked)
		end)
	end
	
	updateSprite()
	
	return checkboxFrame, setValue
end



-- Code for handling controls of various data types --

local Controls = {}

Controls["default"] = function(object, propertyData, readOnly)
	local propertyName = propertyData["Name"]
	local propertyType = propertyData["ValueType"]
	
	local box = CreateTextBox(readOnly)
	box.Size = UDim2.new(1, -2 * Styles.Margin, 1, 0)
	box.Position = UDim2.new(0, Styles.Margin, 0, 0)

	local function update()
		local value = object[propertyName]
		box.Text = ToString(value, propertyType)
	end
	
	if not readOnly then
		box.FocusLost:connect(function(enterPressed)
			Set(object, propertyData, ToValue(box.Text,propertyType))
			update()
		end)
	end
	
	update()
	
	object.Changed:connect(function(property)
		if (property == propertyName) then
			update()
		end
	end)
	
	return box
end

Controls["bool"] = function(object, propertyData, readOnly)
	local propertyName = propertyData["Name"]
	local checked = object[propertyName]
	
	local checkbox, setValue = CreateCheckbox(checked, readOnly, function(value)
		Set(object, propertyData, not checked)
	end)
	checkbox.Position = UDim2.new(0, Styles.Margin, 0, Styles.Margin)
	
	setValue(checked)
	
	local function update()
		checked = object[propertyName]
		setValue(checked)
	end
	
	object.Changed:connect(function(property)
		if (property == propertyName) then
			update()
		end
	end)
	
	if object:IsA("BoolValue") then
		object.Changed:connect(function(val)
			update()
		end)
	end
	
	update()
	
	return checkbox
end

Controls["BrickColor"] = function(object, propertyData, readOnly)
	local propertyName = propertyData["Name"]

	local frame,label,brickColorBox = CreateBrickColor(readOnly, function(brickColor)
		Set(object, propertyData, brickColor)
	end)
	
	local function update()
		local value = object[propertyName]
		brickColorBox.BackgroundColor3 = value.Color
		label.Text = tostring(value)
	end
	
	update()
	
	object.Changed:connect(function(property)
		if (property == propertyName) then
			update()
		end
	end)
	
	return frame
end

Controls["Color3"] = function(object, propertyData, readOnly)
	local propertyName = propertyData["Name"]

	local frame,textBox,colorBox = CreateColor3Control(readOnly)
	
	textBox.FocusLost:connect(function(enterPressed)
		Set(object, propertyData, ToValue(textBox.Text,"Color3"))
		local value = object[propertyName]
		colorBox.BackgroundColor3 = value
		textBox.Text = ToString(value, "Color3")
	end)
			
	local function update()
		local value = object[propertyName]
		colorBox.BackgroundColor3 = value
		textBox.Text = ToString(value, "Color3")
	end
	
	update()
	
	object.Changed:connect(function(property)
		if (property == propertyName) then
			update()
		end
	end)
	
	return frame
end

Controls["Enum"] = function(object, propertyData, readOnly)
	local propertyName = propertyData["Name"]
	local propertyType = propertyData["ValueType"]
	
	local enumName = object[propertyName].Name
	
	local enumNames = {}
	for _,enum in pairs(Enum[tostring(propertyType)]:GetEnumItems()) do
		table.insert(enumNames, enum.Name)
	end
	
	local dropdown, propertyLabel = CreateDropDown(enumNames, enumName, readOnly, function(value)
		Set(object, propertyData, value)
	end)
	--dropdown.Parent = frame
	
	local function update()
		local value = object[propertyName].Name
		propertyLabel.Text = tostring(value)
	end
	
	update()
	
	object.Changed:connect(function(property)
		if (property == propertyName) then
			update()
		end
	end)
	
	return dropdown
end

Controls["Object"] = function(object, propertyData, readOnly)
	local propertyName = propertyData["Name"]
	local propertyType = propertyData["ValueType"]
	
	local box = CreateObject(readOnly,function()end)
	box.Size = UDim2.new(1, -2 * Styles.Margin, 1, 0)
	box.Position = UDim2.new(0, Styles.Margin, 0, 0)

	local function update()
		if AwaitingObjectObj == object then
			if AwaitingObjectValue == true then
				box.Text = "Select an Object"
				return
			end
		end
		local value = object[propertyName]
		box.Text = ToString(value, propertyType)
	end
	
	if not readOnly then
		box.MouseButton1Click:connect(function()
			if AwaitingObjectValue then
				AwaitingObjectValue = false
				update()
				return
			end
			AwaitingObjectValue = true
			AwaitingObjectObj = object
			AwaitingObjectProp = propertyData
			box.Text = "Select an Object"
		end)
		
		box.Cancel.Visible = true
		box.Cancel.MouseButton1Click:connect(function()
			object[propertyName] = nil
		end)
	end
	
	update()
	
	object.Changed:connect(function(property)
		if (property == propertyName) then
			update()
		end
	end)
	
	if object:IsA("ObjectValue") then
		object.Changed:connect(function(val)
			update()
		end)
	end
	
	return box
end

function GetControl(object, propertyData, readOnly)
	local propertyType = propertyData["ValueType"]
	local control = nil
	
	if Controls[propertyType] then
		control = Controls[propertyType](object, propertyData, readOnly)
	elseif RbxApi.IsEnum(propertyType) then
		control = Controls["Enum"](object, propertyData, readOnly)
	elseif RbxApi.Classes[propertyType] then
        control = Controls["Object"](object, propertyData, readOnly)
	else
		control = Controls["default"](object, propertyData, readOnly)
	end
	return control
end
-- Permissions

function CanEditObject(object)
	local player = Players.LocalPlayer
	local character = player.Character
	return Permissions.CanEdit
end

function CanEditProperty(object,propertyData)
	local tags = propertyData["tags"]
	for _,name in pairs(tags) do
		if name == "readonly" then
			return false
		end
	end
	return CanEditObject(object)
end

--RbxApi
local function PropertyIsHidden(propertyData)
	local tags = propertyData["tags"]
	for _,name in pairs(tags) do
		if name == "deprecated"
			or name == "hidden"
			or name == "writeonly" then
			return true
		end
	end
	return false
end

function Set(object, propertyData, value)
	local propertyName = propertyData["Name"]
	local propertyType = propertyData["ValueType"]
	
	if value == nil then return end
	
	for i,v in pairs(GetSelection()) do
		if CanEditProperty(v,propertyData) then
			pcall(function()
				--print("Setting " .. propertyName .. " to " .. tostring(value))
				v[propertyName] = value
			end)
		end
	end
end

function CreateRow(object, propertyData, isAlternateRow)
	local propertyName = propertyData["Name"]
	local propertyType = propertyData["ValueType"]
	local propertyValue = object[propertyName]
	--rowValue, rowValueType, isAlternate
	local backColor = Row.BackgroundColor;
	if (isAlternateRow) then
		backColor = Row.BackgroundColorAlternate
	end
	
	local readOnly = not CanEditProperty(object, propertyData)
	--if propertyType == "Instance" or propertyName == "Parent" then readOnly = true end

	local rowFrame = Instance.new("Frame")
	rowFrame.Size = UDim2.new(1,0,0,Row.Height)
	rowFrame.BackgroundTransparency = 1
	rowFrame.Name = 'Row'

	local propertyLabelFrame = CreateCell()
	propertyLabelFrame.Parent = rowFrame
	propertyLabelFrame.ClipsDescendants = true
	
	local propertyLabel = CreateLabel(readOnly)
	propertyLabel.Text = propertyName
	propertyLabel.Size = UDim2.new(1, -1 * Row.TitleMarginLeft, 1, 0)
	propertyLabel.Position = UDim2.new(0, Row.TitleMarginLeft, 0, 0)
	propertyLabel.Parent = propertyLabelFrame

	local propertyValueFrame = CreateCell()
	propertyValueFrame.Size = UDim2.new(0.5, -1, 1, 0)
	propertyValueFrame.Position = UDim2.new(0.5, 0, 0, 0)
	propertyValueFrame.Parent = rowFrame

	local control = GetControl(object, propertyData, readOnly)
	control.Parent = propertyValueFrame

	rowFrame.MouseEnter:connect(function()
		propertyLabelFrame.BackgroundColor3 = Row.BackgroundColorMouseover
		propertyValueFrame.BackgroundColor3 = Row.BackgroundColorMouseover
	end)
	rowFrame.MouseLeave:connect(function()
		propertyLabelFrame.BackgroundColor3 = backColor
		propertyValueFrame.BackgroundColor3 = backColor
	end)
	
	propertyLabelFrame.BackgroundColor3 = backColor
	propertyValueFrame.BackgroundColor3 = backColor
	
	return rowFrame
end

function ClearPropertiesList()
	for _,instance in pairs(ContentFrame:GetChildren()) do
		instance:Destroy()
	end
end

local selection = Gui:FindFirstChild("Selection", 1)
print(selection)

function displayProperties(props)
	for i,v in pairs(props) do
		pcall(function()
			local a = CreateRow(v.object, v.propertyData, ((numRows % 2) == 0))
			a.Position = UDim2.new(0,0,0,numRows*Row.Height)
			a.Parent = ContentFrame
			numRows = numRows + 1
		end)
	end
end

function checkForDupe(prop,props)
	for i,v in pairs(props) do
		if v.propertyData.Name == prop.Name and v.propertyData.ValueType == prop.ValueType then
			return true
		end
	end
	return false
end

function sortProps(t)
	table.sort(t, 
		function(x,y) return x.propertyData.Name < y.propertyData.Name
	end)
end

function showProperties(obj)
	ClearPropertiesList()
	if obj == nil then return end
	local propHolder = {}
	local foundProps = {}
	numRows = 0
	for _,nextObj in pairs(obj) do
		if not foundProps[nextObj.className] then
			foundProps[nextObj.className] = true
			for i,v in pairs(RbxApi.GetProperties(nextObj.className)) do
				local suc, err = pcall(function()
					if not (PropertyIsHidden(v)) and not checkForDupe(v,propHolder) then
						if string.find(string.lower(v.Name),string.lower(propertiesSearch.Text)) or not searchingProperties() then
							table.insert(propHolder,{propertyData = v, object = nextObj})
						end
					end
				end)
				--[[if not suc then 
					warn("Problem getting the value of property " .. v.Name .. " | " .. err)
				end	--]]
			end
		end
	end
	sortProps(propHolder)
	displayProperties(propHolder)
	ContentFrame.Size = UDim2.new(1, 0, 0, numRows * Row.Height)
	scrollBar.ScrollIndex = 0
	scrollBar.TotalSpace = numRows * Row.Height
	scrollBar.Update()
end

----------------------------------------------------------------
-----------------------SCROLLBAR STUFF--------------------------
----------------------------------------------------------------
----------------------------------------------------------------
local ScrollBarWidth = 16

local ScrollStyles = {
	Background      = Color3.new(233/255, 233/255, 233/255);
	Border          = Color3.new(149/255, 149/255, 149/255);
	Selected        = Color3.new( 63/255, 119/255, 189/255);
	BorderSelected  = Color3.new( 55/255, 106/255, 167/255);
	Text            = Color3.new(  0/255,   0/255,   0/255);
	TextDisabled    = Color3.new(128/255, 128/255, 128/255);
	TextSelected    = Color3.new(255/255, 255/255, 255/255);
	Button          = Color3.new(221/255, 221/255, 221/255);
	ButtonBorder    = Color3.new(149/255, 149/255, 149/255);
	ButtonSelected  = Color3.new(255/255,   0/255,   0/255);
	Field           = Color3.new(255/255, 255/255, 255/255);
	FieldBorder     = Color3.new(191/255, 191/255, 191/255);
	TitleBackground = Color3.new(178/255, 178/255, 178/255);
}
do
	local ZIndexLock = {}
	function SetZIndex(object,z)
		if not ZIndexLock[object] then
			ZIndexLock[object] = true
			if object:IsA'GuiObject' then
				object.ZIndex = z
			end
			local children = object:GetChildren()
			for i = 1,#children do
				SetZIndex(children[i],z)
			end
			ZIndexLock[object] = nil
		end
	end
end
function SetZIndexOnChanged(object)
	return object.Changed:connect(function(p)
		if p == "ZIndex" then
			SetZIndex(object,object.ZIndex)
		end
	end)
end
function Create(ty,data)
	local obj
	if type(ty) == 'string' then
		obj = Instance.new(ty)
	else
		obj = ty
	end
	for k, v in pairs(data) do
		if type(k) == 'number' then
			v.Parent = obj
		else
			obj[k] = v
		end
	end
	return obj
end
-- returns the ascendant ScreenGui of an object
function GetScreen(screen)
	if screen == nil then return nil end
	while not screen:IsA("ScreenGui") do
		screen = screen.Parent
		if screen == nil then return nil end
	end
	return screen
end
-- AutoButtonColor doesn't always reset properly
function ResetButtonColor(button)
	local active = button.Active
	button.Active = not active
	button.Active = active
end

function ArrowGraphic(size,dir,scaled,template)
	local Frame = Create('Frame',{
		Name = "Arrow Graphic";
		BorderSizePixel = 0;
		Size = UDim2.new(0,size,0,size);
		Transparency = 1;
	})
	if not template then
		template = Instance.new("Frame")
		template.BorderSizePixel = 0
	end

	local transform
	if dir == nil or dir == 'Up' then
		function transform(p,s) return p,s end
	elseif dir == 'Down' then
		function transform(p,s) return UDim2.new(0,p.X.Offset,0,size-p.Y.Offset-1),s end
	elseif dir == 'Left' then
		function transform(p,s) return UDim2.new(0,p.Y.Offset,0,p.X.Offset),UDim2.new(0,s.Y.Offset,0,s.X.Offset) end
	elseif dir == 'Right' then
		function transform(p,s) return UDim2.new(0,size-p.Y.Offset-1,0,p.X.Offset),UDim2.new(0,s.Y.Offset,0,s.X.Offset) end
	end

	local scale
	if scaled then
		function scale(p,s) return UDim2.new(p.X.Offset/size,0,p.Y.Offset/size,0),UDim2.new(s.X.Offset/size,0,s.Y.Offset/size,0) end
	else
		function scale(p,s) return p,s end
	end

	local o = math.floor(size/4)
	if size%2 == 0 then
		local n = size/2-1
		for i = 0,n do
			local t = template:Clone()
			local p,s = scale(transform(
				UDim2.new(0,n-i,0,o+i),
				UDim2.new(0,(i+1)*2,0,1)
			))
			t.Position = p
			t.Size = s
			t.Parent = Frame
		end
	else
		local n = (size-1)/2
		for i = 0,n do
			local t = template:Clone()
			local p,s = scale(transform(
				UDim2.new(0,n-i,0,o+i),
				UDim2.new(0,i*2+1,0,1)
			))
			t.Position = p
			t.Size = s
			t.Parent = Frame
		end
	end
	if size%4 > 1 then
		local t = template:Clone()
		local p,s = scale(transform(
			UDim2.new(0,0,0,size-o-1),
			UDim2.new(0,size,0,1)
		))
		t.Position = p
		t.Size = s
		t.Parent = Frame
	end
	return Frame
end

function GripGraphic(size,dir,spacing,scaled,template)
	local Frame = Create('Frame',{
		Name = "Grip Graphic";
		BorderSizePixel = 0;
		Size = UDim2.new(0,size.x,0,size.y);
		Transparency = 1;
	})
	if not template then
		template = Instance.new("Frame")
		template.BorderSizePixel = 0
	end

	spacing = spacing or 2

	local scale
	if scaled then
		function scale(p) return UDim2.new(p.X.Offset/size.x,0,p.Y.Offset/size.y,0) end
	else
		function scale(p) return p end
	end

	if dir == 'Vertical' then
		for i=0,size.x-1,spacing do
			local t = template:Clone()
			t.Size = scale(UDim2.new(0,1,0,size.y))
			t.Position = scale(UDim2.new(0,i,0,0))
			t.Parent = Frame
		end
	elseif dir == nil or dir == 'Horizontal' then
		for i=0,size.y-1,spacing do
			local t = template:Clone()
			t.Size = scale(UDim2.new(0,size.x,0,1))
			t.Position = scale(UDim2.new(0,0,0,i))
			t.Parent = Frame
		end
	end

	return Frame
end

do
	local mt = {
		__index = {
			GetScrollPercent = function(self)
				return self.ScrollIndex/(self.TotalSpace-self.VisibleSpace)
			end;
			CanScrollDown = function(self)
				return self.ScrollIndex + self.VisibleSpace < self.TotalSpace
			end;
			CanScrollUp = function(self)
				return self.ScrollIndex > 0
			end;
			ScrollDown = function(self)
				self.ScrollIndex = self.ScrollIndex + self.PageIncrement
				self:Update()
			end;
			ScrollUp = function(self)
				self.ScrollIndex = self.ScrollIndex - self.PageIncrement
				self:Update()
			end;
			ScrollTo = function(self,index)
				self.ScrollIndex = index
				self:Update()
			end;
			SetScrollPercent = function(self,percent)
				self.ScrollIndex = math.floor((self.TotalSpace - self.VisibleSpace)*percent + 0.5)
				self:Update()
			end;
		};
	}
	mt.__index.CanScrollRight = mt.__index.CanScrollDown
	mt.__index.CanScrollLeft = mt.__index.CanScrollUp
	mt.__index.ScrollLeft = mt.__index.ScrollUp
	mt.__index.ScrollRight = mt.__index.ScrollDown

	function ScrollBar(horizontal)
		-- create row scroll bar
		local ScrollFrame = Create('Frame',{
			Name = "ScrollFrame";
			Position = horizontal and UDim2.new(0,0,1,-ScrollBarWidth) or UDim2.new(1,-ScrollBarWidth,0,0);
			Size = horizontal and UDim2.new(1,0,0,ScrollBarWidth) or UDim2.new(0,ScrollBarWidth,1,0);
			BackgroundTransparency = 1;
			Create('ImageButton',{
				Name = "ScrollDown";
				Position = horizontal and UDim2.new(1,-ScrollBarWidth,0,0) or UDim2.new(0,0,1,-ScrollBarWidth);
				Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
				BackgroundColor3 = ScrollStyles.Button;
				BorderColor3 = ScrollStyles.Border;
				--BorderSizePixel = 0;
			});
			Create('ImageButton',{
				Name = "ScrollUp";
				Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
				BackgroundColor3 = ScrollStyles.Button;
				BorderColor3 = ScrollStyles.Border;
				--BorderSizePixel = 0;
			});
			Create('ImageButton',{
				Name = "ScrollBar";
				Size = horizontal and UDim2.new(1,-ScrollBarWidth*2,1,0) or UDim2.new(1,0,1,-ScrollBarWidth*2);
				Position = horizontal and UDim2.new(0,ScrollBarWidth,0,0) or UDim2.new(0,0,0,ScrollBarWidth);
				AutoButtonColor = false;
				BackgroundColor3 = Color3.new(0.94902, 0.94902, 0.94902);
				BorderColor3 = ScrollStyles.Border;
				--BorderSizePixel = 0;
				Create('ImageButton',{
					Name = "ScrollThumb";
					AutoButtonColor = false;
					Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
					BackgroundColor3 = ScrollStyles.Button;
					BorderColor3 = ScrollStyles.Border;
					--BorderSizePixel = 0;
				});
			});
		})

		local graphicTemplate = Create('Frame',{
			Name="Graphic";
			BorderSizePixel = 0;
			BackgroundColor3 = ScrollStyles.Border;
		})
		local graphicSize = ScrollBarWidth/2

		local ScrollDownFrame = ScrollFrame.ScrollDown
			local ScrollDownGraphic = ArrowGraphic(graphicSize,horizontal and 'Right' or 'Down',true,graphicTemplate)
			ScrollDownGraphic.Position = UDim2.new(0.5,-graphicSize/2,0.5,-graphicSize/2)
			ScrollDownGraphic.Parent = ScrollDownFrame
		local ScrollUpFrame = ScrollFrame.ScrollUp
			local ScrollUpGraphic = ArrowGraphic(graphicSize,horizontal and 'Left' or 'Up',true,graphicTemplate)
			ScrollUpGraphic.Position = UDim2.new(0.5,-graphicSize/2,0.5,-graphicSize/2)
			ScrollUpGraphic.Parent = ScrollUpFrame
		local ScrollBarFrame = ScrollFrame.ScrollBar
		local ScrollThumbFrame = ScrollBarFrame.ScrollThumb
		do
			local size = ScrollBarWidth*3/8
			local Decal = GripGraphic(Vector2.new(size,size),horizontal and 'Vertical' or 'Horizontal',2,graphicTemplate)
			Decal.Position = UDim2.new(0.5,-size/2,0.5,-size/2)
			Decal.Parent = ScrollThumbFrame
		end

		local MouseDrag = Create('ImageButton',{
			Name = "MouseDrag";
			Position = UDim2.new(-0.25,0,-0.25,0);
			Size = UDim2.new(1.5,0,1.5,0);
			Transparency = 1;
			AutoButtonColor = false;
			Active = true;
			ZIndex = 10;
		})

		local Class = setmetatable({
			GUI = ScrollFrame;
			ScrollIndex = 0;
			VisibleSpace = 0;
			TotalSpace = 0;
			PageIncrement = 1;
		},mt)

		local UpdateScrollThumb
		if horizontal then
			function UpdateScrollThumb()
				ScrollThumbFrame.Size = UDim2.new(Class.VisibleSpace/Class.TotalSpace,0,0,ScrollBarWidth)
				if ScrollThumbFrame.AbsoluteSize.x < ScrollBarWidth then
					ScrollThumbFrame.Size = UDim2.new(0,ScrollBarWidth,0,ScrollBarWidth)
				end
				local barSize = ScrollBarFrame.AbsoluteSize.x
				ScrollThumbFrame.Position = UDim2.new(Class:GetScrollPercent()*(barSize - ScrollThumbFrame.AbsoluteSize.x)/barSize,0,0,0)
			end
		else
			function UpdateScrollThumb()
				ScrollThumbFrame.Size = UDim2.new(0,ScrollBarWidth,Class.VisibleSpace/Class.TotalSpace,0)
				if ScrollThumbFrame.AbsoluteSize.y < ScrollBarWidth then
					ScrollThumbFrame.Size = UDim2.new(0,ScrollBarWidth,0,ScrollBarWidth)
				end
				local barSize = ScrollBarFrame.AbsoluteSize.y
				ScrollThumbFrame.Position = UDim2.new(0,0,Class:GetScrollPercent()*(barSize - ScrollThumbFrame.AbsoluteSize.y)/barSize,0)
			end
		end

		local lastDown
		local lastUp
		local scrollStyle = {BackgroundColor3=ScrollStyles.Border,BackgroundTransparency=0}
		local scrollStyle_ds = {BackgroundColor3=ScrollStyles.Border,BackgroundTransparency=0.7}

		local function Update()
			local t = Class.TotalSpace
			local v = Class.VisibleSpace
			local s = Class.ScrollIndex
			if v <= t then
				if s > 0 then
					if s + v > t then
						Class.ScrollIndex = t - v
					end
				else
					Class.ScrollIndex = 0
				end
			else
				Class.ScrollIndex = 0
			end

			if Class.UpdateCallback then
				if Class.UpdateCallback(Class) == false then
					return
				end
			end

			local down = Class:CanScrollDown()
			local up = Class:CanScrollUp()
			if down ~= lastDown then
				lastDown = down
				ScrollDownFrame.Active = down
				ScrollDownFrame.AutoButtonColor = down
				local children = ScrollDownGraphic:GetChildren()
				local style = down and scrollStyle or scrollStyle_ds
				for i = 1,#children do
					Create(children[i],style)
				end
			end
			if up ~= lastUp then
				lastUp = up
				ScrollUpFrame.Active = up
				ScrollUpFrame.AutoButtonColor = up
				local children = ScrollUpGraphic:GetChildren()
				local style = up and scrollStyle or scrollStyle_ds
				for i = 1,#children do
					Create(children[i],style)
				end
			end
			ScrollThumbFrame.Visible = down or up
			UpdateScrollThumb()
		end
		Class.Update = Update

		SetZIndexOnChanged(ScrollFrame)

		local scrollEventID = 0
		ScrollDownFrame.MouseButton1Down:connect(function()
			scrollEventID = tick()
			local current = scrollEventID
			local up_con
			up_con = MouseDrag.MouseButton1Up:connect(function()
				scrollEventID = tick()
				MouseDrag.Parent = nil
				ResetButtonColor(ScrollDownFrame)
				up_con:disconnect(); drag = nil
			end)
			MouseDrag.Parent = GetScreen(ScrollFrame)
			Class:ScrollDown()
			wait(0.2) -- delay before auto scroll
			while scrollEventID == current do
				Class:ScrollDown()
				if not Class:CanScrollDown() then break end
				wait()
			end
		end)

		ScrollDownFrame.MouseButton1Up:connect(function()
			scrollEventID = tick()
		end)

		ScrollUpFrame.MouseButton1Down:connect(function()
			scrollEventID = tick()
			local current = scrollEventID
			local up_con
			up_con = MouseDrag.MouseButton1Up:connect(function()
				scrollEventID = tick()
				MouseDrag.Parent = nil
				ResetButtonColor(ScrollUpFrame)
				up_con:disconnect(); drag = nil
			end)
			MouseDrag.Parent = GetScreen(ScrollFrame)
			Class:ScrollUp()
			wait(0.2)
			while scrollEventID == current do
				Class:ScrollUp()
				if not Class:CanScrollUp() then break end
				wait()
			end
		end)

		ScrollUpFrame.MouseButton1Up:connect(function()
			scrollEventID = tick()
		end)

		if horizontal then
			ScrollBarFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local current = scrollEventID
				local up_con
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollUpFrame)
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
				if x > ScrollThumbFrame.AbsolutePosition.x then
					Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if x < ScrollThumbFrame.AbsolutePosition.x + ScrollThumbFrame.AbsoluteSize.x then break end
						Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
						wait()
					end
				else
					Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if x > ScrollThumbFrame.AbsolutePosition.x then break end
						Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
						wait()
					end
				end
			end)
		else
			ScrollBarFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local current = scrollEventID
				local up_con
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollUpFrame)
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
				if y > ScrollThumbFrame.AbsolutePosition.y then
					Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if y < ScrollThumbFrame.AbsolutePosition.y + ScrollThumbFrame.AbsoluteSize.y then break end
						Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
						wait()
					end
				else
					Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if y > ScrollThumbFrame.AbsolutePosition.y then break end
						Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
						wait()
					end
				end
			end)
		end

		if horizontal then
			ScrollThumbFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local mouse_offset = x - ScrollThumbFrame.AbsolutePosition.x
				local drag_con
				local up_con
				drag_con = MouseDrag.MouseMoved:connect(function(x,y)
					local bar_abs_pos = ScrollBarFrame.AbsolutePosition.x
					local bar_drag = ScrollBarFrame.AbsoluteSize.x - ScrollThumbFrame.AbsoluteSize.x
					local bar_abs_one = bar_abs_pos + bar_drag
					x = x - mouse_offset
					x = x < bar_abs_pos and bar_abs_pos or x > bar_abs_one and bar_abs_one or x
					x = x - bar_abs_pos
					Class:SetScrollPercent(x/(bar_drag))
				end)
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollThumbFrame)
					drag_con:disconnect(); drag_con = nil
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
			end)
		else
			ScrollThumbFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local mouse_offset = y - ScrollThumbFrame.AbsolutePosition.y
				local drag_con
				local up_con
				drag_con = MouseDrag.MouseMoved:connect(function(x,y)
					local bar_abs_pos = ScrollBarFrame.AbsolutePosition.y
					local bar_drag = ScrollBarFrame.AbsoluteSize.y - ScrollThumbFrame.AbsoluteSize.y
					local bar_abs_one = bar_abs_pos + bar_drag
					y = y - mouse_offset
					y = y < bar_abs_pos and bar_abs_pos or y > bar_abs_one and bar_abs_one or y
					y = y - bar_abs_pos
					Class:SetScrollPercent(y/(bar_drag))
				end)
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollThumbFrame)
					drag_con:disconnect(); drag_con = nil
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
			end)
		end

		function Class:Destroy()
			ScrollFrame:Destroy()
			MouseDrag:Destroy()
			for k in pairs(Class) do
				Class[k] = nil
			end
			setmetatable(Class,nil)
		end

		Update()

		return Class
	end
end

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(1, -1 * ScrollBarWidth, 1, 0)
MainFrame.Position = UDim2.new(0, 0, 0, 0)
MainFrame.BackgroundTransparency = 1
MainFrame.ClipsDescendants = true
MainFrame.Parent = PropertiesFrame

ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, 0, 0, 0)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

scrollBar = ScrollBar(false)
scrollBar.PageIncrement = 1
Create(scrollBar.GUI,{
	Position = UDim2.new(1,-ScrollBarWidth,0,0);
	Size = UDim2.new(0,ScrollBarWidth,1,0);
	Parent = PropertiesFrame;
})

scrollBarH = ScrollBar(true)
scrollBarH.PageIncrement = ScrollBarWidth
Create(scrollBarH.GUI,{
	Position = UDim2.new(0,0,1,-ScrollBarWidth);
	Size = UDim2.new(1,-ScrollBarWidth,0,ScrollBarWidth);
	Visible = false;
	Parent = PropertiesFrame;
})

do
	local listEntries = {}
	local nameConnLookup = {}
	
	function scrollBar.UpdateCallback(self)
		scrollBar.TotalSpace = ContentFrame.AbsoluteSize.Y
		scrollBar.VisibleSpace = MainFrame.AbsoluteSize.Y
		ContentFrame.Position = UDim2.new(ContentFrame.Position.X.Scale,ContentFrame.Position.X.Offset,0,-1*scrollBar.ScrollIndex)
	end

	function scrollBarH.UpdateCallback(self)
		
	end

	MainFrame.Changed:connect(function(p)
		if p == 'AbsoluteSize' then
			scrollBarH.VisibleSpace = math.ceil(MainFrame.AbsoluteSize.x)
			scrollBarH:Update()
			scrollBar.VisibleSpace = math.ceil(MainFrame.AbsoluteSize.y)
			scrollBar:Update()
		end
	end)

	local wheelAmount = Row.Height
	PropertiesFrame.MouseWheelForward:connect(function()
		if scrollBar.VisibleSpace - 1 > wheelAmount then
			scrollBar:ScrollTo(scrollBar.ScrollIndex - wheelAmount)
		else
			scrollBar:ScrollTo(scrollBar.ScrollIndex - scrollBar.VisibleSpace)
		end
	end)
	PropertiesFrame.MouseWheelBackward:connect(function()
		if scrollBar.VisibleSpace - 1 > wheelAmount then
			scrollBar:ScrollTo(scrollBar.ScrollIndex + wheelAmount)
		else
			scrollBar:ScrollTo(scrollBar.ScrollIndex + scrollBar.VisibleSpace)
		end
	end)
end

scrollBar.VisibleSpace = math.ceil(MainFrame.AbsoluteSize.y)
scrollBar:Update()

showProperties(GetSelection())

bindSelectionChanged.Event:connect(function()
	showProperties(GetSelection())
end)

bindSetAwait.Event:connect(function(obj)
	if AwaitingObjectValue then
		AwaitingObjectValue = false
		local mySel = obj
		if mySel then
			pcall(function()
				Set(AwaitingObjectObj, AwaitingObjectProp, mySel)
			end)
		end
	end
end)

propertiesSearch.Changed:connect(function(prop)
	if prop == "Text" then
		showProperties(GetSelection())
	end
end)

bindGetApi.OnInvoke = function()
	return RbxApi
end

bindGetAwait.OnInvoke = function()
	return AwaitingObjectValue
end
end))
ModuleScript3.Name = "RawApiJson"
ModuleScript3.Parent = LocalScript2
Frame4.Name = "Header"
Frame4.Parent = Frame1
Frame4.Position = UDim2.new(0, 0, 0, -36)
Frame4.Size = UDim2.new(1, 0, 0, 36)
Frame4.BackgroundColor = BrickColor.new("Lily white")
Frame4.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame4.BorderColor = BrickColor.new("Sand violet metallic")
Frame4.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame4.BorderSizePixel = 0
TextLabel5.Parent = Frame4
TextLabel5.Position = UDim2.new(0, 4, 0, 0)
TextLabel5.Transparency = 1
TextLabel5.Size = UDim2.new(1, -4, 0.5, 0)
TextLabel5.BackgroundTransparency = 1
TextLabel5.Font = Enum.Font.SourceSans
TextLabel5.FontSize = Enum.FontSize.Size14
TextLabel5.Text = "Properties"
TextLabel5.TextColor = BrickColor.new("Really black")
TextLabel5.TextColor3 = Color3.new(0, 0, 0)
TextLabel5.TextSize = 14
TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
TextBox6.Parent = Frame4
TextBox6.Position = UDim2.new(0, 4, 0.5, 0)
TextBox6.Transparency = 0.80000001192093
TextBox6.Size = UDim2.new(1, -8, 0.5, -3)
TextBox6.BackgroundTransparency = 0.80000001192093
TextBox6.Font = Enum.Font.SourceSans
TextBox6.FontSize = Enum.FontSize.Size14
TextBox6.Text = "Search Properties"
TextBox6.TextColor = BrickColor.new("Really black")
TextBox6.TextColor3 = Color3.new(0, 0, 0)
TextBox6.TextSize = 14
TextBox6.TextXAlignment = Enum.TextXAlignment.Left
BindableFunction7.Name = "GetApi"
BindableFunction7.Parent = Frame1
BindableFunction8.Name = "GetAwaiting"
BindableFunction8.Parent = Frame1
BindableEvent9.Name = "SetAwaiting"
BindableEvent9.Parent = Frame1
Frame10.Name = "ExplorerPanel"
Frame10.Parent = ScreenGui0
Frame10.Position = UDim2.new(1, 0, 0, 0)
Frame10.Transparency = 0.10000000149012
Frame10.Size = UDim2.new(0, 300, 0.5, 0)
Frame10.BackgroundColor = BrickColor.new("Institutional white")
Frame10.BackgroundColor3 = Color3.new(1, 1, 1)
Frame10.BackgroundTransparency = 0.10000000149012
Frame10.BorderColor = BrickColor.new("Sand violet metallic")
Frame10.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame10.BorderSizePixel = 0
BindableEvent11.Name = "SelectionChanged"
BindableEvent11.Parent = Frame10
BindableFunction12.Name = "SetOption"
BindableFunction12.Parent = Frame10
BindableFunction13.Name = "SetSelection"
BindableFunction13.Parent = Frame10
BindableFunction14.Name = "GetOption"
BindableFunction14.Parent = Frame10
BindableFunction15.Name = "GetSelection"
BindableFunction15.Parent = Frame10
LocalScript16.Parent = Frame10
table.insert(cors,sandbox(LocalScript16,function()
-- initial states
local Option = {
	-- can modify object parents in the hierarchy
	Modifiable = false;
	-- can select objects
	Selectable = true;
}

-- MERELY

Option.Modifiable = true

-- END MERELY

-- general size of GUI objects, in pixels
local GUI_SIZE = 16
-- padding between items within each entry
local ENTRY_PADDING = 1
-- padding between each entry
local ENTRY_MARGIN = 1

local explorerPanel = script.Parent
local Input = game:GetService("UserInputService")
local HoldingCtrl = false
local HoldingShift = false

local DexOutput = Instance.new("Folder")
DexOutput.Name = "Output"
local DexOutputMain = Instance.new("ScreenGui", DexOutput)
DexOutputMain.Name = "Dex Output"

print = function(...)
	local Obj = Instance.new("Dialog")
	Obj.Parent = DexOutputMain
	Obj.Name = ""
	for i,v in pairs({...}) do
		Obj.Name = Obj.Name .. tostring(v) .. " "
	end
end

explorerPanel:WaitForChild("GetPrint").OnInvoke = function()
	return print
end


--[[

# Explorer Panel

A GUI panel that displays the game hierarchy.


## Selection Bindables

- `Function GetSelection ( )`

	Returns an array of objects representing the objects currently
	selected in the panel.

- `Function SetSelection ( Objects selection )`

	Sets the objects that are selected in the panel. `selection` is an array
	of objects.

- `Event SelectionChanged ( )`

	Fired after the selection changes.


## Option Bindables

- `Function GetOption ( string optionName )`

	If `optionName` is given, returns the value of that option. Otherwise,
	returns a table of options and their current values.

- `Function SetOption ( string optionName, bool value )`

	Sets `optionName` to `value`.

	Options:

	- Modifiable

		Whether objects can be modified by the panel.

		Note that modifying objects depends on being able to select them. If
		Selectable is false, then Actions will not be available. Reparenting
		is still possible, but only for the dragged object.

	- Selectable

		Whether objects can be selected.

		If Modifiable is false, then left-clicking will perform a drag
		selection.

## Updates

- 2013-09-18
	- Fixed explorer icons to match studio explorer.

- 2013-09-14
	- Added GetOption and SetOption bindables.
		- Option: Modifiable; sets whether objects can be modified by the panel.
		- Option: Selectable; sets whether objects can be selected.
	- Slight modification to left-click selection behavior.
	- Improved layout and scaling.

- 2013-09-13
	- Added drag to reparent objects.
		- Left-click to select/deselect object.
		- Left-click and drag unselected object to reparent single object.
		- Left-click and drag selected object to move reparent entire selection.
		- Right-click while dragging to cancel.

- 2013-09-11
	- Added explorer panel header with actions.
		- Added Cut action.
		- Added Copy action.
		- Added Paste action.
		- Added Delete action.
	- Added drag selection.
		- Left-click: Add to selection on drag.
		- Right-click: Add to or remove from selection on drag.
	- Ensured SelectionChanged fires only when the selection actually changes.
	- Added documentation and change log.
	- Fixed thread issue.

- 2013-09-09
	- Added basic multi-selection.
		- Left-click to set selection.
		- Right-click to add to or remove from selection.
	- Removed "Selection" ObjectValue.
		- Added GetSelection BindableFunction.
		- Added SetSelection BindableFunction.
		- Added SelectionChanged BindableEvent.
	- Changed font to SourceSans.

- 2013-08-31
	- Improved GUI sizing based off of `GUI_SIZE` constant.
	- Automatic font size detection.

- 2013-08-27
	- Initial explorer panel.


## Todo

- Sorting
	- by ExplorerOrder
	- by children
	- by name
- Drag objects to reparent

]]

local ENTRY_SIZE = GUI_SIZE + ENTRY_PADDING*2
local ENTRY_BOUND = ENTRY_SIZE + ENTRY_MARGIN
local HEADER_SIZE = ENTRY_SIZE*2

local FONT = 'SourceSans'
local FONT_SIZE do
	local size = {8,9,10,11,12,14,18,24,36,48}
	local s
	local n = math.huge
	for i = 1,#size do
		if size[i] <= GUI_SIZE then
			FONT_SIZE = i - 1
		end
	end
end

local GuiColor = {
	Background      = Color3.new(233/255, 233/255, 233/255);
	Border          = Color3.new(149/255, 149/255, 149/255);
	Selected        = Color3.new( 96/255, 140/255, 211/255);
	BorderSelected  = Color3.new( 86/255, 125/255, 188/255);
	Text            = Color3.new(  0/255,   0/255,   0/255);
	TextDisabled    = Color3.new(128/255, 128/255, 128/255);
	TextSelected    = Color3.new(255/255, 255/255, 255/255);
	Button          = Color3.new(221/255, 221/255, 221/255);
	ButtonBorder    = Color3.new(149/255, 149/255, 149/255);
	ButtonSelected  = Color3.new(255/255,   0/255,   0/255);
	Field           = Color3.new(255/255, 255/255, 255/255);
	FieldBorder     = Color3.new(191/255, 191/255, 191/255);
	TitleBackground = Color3.new(178/255, 178/255, 178/255);
}

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
---- Icon map constants

local MAP_ID = 483448923

-- Indices based on implementation of Icon function.
local ACTION_CUT         	 = 160
local ACTION_COPY        	 = 161
local ACTION_PASTE       	 = 162
local ACTION_DELETE      	 = 163
local ACTION_SORT        	 = 164
local ACTION_CUT_OVER    	 = 174
local ACTION_COPY_OVER   	 = 175
local ACTION_PASTE_OVER  	 = 176
local ACTION_DELETE_OVER	 = 177
local ACTION_SORT_OVER  	 = 178
local ACTION_EDITQUICKACCESS = 190
local ACTION_FREEZE 		 = 188
local ACTION_STARRED 		 = 189
local ACTION_ADDSTAR 		 = 184
local ACTION_ADDSTAR_OVER 	 = 187

local NODE_COLLAPSED      = 165
local NODE_EXPANDED       = 166
local NODE_COLLAPSED_OVER = 179
local NODE_EXPANDED_OVER  = 180

local ExplorerIndex = {
	["Accessory"] = 32;
	["Accoutrement"] = 32;
	["AdService"] = 73;
	["Animation"] = 60;
	["AnimationController"] = 60;
	["AnimationTrack"] = 60;
	["Animator"] = 60;
	["ArcHandles"] = 56;
	["AssetService"] = 72;
	["Attachment"] = 34;
	["Backpack"] = 20;
	["BadgeService"] = 75;
	["BallSocketConstraint"] = 89;
	["BillboardGui"] = 64;
	["BinaryStringValue"] = 4;
	["BindableEvent"] = 67;
	["BindableFunction"] = 66;
	["BlockMesh"] = 8;
	["BloomEffect"] = 90;
	["BlurEffect"] = 90;
	["BodyAngularVelocity"] = 14;
	["BodyForce"] = 14;
	["BodyGyro"] = 14;
	["BodyPosition"] = 14;
	["BodyThrust"] = 14;
	["BodyVelocity"] = 14;
	["BoolValue"] = 4;
	["BoxHandleAdornment"] = 54;
	["BrickColorValue"] = 4;
	["Camera"] = 5;
	["CFrameValue"] = 4;
	["CharacterMesh"] = 60;
	["Chat"] = 33;
	["ClickDetector"] = 41;
	["CollectionService"] = 30;
	["Color3Value"] = 4;
	["ColorCorrectionEffect"] = 90;
	["ConeHandleAdornment"] = 54;
	["Configuration"] = 58;
	["ContentProvider"] = 72;
	["ContextActionService"] = 41;
	["CoreGui"] = 46;
	["CoreScript"] = 18;
	["CornerWedgePart"] = 1;
	["CustomEvent"] = 4;
	["CustomEventReceiver"] = 4;
	["CylinderHandleAdornment"] = 54;
	["CylinderMesh"] = 8;
	["CylindricalConstraint"] = 89;
	["Debris"] = 30;
	["Decal"] = 7;
	["Dialog"] = 62;
	["DialogChoice"] = 63;
	["DoubleConstrainedValue"] = 4;
	["Explosion"] = 36;
	["FileMesh"] = 8;
	["Fire"] = 61;
	["Flag"] = 38;
	["FlagStand"] = 39;
	["FloorWire"] = 4;
	["Folder"] = 70;
	["ForceField"] = 37;
	["Frame"] = 48;
	["GamePassService"] = 19;
	["Glue"] = 34;
	["GuiButton"] = 52;
	["GuiMain"] = 47;
	["GuiService"] = 47;
	["Handles"] = 53;
	["HapticService"] = 84;
	["Hat"] = 45;
	["HingeConstraint"] = 89;
	["Hint"] = 33;
	["HopperBin"] = 22;
	["HttpService"] = 76;
	["Humanoid"] = 9;
	["ImageButton"] = 52;
	["ImageLabel"] = 49;
	["InsertService"] = 72;
	["IntConstrainedValue"] = 4;
	["IntValue"] = 4;
	["JointInstance"] = 34;
	["JointsService"] = 34;
	["Keyframe"] = 60;
	["KeyframeSequence"] = 60;
	["KeyframeSequenceProvider"] = 60;
	["Lighting"] = 13;
	["LineHandleAdornment"] = 54;
	["LocalScript"] = 18;
	["LogService"] = 87;
	["MarketplaceService"] = 46;
	["Message"] = 33;
	["Model"] = 2;
	["ModuleScript"] = 71;
	["Motor"] = 34;
	["Motor6D"] = 34;
	["MoveToConstraint"] = 89;
	["NegateOperation"] = 78;
	["NetworkClient"] = 16;
	["NetworkReplicator"] = 29;
	["NetworkServer"] = 15;
	["NumberValue"] = 4;
	["ObjectValue"] = 4;
	["Pants"] = 44;
	["ParallelRampPart"] = 1;
	["Part"] = 1;
	["ParticleEmitter"] = 69;
	["PartPairLasso"] = 57;
	["PathfindingService"] = 37;
	["Platform"] = 35;
	["Player"] = 12;
	["PlayerGui"] = 46;
	["Players"] = 21;
	["PlayerScripts"] = 82;
	["PointLight"] = 13;
	["PointsService"] = 83;
	["Pose"] = 60;
	["PrismaticConstraint"] = 89;
	["PrismPart"] = 1;
	["PyramidPart"] = 1;
	["RayValue"] = 4;
	["ReflectionMetadata"] = 86;
	["ReflectionMetadataCallbacks"] = 86;
	["ReflectionMetadataClass"] = 86;
	["ReflectionMetadataClasses"] = 86;
	["ReflectionMetadataEnum"] = 86;
	["ReflectionMetadataEnumItem"] = 86;
	["ReflectionMetadataEnums"] = 86;
	["ReflectionMetadataEvents"] = 86;
	["ReflectionMetadataFunctions"] = 86;
	["ReflectionMetadataMember"] = 86;
	["ReflectionMetadataProperties"] = 86;
	["ReflectionMetadataYieldFunctions"] = 86;
	["RemoteEvent"] = 80;
	["RemoteFunction"] = 79;
	["ReplicatedFirst"] = 72;
	["ReplicatedStorage"] = 72;
	["RightAngleRampPart"] = 1;
	["RocketPropulsion"] = 14;
	["RodConstraint"] = 89;
	["RopeConstraint"] = 89;
	["Rotate"] = 34;
	["RotateP"] = 34;
	["RotateV"] = 34;
	["RunService"] = 66;
	["ScreenGui"] = 47;
	["Script"] = 6;
	["ScrollingFrame"] = 48;
	["Seat"] = 35;
	["Selection"] = 55;
	["SelectionBox"] = 54;
	["SelectionPartLasso"] = 57;
	["SelectionPointLasso"] = 57;
	["SelectionSphere"] = 54;
	["ServerScriptService"] = 0;
	["ServerStorage"] = 74;
	["Shirt"] = 43;
	["ShirtGraphic"] = 40;
	["SkateboardPlatform"] = 35;
	["Sky"] = 28;
	["SlidingBallConstraint"] = 89;
	["Smoke"] = 59;
	["Snap"] = 34;
	["Sound"] = 11;
	["SoundService"] = 31;
	["Sparkles"] = 42;
	["SpawnLocation"] = 25;
	["SpecialMesh"] = 8;
	["SphereHandleAdornment"] = 54;
	["SpotLight"] = 13;
	["SpringConstraint"] = 89;
	["StarterCharacterScripts"] = 82;
	["StarterGear"] = 20;
	["StarterGui"] = 46;
	["StarterPack"] = 20;
	["StarterPlayer"] = 88;
	["StarterPlayerScripts"] = 82;
	["Status"] = 2;
	["StringValue"] = 4;
	["SunRaysEffect"] = 90;
	["SurfaceGui"] = 64;
	["SurfaceLight"] = 13;
	["SurfaceSelection"] = 55;
	["Team"] = 24;
	["Teams"] = 23;
	["TeleportService"] = 81;
	["Terrain"] = 65;
	["TerrainRegion"] = 65;
	["TestService"] = 68;
	["TextBox"] = 51;
	["TextButton"] = 51;
	["TextLabel"] = 50;
	["Texture"] = 10;
	["TextureTrail"] = 4;
	["Tool"] = 17;
	["TouchTransmitter"] = 37;
	["TrussPart"] = 1;
	["UnionOperation"] = 77;
	["UserInputService"] = 84;
	["Vector3Value"] = 4;
	["VehicleSeat"] = 35;
	["VelocityMotor"] = 34;
	["WedgePart"] = 1;
	["Weld"] = 34;
	["Workspace"] = 19;
}

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------

function Create(ty,data)
	local obj
	if type(ty) == 'string' then
		obj = Instance.new(ty)
	else
		obj = ty
	end
	for k, v in pairs(data) do
		if type(k) == 'number' then
			v.Parent = obj
		else
			obj[k] = v
		end
	end
	return obj
end

local barActive = false
local activeOptions = {}

function createDDown(dBut, callback,...)
	if barActive then
		for i,v in pairs(activeOptions) do
			v:Destroy()
		end
		activeOptions = {}
		barActive = false
		return
	else
		barActive = true
	end
	local slots = {...}
	local base = dBut
	for i,v in pairs(slots) do
		local newOption = base:Clone()
		newOption.ZIndex = 5
		newOption.Name = "Option "..tostring(i)
		newOption.Parent = base.Parent.Parent.Parent
		newOption.BackgroundTransparency = 0
		newOption.ZIndex = 2
		table.insert(activeOptions,newOption)
		newOption.Position = UDim2.new(-0.4, dBut.Position.X.Offset, dBut.Position.Y.Scale, dBut.Position.Y.Offset + (#activeOptions * dBut.Size.Y.Offset))
		newOption.Text = slots[i]
		newOption.MouseButton1Down:connect(function()
			dBut.Text = slots[i]
			callback(slots[i])
			for i,v in pairs(activeOptions) do
				v:Destroy()
			end
			activeOptions = {}
			barActive = false
		end)
	end
end

-- Connects a function to an event such that it fires asynchronously
function Connect(event,func)
	return event:connect(function(...)
		local a = {...}
		spawn(function() func(unpack(a)) end)
	end)
end

-- returns the ascendant ScreenGui of an object
function GetScreen(screen)
	if screen == nil then return nil end
	while not screen:IsA("ScreenGui") do
		screen = screen.Parent
		if screen == nil then return nil end
	end
	return screen
end

do
	local ZIndexLock = {}
	-- Sets the ZIndex of an object and its descendants. Objects are locked so
	-- that SetZIndexOnChanged doesn't spawn multiple threads that set the
	-- ZIndex of the same object.
	function SetZIndex(object,z)
		if not ZIndexLock[object] then
			ZIndexLock[object] = true
			if object:IsA'GuiObject' then
				object.ZIndex = z
			end
			local children = object:GetChildren()
			for i = 1,#children do
				SetZIndex(children[i],z)
			end
			ZIndexLock[object] = nil
		end
	end

	function SetZIndexOnChanged(object)
		return object.Changed:connect(function(p)
			if p == "ZIndex" then
				SetZIndex(object,object.ZIndex)
			end
		end)
	end
end

---- IconMap ----
-- Image size: 256px x 256px
-- Icon size: 16px x 16px
-- Padding between each icon: 2px
-- Padding around image edge: 1px
-- Total icons: 14 x 14 (196)
local Icon do
	local iconMap = 'http://www.roblox.com/asset/?id=' .. MAP_ID
	game:GetService('ContentProvider'):Preload(iconMap)
	local iconDehash do
		-- 14 x 14, 0-based input, 0-based output
		local f=math.floor
		function iconDehash(h)
			return f(h/14%14),f(h%14)
		end
	end

	function Icon(IconFrame,index)
		local row,col = iconDehash(index)
		local mapSize = Vector2.new(256,256)
		local pad,border = 2,1
		local iconSize = 16

		local class = 'Frame'
		if type(IconFrame) == 'string' then
			class = IconFrame
			IconFrame = nil
		end

		if not IconFrame then
			IconFrame = Create(class,{
				Name = "Icon";
				BackgroundTransparency = 1;
				ClipsDescendants = true;
				Create('ImageLabel',{
					Name = "IconMap";
					Active = false;
					BackgroundTransparency = 1;
					Image = iconMap;
					Size = UDim2.new(mapSize.x/iconSize,0,mapSize.y/iconSize,0);
				});
			})
		end

		IconFrame.IconMap.Position = UDim2.new(-col - (pad*(col+1) + border)/iconSize,0,-row - (pad*(row+1) + border)/iconSize,0)
		return IconFrame
	end
end

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
---- ScrollBar
do
	-- AutoButtonColor doesn't always reset properly
	local function ResetButtonColor(button)
		local active = button.Active
		button.Active = not active
		button.Active = active
	end

	local function ArrowGraphic(size,dir,scaled,template)
		local Frame = Create('Frame',{
			Name = "Arrow Graphic";
			BorderSizePixel = 0;
			Size = UDim2.new(0,size,0,size);
			Transparency = 1;
		})
		if not template then
			template = Instance.new("Frame")
			template.BorderSizePixel = 0
		end

		local transform
		if dir == nil or dir == 'Up' then
			function transform(p,s) return p,s end
		elseif dir == 'Down' then
			function transform(p,s) return UDim2.new(0,p.X.Offset,0,size-p.Y.Offset-1),s end
		elseif dir == 'Left' then
			function transform(p,s) return UDim2.new(0,p.Y.Offset,0,p.X.Offset),UDim2.new(0,s.Y.Offset,0,s.X.Offset) end
		elseif dir == 'Right' then
			function transform(p,s) return UDim2.new(0,size-p.Y.Offset-1,0,p.X.Offset),UDim2.new(0,s.Y.Offset,0,s.X.Offset) end
		end

		local scale
		if scaled then
			function scale(p,s) return UDim2.new(p.X.Offset/size,0,p.Y.Offset/size,0),UDim2.new(s.X.Offset/size,0,s.Y.Offset/size,0) end
		else
			function scale(p,s) return p,s end
		end

		local o = math.floor(size/4)
		if size%2 == 0 then
			local n = size/2-1
			for i = 0,n do
				local t = template:Clone()
				local p,s = scale(transform(
					UDim2.new(0,n-i,0,o+i),
					UDim2.new(0,(i+1)*2,0,1)
				))
				t.Position = p
				t.Size = s
				t.Parent = Frame
			end
		else
			local n = (size-1)/2
			for i = 0,n do
				local t = template:Clone()
				local p,s = scale(transform(
					UDim2.new(0,n-i,0,o+i),
					UDim2.new(0,i*2+1,0,1)
				))
				t.Position = p
				t.Size = s
				t.Parent = Frame
			end
		end
		if size%4 > 1 then
			local t = template:Clone()
			local p,s = scale(transform(
				UDim2.new(0,0,0,size-o-1),
				UDim2.new(0,size,0,1)
			))
			t.Position = p
			t.Size = s
			t.Parent = Frame
		end
		return Frame
	end


	local function GripGraphic(size,dir,spacing,scaled,template)
		local Frame = Create('Frame',{
			Name = "Grip Graphic";
			BorderSizePixel = 0;
			Size = UDim2.new(0,size.x,0,size.y);
			Transparency = 1;
		})
		if not template then
			template = Instance.new("Frame")
			template.BorderSizePixel = 0
		end

		spacing = spacing or 2

		local scale
		if scaled then
			function scale(p) return UDim2.new(p.X.Offset/size.x,0,p.Y.Offset/size.y,0) end
		else
			function scale(p) return p end
		end

		if dir == 'Vertical' then
			for i=0,size.x-1,spacing do
				local t = template:Clone()
				t.Size = scale(UDim2.new(0,1,0,size.y))
				t.Position = scale(UDim2.new(0,i,0,0))
				t.Parent = Frame
			end
		elseif dir == nil or dir == 'Horizontal' then
			for i=0,size.y-1,spacing do
				local t = template:Clone()
				t.Size = scale(UDim2.new(0,size.x,0,1))
				t.Position = scale(UDim2.new(0,0,0,i))
				t.Parent = Frame
			end
		end

		return Frame
	end

	local mt = {
		__index = {
			GetScrollPercent = function(self)
				return self.ScrollIndex/(self.TotalSpace-self.VisibleSpace)
			end;
			CanScrollDown = function(self)
				return self.ScrollIndex + self.VisibleSpace < self.TotalSpace
			end;
			CanScrollUp = function(self)
				return self.ScrollIndex > 0
			end;
			ScrollDown = function(self)
				self.ScrollIndex = self.ScrollIndex + self.PageIncrement
				self:Update()
			end;
			ScrollUp = function(self)
				self.ScrollIndex = self.ScrollIndex - self.PageIncrement
				self:Update()
			end;
			ScrollTo = function(self,index)
				self.ScrollIndex = index
				self:Update()
			end;
			SetScrollPercent = function(self,percent)
				self.ScrollIndex = math.floor((self.TotalSpace - self.VisibleSpace)*percent + 0.5)
				self:Update()
			end;
		};
	}
	mt.__index.CanScrollRight = mt.__index.CanScrollDown
	mt.__index.CanScrollLeft = mt.__index.CanScrollUp
	mt.__index.ScrollLeft = mt.__index.ScrollUp
	mt.__index.ScrollRight = mt.__index.ScrollDown

	function ScrollBar(horizontal)
		-- create row scroll bar
		local ScrollFrame = Create('Frame',{
			Name = "ScrollFrame";
			Position = horizontal and UDim2.new(0,0,1,-GUI_SIZE) or UDim2.new(1,-GUI_SIZE,0,0);
			Size = horizontal and UDim2.new(1,0,0,GUI_SIZE) or UDim2.new(0,GUI_SIZE,1,0);
			BackgroundTransparency = 1;
			Create('ImageButton',{
				Name = "ScrollDown";
				Position = horizontal and UDim2.new(1,-GUI_SIZE,0,0) or UDim2.new(0,0,1,-GUI_SIZE);
				Size = UDim2.new(0, GUI_SIZE, 0, GUI_SIZE);
				BackgroundColor3 = GuiColor.Button;
				BorderColor3 = GuiColor.Border;
				--BorderSizePixel = 0;
			});
			Create('ImageButton',{
				Name = "ScrollUp";
				Size = UDim2.new(0, GUI_SIZE, 0, GUI_SIZE);
				BackgroundColor3 = GuiColor.Button;
				BorderColor3 = GuiColor.Border;
				--BorderSizePixel = 0;
			});
			Create('ImageButton',{
				Name = "ScrollBar";
				Size = horizontal and UDim2.new(1,-GUI_SIZE*2,1,0) or UDim2.new(1,0,1,-GUI_SIZE*2);
				Position = horizontal and UDim2.new(0,GUI_SIZE,0,0) or UDim2.new(0,0,0,GUI_SIZE);
				AutoButtonColor = false;
				BackgroundColor3 = Color3.new(0.94902, 0.94902, 0.94902);
				BorderColor3 = GuiColor.Border;
				--BorderSizePixel = 0;
				Create('ImageButton',{
					Name = "ScrollThumb";
					AutoButtonColor = false;
					Size = UDim2.new(0, GUI_SIZE, 0, GUI_SIZE);
					BackgroundColor3 = GuiColor.Button;
					BorderColor3 = GuiColor.Border;
					--BorderSizePixel = 0;
				});
			});
		})

		local graphicTemplate = Create('Frame',{
			Name="Graphic";
			BorderSizePixel = 0;
			BackgroundColor3 = GuiColor.Border;
		})
		local graphicSize = GUI_SIZE/2

		local ScrollDownFrame = ScrollFrame.ScrollDown
			local ScrollDownGraphic = ArrowGraphic(graphicSize,horizontal and 'Right' or 'Down',true,graphicTemplate)
			ScrollDownGraphic.Position = UDim2.new(0.5,-graphicSize/2,0.5,-graphicSize/2)
			ScrollDownGraphic.Parent = ScrollDownFrame
		local ScrollUpFrame = ScrollFrame.ScrollUp
			local ScrollUpGraphic = ArrowGraphic(graphicSize,horizontal and 'Left' or 'Up',true,graphicTemplate)
			ScrollUpGraphic.Position = UDim2.new(0.5,-graphicSize/2,0.5,-graphicSize/2)
			ScrollUpGraphic.Parent = ScrollUpFrame
		local ScrollBarFrame = ScrollFrame.ScrollBar
		local ScrollThumbFrame = ScrollBarFrame.ScrollThumb
		do
			local size = GUI_SIZE*3/8
			local Decal = GripGraphic(Vector2.new(size,size),horizontal and 'Vertical' or 'Horizontal',2,graphicTemplate)
			Decal.Position = UDim2.new(0.5,-size/2,0.5,-size/2)
			Decal.Parent = ScrollThumbFrame
		end

		local Class = setmetatable({
			GUI = ScrollFrame;
			ScrollIndex = 0;
			VisibleSpace = 0;
			TotalSpace = 0;
			PageIncrement = 1;
		},mt)

		local UpdateScrollThumb
		if horizontal then
			function UpdateScrollThumb()
				ScrollThumbFrame.Size = UDim2.new(Class.VisibleSpace/Class.TotalSpace,0,0,GUI_SIZE)
				if ScrollThumbFrame.AbsoluteSize.x < GUI_SIZE then
					ScrollThumbFrame.Size = UDim2.new(0,GUI_SIZE,0,GUI_SIZE)
				end
				local barSize = ScrollBarFrame.AbsoluteSize.x
				ScrollThumbFrame.Position = UDim2.new(Class:GetScrollPercent()*(barSize - ScrollThumbFrame.AbsoluteSize.x)/barSize,0,0,0)
			end
		else
			function UpdateScrollThumb()
				ScrollThumbFrame.Size = UDim2.new(0,GUI_SIZE,Class.VisibleSpace/Class.TotalSpace,0)
				if ScrollThumbFrame.AbsoluteSize.y < GUI_SIZE then
					ScrollThumbFrame.Size = UDim2.new(0,GUI_SIZE,0,GUI_SIZE)
				end
				local barSize = ScrollBarFrame.AbsoluteSize.y
				ScrollThumbFrame.Position = UDim2.new(0,0,Class:GetScrollPercent()*(barSize - ScrollThumbFrame.AbsoluteSize.y)/barSize,0)
			end
		end

		local lastDown
		local lastUp
		local scrollStyle = {BackgroundColor3=GuiColor.Border,BackgroundTransparency=0}
		local scrollStyle_ds = {BackgroundColor3=GuiColor.Border,BackgroundTransparency=0.7}

		local function Update()
			local t = Class.TotalSpace
			local v = Class.VisibleSpace
			local s = Class.ScrollIndex
			if v <= t then
				if s > 0 then
					if s + v > t then
						Class.ScrollIndex = t - v
					end
				else
					Class.ScrollIndex = 0
				end
			else
				Class.ScrollIndex = 0
			end

			if Class.UpdateCallback then
				if Class.UpdateCallback(Class) == false then
					return
				end
			end

			local down = Class:CanScrollDown()
			local up = Class:CanScrollUp()
			if down ~= lastDown then
				lastDown = down
				ScrollDownFrame.Active = down
				ScrollDownFrame.AutoButtonColor = down
				local children = ScrollDownGraphic:GetChildren()
				local style = down and scrollStyle or scrollStyle_ds
				for i = 1,#children do
					Create(children[i],style)
				end
			end
			if up ~= lastUp then
				lastUp = up
				ScrollUpFrame.Active = up
				ScrollUpFrame.AutoButtonColor = up
				local children = ScrollUpGraphic:GetChildren()
				local style = up and scrollStyle or scrollStyle_ds
				for i = 1,#children do
					Create(children[i],style)
				end
			end
			ScrollThumbFrame.Visible = down or up
			UpdateScrollThumb()
		end
		Class.Update = Update

		SetZIndexOnChanged(ScrollFrame)

		local MouseDrag = Create('ImageButton',{
			Name = "MouseDrag";
			Position = UDim2.new(-0.25,0,-0.25,0);
			Size = UDim2.new(1.5,0,1.5,0);
			Transparency = 1;
			AutoButtonColor = false;
			Active = true;
			ZIndex = 10;
		})

		local scrollEventID = 0
		ScrollDownFrame.MouseButton1Down:connect(function()
			scrollEventID = tick()
			local current = scrollEventID
			local up_con
			up_con = MouseDrag.MouseButton1Up:connect(function()
				scrollEventID = tick()
				MouseDrag.Parent = nil
				ResetButtonColor(ScrollDownFrame)
				up_con:disconnect(); drag = nil
			end)
			MouseDrag.Parent = GetScreen(ScrollFrame)
			Class:ScrollDown()
			wait(0.2) -- delay before auto scroll
			while scrollEventID == current do
				Class:ScrollDown()
				if not Class:CanScrollDown() then break end
				wait()
			end
		end)

		ScrollDownFrame.MouseButton1Up:connect(function()
			scrollEventID = tick()
		end)

		ScrollUpFrame.MouseButton1Down:connect(function()
			scrollEventID = tick()
			local current = scrollEventID
			local up_con
			up_con = MouseDrag.MouseButton1Up:connect(function()
				scrollEventID = tick()
				MouseDrag.Parent = nil
				ResetButtonColor(ScrollUpFrame)
				up_con:disconnect(); drag = nil
			end)
			MouseDrag.Parent = GetScreen(ScrollFrame)
			Class:ScrollUp()
			wait(0.2)
			while scrollEventID == current do
				Class:ScrollUp()
				if not Class:CanScrollUp() then break end
				wait()
			end
		end)

		ScrollUpFrame.MouseButton1Up:connect(function()
			scrollEventID = tick()
		end)

		if horizontal then
			ScrollBarFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local current = scrollEventID
				local up_con
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollUpFrame)
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
				if x > ScrollThumbFrame.AbsolutePosition.x then
					Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if x < ScrollThumbFrame.AbsolutePosition.x + ScrollThumbFrame.AbsoluteSize.x then break end
						Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
						wait()
					end
				else
					Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if x > ScrollThumbFrame.AbsolutePosition.x then break end
						Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
						wait()
					end
				end
			end)
		else
			ScrollBarFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local current = scrollEventID
				local up_con
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollUpFrame)
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
				if y > ScrollThumbFrame.AbsolutePosition.y then
					Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if y < ScrollThumbFrame.AbsolutePosition.y + ScrollThumbFrame.AbsoluteSize.y then break end
						Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
						wait()
					end
				else
					Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if y > ScrollThumbFrame.AbsolutePosition.y then break end
						Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
						wait()
					end
				end
			end)
		end

		if horizontal then
			ScrollThumbFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local mouse_offset = x - ScrollThumbFrame.AbsolutePosition.x
				local drag_con
				local up_con
				drag_con = MouseDrag.MouseMoved:connect(function(x,y)
					local bar_abs_pos = ScrollBarFrame.AbsolutePosition.x
					local bar_drag = ScrollBarFrame.AbsoluteSize.x - ScrollThumbFrame.AbsoluteSize.x
					local bar_abs_one = bar_abs_pos + bar_drag
					x = x - mouse_offset
					x = x < bar_abs_pos and bar_abs_pos or x > bar_abs_one and bar_abs_one or x
					x = x - bar_abs_pos
					Class:SetScrollPercent(x/(bar_drag))
				end)
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollThumbFrame)
					drag_con:disconnect(); drag_con = nil
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
			end)
		else
			ScrollThumbFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local mouse_offset = y - ScrollThumbFrame.AbsolutePosition.y
				local drag_con
				local up_con
				drag_con = MouseDrag.MouseMoved:connect(function(x,y)
					local bar_abs_pos = ScrollBarFrame.AbsolutePosition.y
					local bar_drag = ScrollBarFrame.AbsoluteSize.y - ScrollThumbFrame.AbsoluteSize.y
					local bar_abs_one = bar_abs_pos + bar_drag
					y = y - mouse_offset
					y = y < bar_abs_pos and bar_abs_pos or y > bar_abs_one and bar_abs_one or y
					y = y - bar_abs_pos
					Class:SetScrollPercent(y/(bar_drag))
				end)
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollThumbFrame)
					drag_con:disconnect(); drag_con = nil
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
			end)
		end

		function Class:Destroy()
			ScrollFrame:Destroy()
			MouseDrag:Destroy()
			for k in pairs(Class) do
				Class[k] = nil
			end
			setmetatable(Class,nil)
		end

		Update()

		return Class
	end
end

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
---- Explorer panel

Create(explorerPanel,{
	BackgroundColor3 = GuiColor.Field;
	BorderColor3 = GuiColor.Border;
	Active = true;
})

local SettingsRemote = explorerPanel.Parent:WaitForChild("SettingsPanel"):WaitForChild("GetSetting")
local GetApiRemote = explorerPanel.Parent:WaitForChild("PropertiesFrame"):WaitForChild("GetApi")
local GetAwaitRemote = explorerPanel.Parent:WaitForChild("PropertiesFrame"):WaitForChild("GetAwaiting")
local bindSetAwaiting = explorerPanel.Parent:WaitForChild("PropertiesFrame"):WaitForChild("SetAwaiting")

local SaveInstanceWindow = explorerPanel.Parent:WaitForChild("SaveInstance")
local ConfirmationWindow = explorerPanel.Parent:WaitForChild("Confirmation")
local CautionWindow = explorerPanel.Parent:WaitForChild("Caution")
local TableCautionWindow = explorerPanel.Parent:WaitForChild("TableCaution")

local RemoteWindow = explorerPanel.Parent:WaitForChild("CallRemote")

local ScriptEditor = explorerPanel.Parent:WaitForChild("ScriptEditor")
local ScriptEditorEvent = ScriptEditor:WaitForChild("OpenScript")

local CurrentSaveInstanceWindow
local CurrentRemoteWindow

local lastSelectedNode

local DexStorage
local DexStorageMain
local DexStorageEnabled

if saveinstance then DexStorageEnabled = true end

if DexStorageEnabled then
	DexStorage = Instance.new("Folder")
	DexStorage.Name = "Dex"
	DexStorageMain = Instance.new("Folder",DexStorage)
	DexStorageMain.Name = "DexStorage"
end

local NilStorage
local NilStorageMain
local NilStorageEnabled

if get_nil_instances and IfThisFunctionWasStableEnough then NilStorageEnabled = true end

if NilStorageEnabled then
	NilStorage = Instance.new("Folder")
	NilStorage.Name = "Dex Internal Storage"
	NilStorageMain = Instance.new("Folder",NilStorage)
	NilStorageMain.Name = "Nil Instances"
end

local listFrame = Create('Frame',{
	Name = "List";
	BackgroundTransparency = 1;
	ClipsDescendants = true;
	Position = UDim2.new(0,0,0,HEADER_SIZE);
	Size = UDim2.new(1,-GUI_SIZE,1,-HEADER_SIZE);
	Parent = explorerPanel;
})

local scrollBar = ScrollBar(false)
scrollBar.PageIncrement = 1
Create(scrollBar.GUI,{
	Position = UDim2.new(1,-GUI_SIZE,0,HEADER_SIZE);
	Size = UDim2.new(0,GUI_SIZE,1,-HEADER_SIZE);
	Parent = explorerPanel;
})

local scrollBarH = ScrollBar(true)
scrollBarH.PageIncrement = GUI_SIZE
Create(scrollBarH.GUI,{
	Position = UDim2.new(0,0,1,-GUI_SIZE);
	Size = UDim2.new(1,-GUI_SIZE,0,GUI_SIZE);
	Visible = false;
	Parent = explorerPanel;
})

local headerFrame = Create('Frame',{
	Name = "Header";
	BackgroundColor3 = GuiColor.Background;
	BorderColor3 = GuiColor.Border;
	Position = UDim2.new(0,0,0,0);
	Size = UDim2.new(1,0,0,HEADER_SIZE);
	Parent = explorerPanel;
	Create('TextLabel',{
		Text = "Explorer";
		BackgroundTransparency = 1;
		TextColor3 = GuiColor.Text;
		TextXAlignment = 'Left';
		Font = FONT;
		FontSize = FONT_SIZE;
		Position = UDim2.new(0,4,0,0);
		Size = UDim2.new(1,-4,0.5,0);
	});
})

local explorerFilter = 	Create('TextBox',{
	Text = "Filter Workspace";
	BackgroundTransparency = 0.8;
	TextColor3 = GuiColor.Text;
	TextXAlignment = 'Left';
	Font = FONT;
	FontSize = FONT_SIZE;
	Position = UDim2.new(0,4,0.5,0);
	Size = UDim2.new(1,-8,0.5,-2);
});
explorerFilter.Parent = headerFrame

SetZIndexOnChanged(explorerPanel)

local function CreateColor3(r, g, b) return Color3.new(r/255,g/255,b/255) end

local Styles = {
	Font = Enum.Font.Arial;
	Margin = 5;
	Black = CreateColor3(0,0,0);
	White = CreateColor3(255,255,255);
}

local DropDown = {
	Font = Styles.Font;
	FontSize = Enum.FontSize.Size14;
	TextColor = CreateColor3(0,0,0);
	TextColorOver = Styles.White;
	TextXAlignment = Enum.TextXAlignment.Left;
	Height = 20;
	BackColor = Styles.White;
	BackColorOver = CreateColor3(86,125,188);
	BorderColor = CreateColor3(216,216,216);
	BorderSizePixel = 2;
	ArrowColor = CreateColor3(160,160,160);
	ArrowColorOver = Styles.Black;
}

local Row = {
	Font = Styles.Font;
	FontSize = Enum.FontSize.Size14;
	TextXAlignment = Enum.TextXAlignment.Left;
	TextColor = Styles.Black;
	TextColorOver = Styles.White;
	TextLockedColor = CreateColor3(120,120,120);
	Height = 24;
	BorderColor = CreateColor3(216,216,216);
	BackgroundColor = Styles.White;
	BackgroundColorAlternate = CreateColor3(246,246,246);
	BackgroundColorMouseover = CreateColor3(211,224,244);
	TitleMarginLeft = 15;
}

local currentRightClickMenu
local CurrentInsertObjectWindow
local CurrentFunctionCallerWindow

local RbxApi

function ClassCanCreate(IName)
	local success,err = pcall(function() Instance.new(IName) end)
	if err then
		return false
	else
		return true
	end
end

function GetClasses()
	if RbxApi == nil then return {} end
	local classTable = {}
	for i,v in pairs(RbxApi.Classes) do
		if ClassCanCreate(v.Name) then
			table.insert(classTable,v.Name)
		end
	end
	return classTable
end

local function sortAlphabetic(t, property)
	table.sort(t, 
		function(x,y) return x[property] < y[property]
	end)
end

local function FunctionIsHidden(functionData)
	local tags = functionData["tags"]
	for _,name in pairs(tags) do
		if name == "deprecated"
			or name == "hidden"
			or name == "writeonly" then
			return true
		end
	end
	return false
end

local function GetAllFunctions(className)
	local class = RbxApi.Classes[className]
	local functions = {}
	
	if not class then return functions end
	
	while class do
		if class.Name == "Instance" then break end
		for _,nextFunction in pairs(class.Functions) do
			if not FunctionIsHidden(nextFunction) then
				table.insert(functions, nextFunction)
			end
		end
		class = RbxApi.Classes[class.Superclass]
	end
	
	sortAlphabetic(functions, "Name")

	return functions
end

function GetFunctions()
	if RbxApi == nil then return {} end
	local List = SelectionVar():Get()
	
	if #List == 0 then return end
	
	local MyObject = List[1]
	
	local functionTable = {}
	for i,v in pairs(GetAllFunctions(MyObject.ClassName)) do
		table.insert(functionTable,v)
	end
	return functionTable
end

function CreateInsertObjectMenu(choices, currentChoice, readOnly, onClick)
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local totalSize = explorerPanel.Parent.AbsoluteSize.y
	if #choices == 0 then return end
	
	table.sort(choices, function(a,b) return a < b end)

	local frame = Instance.new("Frame")	
	frame.Name = "InsertObject"
	frame.Size = UDim2.new(0, 200, 1, 0)
	frame.BackgroundTransparency = 1
	frame.Active = true
	
	local menu = nil
	local arrow = nil
	local expanded = false
	local margin = DropDown.BorderSizePixel;
	
	--[[
	local button = Instance.new("TextButton")
	button.Font = Row.Font
	button.FontSize = Row.FontSize
	button.TextXAlignment = Row.TextXAlignment
	button.BackgroundTransparency = 1
	button.TextColor3 = Row.TextColor
	if readOnly then
		button.TextColor3 = Row.TextLockedColor
	end
	button.Text = currentChoice
	button.Size = UDim2.new(1, -2 * Styles.Margin, 1, 0)
	button.Position = UDim2.new(0, Styles.Margin, 0, 0)
	button.Parent = frame
	--]]
	
	local function hideMenu()
		expanded = false
		--showArrow(DropDown.ArrowColor)
		if frame then 
			--frame:Destroy()
			CurrentInsertObjectWindow.Visible = false
		end
	end
	
	local function showMenu()
		expanded = true
		menu = Instance.new("ScrollingFrame")
		menu.Size = UDim2.new(0,200,1,0)
		menu.CanvasSize = UDim2.new(0, 200, 0, #choices * DropDown.Height)
		menu.Position = UDim2.new(0, margin, 0, 0)
		menu.BackgroundTransparency = 0
		menu.BackgroundColor3 = DropDown.BackColor
		menu.BorderColor3 = DropDown.BorderColor
		menu.BorderSizePixel = DropDown.BorderSizePixel
		menu.TopImage = "rbxasset://textures/blackBkg_square.png"
		menu.MidImage = "rbxasset://textures/blackBkg_square.png"
		menu.BottomImage = "rbxasset://textures/blackBkg_square.png"
		menu.Active = true
		menu.ZIndex = 5
		menu.Parent = frame
		
		--local parentFrameHeight = script.Parent.List.Size.Y.Offset
		--local rowHeight = mouse.Y
		--if (rowHeight + menu.Size.Y.Offset) > parentFrameHeight then
		--	menu.Position = UDim2.new(0, margin, 0, -1 * (#choices * DropDown.Height) - margin)
		--end
			
		local function choice(name)
			onClick(name)
			hideMenu()
		end
		
		for i,name in pairs(choices) do
			local option = CreateRightClickMenuItem(name, function()
				choice(name)
			end,1)
			option.Size = UDim2.new(1, 0, 0, 20)
			option.Position = UDim2.new(0, 0, 0, (i - 1) * DropDown.Height)
			option.ZIndex = menu.ZIndex
			option.Parent = menu
		end
	end


	showMenu()

	
	return frame
end

function CreateFunctionCallerMenu(choices, currentChoice, readOnly, onClick)
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local totalSize = explorerPanel.Parent.AbsoluteSize.y
	if #choices == 0 then return end
	
	table.sort(choices, function(a,b) return a.Name < b.Name end)

	local frame = Instance.new("Frame")	
	frame.Name = "InsertObject"
	frame.Size = UDim2.new(0, 200, 1, 0)
	frame.BackgroundTransparency = 1
	frame.Active = true
	
	local menu = nil
	local arrow = nil
	local expanded = false
	local margin = DropDown.BorderSizePixel;
	
	local function hideMenu()
		expanded = false
		--showArrow(DropDown.ArrowColor)
		if frame then 
			--frame:Destroy()
			CurrentInsertObjectWindow.Visible = false
		end
	end
	
	local function showMenu()
		expanded = true
		menu = Instance.new("ScrollingFrame")
		menu.Size = UDim2.new(0,300,1,0)
		menu.CanvasSize = UDim2.new(0, 300, 0, #choices * DropDown.Height)
		menu.Position = UDim2.new(0, margin, 0, 0)
		menu.BackgroundTransparency = 0
		menu.BackgroundColor3 = DropDown.BackColor
		menu.BorderColor3 = DropDown.BorderColor
		menu.BorderSizePixel = DropDown.BorderSizePixel
		menu.TopImage = "rbxasset://textures/blackBkg_square.png"
		menu.MidImage = "rbxasset://textures/blackBkg_square.png"
		menu.BottomImage = "rbxasset://textures/blackBkg_square.png"
		menu.Active = true
		menu.ZIndex = 5
		menu.Parent = frame
		
		--local parentFrameHeight = script.Parent.List.Size.Y.Offset
		--local rowHeight = mouse.Y
		--if (rowHeight + menu.Size.Y.Offset) > parentFrameHeight then
		--	menu.Position = UDim2.new(0, margin, 0, -1 * (#choices * DropDown.Height) - margin)
		--end
		
		local function GetParameters(functionData)
			local paraString = ""
			paraString = paraString.."("
			for i,v in pairs(functionData.Arguments) do
				paraString = paraString..v.Type.." "..v.Name
				if i < #functionData.Arguments then
					paraString = paraString..", "
				end
			end
			paraString = paraString..")"
			return paraString
		end
			
		local function choice(name)
			onClick(name)
			hideMenu()
		end
		
		for i,name in pairs(choices) do
			local option = CreateRightClickMenuItem(name.ReturnType.." "..name.Name..GetParameters(name), function()
				choice(name)
			end,2)
			option.Size = UDim2.new(1, 0, 0, 20)
			option.Position = UDim2.new(0, 0, 0, (i - 1) * DropDown.Height)
			option.ZIndex = menu.ZIndex
			option.Parent = menu
		end
	end


	showMenu()

	
	return frame
end

function CreateInsertObject()
	if not CurrentInsertObjectWindow then return end
	CurrentInsertObjectWindow.Visible = true
	if currentRightClickMenu and CurrentInsertObjectWindow.Visible then
		CurrentInsertObjectWindow.Position = UDim2.new(0,currentRightClickMenu.Position.X.Offset-currentRightClickMenu.Size.X.Offset-2,0,0)
	end
	if CurrentInsertObjectWindow.Visible then
		CurrentInsertObjectWindow.Parent = explorerPanel.Parent
	end
end

function CreateFunctionCaller(oh)
	if CurrentFunctionCallerWindow then
		CurrentFunctionCallerWindow:Destroy()
		CurrentFunctionCallerWindow = nil
	end
	CurrentFunctionCallerWindow = CreateFunctionCallerMenu(
		GetFunctions(),
		"",
		false,
		function(option)
			CurrentFunctionCallerWindow:Destroy()
			CurrentFunctionCallerWindow = nil
			local list = SelectionVar():Get()
			for i,v in pairs(list) do
				pcall(function() print("Function called.", pcall(function() v[option.Name](v) end)) end)
			end
			
			DestroyRightClick()
		end
	)
	if currentRightClickMenu and CurrentFunctionCallerWindow then
		CurrentFunctionCallerWindow.Position = UDim2.new(0,currentRightClickMenu.Position.X.Offset-currentRightClickMenu.Size.X.Offset*1.5-2,0,0)
	end
	if CurrentFunctionCallerWindow then
		CurrentFunctionCallerWindow.Parent = explorerPanel.Parent
	end
end

function CreateRightClickMenuItem(text, onClick, insObj)
	local button = Instance.new("TextButton")
	button.Font = DropDown.Font
	button.FontSize = DropDown.FontSize
	button.TextColor3 = DropDown.TextColor
	button.TextXAlignment = DropDown.TextXAlignment
	button.BackgroundColor3 = DropDown.BackColor
	button.AutoButtonColor = false
	button.BorderSizePixel = 0
	button.Active = true
	button.Text = text
	
	if insObj == 1 then
		local newIcon = Icon(nil,ExplorerIndex[text] or 0)
		newIcon.Position = UDim2.new(0,0,0,2)
		newIcon.Size = UDim2.new(0,16,0,16)
		newIcon.IconMap.ZIndex = 5
		newIcon.Parent = button
		button.Text = "\t\t"..button.Text
	elseif insObj == 2 then
		button.FontSize = Enum.FontSize.Size11
	end
	
	button.MouseEnter:connect(function()
		button.TextColor3 = DropDown.TextColorOver
		button.BackgroundColor3 = DropDown.BackColorOver
		if not insObj and CurrentInsertObjectWindow then
			if CurrentInsertObjectWindow.Visible == false and button.Text == "Insert Object" then
				CreateInsertObject()
			elseif CurrentInsertObjectWindow.Visible and button.Text ~= "Insert Object" then
				CurrentInsertObjectWindow.Visible = false
			end
		end
		if not insObj then
			if CurrentFunctionCallerWindow and button.Text ~= "Call Function" then
				CurrentFunctionCallerWindow:Destroy()
				CurrentFunctionCallerWindow = nil
			elseif button.Text == "Call Function" then
				CreateFunctionCaller()
			end
		end
	end)
	button.MouseLeave:connect(function()
		button.TextColor3 = DropDown.TextColor
		button.BackgroundColor3 = DropDown.BackColor
	end)
	button.MouseButton1Click:connect(function()
		button.TextColor3 = DropDown.TextColor
		button.BackgroundColor3 = DropDown.BackColor
		onClick(text)
	end)	
	return button
end

function CreateRightClickMenu(choices, currentChoice, readOnly, onClick)
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()

	local frame = Instance.new("Frame")	
	frame.Name = "DropDown"
	frame.Size = UDim2.new(0, 200, 1, 0)
	frame.BackgroundTransparency = 1
	frame.Active = true
	
	local menu = nil
	local arrow = nil
	local expanded = false
	local margin = DropDown.BorderSizePixel;
	
	--[[
	local button = Instance.new("TextButton")
	button.Font = Row.Font
	button.FontSize = Row.FontSize
	button.TextXAlignment = Row.TextXAlignment
	button.BackgroundTransparency = 1
	button.TextColor3 = Row.TextColor
	if readOnly then
		button.TextColor3 = Row.TextLockedColor
	end
	button.Text = currentChoice
	button.Size = UDim2.new(1, -2 * Styles.Margin, 1, 0)
	button.Position = UDim2.new(0, Styles.Margin, 0, 0)
	button.Parent = frame
	--]]
	
	local function hideMenu()
		expanded = false
		--showArrow(DropDown.ArrowColor)
		if frame then 
			frame:Destroy()
			DestroyRightClick()
		end
	end
	
	local function showMenu()
		expanded = true
		menu = Instance.new("Frame")
		menu.Size = UDim2.new(0, 200, 0, #choices * DropDown.Height)
		menu.Position = UDim2.new(0, margin, 0, 5)
		menu.BackgroundTransparency = 0
		menu.BackgroundColor3 = DropDown.BackColor
		menu.BorderColor3 = DropDown.BorderColor
		menu.BorderSizePixel = DropDown.BorderSizePixel
		menu.Active = true
		menu.ZIndex = 5
		menu.Parent = frame
		
		--local parentFrameHeight = script.Parent.List.Size.Y.Offset
		--local rowHeight = mouse.Y
		--if (rowHeight + menu.Size.Y.Offset) > parentFrameHeight then
		--	menu.Position = UDim2.new(0, margin, 0, -1 * (#choices * DropDown.Height) - margin)
		--end
			
		local function choice(name)
			onClick(name)
			hideMenu()
		end
		
		for i,name in pairs(choices) do
			local option = CreateRightClickMenuItem(name, function()
				choice(name)
			end)
			option.Size = UDim2.new(1, 0, 0, 20)
			option.Position = UDim2.new(0, 0, 0, (i - 1) * DropDown.Height)
			option.ZIndex = menu.ZIndex
			option.Parent = menu
		end
	end


	showMenu()

	
	return frame
end

function checkMouseInGui(gui)
	if gui == nil then return false end
	local plrMouse = game:GetService("Players").LocalPlayer:GetMouse()
	local guiPosition = gui.AbsolutePosition
	local guiSize = gui.AbsoluteSize	
	
	if plrMouse.X >= guiPosition.x and plrMouse.X <= guiPosition.x + guiSize.x and plrMouse.Y >= guiPosition.y and plrMouse.Y <= guiPosition.y + guiSize.y then
		return true
	else
		return false
	end
end

local clipboard = {}
local function delete(o)
	o.Parent = nil
end

local getTextWidth do
	local text = Create('TextLabel',{
		Name = "TextWidth";
		TextXAlignment = 'Left';
		TextYAlignment = 'Center';
		Font = FONT;
		FontSize = FONT_SIZE;
		Text = "";
		Position = UDim2.new(0,0,0,0);
		Size = UDim2.new(1,0,1,0);
		Visible = false;
		Parent = explorerPanel;
	})
	function getTextWidth(s)
		text.Text = s
		return text.TextBounds.x
	end
end

local nameScanned = false
-- Holds the game tree converted to a list.
local TreeList = {}
-- Matches objects to their tree node representation.
local NodeLookup = {}

local nodeWidth = 0

local QuickButtons = {}

function filteringWorkspace()
	if explorerFilter.Text ~= "" and explorerFilter.Text ~= "Filter Workspace" then
		return true
	end
	return false
end

function lookForAName(obj,name)
	for i,v in pairs(obj:GetChildren()) do
		if string.find(string.lower(v.Name),string.lower(name)) then nameScanned = true end
		lookForAName(v,name)
	end
end

function scanName(obj)
	nameScanned = false
	if string.find(string.lower(obj.Name),string.lower(explorerFilter.Text)) then
		nameScanned = true
	else
		lookForAName(obj,explorerFilter.Text)
	end
	return nameScanned
end

function updateActions()
	for i,v in pairs(QuickButtons) do
		if v.Cond() then
			v.Toggle(true)
		else
			v.Toggle(false)
		end
	end
end

local updateList,rawUpdateList,updateScroll,rawUpdateSize do
	local function r(t)
		for i = 1,#t do
			if not filteringWorkspace() or scanName(t[i].Object) then
				TreeList[#TreeList+1] = t[i]

				local w = (t[i].Depth)*(2+ENTRY_PADDING+GUI_SIZE) + 2 + ENTRY_SIZE + 4 + getTextWidth(t[i].Object.Name) + 4
				if w > nodeWidth then
					nodeWidth = w
				end
				if t[i].Expanded or filteringWorkspace() then
					r(t[i])
				end
			end
		end
	end

	function rawUpdateSize()
		scrollBarH.TotalSpace = nodeWidth
		scrollBarH.VisibleSpace = listFrame.AbsoluteSize.x
		scrollBarH:Update()
		local visible = scrollBarH:CanScrollDown() or scrollBarH:CanScrollUp()
		scrollBarH.GUI.Visible = visible

		listFrame.Size = UDim2.new(1,-GUI_SIZE,1,-GUI_SIZE*(visible and 1 or 0) - HEADER_SIZE)

		scrollBar.VisibleSpace = math.ceil(listFrame.AbsoluteSize.y/ENTRY_BOUND)
		scrollBar.GUI.Size = UDim2.new(0,GUI_SIZE,1,-GUI_SIZE*(visible and 1 or 0) - HEADER_SIZE)
		
		scrollBar.TotalSpace = #TreeList+1
		scrollBar:Update()
	end

	function rawUpdateList()
		-- Clear then repopulate the entire list. It appears to be fast enough.
		TreeList = {}
		nodeWidth = 0
		r(NodeLookup[workspace.Parent])
		r(NodeLookup[DexOutput])
		if DexStorageEnabled then
			r(NodeLookup[DexStorage])
		end
		if NilStorageEnabled then
			r(NodeLookup[NilStorage])
		end
		rawUpdateSize()
		updateActions()
	end

	-- Adding or removing large models will cause many updates to occur. We
	-- can reduce the number of updates by creating a delay, then dropping any
	-- updates that occur during the delay.
	local updatingList = false
	function updateList()
		if updatingList then return end
		updatingList = true
		wait(0.25)
		updatingList = false
		rawUpdateList()
	end

	local updatingScroll = false
	function updateScroll()
		if updatingScroll then return end
		updatingScroll = true
		wait(0.25)
		updatingScroll = false
		scrollBar:Update()
	end
end

local Selection do
	local bindGetSelection = explorerPanel:FindFirstChild("GetSelection")
	if not bindGetSelection then
		bindGetSelection = Create('BindableFunction',{Name = "GetSelection"})
		bindGetSelection.Parent = explorerPanel
	end

	local bindSetSelection = explorerPanel:FindFirstChild("SetSelection")
	if not bindSetSelection then
		bindSetSelection = Create('BindableFunction',{Name = "SetSelection"})
		bindSetSelection.Parent = explorerPanel
	end

	local bindSelectionChanged = explorerPanel:FindFirstChild("SelectionChanged")
	if not bindSelectionChanged then
		bindSelectionChanged = Create('BindableEvent',{Name = "SelectionChanged"})
		bindSelectionChanged.Parent = explorerPanel
	end

	local SelectionList = {}
	local SelectionSet = {}
	local Updates = true
	Selection = {
		Selected = SelectionSet;
		List = SelectionList;
	}

	local function addObject(object)
		-- list update
		local lupdate = false
		-- scroll update
		local supdate = false

		if not SelectionSet[object] then
			local node = NodeLookup[object]
			if node then
				table.insert(SelectionList,object)
				SelectionSet[object] = true
				node.Selected = true

				-- expand all ancestors so that selected node becomes visible
				node = node.Parent
				while node do
					if not node.Expanded then
						node.Expanded = true
						lupdate = true
					end
					node = node.Parent
				end
				supdate = true
			end
		end
		return lupdate,supdate
	end

	function Selection:Set(objects)
		local lupdate = false
		local supdate = false

		if #SelectionList > 0 then
			for i = 1,#SelectionList do
				local object = SelectionList[i]
				local node = NodeLookup[object]
				if node then
					node.Selected = false
					SelectionSet[object] = nil
				end
			end

			SelectionList = {}
			Selection.List = SelectionList
			supdate = true
		end

		for i = 1,#objects do
			local l,s = addObject(objects[i])
			lupdate = l or lupdate
			supdate = s or supdate
		end

		if lupdate then
			rawUpdateList()
			supdate = true
		elseif supdate then
			scrollBar:Update()
		end

		if supdate then
			bindSelectionChanged:Fire()
			updateActions()
		end
	end

	function Selection:Add(object)
		local l,s = addObject(object)
		if l then
			rawUpdateList()
			if Updates then
				bindSelectionChanged:Fire()
				updateActions()
			end
		elseif s then
			scrollBar:Update()
			if Updates then
				bindSelectionChanged:Fire()
				updateActions()
			end
		end
	end
	
	function Selection:StopUpdates()
		Updates = false
	end
	
	function Selection:ResumeUpdates()
		Updates = true
		bindSelectionChanged:Fire()
		updateActions()
	end

	function Selection:Remove(object,noupdate)
		if SelectionSet[object] then
			local node = NodeLookup[object]
			if node then
				node.Selected = false
				SelectionSet[object] = nil
				for i = 1,#SelectionList do
					if SelectionList[i] == object then
						table.remove(SelectionList,i)
						break
					end
				end

				if not noupdate then
					scrollBar:Update()
				end
				bindSelectionChanged:Fire()
				updateActions()
			end
		end
	end

	function Selection:Get()
		local list = {}
		for i = 1,#SelectionList do
			list[i] = SelectionList[i]
		end
		return list
	end

	bindSetSelection.OnInvoke = function(...)
		Selection:Set(...)
	end

	bindGetSelection.OnInvoke = function()
		return Selection:Get()
	end
end

function CreateCaution(title,msg)
	local newCaution = CautionWindow
	newCaution.Visible = true
	newCaution.Title.Text = title
	newCaution.MainWindow.Desc.Text = msg
	newCaution.MainWindow.Ok.MouseButton1Up:connect(function()
		newCaution.Visible = false
	end)
end

function CreateTableCaution(title,msg)
	if type(msg) ~= "table" then return CreateCaution(title,tostring(msg)) end
	local newCaution = TableCautionWindow:Clone()
	newCaution.Title.Text = title
	
	local TableList = newCaution.MainWindow.TableResults
	local TableTemplate = newCaution.MainWindow.TableTemplate
	
	for i,v in pairs(msg) do
		local newResult = TableTemplate:Clone()
		newResult.Type.Text = type(v)
		newResult.Value.Text = tostring(v)
		newResult.Position = UDim2.new(0,0,0,#TableList:GetChildren() * 20)
		newResult.Parent = TableList
		TableList.CanvasSize = UDim2.new(0,0,0,#TableList:GetChildren() * 20)
		newResult.Visible = true
	end
	newCaution.Parent = explorerPanel.Parent
	newCaution.Visible = true
	newCaution.MainWindow.Ok.MouseButton1Up:connect(function()
		newCaution:Destroy()
	end)
end

local function Split(str, delimiter)
	local start = 1
	local t = {}
	while true do
		local pos = string.find (str, delimiter, start, true)
		if not pos then
			break
		end
		table.insert (t, string.sub (str, start, pos - 1))
		start = pos + string.len (delimiter)
	end
	table.insert (t, string.sub (str, start))
	return t
end

local function ToValue(value,type)
	if type == "Vector2" then
		local list = Split(value,",")
		if #list < 2 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		return Vector2.new(x,y)
	elseif type == "Vector3" then
		local list = Split(value,",")
		if #list < 3 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		local z = tonumber(list[3]) or 0
		return Vector3.new(x,y,z)
	elseif type == "Color3" then
		local list = Split(value,",")
		if #list < 3 then return nil end
		local r = tonumber(list[1]) or 0
		local g = tonumber(list[2]) or 0
		local b = tonumber(list[3]) or 0
		return Color3.new(r/255,g/255, b/255)
	elseif type == "UDim2" then
		local list = Split(string.gsub(string.gsub(value, "{", ""),"}",""),",")
		if #list < 4 then return nil end
		local xScale = tonumber(list[1]) or 0
		local xOffset = tonumber(list[2]) or 0
		local yScale = tonumber(list[3]) or 0
		local yOffset = tonumber(list[4]) or 0
		return UDim2.new(xScale, xOffset, yScale, yOffset)
	elseif type == "Number" then
		return tonumber(value)
	elseif type == "String" then
		return value
	elseif type == "NumberRange" then
		local list = Split(value,",")
		if #list == 1 then
			if tonumber(list[1]) == nil then return nil end
			local newVal = tonumber(list[1]) or 0
			return NumberRange.new(newVal)
		end
		if #list < 2 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		return NumberRange.new(x,y)
	elseif type == "Script" then
		local success,err = ypcall(function()
		_G.D_E_X_DONOTUSETHISPLEASE = nil
		loadstring(
			"_G.D_E_X_DONOTUSETHISPLEASE = "..value
		)()
		return _G.D_E_X_DONOTUSETHISPLEASE
		end)
		if err then
			return nil
		end
	else
		return nil
	end
end

local function ToPropValue(value,type)
	if type == "Vector2" then
		local list = Split(value,",")
		if #list < 2 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		return Vector2.new(x,y)
	elseif type == "Vector3" then
		local list = Split(value,",")
		if #list < 3 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		local z = tonumber(list[3]) or 0
		return Vector3.new(x,y,z)
	elseif type == "Color3" then
		local list = Split(value,",")
		if #list < 3 then return nil end
		local r = tonumber(list[1]) or 0
		local g = tonumber(list[2]) or 0
		local b = tonumber(list[3]) or 0
		return Color3.new(r/255,g/255, b/255)
	elseif type == "UDim2" then
		local list = Split(string.gsub(string.gsub(value, "{", ""),"}",""),",")
		if #list < 4 then return nil end
		local xScale = tonumber(list[1]) or 0
		local xOffset = tonumber(list[2]) or 0
		local yScale = tonumber(list[3]) or 0
		local yOffset = tonumber(list[4]) or 0
		return UDim2.new(xScale, xOffset, yScale, yOffset)
	elseif type == "Content" then
		return value
	elseif type == "float" or type == "int" or type == "double" then
		return tonumber(value)
	elseif type == "string" then
		return value
	elseif type == "NumberRange" then
		local list = Split(value,",")
		if #list == 1 then
			if tonumber(list[1]) == nil then return nil end
			local newVal = tonumber(list[1]) or 0
			return NumberRange.new(newVal)
		end
		if #list < 2 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		return NumberRange.new(x,y)
	elseif string.sub(value,1,4) == "Enum" then
		local getEnum = value
		while true do
			local x,y = string.find(getEnum,".")
			if y then
				getEnum = string.sub(getEnum,y+1)
			else
				break
			end
		end
		print(getEnum)
		return getEnum
	else
		return nil
	end
end

function PromptRemoteCaller(inst)
	if CurrentRemoteWindow then
		CurrentRemoteWindow:Destroy()
		CurrentRemoteWindow = nil
	end
	CurrentRemoteWindow = RemoteWindow:Clone()
	CurrentRemoteWindow.Parent = explorerPanel.Parent
	CurrentRemoteWindow.Visible = true
	
	local displayValues = false
	
	local ArgumentList = CurrentRemoteWindow.MainWindow.Arguments
	local ArgumentTemplate = CurrentRemoteWindow.MainWindow.ArgumentTemplate
	
	if inst:IsA("RemoteEvent") then
		CurrentRemoteWindow.Title.Text = "Fire Event"
		CurrentRemoteWindow.MainWindow.Ok.Text = "Fire"
		CurrentRemoteWindow.MainWindow.DisplayReturned.Visible = false
		CurrentRemoteWindow.MainWindow.Desc2.Visible = false
	end
	
	local newArgument = ArgumentTemplate:Clone()
	newArgument.Parent = ArgumentList
	newArgument.Visible = true
	newArgument.Type.MouseButton1Down:connect(function()
		createDDown(newArgument.Type,function(choice)
			newArgument.Type.Text = choice
		end,"Script","Number","String","Color3","Vector3","Vector2","UDim2","NumberRange")
	end)
	
	CurrentRemoteWindow.MainWindow.Ok.MouseButton1Up:connect(function()
		if CurrentRemoteWindow and inst.Parent ~= nil then
			local MyArguments = {}
			for i,v in pairs(ArgumentList:GetChildren()) do
				table.insert(MyArguments,ToValue(v.Value.Text,v.Type.Text))
			end
			if inst:IsA("RemoteFunction") then
				if displayValues then
					spawn(function()
						local myResults = inst:InvokeServer(unpack(MyArguments))
						if myResults then
							CreateTableCaution("Remote Caller",myResults)
						else
							CreateCaution("Remote Caller","This remote did not return anything.")
						end
					end)
				else
					spawn(function()
						inst:InvokeServer(unpack(MyArguments))
					end)
				end
			else
				inst:FireServer(unpack(MyArguments))
			end
			CurrentRemoteWindow:Destroy()
			CurrentRemoteWindow = nil
		end
	end)
	
	CurrentRemoteWindow.MainWindow.Add.MouseButton1Up:connect(function()
		if CurrentRemoteWindow then
			local newArgument = ArgumentTemplate:Clone()
			newArgument.Position = UDim2.new(0,0,0,#ArgumentList:GetChildren() * 20)
			newArgument.Parent = ArgumentList
			ArgumentList.CanvasSize = UDim2.new(0,0,0,#ArgumentList:GetChildren() * 20)
			newArgument.Visible = true
			newArgument.Type.MouseButton1Down:connect(function()
				createDDown(newArgument.Type,function(choice)
					newArgument.Type.Text = choice
				end,"Script","Number","String","Color3","Vector3","Vector2","UDim2","NumberRange")
			end)
		end
	end)
	
	CurrentRemoteWindow.MainWindow.Subtract.MouseButton1Up:connect(function()
		if CurrentRemoteWindow then
			if #ArgumentList:GetChildren() > 1 then
				ArgumentList:GetChildren()[#ArgumentList:GetChildren()]:Destroy()
				ArgumentList.CanvasSize = UDim2.new(0,0,0,#ArgumentList:GetChildren() * 20)
			end
		end
	end)
	
	CurrentRemoteWindow.MainWindow.Cancel.MouseButton1Up:connect(function()
		if CurrentRemoteWindow then
			CurrentRemoteWindow:Destroy()
			CurrentRemoteWindow = nil
		end
	end)
	
	CurrentRemoteWindow.MainWindow.DisplayReturned.MouseButton1Up:connect(function()
		if displayValues then
			displayValues = false
			CurrentRemoteWindow.MainWindow.DisplayReturned.enabled.Visible = false
		else
			displayValues = true
			CurrentRemoteWindow.MainWindow.DisplayReturned.enabled.Visible = true
		end
	end)
end

function PromptSaveInstance(inst)
	if not SaveInstance and not _G.SaveInstance then CreateCaution("SaveInstance Missing","You do not have the SaveInstance function installed. Please go to RaspberryPi's thread to retrieve it.") return end
	if CurrentSaveInstanceWindow then
		CurrentSaveInstanceWindow:Destroy()
		CurrentSaveInstanceWindow = nil
		if explorerPanel.Parent:FindFirstChild("SaveInstanceOverwriteCaution") then
			explorerPanel.Parent.SaveInstanceOverwriteCaution:Destroy()
		end
	end
	CurrentSaveInstanceWindow = SaveInstanceWindow:Clone()
	CurrentSaveInstanceWindow.Parent = explorerPanel.Parent
	CurrentSaveInstanceWindow.Visible = true
	
	local filename = CurrentSaveInstanceWindow.MainWindow.FileName
	local saveObjects = true
	local overwriteCaution = false
	
	CurrentSaveInstanceWindow.MainWindow.Save.MouseButton1Up:connect(function()
		if readfile and getelysianpath then
			if readfile(getelysianpath()..filename.Text..".rbxmx") then
				if not overwriteCaution then
					overwriteCaution = true
					local newCaution = ConfirmationWindow:Clone()
					newCaution.Name = "SaveInstanceOverwriteCaution"
					newCaution.MainWindow.Desc.Text = "The file, "..filename.Text..".rbxmx, already exists. Overwrite?"
					newCaution.Parent = explorerPanel.Parent
					newCaution.Visible = true
					newCaution.MainWindow.Yes.MouseButton1Up:connect(function()
						ypcall(function()
							SaveInstance(inst,filename.Text..".rbxmx",not saveObjects)
						end)
						overwriteCaution = false
						newCaution:Destroy()
						if CurrentSaveInstanceWindow then
							CurrentSaveInstanceWindow:Destroy()
							CurrentSaveInstanceWindow = nil
						end
					end)
					newCaution.MainWindow.No.MouseButton1Up:connect(function()
						overwriteCaution = false
						newCaution:Destroy()
					end)
				end
			else
				ypcall(function()
					SaveInstance(inst,filename.Text..".rbxmx",not saveObjects)
				end)
				if CurrentSaveInstanceWindow then
					CurrentSaveInstanceWindow:Destroy()
					CurrentSaveInstanceWindow = nil
					if explorerPanel.Parent:FindFirstChild("SaveInstanceOverwriteCaution") then
						explorerPanel.Parent.SaveInstanceOverwriteCaution:Destroy()
					end
				end
			end
		else
			ypcall(function()
				if SaveInstance then
					SaveInstance(inst,filename.Text..".rbxmx",not saveObjects)
				else
					_G.SaveInstance(inst,filename.Text,not saveObjects)
				end
			end)
			if CurrentSaveInstanceWindow then
				CurrentSaveInstanceWindow:Destroy()
				CurrentSaveInstanceWindow = nil
				if explorerPanel.Parent:FindFirstChild("SaveInstanceOverwriteCaution") then
					explorerPanel.Parent.SaveInstanceOverwriteCaution:Destroy()
				end
			end
		end
	end)
	CurrentSaveInstanceWindow.MainWindow.Cancel.MouseButton1Up:connect(function()
		if CurrentSaveInstanceWindow then
			CurrentSaveInstanceWindow:Destroy()
			CurrentSaveInstanceWindow = nil
			if explorerPanel.Parent:FindFirstChild("SaveInstanceOverwriteCaution") then
				explorerPanel.Parent.SaveInstanceOverwriteCaution:Destroy()
			end
		end
	end)
	CurrentSaveInstanceWindow.MainWindow.SaveObjects.MouseButton1Up:connect(function()
		if saveObjects then
			saveObjects = false
			CurrentSaveInstanceWindow.MainWindow.SaveObjects.enabled.Visible = false
		else
			saveObjects = true
			CurrentSaveInstanceWindow.MainWindow.SaveObjects.enabled.Visible = true
		end
	end)
end

function DestroyRightClick()
	if currentRightClickMenu then
		currentRightClickMenu:Destroy()
		currentRightClickMenu = nil
	end
	if CurrentInsertObjectWindow and CurrentInsertObjectWindow.Visible then
		CurrentInsertObjectWindow.Visible = false
	end
end

function rightClickMenu(sObj)
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	
	currentRightClickMenu = CreateRightClickMenu(
		{"Cut","Copy","Paste Into","Duplicate","Delete","Group","Ungroup","Select Children","Teleport To","Insert Part","Insert Object","View Script","Save Instance","Call Function","Call Remote"},
		"",
		false,
		function(option)
			if option == "Cut" then
				if not Option.Modifiable then return end
				clipboard = {}
				local list = Selection.List
				local cut = {}
				for i = 1,#list do
					local obj = list[i]:Clone()
					if obj then
						table.insert(clipboard,obj)
						table.insert(cut,list[i])
					end
				end
				for i = 1,#cut do
					pcall(delete,cut[i])
				end
				updateActions()
			elseif option == "Copy" then
				if not Option.Modifiable then return end
				clipboard = {}
				local list = Selection.List
				for i = 1,#list do
					table.insert(clipboard,list[i]:Clone())
				end
				updateActions()
			elseif option == "Paste Into" then
				if not Option.Modifiable then return end
				local parent = Selection.List[1] or workspace
				for i = 1,#clipboard do
					clipboard[i]:Clone().Parent = parent
				end
			elseif option == "Duplicate" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				for i = 1,#list do
					list[i]:Clone().Parent = Selection.List[1].Parent or workspace
				end
			elseif option == "Delete" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				for i = 1,#list do
					pcall(delete,list[i])
				end
				Selection:Set({})
			elseif option == "Group" then
				if not Option.Modifiable then return end
				local newModel = Instance.new("Model")
				local list = Selection:Get()
				newModel.Parent = Selection.List[1].Parent or workspace
				for i = 1,#list do
					list[i].Parent = newModel
				end
				Selection:Set({})
			elseif option == "Ungroup" then
				if not Option.Modifiable then return end
				local ungrouped = {}
				local list = Selection:Get()
				for i = 1,#list do
					if list[i]:IsA("Model") then
						for i2,v2 in pairs(list[i]:GetChildren()) do
							v2.Parent = list[i].Parent or workspace
							table.insert(ungrouped,v2)
						end		
						pcall(delete,list[i])			
					end
				end
				Selection:Set({})
				if SettingsRemote:Invoke("SelectUngrouped") then
					for i,v in pairs(ungrouped) do
						Selection:Add(v)
					end
				end
			elseif option == "Select Children" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				Selection:Set({})
				Selection:StopUpdates()
				for i = 1,#list do
					for i2,v2 in pairs(list[i]:GetChildren()) do
						Selection:Add(v2)
					end
				end
				Selection:ResumeUpdates()
			elseif option == "Teleport To" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				for i = 1,#list do
					if list[i]:IsA("BasePart") then
						pcall(function()
							game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = list[i].CFrame
						end)
						break
					end
				end
			elseif option == "Insert Part" then
				if not Option.Modifiable then return end
				local insertedParts = {}
				local list = Selection:Get()
				for i = 1,#list do
					pcall(function()
						local newPart = Instance.new("Part")
						newPart.Parent = list[i]
						newPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.Head.Position) + Vector3.new(0,3,0)
						table.insert(insertedParts,newPart)
					end)
				end
			elseif option == "Save Instance" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				if #list == 1 then
					list[1].Archivable = true
					ypcall(function()PromptSaveInstance(list[1]:Clone())end)
				elseif #list > 1 then
					local newModel = Instance.new("Model")
					newModel.Name = "SavedInstances"
					for i = 1,#list do
						ypcall(function()
							list[i].Archivable = true
							list[i]:Clone().Parent = newModel
						end)
					end
					PromptSaveInstance(newModel)
				end
			elseif option == "Call Remote" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				for i = 1,#list do
					if list[i]:IsA("RemoteFunction") or list[i]:IsA("RemoteEvent") then
						PromptRemoteCaller(list[i])
						break
					end
				end
			elseif option == "View Script" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				for i = 1,#list do
					if list[i]:IsA("LocalScript") or list[i]:IsA("ModuleScript") then
						ScriptEditorEvent:Fire(list[i])
					end
				end
			end
	end)
	currentRightClickMenu.Parent = explorerPanel.Parent
	currentRightClickMenu.Position = UDim2.new(0,mouse.X,0,mouse.Y)
	if currentRightClickMenu.AbsolutePosition.X + currentRightClickMenu.AbsoluteSize.X > explorerPanel.AbsolutePosition.X + explorerPanel.AbsoluteSize.X then
		currentRightClickMenu.Position = UDim2.new(0, explorerPanel.AbsolutePosition.X + explorerPanel.AbsoluteSize.X - currentRightClickMenu.AbsoluteSize.X, 0, mouse.Y)
	end
end

local function cancelReparentDrag()end
local function cancelSelectDrag()end
do
	local listEntries = {}
	local nameConnLookup = {}

	local mouseDrag = Create('ImageButton',{
		Name = "MouseDrag";
		Position = UDim2.new(-0.25,0,-0.25,0);
		Size = UDim2.new(1.5,0,1.5,0);
		Transparency = 1;
		AutoButtonColor = false;
		Active = true;
		ZIndex = 10;
	})
	local function dragSelect(last,add,button)
		local connDrag
		local conUp

		conDrag = mouseDrag.MouseMoved:connect(function(x,y)
			local pos = Vector2.new(x,y) - listFrame.AbsolutePosition
			local size = listFrame.AbsoluteSize
			if pos.x < 0 or pos.x > size.x or pos.y < 0 or pos.y > size.y then return end

			local i = math.ceil(pos.y/ENTRY_BOUND) + scrollBar.ScrollIndex
			-- Mouse may have made a large step, so interpolate between the
			-- last index and the current.
			for n = i<last and i or last, i>last and i or last do
				local node = TreeList[n]
				if node then
					if add then
						Selection:Add(node.Object)
					else
						Selection:Remove(node.Object)
					end
				end
			end
			last = i
		end)

		function cancelSelectDrag()
			mouseDrag.Parent = nil
			conDrag:disconnect()
			conUp:disconnect()
			function cancelSelectDrag()end
		end

		conUp = mouseDrag[button]:connect(cancelSelectDrag)

		mouseDrag.Parent = GetScreen(listFrame)
	end

	local function dragReparent(object,dragGhost,clickPos,ghostOffset)
		local connDrag
		local conUp
		local conUp2

		local parentIndex = nil
		local dragged = false

		local parentHighlight = Create('Frame',{
			Transparency = 1;
			Visible = false;
			Create('Frame',{
				BorderSizePixel = 0;
				BackgroundColor3 = Color3.new(0,0,0);
				BackgroundTransparency = 0.1;
				Position = UDim2.new(0,0,0,0);
				Size = UDim2.new(1,0,0,1);
			});
			Create('Frame',{
				BorderSizePixel = 0;
				BackgroundColor3 = Color3.new(0,0,0);
				BackgroundTransparency = 0.1;
				Position = UDim2.new(1,0,0,0);
				Size = UDim2.new(0,1,1,0);
			});
			Create('Frame',{
				BorderSizePixel = 0;
				BackgroundColor3 = Color3.new(0,0,0);
				BackgroundTransparency = 0.1;
				Position = UDim2.new(0,0,1,0);
				Size = UDim2.new(1,0,0,1);
			});
			Create('Frame',{
				BorderSizePixel = 0;
				BackgroundColor3 = Color3.new(0,0,0);
				BackgroundTransparency = 0.1;
				Position = UDim2.new(0,0,0,0);
				Size = UDim2.new(0,1,1,0);
			});
		})
		SetZIndex(parentHighlight,9)

		conDrag = mouseDrag.MouseMoved:connect(function(x,y)
			local dragPos = Vector2.new(x,y)
			if dragged then
				local pos = dragPos - listFrame.AbsolutePosition
				local size = listFrame.AbsoluteSize

				parentIndex = nil
				parentHighlight.Visible = false
				if pos.x >= 0 and pos.x <= size.x and pos.y >= 0 and pos.y <= size.y + ENTRY_SIZE*2 then
					local i = math.ceil(pos.y/ENTRY_BOUND-2)
					local node = TreeList[i + scrollBar.ScrollIndex]
					if node and node.Object ~= object and not object:IsAncestorOf(node.Object) then
						parentIndex = i
						local entry = listEntries[i]
						if entry then
							parentHighlight.Visible = true
							parentHighlight.Position = UDim2.new(0,1,0,entry.AbsolutePosition.y-listFrame.AbsolutePosition.y)
							parentHighlight.Size = UDim2.new(0,size.x-4,0,entry.AbsoluteSize.y)
						end
					end
				end

				dragGhost.Position = UDim2.new(0,dragPos.x+ghostOffset.x,0,dragPos.y+ghostOffset.y)
			elseif (clickPos-dragPos).magnitude > 8 then
				dragged = true
				SetZIndex(dragGhost,9)
				dragGhost.IndentFrame.Transparency = 0.25
				dragGhost.IndentFrame.EntryText.TextColor3 = GuiColor.TextSelected
				dragGhost.Position = UDim2.new(0,dragPos.x+ghostOffset.x,0,dragPos.y+ghostOffset.y)
				dragGhost.Parent = GetScreen(listFrame)
				parentHighlight.Parent = listFrame
			end
		end)

		function cancelReparentDrag()
			mouseDrag.Parent = nil
			conDrag:disconnect()
			conUp:disconnect()
			conUp2:disconnect()
			dragGhost:Destroy()
			parentHighlight:Destroy()
			function cancelReparentDrag()end
		end

		local wasSelected = Selection.Selected[object]
		if not wasSelected and Option.Selectable then
			Selection:Set({object})
		end

		conUp = mouseDrag.MouseButton1Up:connect(function()
			cancelReparentDrag()
			if dragged then
				if parentIndex then
					local parentNode = TreeList[parentIndex + scrollBar.ScrollIndex]
					if parentNode then
						parentNode.Expanded = true

						local parentObj = parentNode.Object
						local function parent(a,b)
							a.Parent = b
						end
						if Option.Selectable then
							local list = Selection.List
							for i = 1,#list do
								pcall(parent,list[i],parentObj)
							end
						else
							pcall(parent,object,parentObj)
						end
					end
				end
			else
				-- do selection click
				if wasSelected and Option.Selectable then
					Selection:Set({})
				end
			end
		end)
		conUp2 = mouseDrag.MouseButton2Down:connect(function()
			cancelReparentDrag()
		end)

		mouseDrag.Parent = GetScreen(listFrame)
	end

	local entryTemplate = Create('ImageButton',{
		Name = "Entry";
		Transparency = 1;
		AutoButtonColor = false;
		Position = UDim2.new(0,0,0,0);
		Size = UDim2.new(1,0,0,ENTRY_SIZE);
		Create('Frame',{
			Name = "IndentFrame";
			BackgroundTransparency = 1;
			BackgroundColor3 = GuiColor.Selected;
			BorderColor3 = GuiColor.BorderSelected;
			Position = UDim2.new(0,0,0,0);
			Size = UDim2.new(1,0,1,0);
			Create(Icon('ImageButton',0),{
				Name = "Expand";
				AutoButtonColor = false;
				Position = UDim2.new(0,-GUI_SIZE,0.5,-GUI_SIZE/2);
				Size = UDim2.new(0,GUI_SIZE,0,GUI_SIZE);
			});
			Create(Icon(nil,0),{
				Name = "ExplorerIcon";
				Position = UDim2.new(0,2+ENTRY_PADDING,0.5,-GUI_SIZE/2);
				Size = UDim2.new(0,GUI_SIZE,0,GUI_SIZE);
			});
			Create('TextLabel',{
				Name = "EntryText";
				BackgroundTransparency = 1;
				TextColor3 = GuiColor.Text;
				TextXAlignment = 'Left';
				TextYAlignment = 'Center';
				Font = FONT;
				FontSize = FONT_SIZE;
				Text = "";
				Position = UDim2.new(0,2+ENTRY_SIZE+4,0,0);
				Size = UDim2.new(1,-2,1,0);
			});
		});
	})

	function scrollBar.UpdateCallback(self)
		for i = 1,self.VisibleSpace do
			local node = TreeList[i + self.ScrollIndex]
			if node then
				local entry = listEntries[i]
				if not entry then
					entry = Create(entryTemplate:Clone(),{
						Position = UDim2.new(0,2,0,ENTRY_BOUND*(i-1)+2);
						Size = UDim2.new(0,nodeWidth,0,ENTRY_SIZE);
						ZIndex = listFrame.ZIndex;
					})
					listEntries[i] = entry

					local expand = entry.IndentFrame.Expand
					expand.MouseEnter:connect(function()
						local node = TreeList[i + self.ScrollIndex]
						if #node > 0 then
							if node.Expanded then
								Icon(expand,NODE_EXPANDED_OVER)
							else
								Icon(expand,NODE_COLLAPSED_OVER)
							end
						end
					end)
					expand.MouseLeave:connect(function()
						local node = TreeList[i + self.ScrollIndex]
						if #node > 0 then
							if node.Expanded then
								Icon(expand,NODE_EXPANDED)
							else
								Icon(expand,NODE_COLLAPSED)
							end
						end
					end)
					expand.MouseButton1Down:connect(function()
						local node = TreeList[i + self.ScrollIndex]
						if #node > 0 then
							node.Expanded = not node.Expanded
							if node.Object == explorerPanel.Parent and node.Expanded then
								CreateCaution("Warning","Please be careful when editing instances inside here, this is like the System32 of Dex and modifying objects here can break Dex.")
							end
							-- use raw update so the list updates instantly
							rawUpdateList()
						end
					end)

					entry.MouseButton1Down:connect(function(x,y)
						local node = TreeList[i + self.ScrollIndex]
						DestroyRightClick()
						if GetAwaitRemote:Invoke() then
							bindSetAwaiting:Fire(node.Object)
							return
						end
						
						if not HoldingShift then
							lastSelectedNode = i + self.ScrollIndex
						end
						
						if HoldingShift and not filteringWorkspace() then
							if lastSelectedNode then
								if i + self.ScrollIndex - lastSelectedNode > 0 then
									Selection:StopUpdates()
									for i2 = 1, i + self.ScrollIndex - lastSelectedNode do
										local newNode = TreeList[lastSelectedNode + i2]
										if newNode then
											Selection:Add(newNode.Object)
										end
									end
									Selection:ResumeUpdates()
								else
									Selection:StopUpdates()
									for i2 = i + self.ScrollIndex - lastSelectedNode, 1 do
										local newNode = TreeList[lastSelectedNode + i2]
										if newNode then
											Selection:Add(newNode.Object)
										end
									end
									Selection:ResumeUpdates()
								end
							end
							return
						end
						
						if HoldingCtrl then
							if Selection.Selected[node.Object] then
								Selection:Remove(node.Object)
							else
								Selection:Add(node.Object)
							end
							return
						end
						if Option.Modifiable then
							local pos = Vector2.new(x,y)
							dragReparent(node.Object,entry:Clone(),pos,entry.AbsolutePosition-pos)
						elseif Option.Selectable then
							if Selection.Selected[node.Object] then
								Selection:Set({})
							else
								Selection:Set({node.Object})
							end
							dragSelect(i+self.ScrollIndex,true,'MouseButton1Up')
						end
					end)

					entry.MouseButton2Down:connect(function()
						if not Option.Selectable then return end
						
						DestroyRightClick()
						
						curSelect = entry
						
						local node = TreeList[i + self.ScrollIndex]
						
						if GetAwaitRemote:Invoke() then
							bindSetAwaiting:Fire(node.Object)
							return
						end
						
						if not Selection.Selected[node.Object] then
							Selection:Set({node.Object})
						end
					end)
					
					
					entry.MouseButton2Up:connect(function()
						if not Option.Selectable then return end
						
						local node = TreeList[i + self.ScrollIndex]
						
						if checkMouseInGui(curSelect) then
							rightClickMenu(node.Object)
						end
					end)

					entry.Parent = listFrame
				end

				entry.Visible = true

				local object = node.Object

				-- update expand icon
				if #node == 0 then
					entry.IndentFrame.Expand.Visible = false
				elseif node.Expanded then
					Icon(entry.IndentFrame.Expand,NODE_EXPANDED)
					entry.IndentFrame.Expand.Visible = true
				else
					Icon(entry.IndentFrame.Expand,NODE_COLLAPSED)
					entry.IndentFrame.Expand.Visible = true
				end

				-- update explorer icon
				Icon(entry.IndentFrame.ExplorerIcon,ExplorerIndex[object.ClassName] or 0)

				-- update indentation
				local w = (node.Depth)*(2+ENTRY_PADDING+GUI_SIZE)
				entry.IndentFrame.Position = UDim2.new(0,w,0,0)
				entry.IndentFrame.Size = UDim2.new(1,-w,1,0)

				-- update name change detection
				if nameConnLookup[entry] then
					nameConnLookup[entry]:disconnect()
				end
				local text = entry.IndentFrame.EntryText
				text.Text = object.Name
				nameConnLookup[entry] = node.Object.Changed:connect(function(p)
					if p == 'Name' then
						text.Text = object.Name
					end
				end)

				-- update selection
				entry.IndentFrame.Transparency = node.Selected and 0 or 1
				text.TextColor3 = GuiColor[node.Selected and 'TextSelected' or 'Text']

				entry.Size = UDim2.new(0,nodeWidth,0,ENTRY_SIZE)
			elseif listEntries[i] then
				listEntries[i].Visible = false
			end
		end
		for i = self.VisibleSpace+1,self.TotalSpace do
			local entry = listEntries[i]
			if entry then
				listEntries[i] = nil
				entry:Destroy()
			end
		end
	end

	function scrollBarH.UpdateCallback(self)
		for i = 1,scrollBar.VisibleSpace do
			local node = TreeList[i + scrollBar.ScrollIndex]
			if node then
				local entry = listEntries[i]
				if entry then
					entry.Position = UDim2.new(0,2 - scrollBarH.ScrollIndex,0,ENTRY_BOUND*(i-1)+2)
				end
			end
		end
	end

	Connect(listFrame.Changed,function(p)
		if p == 'AbsoluteSize' then
			rawUpdateSize()
		end
	end)

	local wheelAmount = 6
	explorerPanel.MouseWheelForward:connect(function()
		if scrollBar.VisibleSpace - 1 > wheelAmount then
			scrollBar:ScrollTo(scrollBar.ScrollIndex - wheelAmount)
		else
			scrollBar:ScrollTo(scrollBar.ScrollIndex - scrollBar.VisibleSpace)
		end
	end)
	explorerPanel.MouseWheelBackward:connect(function()
		if scrollBar.VisibleSpace - 1 > wheelAmount then
			scrollBar:ScrollTo(scrollBar.ScrollIndex + wheelAmount)
		else
			scrollBar:ScrollTo(scrollBar.ScrollIndex + scrollBar.VisibleSpace)
		end
	end)
end

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
---- Object detection

-- Inserts `v` into `t` at `i`. Also sets `Index` field in `v`.
local function insert(t,i,v)
	for n = #t,i,-1 do
		local v = t[n]
		v.Index = n+1
		t[n+1] = v
	end
	v.Index = i
	t[i] = v
end

-- Removes `i` from `t`. Also sets `Index` field in removed value.
local function remove(t,i)
	local v = t[i]
	for n = i+1,#t do
		local v = t[n]
		v.Index = n-1
		t[n-1] = v
	end
	t[#t] = nil
	v.Index = 0
	return v
end

-- Returns how deep `o` is in the tree.
local function depth(o)
	local d = -1
	while o do
		o = o.Parent
		d = d + 1
	end
	return d
end


local connLookup = {}

-- Returns whether a node would be present in the tree list
local function nodeIsVisible(node)
	local visible = true
	node = node.Parent
	while node and visible do
		visible = visible and node.Expanded
		node = node.Parent
	end
	return visible
end

-- Removes an object's tree node. Called when the object stops existing in the
-- game tree.
local function removeObject(object)
	local objectNode = NodeLookup[object]
	if not objectNode then
		return
	end

	local visible = nodeIsVisible(objectNode)

	Selection:Remove(object,true)

	local parent = objectNode.Parent
	remove(parent,objectNode.Index)
	NodeLookup[object] = nil
	connLookup[object]:disconnect()
	connLookup[object] = nil

	if visible then
		updateList()
	elseif nodeIsVisible(parent) then
		updateScroll()
	end
end

-- Moves a tree node to a new parent. Called when an existing object's parent
-- changes.
local function moveObject(object,parent)
	local objectNode = NodeLookup[object]
	if not objectNode then
		return
	end

	local parentNode = NodeLookup[parent]
	if not parentNode then
		return
	end

	local visible = nodeIsVisible(objectNode)

	remove(objectNode.Parent,objectNode.Index)
	objectNode.Parent = parentNode

	objectNode.Depth = depth(object)
	local function r(node,d)
		for i = 1,#node do
			node[i].Depth = d
			r(node[i],d+1)
		end
	end
	r(objectNode,objectNode.Depth+1)

	insert(parentNode,#parentNode+1,objectNode)

	if visible or nodeIsVisible(objectNode) then
		updateList()
	elseif nodeIsVisible(objectNode.Parent) then
		updateScroll()
	end
end

-- ScriptContext['/Libraries/LibraryRegistration/LibraryRegistration']
-- This RobloxLocked object lets me index its properties for some reason

local function check(object)
	return object.AncestryChanged
end

-- Creates a new tree node from an object. Called when an object starts
-- existing in the game tree.
local function addObject(object,noupdate)
	if script then
		-- protect against naughty RobloxLocked objects
		local s = pcall(check,object)
		if not s then
			return
		end
	end

	local parentNode = NodeLookup[object.Parent]
	if not parentNode then
		return
	end

	local objectNode = {
		Object = object;
		Parent = parentNode;
		Index = 0;
		Expanded = false;
		Selected = false;
		Depth = depth(object);
	}

	connLookup[object] = Connect(object.AncestryChanged,function(c,p)
		if c == object then
			if p == nil then
				removeObject(c)
			else
				moveObject(c,p)
			end
		end
	end)

	NodeLookup[object] = objectNode
	insert(parentNode,#parentNode+1,objectNode)

	if not noupdate then
		if nodeIsVisible(objectNode) then
			updateList()
		elseif nodeIsVisible(objectNode.Parent) then
			updateScroll()
		end
	end
end

local function makeObject(obj,par)
	local newObject = Instance.new(obj.ClassName)
	for i,v in pairs(obj.Properties) do
		ypcall(function()
			local newProp
			newProp = ToPropValue(v.Value,v.Type)
			newObject[v.Name] = newProp
		end)
	end
	newObject.Parent = par
end

local function writeObject(obj)
	local newObject = {ClassName = obj.ClassName, Properties = {}}
	for i,v in pairs(RbxApi.GetProperties(obj.className)) do
		if v["Name"] ~= "Parent" then
			print("thispassed")
			table.insert(newObject.Properties,{Name = v["Name"], Type = v["ValueType"], Value = tostring(obj[v["Name"]])})
		end
	end
	return newObject
end

local function buildDexStorage()
	local localDexStorage
	
	local success,err = ypcall(function()
		localDexStorage = game:GetObjects("rbxasset://DexStorage.rbxm")[1]
	end)
	
	if success and localDexStorage then
		for i,v in pairs(localDexStorage:GetChildren()) do
			ypcall(function()
				v.Parent = DexStorageMain
			end)
		end
	end
	
	updateDexStorageListeners()
	--[[
	local localDexStorage = readfile(getelysianpath().."DexStorage.txt")--game:GetService("CookiesService"):GetCookieValue("DexStorage")
	--local success,err = pcall(function()
		if localDexStorage then
			local objTable = game:GetService("HttpService"):JSONDecode(localDexStorage)
			for i,v in pairs(objTable) do
				makeObject(v,DexStorageMain)
			end
		end
	--end)
	--]]
end

local dexStorageDebounce = false
local dexStorageListeners = {}

local function updateDexStorage()
	if dexStorageDebounce then return end
	dexStorageDebounce = true	
	
	wait()
	
	pcall(function()
		saveinstance("content//DexStorage.rbxm",DexStorageMain)
	end)
	
	updateDexStorageListeners()
	
	dexStorageDebounce = false
	--[[
	local success,err = ypcall(function()
		local objs = {}
		for i,v in pairs(DexStorageMain:GetChildren()) do
			table.insert(objs,writeObject(v))
		end
		writefile(getelysianpath().."DexStorage.txt",game:GetService("HttpService"):JSONEncode(objs))
		--game:GetService("CookiesService"):SetCookieValue("DexStorage",game:GetService("HttpService"):JSONEncode(objs))
	end)
	if err then
		CreateCaution("DexStorage Save Fail!","DexStorage broke! If you see this message, report to Raspberry Pi!")
	end
	print("hi")
	--]]
end

function updateDexStorageListeners()
	for i,v in pairs(dexStorageListeners) do
		v:Disconnect()
	end
	dexStorageListeners = {}
	for i,v in pairs(DexStorageMain:GetChildren()) do
		pcall(function()
			local ev = v.Changed:connect(updateDexStorage)
			table.insert(dexStorageListeners,ev)
		end)
	end
end

do
	NodeLookup[workspace.Parent] = {
		Object = workspace.Parent;
		Parent = nil;
		Index = 0;
		Expanded = true;
	}
	
	NodeLookup[DexOutput] = {
		Object = DexOutput;
		Parent = nil;
		Index = 0;
		Expanded = true;
	}
	
	if DexStorageEnabled then
		NodeLookup[DexStorage] = {
			Object = DexStorage;
			Parent = nil;
			Index = 0;
			Expanded = true;
		}
	end
	
	if NilStorageEnabled then
		NodeLookup[NilStorage] = {
			Object = NilStorage;
			Parent = nil;
			Index = 0;
			Expanded = true;
		}
	end

	Connect(game.DescendantAdded,addObject)
	Connect(game.DescendantRemoving,removeObject)
	
	Connect(DexOutput.DescendantAdded,addObject)
	Connect(DexOutput.DescendantRemoving,removeObject)
	
	if DexStorageEnabled then
		--[[
		if readfile(getelysianpath().."DexStorage.txt") == nil then
			writefile(getelysianpath().."DexStorage.txt","")
		end
		--]]
		
		buildDexStorage()
	
		Connect(DexStorage.DescendantAdded,addObject)
		Connect(DexStorage.DescendantRemoving,removeObject)
	
		Connect(DexStorage.DescendantAdded,updateDexStorage)
		Connect(DexStorage.DescendantRemoving,updateDexStorage)
	end
	
	if NilStorageEnabled then
		Connect(NilStorage.DescendantAdded,addObject)
		Connect(NilStorage.DescendantRemoving,removeObject)		
		
		local currentTable = get_nil_instances()	
		
		spawn(function()
			while wait() do
				if #currentTable ~= #get_nil_instances() then
					currentTable = get_nil_instances()
					--NilStorageMain:ClearAllChildren()
					for i,v in pairs(get_nil_instances()) do
						if v ~= NilStorage and v ~= DexStorage then
							pcall(function()
								v.Parent = NilStorageMain
							end)
							--[[
							local newNil = v
							newNil.Archivable = true
							newNil:Clone().Parent = NilStorageMain
							--]]
						end
					end
				end
			end
		end)
	end

	local function get(o)
		return o:GetChildren()
	end

	local function r(o)
		local s,children = pcall(get,o)
		if s then
			for i = 1,#children do
				addObject(children[i],true)
				r(children[i])
			end
		end
	end

	r(workspace.Parent)
	r(DexOutput)
	if DexStorageEnabled then
		r(DexStorage)
	end
	if NilStorageEnabled then
		r(NilStorage)
	end

	scrollBar.VisibleSpace = math.ceil(listFrame.AbsoluteSize.y/ENTRY_BOUND)
	updateList()
end

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
---- Actions

local actionButtons do
	actionButtons = {}

	local totalActions = 1
	local currentActions = totalActions
	local function makeButton(icon,over,name,vis,cond)
		local buttonEnabled = false
		
		local button = Create(Icon('ImageButton',icon),{
			Name = name .. "Button";
			Visible = Option.Modifiable and Option.Selectable;
			Position = UDim2.new(1,-(GUI_SIZE+2)*currentActions+2,0.25,-GUI_SIZE/2);
			Size = UDim2.new(0,GUI_SIZE,0,GUI_SIZE);
			Parent = headerFrame;
		})

		local tipText = Create('TextLabel',{
			Name = name .. "Text";
			Text = name;
			Visible = false;
			BackgroundTransparency = 1;
			TextXAlignment = 'Right';
			Font = FONT;
			FontSize = FONT_SIZE;
			Position = UDim2.new(0,0,0,0);
			Size = UDim2.new(1,-(GUI_SIZE+2)*totalActions,1,0);
			Parent = headerFrame;
		})

		
		button.MouseEnter:connect(function()
			if buttonEnabled then
				button.BackgroundTransparency = 0.9
			end
			--Icon(button,over)
			--tipText.Visible = true
		end)
		button.MouseLeave:connect(function()
			button.BackgroundTransparency = 1
			--Icon(button,icon)
			--tipText.Visible = false
		end)

		currentActions = currentActions + 1
		actionButtons[#actionButtons+1] = {Obj = button,Cond = cond}
		QuickButtons[#actionButtons+1] = {Obj = button,Cond = cond, Toggle = function(on)
			if on then
				buttonEnabled = true
				Icon(button,over)
			else
				buttonEnabled = false
				Icon(button,icon)
			end
		end}
		return button
	end

	--local clipboard = {}
	local function delete(o)
		o.Parent = nil
	end
	
	makeButton(ACTION_EDITQUICKACCESS,ACTION_EDITQUICKACCESS,"Options",true,function()return true end).MouseButton1Click:connect(function()
		
	end)
	

	-- DELETE
	makeButton(ACTION_DELETE,ACTION_DELETE_OVER,"Delete",true,function() return #Selection:Get() > 0 end).MouseButton1Click:connect(function()
		if not Option.Modifiable then return end
		local list = Selection:Get()
		for i = 1,#list do
			pcall(delete,list[i])
		end
		Selection:Set({})
	end)
	
	-- PASTE
	makeButton(ACTION_PASTE,ACTION_PASTE_OVER,"Paste",true,function() return #Selection:Get() > 0 and #clipboard > 0 end).MouseButton1Click:connect(function()
		if not Option.Modifiable then return end
		local parent = Selection.List[1] or workspace
		for i = 1,#clipboard do
			clipboard[i]:Clone().Parent = parent
		end
	end)
	
	-- COPY
	makeButton(ACTION_COPY,ACTION_COPY_OVER,"Copy",true,function() return #Selection:Get() > 0 end).MouseButton1Click:connect(function()
		if not Option.Modifiable then return end
		clipboard = {}
		local list = Selection.List
		for i = 1,#list do
			table.insert(clipboard,list[i]:Clone())
		end
		updateActions()
	end)
	
	-- CUT
	makeButton(ACTION_CUT,ACTION_CUT_OVER,"Cut",true,function() return #Selection:Get() > 0 end).MouseButton1Click:connect(function()
		if not Option.Modifiable then return end
		clipboard = {}
		local list = Selection.List
		local cut = {}
		for i = 1,#list do
			local obj = list[i]:Clone()
			if obj then
				table.insert(clipboard,obj)
				table.insert(cut,list[i])
			end
		end
		for i = 1,#cut do
			pcall(delete,cut[i])
		end
		updateActions()
	end)
	
	-- FREEZE
	makeButton(ACTION_FREEZE,ACTION_FREEZE,"Freeze",true,function() return true end)
	
	-- ADD/REMOVE STARRED
	makeButton(ACTION_ADDSTAR,ACTION_ADDSTAR_OVER,"Star",true,function() return #Selection:Get() > 0 end)
	
	-- STARRED
	makeButton(ACTION_STARRED,ACTION_STARRED,"Starred",true,function() return true end)


	-- SORT
	-- local actionSort = makeButton(ACTION_SORT,ACTION_SORT_OVER,"Sort")
end

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
---- Option Bindables

do
	local optionCallback = {
		Modifiable = function(value)
			for i = 1,#actionButtons do
				actionButtons[i].Obj.Visible = value and Option.Selectable
			end
			cancelReparentDrag()
		end;
		Selectable = function(value)
			for i = 1,#actionButtons do
				actionButtons[i].Obj.Visible = value and Option.Modifiable
			end
			cancelSelectDrag()
			Selection:Set({})
		end;
	}

	local bindSetOption = explorerPanel:FindFirstChild("SetOption")
	if not bindSetOption then
		bindSetOption = Create('BindableFunction',{Name = "SetOption"})
		bindSetOption.Parent = explorerPanel
	end

	bindSetOption.OnInvoke = function(optionName,value)
		if optionCallback[optionName] then
			Option[optionName] = value
			optionCallback[optionName](value)
		end
	end

	local bindGetOption = explorerPanel:FindFirstChild("GetOption")
	if not bindGetOption then
		bindGetOption = Create('BindableFunction',{Name = "GetOption"})
		bindGetOption.Parent = explorerPanel
	end

	bindGetOption.OnInvoke = function(optionName)
		if optionName then
			return Option[optionName]
		else
			local options = {}
			for k,v in pairs(Option) do
				options[k] = v
			end
			return options
		end
	end
end

function SelectionVar()
	return Selection
end

Input.InputBegan:connect(function(key)
	if key.KeyCode == Enum.KeyCode.LeftControl then
		HoldingCtrl = true
	end
	if key.KeyCode == Enum.KeyCode.LeftShift then
		HoldingShift = true
	end
end)

Input.InputEnded:connect(function(key)
	if key.KeyCode == Enum.KeyCode.LeftControl then
		HoldingCtrl = false
	end
	if key.KeyCode == Enum.KeyCode.LeftShift then
		HoldingShift = false
	end
end)

while RbxApi == nil do
	RbxApi = GetApiRemote:Invoke()
	wait()
end

explorerFilter.Changed:connect(function(prop)
	if prop == "Text" then
		rawUpdateList()
	end
end)

CurrentInsertObjectWindow = CreateInsertObjectMenu(
	GetClasses(),
	"",
	false,
	function(option)
		CurrentInsertObjectWindow.Visible = false
		local list = SelectionVar():Get()
		for i = 1,#list do
			pcall(function() Instance.new(option,list[i]) end)
		end
		DestroyRightClick()
	end
)
end))
BindableFunction17.Name = "GetPrint"
BindableFunction17.Parent = Frame10
LocalScript18.Name = "Selection"
LocalScript18.Parent = ScreenGui0
table.insert(cors,sandbox(LocalScript18,function()
local Gui = script.Parent

local IntroFrame = Gui:WaitForChild("IntroFrame")

local SideMenu = Gui:WaitForChild("SideMenu")
local OpenToggleButton = Gui:WaitForChild("Toggle")
local CloseToggleButton = SideMenu:WaitForChild("Toggle")
local OpenScriptEditorButton = SideMenu:WaitForChild("OpenScriptEditor")

local ScriptEditor = Gui:WaitForChild("ScriptEditor")

local SlideOut = SideMenu:WaitForChild("SlideOut")
local SlideFrame = SlideOut:WaitForChild("SlideFrame")
local Slant = SideMenu:WaitForChild("Slant")

local ExplorerButton = SlideFrame:WaitForChild("Explorer")
local SettingsButton = SlideFrame:WaitForChild("Settings")

local SelectionBox = Instance.new("SelectionBox")
SelectionBox.Parent = Gui

local ExplorerPanel = Gui:WaitForChild("ExplorerPanel")
local PropertiesFrame = Gui:WaitForChild("PropertiesFrame")
local SaveMapWindow = Gui:WaitForChild("SaveMapWindow")
local RemoteDebugWindow = Gui:WaitForChild("RemoteDebugWindow")

local SettingsPanel = Gui:WaitForChild("SettingsPanel")
local AboutPanel = Gui:WaitForChild("About")
local SettingsListener = SettingsPanel:WaitForChild("GetSetting")
local SettingTemplate = SettingsPanel:WaitForChild("SettingTemplate")
local SettingList = SettingsPanel:WaitForChild("SettingList")

local SaveMapCopyList = SaveMapWindow:WaitForChild("CopyList")
local SaveMapSettingFrame = SaveMapWindow:WaitForChild("MapSettings")
local SaveMapName = SaveMapWindow:WaitForChild("FileName")
local SaveMapButton = SaveMapWindow:WaitForChild("Save")
local SaveMapCopyTemplate = SaveMapWindow:WaitForChild("Entry")
local SaveMapSettings = {
	CopyWhat = {
		Workspace = true,
		Lighting = true,
		ReplicatedStorage = true,
		ReplicatedFirst = true,
		StarterPack = true,
		StarterGui = true,
		StarterPlayer = true
	},
	SaveScripts = true,
	SaveTerrain = true,
	LightingProperties = true,
	CameraInstances = true
}

--[[
local ClickSelectOption = SettingsPanel:WaitForChild("ClickSelect"):WaitForChild("Change")
local SelectionBoxOption = SettingsPanel:WaitForChild("SelectionBox"):WaitForChild("Change")
local ClearPropsOption = SettingsPanel:WaitForChild("ClearProperties"):WaitForChild("Change")
local SelectUngroupedOption = SettingsPanel:WaitForChild("SelectUngrouped"):WaitForChild("Change")
--]]

local SelectionChanged = ExplorerPanel:WaitForChild("SelectionChanged")
local GetSelection = ExplorerPanel:WaitForChild("GetSelection")
local SetSelection = ExplorerPanel:WaitForChild("SetSelection")

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()

local CurrentWindow = "Nothing c:"
local Windows = {
	Explorer = {
		ExplorerPanel,
		PropertiesFrame
	},
	Settings = {SettingsPanel},
	SaveMap = {SaveMapWindow},
	Remotes = {RemoteDebugWindow},
	About = {AboutPanel},
}

function switchWindows(wName,over)
	if CurrentWindow == wName and not over then return end
	
	local count = 0
	
	for i,v in pairs(Windows) do
		count = 0
		if i ~= wName then
			for _,c in pairs(v) do c:TweenPosition(UDim2.new(1, 30, count * 0.5, count * 36), "Out", "Quad", 0.5, true) count = count + 1 end
		end
	end
	
	count = 0
	
	if Windows[wName] then
		for _,c in pairs(Windows[wName]) do c:TweenPosition(UDim2.new(1, -300, count * 0.5, count * 36), "Out", "Quad", 0.5, true) count = count + 1 end
	end
	
	if wName ~= "Nothing c:" then
		CurrentWindow = wName
		for i,v in pairs(SlideFrame:GetChildren()) do
			v.BackgroundTransparency = 1
			v.Icon.ImageColor3 = Color3.new(70/255, 70/255, 70/255)
		end
		if SlideFrame:FindFirstChild(wName) then
			SlideFrame[wName].BackgroundTransparency = 0.5
			SlideFrame[wName].Icon.ImageColor3 = Color3.new(0,0,0)
		end
	end
end

function toggleDex(on)
	if on then
		SideMenu:TweenPosition(UDim2.new(1, -330, 0, 0), "Out", "Quad", 0.5, true)
		OpenToggleButton:TweenPosition(UDim2.new(1,0,0,0), "Out", "Quad", 0.5, true)
		switchWindows(CurrentWindow,true)
	else
		SideMenu:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.5, true)
		OpenToggleButton:TweenPosition(UDim2.new(1,-40,0,0), "Out", "Quad", 0.5, true)
		switchWindows("Nothing c:")
	end
end

local Settings = {
	ClickSelect = false,
	SelBox = false,
	ClearProps = false,
	SelectUngrouped = true,
	SaveInstanceScripts = true
}

function ReturnSetting(set)
	if set == "ClearProps" then
		return Settings.ClearProps
	elseif set == "SelectUngrouped" then
		return Settings.SelectUngrouped
	end
end

OpenToggleButton.MouseButton1Up:connect(function()
	toggleDex(true)
end)

OpenScriptEditorButton.MouseButton1Up:connect(function()
	if OpenScriptEditorButton.Active then
		ScriptEditor.Visible = true
	end
end)

CloseToggleButton.MouseButton1Up:connect(function()
	if CloseToggleButton.Active then
		toggleDex(false)
	end
end)

--[[
OpenToggleButton.MouseButton1Up:connect(function()
	SideMenu:TweenPosition(UDim2.new(1, -330, 0, 0), "Out", "Quad", 0.5, true)
	
	if CurrentWindow == "Explorer" then
		ExplorerPanel:TweenPosition(UDim2.new(1, -300, 0, 0), "Out", "Quad", 0.5, true)
		PropertiesFrame:TweenPosition(UDim2.new(1, -300, 0.5, 36), "Out", "Quad", 0.5, true)
	else
		SettingsPanel:TweenPosition(UDim2.new(1, -300, 0, 0), "Out", "Quad", 0.5, true)
	end
	
	OpenToggleButton:TweenPosition(UDim2.new(1,0,0,0), "Out", "Quad", 0.5, true)
end)

CloseToggleButton.MouseButton1Up:connect(function()
	SideMenu:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.5, true)
	
	ExplorerPanel:TweenPosition(UDim2.new(1, 30, 0, 0), "Out", "Quad", 0.5, true)
	PropertiesFrame:TweenPosition(UDim2.new(1, 30, 0.5, 36), "Out", "Quad", 0.5, true)
	SettingsPanel:TweenPosition(UDim2.new(1, 30, 0, 0), "Out", "Quad", 0.5, true)
	
	OpenToggleButton:TweenPosition(UDim2.new(1,-30,0,0), "Out", "Quad", 0.5, true)
end)
--]]

--[[
ExplorerButton.MouseButton1Up:connect(function()
	switchWindows("Explorer")
end)

SettingsButton.MouseButton1Up:connect(function()
	switchWindows("Settings")
end)
--]]

for i,v in pairs(SlideFrame:GetChildren()) do
	v.MouseButton1Click:connect(function()
		switchWindows(v.Name)
	end)
	
	v.MouseEnter:connect(function()v.BackgroundTransparency = 0.5 end)
	v.MouseLeave:connect(function()if CurrentWindow~=v.Name then v.BackgroundTransparency = 1 end end)
end

--[[
ExplorerButton.MouseButton1Up:connect(function()
	if CurrentWindow ~= "Explorer" then
		CurrentWindow = "Explorer"
		
		ExplorerPanel:TweenPosition(UDim2.new(1, -300, 0, 0), "Out", "Quad", 0.5, true)
		PropertiesFrame:TweenPosition(UDim2.new(1, -300, 0.5, 36), "Out", "Quad", 0.5, true)
		SettingsPanel:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.5, true)
	end
end)

SettingsButton.MouseButton1Up:connect(function()
	if CurrentWindow ~= "Settings" then
		CurrentWindow = "Settings"
		
		ExplorerPanel:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.5, true)
		PropertiesFrame:TweenPosition(UDim2.new(1, 0, 0.5, 36), "Out", "Quad", 0.5, true)
		SettingsPanel:TweenPosition(UDim2.new(1, -300, 0, 0), "Out", "Quad", 0.5, true)
	end
end)
--]]

function createSetting(name,interName,defaultOn)
	local newSetting = SettingTemplate:Clone()
	newSetting.Position = UDim2.new(0,0,0,#SettingList:GetChildren() * 60)
	newSetting.SName.Text = name
	
	local function toggle(on)
		if on then
			newSetting.Change.Bar:TweenPosition(UDim2.new(0,32,0,-2),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			newSetting.Change.OnBar:TweenSize(UDim2.new(0,34,0,15),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			newSetting.Status.Text = "On"
			Settings[interName] = true
		else
			newSetting.Change.Bar:TweenPosition(UDim2.new(0,-2,0,-2),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			newSetting.Change.OnBar:TweenSize(UDim2.new(0,0,0,15),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			newSetting.Status.Text = "Off"
			Settings[interName] = false
		end
	end	
	
	newSetting.Change.MouseButton1Click:connect(function()
		toggle(not Settings[interName])
	end)
	
	newSetting.Visible = true
	newSetting.Parent = SettingList
	
	if defaultOn then
		toggle(true)
	end
end

createSetting("Click part to select","ClickSelect",false)
createSetting("Selection Box","SelBox",false)
createSetting("Clear property value on focus","ClearProps",false)
createSetting("Select ungrouped models","SelectUngrouped",true)
createSetting("SaveInstance decompiles scripts","SaveInstanceScripts",true)

--[[
ClickSelectOption.MouseButton1Up:connect(function()
	if Settings.ClickSelect then
		Settings.ClickSelect = false
		ClickSelectOption.Text = "OFF"
	else
		Settings.ClickSelect = true
		ClickSelectOption.Text = "ON"
	end
end)

SelectionBoxOption.MouseButton1Up:connect(function()
	if Settings.SelBox then
		Settings.SelBox = false
		SelectionBox.Adornee = nil
		SelectionBoxOption.Text = "OFF"
	else
		Settings.SelBox = true
		SelectionBoxOption.Text = "ON"
	end
end)

ClearPropsOption.MouseButton1Up:connect(function()
	if Settings.ClearProps then
		Settings.ClearProps = false
		ClearPropsOption.Text = "OFF"
	else
		Settings.ClearProps = true
		ClearPropsOption.Text = "ON"
	end
end)

SelectUngroupedOption.MouseButton1Up:connect(function()
	if Settings.SelectUngrouped then
		Settings.SelectUngrouped = false
		SelectUngroupedOption.Text = "OFF"
	else
		Settings.SelectUngrouped = true
		SelectUngroupedOption.Text = "ON"
	end
end)
--]]

local function getSelection()
	local t = GetSelection:Invoke()
	if t and #t > 0 then
		return t[1]
	else
		return nil
	end
end

Mouse.Button1Down:connect(function()
	if CurrentWindow == "Explorer" and Settings.ClickSelect then
		local target = Mouse.Target
		if target then
			SetSelection:Invoke({target})
		end
	end
end)

SelectionChanged.Event:connect(function()
	if Settings.SelBox then
		local success,err = pcall(function()
			local selection = getSelection()
			SelectionBox.Adornee = selection
		end)
		if err then
			SelectionBox.Adornee = nil
		end
	end
end)

SettingsListener.OnInvoke = ReturnSetting

-- Map Copier

function createMapSetting(obj,interName,defaultOn)
	local function toggle(on)
		if on then
			obj.Change.Bar:TweenPosition(UDim2.new(0,32,0,-2),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			obj.Change.OnBar:TweenSize(UDim2.new(0,34,0,15),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			obj.Status.Text = "On"
			SaveMapSettings[interName] = true
		else
			obj.Change.Bar:TweenPosition(UDim2.new(0,-2,0,-2),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			obj.Change.OnBar:TweenSize(UDim2.new(0,0,0,15),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			obj.Status.Text = "Off"
			SaveMapSettings[interName] = false
		end
	end	
	
	obj.Change.MouseButton1Click:connect(function()
		toggle(not SaveMapSettings[interName])
	end)
	
	obj.Visible = true
	obj.Parent = SaveMapSettingFrame
	
	if defaultOn then
		toggle(true)
	end
end

function createCopyWhatSetting(serv)
	if SaveMapSettings.CopyWhat[serv] then
		local newSetting = SaveMapCopyTemplate:Clone()
		newSetting.Position = UDim2.new(0,0,0,#SaveMapCopyList:GetChildren() * 22 + 5)
		newSetting.Info.Text = serv
		
		local function toggle(on)
			if on then
				newSetting.Change.enabled.Visible = true
				SaveMapSettings.CopyWhat[serv] = true
			else
				newSetting.Change.enabled.Visible = false
				SaveMapSettings.CopyWhat[serv] = false
			end
		end	
	
		newSetting.Change.MouseButton1Click:connect(function()
			toggle(not SaveMapSettings.CopyWhat[serv])
		end)
		
		newSetting.Visible = true
		newSetting.Parent = SaveMapCopyList
	end
end

createMapSetting(SaveMapSettingFrame.Scripts,"SaveScripts",true)
createMapSetting(SaveMapSettingFrame.Terrain,"SaveTerrain",true)
createMapSetting(SaveMapSettingFrame.Lighting,"LightingProperties",true)
createMapSetting(SaveMapSettingFrame.CameraInstances,"CameraInstances",true)

createCopyWhatSetting("Workspace")
createCopyWhatSetting("Lighting")
createCopyWhatSetting("ReplicatedStorage")
createCopyWhatSetting("ReplicatedFirst")
createCopyWhatSetting("StarterPack")
createCopyWhatSetting("StarterGui")
createCopyWhatSetting("StarterPlayer")

SaveMapName.Text = tostring(game.PlaceId).."MapCopy"

SaveMapButton.MouseButton1Click:connect(function()
	local copyWhat = {}

	local copyGroup = Instance.new("Model",game:GetService('ReplicatedStorage'))

	local copyScripts = SaveMapSettings.SaveScripts

	local copyTerrain = SaveMapSettings.SaveTerrain

	local lightingProperties = SaveMapSettings.LightingProperties

	local cameraInstances = SaveMapSettings.CameraInstances

	-----------------------------------------------------------------------------------

	for i,v in pairs(SaveMapSettings.CopyWhat) do
		if v then
			table.insert(copyWhat,i)
		end
	end

	local consoleFunc = printconsole or writeconsole

	if consoleFunc then
		consoleFunc("Moon's place copier loaded.")
		consoleFunc("Copying map of game "..tostring(game.PlaceId)..".")
	end

	function archivable(root)
		for i,v in pairs(root:GetChildren()) do
			if not game:GetService('Players'):GetPlayerFromCharacter(v) then
				v.Archivable = true
				archivable(v)
			end
		end
	end

	function decompileS(root)
		for i,v in pairs(root:GetChildren()) do
			pcall(function()
				if v:IsA("LocalScript") then
					local isDisabled = v.Disabled
					v.Disabled = true
					v.Source = decompile(v)
					v.Disabled = isDisabled
				
					if v.Source == "" then 
						if consoleFunc then consoleFunc("LocalScript "..v.Name.." had a problem decompiling.") end
					else
						if consoleFunc then consoleFunc("LocalScript "..v.Name.." decompiled.") end
					end
				elseif v:IsA("ModuleScript") then
					v.Source = decompile(v)
				
					if v.Source == "" then 
						if consoleFunc then consoleFunc("ModuleScript "..v.Name.." had a problem decompiling.") end
					else
						if consoleFunc then consoleFunc("ModuleScript "..v.Name.." decompiled.") end
					end
				end
			end)
			decompileS(v)
		end
	end

	for i,v in pairs(copyWhat) do archivable(game[v]) end

	for j,obj in pairs(copyWhat) do
		if obj ~= "StarterPlayer" then
			local newFolder = Instance.new("Folder",copyGroup)
			newFolder.Name = obj
			for i,v in pairs(game[obj]:GetChildren()) do
				if v ~= copyGroup then
					pcall(function()
						v:Clone().Parent = newFolder
					end)
				end
			end
		else
			local newFolder = Instance.new("Model",copyGroup)
			newFolder.Name = "StarterPlayer"
			for i,v in pairs(game[obj]:GetChildren()) do
				local newObj = Instance.new("Folder",newFolder)
				newObj.Name = v.Name
				for _,c in pairs(v:GetChildren()) do
					if c.Name ~= "ControlScript" and c.Name ~= "CameraScript" then
						c:Clone().Parent = newObj
					end
				end
			end
		end
	end

	if workspace.CurrentCamera and cameraInstances then
		local cameraFolder = Instance.new("Model",copyGroup)
		cameraFolder.Name = "CameraItems"
		for i,v in pairs(workspace.CurrentCamera:GetChildren()) do v:Clone().Parent = cameraFolder end
	end

	if copyTerrain then
		local myTerrain = workspace.Terrain:CopyRegion(workspace.Terrain.MaxExtents)
		myTerrain.Parent = copyGroup
	end

	function saveProp(obj,prop,par)
		local myProp = obj[prop]
		if type(myProp) == "boolean" then
			local newProp = Instance.new("BoolValue",par)
			newProp.Name = prop
			newProp.Value = myProp
		elseif type(myProp) == "number" then
			local newProp = Instance.new("IntValue",par)
			newProp.Name = prop
			newProp.Value = myProp
		elseif type(myProp) == "string" then
			local newProp = Instance.new("StringValue",par)
			newProp.Name = prop
			newProp.Value = myProp
		elseif type(myProp) == "userdata" then -- Assume Color3
			pcall(function()
				local newProp = Instance.new("Color3Value",par)
				newProp.Name = prop
				newProp.Value = myProp
			end)
		end
	end

	if lightingProperties then
		local lightingProps = Instance.new("Model",copyGroup)
		lightingProps.Name = "LightingProperties"
	
		saveProp(game:GetService('Lighting'),"Ambient",lightingProps)
		saveProp(game:GetService('Lighting'),"Brightness",lightingProps)
		saveProp(game:GetService('Lighting'),"ColorShift_Bottom",lightingProps)
		saveProp(game:GetService('Lighting'),"ColorShift_Top",lightingProps)
		saveProp(game:GetService('Lighting'),"GlobalShadows",lightingProps)
		saveProp(game:GetService('Lighting'),"OutdoorAmbient",lightingProps)
		saveProp(game:GetService('Lighting'),"Outlines",lightingProps)
		saveProp(game:GetService('Lighting'),"GeographicLatitude",lightingProps)
		saveProp(game:GetService('Lighting'),"TimeOfDay",lightingProps)
		saveProp(game:GetService('Lighting'),"FogColor",lightingProps)
		saveProp(game:GetService('Lighting'),"FogEnd",lightingProps)
		saveProp(game:GetService('Lighting'),"FogStart",lightingProps)
	end

	if decompile and copyScripts then
		decompileS(copyGroup)
	end

	if SaveInstance then
		SaveInstance(copyGroup,SaveMapName.Text..".rbxm")
	elseif saveinstance then
		saveinstance(getelysianpath()..SaveMapName.Text..".rbxm",copyGroup)
	end
	--print("Saved!")
	if consoleFunc then
		consoleFunc("The map has been copied.")
	end
	SaveMapButton.Text = "The map has been saved"
	wait(5)
	SaveMapButton.Text = "Save"
end)

-- End Copier

wait()

IntroFrame:TweenPosition(UDim2.new(1,-301,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,true)

switchWindows("Explorer")

wait(1)

SideMenu.Visible = true

for i = 0,1,0.1 do
	IntroFrame.BackgroundTransparency = i
	IntroFrame.Main.BackgroundTransparency = i
	IntroFrame.Slant.ImageTransparency = i
	IntroFrame.Title.TextTransparency = i
	IntroFrame.Version.TextTransparency = i
	IntroFrame.Creator.TextTransparency = i
	IntroFrame.Sad.ImageTransparency = i
	wait()
end

IntroFrame.Visible = false

SlideFrame:TweenPosition(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,true)
OpenScriptEditorButton:TweenPosition(UDim2.new(0,0,0,150),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,true)
CloseToggleButton:TweenPosition(UDim2.new(0,0,0,180),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,true)
Slant:TweenPosition(UDim2.new(0,0,0,210),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,true)

wait(0.5)

for i = 1,0,-0.1 do
	OpenScriptEditorButton.Icon.ImageTransparency = i
	CloseToggleButton.TextTransparency = i
	wait()
end

CloseToggleButton.Active = true
CloseToggleButton.AutoButtonColor = true

OpenScriptEditorButton.Active = true
OpenScriptEditorButton.AutoButtonColor = true
end))
Frame19.Name = "SideMenu"
Frame19.Parent = ScreenGui0
Frame19.Position = UDim2.new(1, -330, 0, 0)
Frame19.Visible = false
Frame19.Transparency = 1
Frame19.Size = UDim2.new(0, 30, 0, 180)
Frame19.BackgroundColor = BrickColor.new("Lily white")
Frame19.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame19.BackgroundTransparency = 1
Frame19.BorderColor = BrickColor.new("Sand violet metallic")
Frame19.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame19.BorderSizePixel = 0
Frame19.ZIndex = 2
TextButton20.Name = "Toggle"
TextButton20.Parent = Frame19
TextButton20.Position = UDim2.new(0, 0, 0, 60)
TextButton20.Size = UDim2.new(0, 30, 0, 30)
TextButton20.Active = false
TextButton20.BackgroundColor = BrickColor.new("Lily white")
TextButton20.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
TextButton20.BorderSizePixel = 0
TextButton20.AutoButtonColor = false
TextButton20.Font = Enum.Font.SourceSans
TextButton20.FontSize = Enum.FontSize.Size24
TextButton20.Text = ">"
TextButton20.TextSize = 24
TextButton20.TextTransparency = 1
TextButton20.TextWrap = true
TextButton20.TextWrapped = true
TextLabel21.Name = "Title"
TextLabel21.Parent = Frame19
TextLabel21.Transparency = 1
TextLabel21.Size = UDim2.new(0, 30, 0, 20)
TextLabel21.BackgroundColor = BrickColor.new("Institutional white")
TextLabel21.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel21.BackgroundTransparency = 1
TextLabel21.ZIndex = 2
TextLabel21.Font = Enum.Font.SourceSansBold
TextLabel21.FontSize = Enum.FontSize.Size14
TextLabel21.Text = "DEX"
TextLabel21.TextSize = 14
TextLabel21.TextWrap = true
TextLabel21.TextWrapped = true
TextLabel22.Name = "Version"
TextLabel22.Parent = Frame19
TextLabel22.Position = UDim2.new(0, 0, 0, 15)
TextLabel22.Transparency = 1
TextLabel22.Size = UDim2.new(0, 30, 0, 20)
TextLabel22.BackgroundColor = BrickColor.new("Institutional white")
TextLabel22.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel22.BackgroundTransparency = 1
TextLabel22.ZIndex = 2
TextLabel22.Font = Enum.Font.SourceSansBold
TextLabel22.FontSize = Enum.FontSize.Size12
TextLabel22.Text = "v3"
TextLabel22.TextSize = 12
TextLabel22.TextWrap = true
TextLabel22.TextWrapped = true
ImageLabel23.Name = "Slant"
ImageLabel23.Parent = Frame19
ImageLabel23.Position = UDim2.new(0, 0, 0, 90)
ImageLabel23.Rotation = 180
ImageLabel23.Transparency = 1
ImageLabel23.Size = UDim2.new(0, 30, 0, 30)
ImageLabel23.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel23.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel23.BackgroundTransparency = 1
ImageLabel23.Image = "rbxassetid://1513966937"
ImageLabel23.ImageColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame24.Name = "Main"
Frame24.Parent = Frame19
Frame24.Size = UDim2.new(0, 30, 0, 30)
Frame24.BackgroundColor = BrickColor.new("Lily white")
Frame24.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame24.BorderSizePixel = 0
Frame25.Name = "SlideOut"
Frame25.Parent = Frame19
Frame25.Position = UDim2.new(0, 0, 0, 30)
Frame25.Transparency = 1
Frame25.Size = UDim2.new(0, 30, 0, 150)
Frame25.BackgroundColor = BrickColor.new("Quill grey")
Frame25.BackgroundColor3 = Color3.new(0.862745, 0.862745, 0.862745)
Frame25.BackgroundTransparency = 1
Frame25.BorderSizePixel = 0
Frame25.ClipsDescendants = true
Frame26.Name = "SlideFrame"
Frame26.Parent = Frame25
Frame26.Position = UDim2.new(0, 0, 0, -120)
Frame26.Size = UDim2.new(0, 30, 0, 120)
Frame26.BackgroundColor = BrickColor.new("Quill grey")
Frame26.BackgroundColor3 = Color3.new(0.862745, 0.862745, 0.862745)
Frame26.BorderSizePixel = 0
TextButton27.Name = "Explorer"
TextButton27.Parent = Frame26
TextButton27.Position = UDim2.new(0, 0, 0, 90)
TextButton27.Transparency = 1
TextButton27.Size = UDim2.new(0, 30, 0, 30)
TextButton27.BackgroundColor = BrickColor.new("Institutional white")
TextButton27.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton27.BackgroundTransparency = 1
TextButton27.BorderSizePixel = 0
TextButton27.AutoButtonColor = false
TextButton27.Font = Enum.Font.SourceSans
TextButton27.FontSize = Enum.FontSize.Size24
TextButton27.Text = ""
TextButton27.TextSize = 24
ImageLabel28.Name = "Icon"
ImageLabel28.Parent = TextButton27
ImageLabel28.Position = UDim2.new(0, 5, 0, 5)
ImageLabel28.Transparency = 1
ImageLabel28.Size = UDim2.new(0, 20, 0, 20)
ImageLabel28.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel28.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel28.BackgroundTransparency = 1
ImageLabel28.ZIndex = 2
ImageLabel28.Image = "rbxassetid://472635937"
ImageLabel28.ImageColor3 = Color3.new(0.27451, 0.27451, 0.27451)
TextButton29.Name = "SaveMap"
TextButton29.Parent = Frame26
TextButton29.Position = UDim2.new(0, 0, 0, 60)
TextButton29.Transparency = 1
TextButton29.Size = UDim2.new(0, 30, 0, 30)
TextButton29.BackgroundColor = BrickColor.new("Institutional white")
TextButton29.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton29.BackgroundTransparency = 1
TextButton29.BorderSizePixel = 0
TextButton29.AutoButtonColor = false
TextButton29.Font = Enum.Font.SourceSans
TextButton29.FontSize = Enum.FontSize.Size24
TextButton29.Text = ""
TextButton29.TextSize = 24
ImageLabel30.Name = "Icon"
ImageLabel30.Parent = TextButton29
ImageLabel30.Position = UDim2.new(0, 5, 0, 5)
ImageLabel30.Transparency = 1
ImageLabel30.Size = UDim2.new(0, 20, 0, 20)
ImageLabel30.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel30.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel30.BackgroundTransparency = 1
ImageLabel30.ZIndex = 2
ImageLabel30.Image = "rbxassetid://472636337"
ImageLabel30.ImageColor3 = Color3.new(0.27451, 0.27451, 0.27451)
TextButton31.Name = "Settings"
TextButton31.Parent = Frame26
TextButton31.Position = UDim2.new(0, 0, 0, 30)
TextButton31.Transparency = 1
TextButton31.Size = UDim2.new(0, 30, 0, 30)
TextButton31.BackgroundColor = BrickColor.new("Institutional white")
TextButton31.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton31.BackgroundTransparency = 1
TextButton31.BorderSizePixel = 0
TextButton31.AutoButtonColor = false
TextButton31.Font = Enum.Font.SourceSans
TextButton31.FontSize = Enum.FontSize.Size24
TextButton31.Text = ""
TextButton31.TextSize = 24
ImageLabel32.Name = "Icon"
ImageLabel32.Parent = TextButton31
ImageLabel32.Position = UDim2.new(0, 5, 0, 5)
ImageLabel32.Transparency = 1
ImageLabel32.Size = UDim2.new(0, 20, 0, 20)
ImageLabel32.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel32.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel32.BackgroundTransparency = 1
ImageLabel32.ZIndex = 2
ImageLabel32.Image = "rbxassetid://472635774"
ImageLabel32.ImageColor3 = Color3.new(0.27451, 0.27451, 0.27451)
TextButton33.Name = "About"
TextButton33.Parent = Frame26
TextButton33.Transparency = 1
TextButton33.Size = UDim2.new(0, 30, 0, 30)
TextButton33.BackgroundColor = BrickColor.new("Institutional white")
TextButton33.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton33.BackgroundTransparency = 1
TextButton33.BorderSizePixel = 0
TextButton33.AutoButtonColor = false
TextButton33.Font = Enum.Font.SourceSans
TextButton33.FontSize = Enum.FontSize.Size24
TextButton33.Text = ""
TextButton33.TextSize = 24
ImageLabel34.Name = "Icon"
ImageLabel34.Parent = TextButton33
ImageLabel34.Position = UDim2.new(0, 5, 0, 5)
ImageLabel34.Transparency = 1
ImageLabel34.Size = UDim2.new(0, 20, 0, 20)
ImageLabel34.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel34.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel34.BackgroundTransparency = 1
ImageLabel34.ZIndex = 2
ImageLabel34.Image = "rbxassetid://476354004"
ImageLabel34.ImageColor3 = Color3.new(0.27451, 0.27451, 0.27451)
TextButton35.Name = "OpenScriptEditor"
TextButton35.Parent = Frame19
TextButton35.Position = UDim2.new(0, 0, 0, 30)
TextButton35.Size = UDim2.new(0, 30, 0, 30)
TextButton35.Active = false
TextButton35.BackgroundColor = BrickColor.new("Lily white")
TextButton35.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
TextButton35.BorderSizePixel = 0
TextButton35.AutoButtonColor = false
TextButton35.Font = Enum.Font.SourceSans
TextButton35.FontSize = Enum.FontSize.Size24
TextButton35.Text = ""
TextButton35.TextSize = 24
ImageLabel36.Name = "Icon"
ImageLabel36.Parent = TextButton35
ImageLabel36.Position = UDim2.new(0, 5, 0, 5)
ImageLabel36.Transparency = 1
ImageLabel36.Size = UDim2.new(0, 20, 0, 20)
ImageLabel36.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel36.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel36.BackgroundTransparency = 1
ImageLabel36.BorderSizePixel = 0
ImageLabel36.ZIndex = 2
ImageLabel36.Image = "rbxassetid://475456048"
ImageLabel36.ImageColor3 = Color3.new(0.105882, 0.164706, 0.207843)
ImageLabel36.ImageTransparency = 1
Frame37.Name = "SettingsPanel"
Frame37.Parent = ScreenGui0
Frame37.Position = UDim2.new(1, 0, 0, 0)
Frame37.Transparency = 0.10000000149012
Frame37.Size = UDim2.new(0, 300, 1, 0)
Frame37.BackgroundColor = BrickColor.new("Institutional white")
Frame37.BackgroundColor3 = Color3.new(1, 1, 1)
Frame37.BackgroundTransparency = 0.10000000149012
Frame37.BorderColor = BrickColor.new("Light grey")
Frame37.BorderColor3 = Color3.new(0.74902, 0.74902, 0.74902)
Frame37.BorderSizePixel = 0
Frame38.Name = "Header"
Frame38.Parent = Frame37
Frame38.Size = UDim2.new(1, 0, 0, 17)
Frame38.BackgroundColor = BrickColor.new("Lily white")
Frame38.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame38.BorderColor = BrickColor.new("Sand violet metallic")
Frame38.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame38.BorderSizePixel = 0
TextLabel39.Parent = Frame38
TextLabel39.Position = UDim2.new(0, 4, 0, 0)
TextLabel39.Transparency = 1
TextLabel39.Size = UDim2.new(1, -4, 1, 0)
TextLabel39.BackgroundTransparency = 1
TextLabel39.BorderSizePixel = 0
TextLabel39.Font = Enum.Font.SourceSans
TextLabel39.FontSize = Enum.FontSize.Size14
TextLabel39.Text = "Settings"
TextLabel39.TextColor = BrickColor.new("Really black")
TextLabel39.TextColor3 = Color3.new(0, 0, 0)
TextLabel39.TextSize = 14
TextLabel39.TextXAlignment = Enum.TextXAlignment.Left
BindableFunction40.Name = "GetSetting"
BindableFunction40.Parent = Frame37
Frame41.Name = "SettingTemplate"
Frame41.Parent = Frame37
Frame41.Position = UDim2.new(0, 0, 0, 18)
Frame41.Visible = false
Frame41.Transparency = 1
Frame41.Size = UDim2.new(1, 0, 0, 60)
Frame41.BackgroundColor = BrickColor.new("Institutional white")
Frame41.BackgroundColor3 = Color3.new(1, 1, 1)
Frame41.BackgroundTransparency = 1
TextLabel42.Name = "SName"
TextLabel42.Parent = Frame41
TextLabel42.Position = UDim2.new(0, 10, 0, 0)
TextLabel42.Transparency = 1
TextLabel42.Size = UDim2.new(1, -20, 0, 30)
TextLabel42.BackgroundColor = BrickColor.new("Institutional white")
TextLabel42.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel42.BackgroundTransparency = 1
TextLabel42.Font = Enum.Font.SourceSans
TextLabel42.FontSize = Enum.FontSize.Size18
TextLabel42.Text = "SettingName"
TextLabel42.TextSize = 18
TextLabel42.TextXAlignment = Enum.TextXAlignment.Left
TextLabel43.Name = "Status"
TextLabel43.Parent = Frame41
TextLabel43.Position = UDim2.new(0, 60, 0, 30)
TextLabel43.Transparency = 1
TextLabel43.Size = UDim2.new(0, 50, 0, 15)
TextLabel43.BackgroundColor = BrickColor.new("Institutional white")
TextLabel43.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel43.BackgroundTransparency = 1
TextLabel43.Font = Enum.Font.SourceSans
TextLabel43.FontSize = Enum.FontSize.Size18
TextLabel43.Text = "Off"
TextLabel43.TextSize = 18
TextLabel43.TextXAlignment = Enum.TextXAlignment.Left
TextButton44.Name = "Change"
TextButton44.Parent = Frame41
TextButton44.Position = UDim2.new(0, 10, 0, 30)
TextButton44.Size = UDim2.new(0, 40, 0, 15)
TextButton44.BackgroundColor = BrickColor.new("Quill grey")
TextButton44.BackgroundColor3 = Color3.new(0.862745, 0.862745, 0.862745)
TextButton44.BorderSizePixel = 0
TextButton44.Font = Enum.Font.SourceSans
TextButton44.FontSize = Enum.FontSize.Size14
TextButton44.Text = ""
TextButton44.TextSize = 14
TextLabel45.Name = "OnBar"
TextLabel45.Parent = TextButton44
TextLabel45.Size = UDim2.new(0, 0, 0, 15)
TextLabel45.BackgroundColor = BrickColor.new("Electric blue")
TextLabel45.BackgroundColor3 = Color3.new(0, 0.576471, 0.862745)
TextLabel45.BorderSizePixel = 0
TextLabel45.Font = Enum.Font.SourceSans
TextLabel45.FontSize = Enum.FontSize.Size14
TextLabel45.Text = ""
TextLabel45.TextSize = 14
TextLabel46.Name = "Bar"
TextLabel46.Parent = TextButton44
TextLabel46.Position = UDim2.new(0, -2, 0, -2)
TextLabel46.Size = UDim2.new(0, 10, 0, 19)
TextLabel46.BackgroundColor = BrickColor.new("Really black")
TextLabel46.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel46.BorderSizePixel = 0
TextLabel46.ClipsDescendants = true
TextLabel46.Font = Enum.Font.SourceSans
TextLabel46.FontSize = Enum.FontSize.Size14
TextLabel46.Text = ""
TextLabel46.TextSize = 14
Frame47.Name = "SettingList"
Frame47.Parent = Frame37
Frame47.Position = UDim2.new(0, 0, 0, 17)
Frame47.Transparency = 1
Frame47.Size = UDim2.new(1, 0, 1, -17)
Frame47.BackgroundColor = BrickColor.new("Institutional white")
Frame47.BackgroundColor3 = Color3.new(1, 1, 1)
Frame47.BackgroundTransparency = 1
Frame48.Name = "SaveInstance"
Frame48.Parent = ScreenGui0
Frame48.Position = UDim2.new(0.300000012, 0, 0.300000012, 0)
Frame48.Visible = false
Frame48.Size = UDim2.new(0, 350, 0, 20)
Frame48.Active = true
Frame48.BackgroundColor = BrickColor.new("Lily white")
Frame48.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame48.BorderColor = BrickColor.new("Sand violet metallic")
Frame48.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame48.BorderSizePixel = 0
Frame48.Draggable = true
Frame48.ZIndex = 2
TextLabel49.Name = "Title"
TextLabel49.Parent = Frame48
TextLabel49.Transparency = 1
TextLabel49.Size = UDim2.new(1, 0, 1, 0)
TextLabel49.BackgroundTransparency = 1
TextLabel49.ZIndex = 2
TextLabel49.Font = Enum.Font.SourceSans
TextLabel49.FontSize = Enum.FontSize.Size14
TextLabel49.Text = "Save Instance"
TextLabel49.TextColor = BrickColor.new("Really black")
TextLabel49.TextColor3 = Color3.new(0, 0, 0)
TextLabel49.TextSize = 14
TextLabel49.TextXAlignment = Enum.TextXAlignment.Left
Frame50.Name = "MainWindow"
Frame50.Parent = Frame48
Frame50.Transparency = 0.10000000149012
Frame50.Size = UDim2.new(1, 0, 0, 200)
Frame50.BackgroundColor = BrickColor.new("Institutional white")
Frame50.BackgroundColor3 = Color3.new(1, 1, 1)
Frame50.BackgroundTransparency = 0.10000000149012
Frame50.BorderColor = BrickColor.new("Light grey")
Frame50.BorderColor3 = Color3.new(0.74902, 0.74902, 0.74902)
TextButton51.Name = "Save"
TextButton51.Parent = Frame50
TextButton51.Position = UDim2.new(0.075000003, 0, 1, -40)
TextButton51.Transparency = 0.5
TextButton51.Size = UDim2.new(0.400000006, 0, 0, 30)
TextButton51.BackgroundColor = BrickColor.new("Institutional white")
TextButton51.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton51.BackgroundTransparency = 0.5
TextButton51.BorderColor = BrickColor.new("Really black")
TextButton51.BorderColor3 = Color3.new(0, 0, 0)
TextButton51.Font = Enum.Font.SourceSans
TextButton51.FontSize = Enum.FontSize.Size18
TextButton51.Text = "Save"
TextButton51.TextSize = 18
TextLabel52.Name = "Desc"
TextLabel52.Parent = Frame50
TextLabel52.Position = UDim2.new(0, 0, 0, 20)
TextLabel52.Transparency = 1
TextLabel52.Size = UDim2.new(1, 0, 0, 40)
TextLabel52.BackgroundColor = BrickColor.new("Institutional white")
TextLabel52.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel52.BackgroundTransparency = 1
TextLabel52.Font = Enum.Font.SourceSans
TextLabel52.FontSize = Enum.FontSize.Size14
TextLabel52.Text = "This will save an instance to your PC. Type in the name for your instance. (.rbxmx will be added automatically.)"
TextLabel52.TextSize = 14
TextLabel52.TextWrap = true
TextLabel52.TextWrapped = true
TextButton53.Name = "Cancel"
TextButton53.Parent = Frame50
TextButton53.Position = UDim2.new(0.524999976, 0, 1, -40)
TextButton53.Transparency = 0.5
TextButton53.Size = UDim2.new(0.400000006, 0, 0, 30)
TextButton53.BackgroundColor = BrickColor.new("Institutional white")
TextButton53.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton53.BackgroundTransparency = 0.5
TextButton53.BorderColor = BrickColor.new("Really black")
TextButton53.BorderColor3 = Color3.new(0, 0, 0)
TextButton53.Font = Enum.Font.SourceSans
TextButton53.FontSize = Enum.FontSize.Size18
TextButton53.Text = "Cancel"
TextButton53.TextSize = 18
TextBox54.Name = "FileName"
TextBox54.Parent = Frame50
TextBox54.Position = UDim2.new(0.075000003, 0, 0.400000006, 0)
TextBox54.Transparency = 0.20000000298023
TextBox54.Size = UDim2.new(0.850000024, 0, 0, 30)
TextBox54.BackgroundColor = BrickColor.new("Institutional white")
TextBox54.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox54.BackgroundTransparency = 0.20000000298023
TextBox54.Font = Enum.Font.SourceSans
TextBox54.FontSize = Enum.FontSize.Size18
TextBox54.Text = ""
TextBox54.TextSize = 18
TextBox54.TextXAlignment = Enum.TextXAlignment.Left
TextButton55.Name = "SaveObjects"
TextButton55.Parent = Frame50
TextButton55.Position = UDim2.new(0.075000003, 0, 0.625, 0)
TextButton55.Transparency = 0.60000002384186
TextButton55.Size = UDim2.new(0, 20, 0, 20)
TextButton55.BackgroundColor = BrickColor.new("Institutional white")
TextButton55.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton55.BackgroundTransparency = 0.60000002384186
TextButton55.ZIndex = 2
TextButton55.Font = Enum.Font.SourceSans
TextButton55.FontSize = Enum.FontSize.Size18
TextButton55.Text = ""
TextButton55.TextColor = BrickColor.new("Institutional white")
TextButton55.TextColor3 = Color3.new(1, 1, 1)
TextButton55.TextSize = 18
TextLabel56.Name = "enabled"
TextLabel56.Parent = TextButton55
TextLabel56.Position = UDim2.new(0, 3, 0, 3)
TextLabel56.Transparency = 0.40000000596046
TextLabel56.Size = UDim2.new(0, 14, 0, 14)
TextLabel56.BackgroundColor = BrickColor.new("Dark stone grey")
TextLabel56.BackgroundColor3 = Color3.new(0.380392, 0.380392, 0.380392)
TextLabel56.BackgroundTransparency = 0.40000000596046
TextLabel56.BorderSizePixel = 0
TextLabel56.Font = Enum.Font.SourceSans
TextLabel56.FontSize = Enum.FontSize.Size14
TextLabel56.Text = ""
TextLabel56.TextSize = 14
TextLabel57.Name = "Desc2"
TextLabel57.Parent = Frame50
TextLabel57.Position = UDim2.new(0.075000003, 30, 0.625, 0)
TextLabel57.Transparency = 1
TextLabel57.Size = UDim2.new(0.925000012, -30, 0, 20)
TextLabel57.BackgroundColor = BrickColor.new("Institutional white")
TextLabel57.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel57.BackgroundTransparency = 1
TextLabel57.Font = Enum.Font.SourceSans
TextLabel57.FontSize = Enum.FontSize.Size14
TextLabel57.Text = "Save Object type values"
TextLabel57.TextSize = 14
TextLabel57.TextXAlignment = Enum.TextXAlignment.Left
Frame58.Name = "Confirmation"
Frame58.Parent = ScreenGui0
Frame58.Position = UDim2.new(0.5, -175, 0.5, -75)
Frame58.Visible = false
Frame58.Size = UDim2.new(0, 350, 0, 20)
Frame58.Active = true
Frame58.BackgroundColor = BrickColor.new("Lily white")
Frame58.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame58.BorderColor = BrickColor.new("Sand violet metallic")
Frame58.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame58.BorderSizePixel = 0
Frame58.Draggable = true
Frame58.ZIndex = 3
TextLabel59.Name = "Title"
TextLabel59.Parent = Frame58
TextLabel59.Transparency = 1
TextLabel59.Size = UDim2.new(1, 0, 1, 0)
TextLabel59.BackgroundTransparency = 1
TextLabel59.ZIndex = 3
TextLabel59.Font = Enum.Font.SourceSans
TextLabel59.FontSize = Enum.FontSize.Size14
TextLabel59.Text = "Confirm"
TextLabel59.TextColor = BrickColor.new("Really black")
TextLabel59.TextColor3 = Color3.new(0, 0, 0)
TextLabel59.TextSize = 14
TextLabel59.TextXAlignment = Enum.TextXAlignment.Left
Frame60.Name = "MainWindow"
Frame60.Parent = Frame58
Frame60.Transparency = 0.10000000149012
Frame60.Size = UDim2.new(1, 0, 0, 150)
Frame60.BackgroundColor = BrickColor.new("Institutional white")
Frame60.BackgroundColor3 = Color3.new(1, 1, 1)
Frame60.BackgroundTransparency = 0.10000000149012
Frame60.BorderColor = BrickColor.new("Light grey")
Frame60.BorderColor3 = Color3.new(0.74902, 0.74902, 0.74902)
Frame60.ZIndex = 2
TextButton61.Name = "Yes"
TextButton61.Parent = Frame60
TextButton61.Position = UDim2.new(0.075000003, 0, 1, -40)
TextButton61.Transparency = 0.5
TextButton61.Size = UDim2.new(0.400000006, 0, 0, 30)
TextButton61.BackgroundColor = BrickColor.new("Institutional white")
TextButton61.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton61.BackgroundTransparency = 0.5
TextButton61.BorderColor = BrickColor.new("Really black")
TextButton61.BorderColor3 = Color3.new(0, 0, 0)
TextButton61.ZIndex = 2
TextButton61.Font = Enum.Font.SourceSans
TextButton61.FontSize = Enum.FontSize.Size18
TextButton61.Text = "Yes"
TextButton61.TextSize = 18
TextLabel62.Name = "Desc"
TextLabel62.Parent = Frame60
TextLabel62.Position = UDim2.new(0, 0, 0, 20)
TextLabel62.Transparency = 1
TextLabel62.Size = UDim2.new(1, 0, 0, 40)
TextLabel62.BackgroundColor = BrickColor.new("Institutional white")
TextLabel62.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel62.BackgroundTransparency = 1
TextLabel62.ZIndex = 2
TextLabel62.Font = Enum.Font.SourceSans
TextLabel62.FontSize = Enum.FontSize.Size14
TextLabel62.Text = "The file, FILENAME, already exists. Overwrite?"
TextLabel62.TextSize = 14
TextLabel62.TextWrap = true
TextLabel62.TextWrapped = true
TextButton63.Name = "No"
TextButton63.Parent = Frame60
TextButton63.Position = UDim2.new(0.524999976, 0, 1, -40)
TextButton63.Transparency = 0.5
TextButton63.Size = UDim2.new(0.400000006, 0, 0, 30)
TextButton63.BackgroundColor = BrickColor.new("Institutional white")
TextButton63.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton63.BackgroundTransparency = 0.5
TextButton63.BorderColor = BrickColor.new("Really black")
TextButton63.BorderColor3 = Color3.new(0, 0, 0)
TextButton63.ZIndex = 2
TextButton63.Font = Enum.Font.SourceSans
TextButton63.FontSize = Enum.FontSize.Size18
TextButton63.Text = "No"
TextButton63.TextSize = 18
Frame64.Name = "Caution"
Frame64.Parent = ScreenGui0
Frame64.Position = UDim2.new(0.5, -175, 0.5, -75)
Frame64.Visible = false
Frame64.Size = UDim2.new(0, 350, 0, 20)
Frame64.Active = true
Frame64.BackgroundColor = BrickColor.new("Lily white")
Frame64.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame64.BorderColor = BrickColor.new("Sand violet metallic")
Frame64.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame64.BorderSizePixel = 0
Frame64.Draggable = true
Frame64.ZIndex = 5
TextLabel65.Name = "Title"
TextLabel65.Parent = Frame64
TextLabel65.Transparency = 1
TextLabel65.Size = UDim2.new(1, 0, 1, 0)
TextLabel65.BackgroundTransparency = 1
TextLabel65.ZIndex = 5
TextLabel65.Font = Enum.Font.SourceSans
TextLabel65.FontSize = Enum.FontSize.Size14
TextLabel65.Text = "Caution"
TextLabel65.TextColor = BrickColor.new("Really black")
TextLabel65.TextColor3 = Color3.new(0, 0, 0)
TextLabel65.TextSize = 14
TextLabel65.TextXAlignment = Enum.TextXAlignment.Left
Frame66.Name = "MainWindow"
Frame66.Parent = Frame64
Frame66.Transparency = 0.10000000149012
Frame66.Size = UDim2.new(1, 0, 0, 150)
Frame66.BackgroundColor = BrickColor.new("Institutional white")
Frame66.BackgroundColor3 = Color3.new(1, 1, 1)
Frame66.BackgroundTransparency = 0.10000000149012
Frame66.BorderColor = BrickColor.new("Light grey")
Frame66.BorderColor3 = Color3.new(0.74902, 0.74902, 0.74902)
Frame66.ZIndex = 4
TextLabel67.Name = "Desc"
TextLabel67.Parent = Frame66
TextLabel67.Position = UDim2.new(0, 0, 0, 20)
TextLabel67.Transparency = 1
TextLabel67.Size = UDim2.new(1, 0, 0, 42)
TextLabel67.BackgroundColor = BrickColor.new("Institutional white")
TextLabel67.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel67.BackgroundTransparency = 1
TextLabel67.ZIndex = 4
TextLabel67.Font = Enum.Font.SourceSans
TextLabel67.FontSize = Enum.FontSize.Size14
TextLabel67.Text = "The file, FILENAME, already exists. Overwrite?"
TextLabel67.TextSize = 14
TextLabel67.TextWrap = true
TextLabel67.TextWrapped = true
TextButton68.Name = "Ok"
TextButton68.Parent = Frame66
TextButton68.Position = UDim2.new(0.300000012, 0, 1, -40)
TextButton68.Transparency = 0.5
TextButton68.Size = UDim2.new(0.400000006, 0, 0, 30)
TextButton68.BackgroundColor = BrickColor.new("Institutional white")
TextButton68.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton68.BackgroundTransparency = 0.5
TextButton68.BorderColor = BrickColor.new("Really black")
TextButton68.BorderColor3 = Color3.new(0, 0, 0)
TextButton68.ZIndex = 4
TextButton68.Font = Enum.Font.SourceSans
TextButton68.FontSize = Enum.FontSize.Size18
TextButton68.Text = "Ok"
TextButton68.TextSize = 18
Frame69.Name = "CallRemote"
Frame69.Parent = ScreenGui0
Frame69.Position = UDim2.new(0.5, -175, 0.5, -100)
Frame69.Visible = false
Frame69.Size = UDim2.new(0, 350, 0, 20)
Frame69.Active = true
Frame69.BackgroundColor = BrickColor.new("Lily white")
Frame69.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame69.BorderColor = BrickColor.new("Sand violet metallic")
Frame69.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame69.BorderSizePixel = 0
Frame69.Draggable = true
Frame69.ZIndex = 2
TextLabel70.Name = "Title"
TextLabel70.Parent = Frame69
TextLabel70.Transparency = 1
TextLabel70.Size = UDim2.new(1, 0, 1, 0)
TextLabel70.BackgroundTransparency = 1
TextLabel70.ZIndex = 2
TextLabel70.Font = Enum.Font.SourceSans
TextLabel70.FontSize = Enum.FontSize.Size14
TextLabel70.Text = "Call Remote"
TextLabel70.TextColor = BrickColor.new("Really black")
TextLabel70.TextColor3 = Color3.new(0, 0, 0)
TextLabel70.TextSize = 14
TextLabel70.TextXAlignment = Enum.TextXAlignment.Left
Frame71.Name = "MainWindow"
Frame71.Parent = Frame69
Frame71.Transparency = 0.10000000149012
Frame71.Size = UDim2.new(1, 0, 0, 200)
Frame71.BackgroundColor = BrickColor.new("Institutional white")
Frame71.BackgroundColor3 = Color3.new(1, 1, 1)
Frame71.BackgroundTransparency = 0.10000000149012
Frame71.BorderColor = BrickColor.new("Light grey")
Frame71.BorderColor3 = Color3.new(0.74902, 0.74902, 0.74902)
TextLabel72.Name = "Desc"
TextLabel72.Parent = Frame71
TextLabel72.Position = UDim2.new(0, 0, 0, 20)
TextLabel72.Transparency = 1
TextLabel72.Size = UDim2.new(1, 0, 0, 20)
TextLabel72.BackgroundColor = BrickColor.new("Institutional white")
TextLabel72.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel72.BackgroundTransparency = 1
TextLabel72.Font = Enum.Font.SourceSans
TextLabel72.FontSize = Enum.FontSize.Size14
TextLabel72.Text = "Arguments"
TextLabel72.TextSize = 14
TextLabel72.TextWrap = true
TextLabel72.TextWrapped = true
ScrollingFrame73.Name = "Arguments"
ScrollingFrame73.Parent = Frame71
ScrollingFrame73.Position = UDim2.new(0, 0, 0, 40)
ScrollingFrame73.Transparency = 1
ScrollingFrame73.Size = UDim2.new(1, 0, 0, 80)
ScrollingFrame73.BackgroundColor = BrickColor.new("Institutional white")
ScrollingFrame73.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame73.BackgroundTransparency = 1
ScrollingFrame73.BottomImage = "rbxasset://textures/blackBkg_square.png"
ScrollingFrame73.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame73.MidImage = "rbxasset://textures/blackBkg_square.png"
ScrollingFrame73.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollingFrame73.TopImage = "rbxasset://textures/blackBkg_square.png"
TextButton74.Name = "DisplayReturned"
TextButton74.Parent = Frame71
TextButton74.Position = UDim2.new(0.075000003, 0, 0.625, 0)
TextButton74.Transparency = 0.60000002384186
TextButton74.Size = UDim2.new(0, 20, 0, 20)
TextButton74.BackgroundColor = BrickColor.new("Institutional white")
TextButton74.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton74.BackgroundTransparency = 0.60000002384186
TextButton74.ZIndex = 2
TextButton74.Font = Enum.Font.SourceSans
TextButton74.FontSize = Enum.FontSize.Size18
TextButton74.Text = ""
TextButton74.TextColor = BrickColor.new("Institutional white")
TextButton74.TextColor3 = Color3.new(1, 1, 1)
TextButton74.TextSize = 18
TextLabel75.Name = "enabled"
TextLabel75.Parent = TextButton74
TextLabel75.Position = UDim2.new(0, 3, 0, 3)
TextLabel75.Visible = false
TextLabel75.Transparency = 0.40000000596046
TextLabel75.Size = UDim2.new(0, 14, 0, 14)
TextLabel75.BackgroundColor = BrickColor.new("Dark stone grey")
TextLabel75.BackgroundColor3 = Color3.new(0.380392, 0.380392, 0.380392)
TextLabel75.BackgroundTransparency = 0.40000000596046
TextLabel75.BorderSizePixel = 0
TextLabel75.Font = Enum.Font.SourceSans
TextLabel75.FontSize = Enum.FontSize.Size14
TextLabel75.Text = ""
TextLabel75.TextSize = 14
TextLabel76.Name = "Desc2"
TextLabel76.Parent = Frame71
TextLabel76.Position = UDim2.new(0.075000003, 30, 0.625, 0)
TextLabel76.Transparency = 1
TextLabel76.Size = UDim2.new(0.925000012, -30, 0, 20)
TextLabel76.BackgroundColor = BrickColor.new("Institutional white")
TextLabel76.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel76.BackgroundTransparency = 1
TextLabel76.Font = Enum.Font.SourceSans
TextLabel76.FontSize = Enum.FontSize.Size14
TextLabel76.Text = "Display values returned"
TextLabel76.TextSize = 14
TextLabel76.TextXAlignment = Enum.TextXAlignment.Left
TextButton77.Name = "Add"
TextButton77.Parent = Frame71
TextButton77.Position = UDim2.new(0.800000012, 0, 0.625, 0)
TextButton77.Transparency = 0.5
TextButton77.Size = UDim2.new(0, 20, 0, 20)
TextButton77.BackgroundColor = BrickColor.new("Institutional white")
TextButton77.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton77.BackgroundTransparency = 0.5
TextButton77.BorderColor = BrickColor.new("Really black")
TextButton77.BorderColor3 = Color3.new(0, 0, 0)
TextButton77.Font = Enum.Font.SourceSansBold
TextButton77.FontSize = Enum.FontSize.Size24
TextButton77.Text = "+"
TextButton77.TextSize = 24
TextButton78.Name = "Subtract"
TextButton78.Parent = Frame71
TextButton78.Position = UDim2.new(0.899999976, 0, 0.625, 0)
TextButton78.Transparency = 0.5
TextButton78.Size = UDim2.new(0, 20, 0, 20)
TextButton78.BackgroundColor = BrickColor.new("Institutional white")
TextButton78.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton78.BackgroundTransparency = 0.5
TextButton78.BorderColor = BrickColor.new("Really black")
TextButton78.BorderColor3 = Color3.new(0, 0, 0)
TextButton78.Font = Enum.Font.SourceSansBold
TextButton78.FontSize = Enum.FontSize.Size24
TextButton78.Text = "-"
TextButton78.TextSize = 24
Frame79.Name = "ArgumentTemplate"
Frame79.Parent = Frame71
Frame79.Visible = false
Frame79.Transparency = 0.5
Frame79.Size = UDim2.new(1, 0, 0, 20)
Frame79.BackgroundColor = BrickColor.new("Institutional white")
Frame79.BackgroundColor3 = Color3.new(1, 1, 1)
Frame79.BackgroundTransparency = 0.5
Frame79.BorderColor = BrickColor.new("Light grey")
Frame79.BorderColor3 = Color3.new(0.74902, 0.74902, 0.74902)
TextButton80.Name = "Type"
TextButton80.Parent = Frame79
TextButton80.Transparency = 0.89999997615814
TextButton80.Size = UDim2.new(0.400000006, 0, 0, 20)
TextButton80.BackgroundColor = BrickColor.new("Institutional white")
TextButton80.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton80.BackgroundTransparency = 0.89999997615814
TextButton80.BorderColor = BrickColor.new("Really black")
TextButton80.BorderColor3 = Color3.new(0, 0, 0)
TextButton80.Font = Enum.Font.SourceSans
TextButton80.FontSize = Enum.FontSize.Size18
TextButton80.Text = "Script"
TextButton80.TextSize = 18
TextBox81.Name = "Value"
TextBox81.Parent = Frame79
TextBox81.Position = UDim2.new(0.400000006, 0, 0, 0)
TextBox81.Transparency = 0.89999997615814
TextBox81.Size = UDim2.new(0.600000024, -12, 0, 20)
TextBox81.BackgroundColor = BrickColor.new("Institutional white")
TextBox81.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox81.BackgroundTransparency = 0.89999997615814
TextBox81.Font = Enum.Font.SourceSans
TextBox81.FontSize = Enum.FontSize.Size14
TextBox81.Text = ""
TextBox81.TextSize = 14
TextBox81.TextXAlignment = Enum.TextXAlignment.Left
TextButton82.Name = "Cancel"
TextButton82.Parent = Frame71
TextButton82.Position = UDim2.new(0.524999976, 0, 1, -40)
TextButton82.Transparency = 0.5
TextButton82.Size = UDim2.new(0.400000006, 0, 0, 30)
TextButton82.BackgroundColor = BrickColor.new("Institutional white")
TextButton82.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton82.BackgroundTransparency = 0.5
TextButton82.BorderColor = BrickColor.new("Really black")
TextButton82.BorderColor3 = Color3.new(0, 0, 0)
TextButton82.Font = Enum.Font.SourceSans
TextButton82.FontSize = Enum.FontSize.Size18
TextButton82.Text = "Cancel"
TextButton82.TextSize = 18
TextButton83.Name = "Ok"
TextButton83.Parent = Frame71
TextButton83.Position = UDim2.new(0.075000003, 0, 1, -40)
TextButton83.Transparency = 0.5
TextButton83.Size = UDim2.new(0.400000006, 0, 0, 30)
TextButton83.BackgroundColor = BrickColor.new("Institutional white")
TextButton83.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton83.BackgroundTransparency = 0.5
TextButton83.BorderColor = BrickColor.new("Really black")
TextButton83.BorderColor3 = Color3.new(0, 0, 0)
TextButton83.Font = Enum.Font.SourceSans
TextButton83.FontSize = Enum.FontSize.Size18
TextButton83.Text = "Call"
TextButton83.TextSize = 18
Frame84.Name = "TableCaution"
Frame84.Parent = ScreenGui0
Frame84.Position = UDim2.new(0.300000012, 0, 0.300000012, 0)
Frame84.Visible = false
Frame84.Size = UDim2.new(0, 350, 0, 20)
Frame84.Active = true
Frame84.BackgroundColor = BrickColor.new("Lily white")
Frame84.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame84.BorderColor = BrickColor.new("Sand violet metallic")
Frame84.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame84.BorderSizePixel = 0
Frame84.Draggable = true
Frame84.ZIndex = 2
Frame85.Name = "MainWindow"
Frame85.Parent = Frame84
Frame85.Transparency = 0.10000000149012
Frame85.Size = UDim2.new(1, 0, 0, 150)
Frame85.BackgroundColor = BrickColor.new("Institutional white")
Frame85.BackgroundColor3 = Color3.new(1, 1, 1)
Frame85.BackgroundTransparency = 0.10000000149012
Frame85.BorderColor = BrickColor.new("Light grey")
Frame85.BorderColor3 = Color3.new(0.74902, 0.74902, 0.74902)
TextButton86.Name = "Ok"
TextButton86.Parent = Frame85
TextButton86.Position = UDim2.new(0.300000012, 0, 1, -40)
TextButton86.Transparency = 0.5
TextButton86.Size = UDim2.new(0.400000006, 0, 0, 30)
TextButton86.BackgroundColor = BrickColor.new("Institutional white")
TextButton86.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton86.BackgroundTransparency = 0.5
TextButton86.BorderColor = BrickColor.new("Really black")
TextButton86.BorderColor3 = Color3.new(0, 0, 0)
TextButton86.Font = Enum.Font.SourceSans
TextButton86.FontSize = Enum.FontSize.Size18
TextButton86.Text = "Ok"
TextButton86.TextSize = 18
ScrollingFrame87.Name = "TableResults"
ScrollingFrame87.Parent = Frame85
ScrollingFrame87.Position = UDim2.new(0, 0, 0, 20)
ScrollingFrame87.Transparency = 1
ScrollingFrame87.Size = UDim2.new(1, 0, 0, 80)
ScrollingFrame87.BackgroundColor = BrickColor.new("Institutional white")
ScrollingFrame87.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame87.BackgroundTransparency = 1
ScrollingFrame87.BottomImage = "rbxasset://textures/blackBkg_square.png"
ScrollingFrame87.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame87.MidImage = "rbxasset://textures/blackBkg_square.png"
ScrollingFrame87.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollingFrame87.TopImage = "rbxasset://textures/blackBkg_square.png"
Frame88.Name = "TableTemplate"
Frame88.Parent = Frame85
Frame88.Visible = false
Frame88.Transparency = 0.5
Frame88.Size = UDim2.new(1, 0, 0, 20)
Frame88.BackgroundColor = BrickColor.new("Institutional white")
Frame88.BackgroundColor3 = Color3.new(1, 1, 1)
Frame88.BackgroundTransparency = 0.5
Frame88.BorderColor = BrickColor.new("Light grey")
Frame88.BorderColor3 = Color3.new(0.74902, 0.74902, 0.74902)
TextLabel89.Name = "Type"
TextLabel89.Parent = Frame88
TextLabel89.Transparency = 0.89999997615814
TextLabel89.Size = UDim2.new(0.400000006, 0, 0, 20)
TextLabel89.BackgroundColor = BrickColor.new("Institutional white")
TextLabel89.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel89.BackgroundTransparency = 0.89999997615814
TextLabel89.Font = Enum.Font.SourceSans
TextLabel89.FontSize = Enum.FontSize.Size18
TextLabel89.Text = "Script"
TextLabel89.TextSize = 18
TextLabel90.Name = "Value"
TextLabel90.Parent = Frame88
TextLabel90.Position = UDim2.new(0.400000006, 0, 0, 0)
TextLabel90.Transparency = 0.89999997615814
TextLabel90.Size = UDim2.new(0.600000024, -12, 0, 20)
TextLabel90.BackgroundColor = BrickColor.new("Institutional white")
TextLabel90.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel90.BackgroundTransparency = 0.89999997615814
TextLabel90.Font = Enum.Font.SourceSans
TextLabel90.FontSize = Enum.FontSize.Size14
TextLabel90.Text = "Script"
TextLabel90.TextSize = 14
TextLabel91.Name = "Title"
TextLabel91.Parent = Frame84
TextLabel91.Transparency = 1
TextLabel91.Size = UDim2.new(1, 0, 1, 0)
TextLabel91.BackgroundTransparency = 1
TextLabel91.ZIndex = 2
TextLabel91.Font = Enum.Font.SourceSans
TextLabel91.FontSize = Enum.FontSize.Size14
TextLabel91.Text = "Caution"
TextLabel91.TextColor = BrickColor.new("Really black")
TextLabel91.TextColor3 = Color3.new(0, 0, 0)
TextLabel91.TextSize = 14
TextLabel91.TextXAlignment = Enum.TextXAlignment.Left
Frame92.Name = "ScriptEditor"
Frame92.Parent = ScreenGui0
Frame92.Position = UDim2.new(0.5, -258, 0.5, -208)
Frame92.Visible = false
Frame92.Size = UDim2.new(0, 516, 0, 20)
Frame92.Active = true
Frame92.BackgroundColor = BrickColor.new("Lily white")
Frame92.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame92.BorderColor = BrickColor.new("Sand violet metallic")
Frame92.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame92.Draggable = true
Frame92.ZIndex = 5
TextLabel93.Name = "Title"
TextLabel93.Parent = Frame92
TextLabel93.Transparency = 1
TextLabel93.Size = UDim2.new(1, 0, 1, 0)
TextLabel93.BackgroundTransparency = 1
TextLabel93.ZIndex = 5
TextLabel93.Font = Enum.Font.SourceSans
TextLabel93.FontSize = Enum.FontSize.Size14
TextLabel93.Text = "Script Viewer"
TextLabel93.TextColor = BrickColor.new("Really black")
TextLabel93.TextColor3 = Color3.new(0, 0, 0)
TextLabel93.TextSize = 14
TextLabel93.TextXAlignment = Enum.TextXAlignment.Left
Frame94.Name = "Cover"
Frame94.Parent = Frame92
Frame94.Position = UDim2.new(0, 0, 3, 0)
Frame94.Size = UDim2.new(0, 516, 0, 416)
Frame94.BackgroundColor = BrickColor.new("Institutional white")
Frame94.BackgroundColor3 = Color3.new(1, 1, 1)
Frame94.BorderSizePixel = 0
Frame95.Name = "EditorGrid"
Frame95.Parent = Frame92
Frame95.Position = UDim2.new(0, 0, 3, 0)
Frame95.Size = UDim2.new(0, 500, 0, 400)
Frame95.BackgroundColor = BrickColor.new("Institutional white")
Frame95.BackgroundColor3 = Color3.new(1, 1, 1)
Frame95.BorderSizePixel = 0
Frame96.Name = "TopBar"
Frame96.Parent = Frame92
Frame96.Size = UDim2.new(1, 0, 3, 0)
Frame96.BackgroundColor = BrickColor.new("White")
Frame96.BackgroundColor3 = Color3.new(0.941177, 0.941177, 0.941177)
Frame96.BorderColor = BrickColor.new("Sand violet metallic")
Frame96.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
ImageButton97.Name = "ScriptBarLeft"
ImageButton97.Parent = Frame96
ImageButton97.Position = UDim2.new(1, -32, 0, 40)
ImageButton97.Size = UDim2.new(0, 16, 0, 20)
ImageButton97.Active = false
ImageButton97.BackgroundColor = BrickColor.new("Quill grey")
ImageButton97.BackgroundColor3 = Color3.new(0.866667, 0.866667, 0.866667)
ImageButton97.BorderColor = BrickColor.new("Sand violet metallic")
ImageButton97.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
ImageButton97.AutoButtonColor = false
Frame98.Name = "Arrow Graphic"
Frame98.Parent = ImageButton97
Frame98.Position = UDim2.new(0.5, -4, 0.5, -4)
Frame98.Transparency = 1
Frame98.Size = UDim2.new(0, 8, 0, 8)
Frame98.BackgroundTransparency = 1
Frame98.BorderSizePixel = 0
Frame99.Name = "Graphic"
Frame99.Parent = Frame98
Frame99.Position = UDim2.new(0.25, 0, 0.375, 0)
Frame99.Transparency = 0.69999998807907
Frame99.Size = UDim2.new(0.125, 0, 0.25, 0)
Frame99.BackgroundColor = BrickColor.new("Sand violet metallic")
Frame99.BackgroundColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame99.BackgroundTransparency = 0.69999998807907
Frame99.BorderSizePixel = 0
Frame100.Name = "Graphic"
Frame100.Parent = Frame98
Frame100.Position = UDim2.new(0.375, 0, 0.25, 0)
Frame100.Transparency = 0.69999998807907
Frame100.Size = UDim2.new(0.125, 0, 0.5, 0)
Frame100.BackgroundColor = BrickColor.new("Sand violet metallic")
Frame100.BackgroundColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame100.BackgroundTransparency = 0.69999998807907
Frame100.BorderSizePixel = 0
Frame101.Name = "Graphic"
Frame101.Parent = Frame98
Frame101.Position = UDim2.new(0.5, 0, 0.125, 0)
Frame101.Transparency = 0.69999998807907
Frame101.Size = UDim2.new(0.125, 0, 0.75, 0)
Frame101.BackgroundColor = BrickColor.new("Sand violet metallic")
Frame101.BackgroundColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame101.BackgroundTransparency = 0.69999998807907
Frame101.BorderSizePixel = 0
Frame102.Name = "Graphic"
Frame102.Parent = Frame98
Frame102.Position = UDim2.new(0.625, 0, 0, 0)
Frame102.Transparency = 0.69999998807907
Frame102.Size = UDim2.new(0.125, 0, 1, 0)
Frame102.BackgroundColor = BrickColor.new("Sand violet metallic")
Frame102.BackgroundColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame102.BackgroundTransparency = 0.69999998807907
Frame102.BorderSizePixel = 0
ImageButton103.Name = "ScriptBarRight"
ImageButton103.Parent = Frame96
ImageButton103.Position = UDim2.new(1, -16, 0, 40)
ImageButton103.Size = UDim2.new(0, 16, 0, 20)
ImageButton103.Active = false
ImageButton103.BackgroundColor = BrickColor.new("Quill grey")
ImageButton103.BackgroundColor3 = Color3.new(0.866667, 0.866667, 0.866667)
ImageButton103.BorderColor = BrickColor.new("Sand violet metallic")
ImageButton103.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
ImageButton103.AutoButtonColor = false
Frame104.Name = "Arrow Graphic"
Frame104.Parent = ImageButton103
Frame104.Position = UDim2.new(0.5, -4, 0.5, -4)
Frame104.Transparency = 1
Frame104.Size = UDim2.new(0, 8, 0, 8)
Frame104.BackgroundTransparency = 1
Frame104.BorderSizePixel = 0
Frame105.Name = "Graphic"
Frame105.Parent = Frame104
Frame105.Position = UDim2.new(0.625, 0, 0.375, 0)
Frame105.Transparency = 0.69999998807907
Frame105.Size = UDim2.new(0.125, 0, 0.25, 0)
Frame105.BackgroundColor = BrickColor.new("Sand violet metallic")
Frame105.BackgroundColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame105.BackgroundTransparency = 0.69999998807907
Frame105.BorderSizePixel = 0
Frame106.Name = "Graphic"
Frame106.Parent = Frame104
Frame106.Position = UDim2.new(0.5, 0, 0.25, 0)
Frame106.Transparency = 0.69999998807907
Frame106.Size = UDim2.new(0.125, 0, 0.5, 0)
Frame106.BackgroundColor = BrickColor.new("Sand violet metallic")
Frame106.BackgroundColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame106.BackgroundTransparency = 0.69999998807907
Frame106.BorderSizePixel = 0
Frame107.Name = "Graphic"
Frame107.Parent = Frame104
Frame107.Position = UDim2.new(0.375, 0, 0.125, 0)
Frame107.Transparency = 0.69999998807907
Frame107.Size = UDim2.new(0.125, 0, 0.75, 0)
Frame107.BackgroundColor = BrickColor.new("Sand violet metallic")
Frame107.BackgroundColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame107.BackgroundTransparency = 0.69999998807907
Frame107.BorderSizePixel = 0
Frame108.Name = "Graphic"
Frame108.Parent = Frame104
Frame108.Position = UDim2.new(0.25, 0, 0, 0)
Frame108.Transparency = 0.69999998807907
Frame108.Size = UDim2.new(0.125, 0, 1, 0)
Frame108.BackgroundColor = BrickColor.new("Sand violet metallic")
Frame108.BackgroundColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame108.BackgroundTransparency = 0.69999998807907
Frame108.BorderSizePixel = 0
TextButton109.Name = "Clipboard"
TextButton109.Parent = Frame96
TextButton109.Position = UDim2.new(0, 0, 0, 20)
TextButton109.Transparency = 0.5
TextButton109.Size = UDim2.new(0, 80, 0, 20)
TextButton109.BackgroundColor = BrickColor.new("Institutional white")
TextButton109.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton109.BackgroundTransparency = 0.5
TextButton109.BorderColor = BrickColor.new("Really black")
TextButton109.BorderColor3 = Color3.new(0, 0, 0)
TextButton109.Font = Enum.Font.SourceSans
TextButton109.FontSize = Enum.FontSize.Size14
TextButton109.Text = "To Clipboard"
TextButton109.TextSize = 14
Frame110.Name = "ScriptBar"
Frame110.Parent = Frame96
Frame110.Position = UDim2.new(0, 0, 0, 40)
Frame110.Size = UDim2.new(1, -32, 0, 20)
Frame110.BackgroundColor = BrickColor.new("Mid gray")
Frame110.BackgroundColor3 = Color3.new(0.823529, 0.823529, 0.823529)
Frame110.BorderColor = BrickColor.new("Sand violet metallic")
Frame110.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame110.ClipsDescendants = true
Frame111.Name = "Entry"
Frame111.Parent = Frame96
Frame111.Visible = false
Frame111.Transparency = 1
Frame111.Size = UDim2.new(0, 100, 1, 0)
Frame111.BackgroundColor = BrickColor.new("Institutional white")
Frame111.BackgroundColor3 = Color3.new(1, 1, 1)
Frame111.BackgroundTransparency = 1
TextButton112.Name = "Button"
TextButton112.Parent = Frame111
TextButton112.Transparency = 0.60000002384186
TextButton112.Size = UDim2.new(1, 0, 1, 0)
TextButton112.BackgroundColor = BrickColor.new("Institutional white")
TextButton112.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton112.BackgroundTransparency = 0.60000002384186
TextButton112.BorderColor = BrickColor.new("Really black")
TextButton112.BorderColor3 = Color3.new(0, 0, 0)
TextButton112.ClipsDescendants = true
TextButton112.ZIndex = 4
TextButton112.Font = Enum.Font.SourceSans
TextButton112.FontSize = Enum.FontSize.Size12
TextButton112.Text = ""
TextButton112.TextSize = 12
TextButton112.TextXAlignment = Enum.TextXAlignment.Left
TextButton113.Name = "Close"
TextButton113.Parent = Frame111
TextButton113.Position = UDim2.new(1, -20, 0, 0)
TextButton113.Transparency = 1
TextButton113.Size = UDim2.new(0, 20, 0, 20)
TextButton113.BackgroundColor = BrickColor.new("Institutional white")
TextButton113.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton113.BackgroundTransparency = 1
TextButton113.BorderColor = BrickColor.new("Really black")
TextButton113.BorderColor3 = Color3.new(0, 0, 0)
TextButton113.ZIndex = 4
TextButton113.Font = Enum.Font.SourceSans
TextButton113.FontSize = Enum.FontSize.Size14
TextButton113.Text = "X"
TextButton113.TextSize = 14
BindableEvent114.Name = "OpenScript"
BindableEvent114.Parent = Frame92
LocalScript115.Parent = Frame92
table.insert(cors,sandbox(LocalScript115,function()
local top = script.Parent

local editorGrid = top:WaitForChild("EditorGrid")

local currentSource = ""

local currentEditor = {
	x = 0,
	y = 0
}

local userInput = game:GetService("UserInputService")
local mouse = game:GetService("Players").LocalPlayer:GetMouse()

local topBar = top:WaitForChild("TopBar")
local scriptBar = topBar:WaitForChild("ScriptBar")
local scriptBarLeft = topBar:WaitForChild("ScriptBarLeft")
local scriptBarRight = topBar:WaitForChild("ScriptBarRight")
local clipboardButton = topBar:WaitForChild("Clipboard")

local entryTemplate = topBar:WaitForChild("Entry")

local openEvent = top:WaitForChild("OpenScript")

local closeButton = top:WaitForChild("Close")

local memoryScripts = {}

local editingIndex = 0

-- Scrollbar

local ScrollBarWidth = 16

local ScrollStyles = {
	Background      = Color3.new(233/255, 233/255, 233/255);
	Border          = Color3.new(149/255, 149/255, 149/255);
	Selected        = Color3.new( 63/255, 119/255, 189/255);
	BorderSelected  = Color3.new( 55/255, 106/255, 167/255);
	Text            = Color3.new(  0/255,   0/255,   0/255);
	TextDisabled    = Color3.new(128/255, 128/255, 128/255);
	TextSelected    = Color3.new(255/255, 255/255, 255/255);
	Button          = Color3.new(221/255, 221/255, 221/255);
	ButtonBorder    = Color3.new(149/255, 149/255, 149/255);
	ButtonSelected  = Color3.new(255/255,   0/255,   0/255);
	Field           = Color3.new(255/255, 255/255, 255/255);
	FieldBorder     = Color3.new(191/255, 191/255, 191/255);
	TitleBackground = Color3.new(178/255, 178/255, 178/255);
}
do
	local ZIndexLock = {}
	function SetZIndex(object,z)
		if not ZIndexLock[object] then
			ZIndexLock[object] = true
			if object:IsA'GuiObject' then
				object.ZIndex = z
			end
			local children = object:GetChildren()
			for i = 1,#children do
				SetZIndex(children[i],z)
			end
			ZIndexLock[object] = nil
		end
	end
end
function SetZIndexOnChanged(object)
	return object.Changed:connect(function(p)
		if p == "ZIndex" then
			SetZIndex(object,object.ZIndex)
		end
	end)
end
function Create(ty,data)
	local obj
	if type(ty) == 'string' then
		obj = Instance.new(ty)
	else
		obj = ty
	end
	for k, v in pairs(data) do
		if type(k) == 'number' then
			v.Parent = obj
		else
			obj[k] = v
		end
	end
	return obj
end
-- returns the ascendant ScreenGui of an object
function GetScreen(screen)
	if screen == nil then return nil end
	while not screen:IsA("ScreenGui") do
		screen = screen.Parent
		if screen == nil then return nil end
	end
	return screen
end
-- AutoButtonColor doesn't always reset properly
function ResetButtonColor(button)
	local active = button.Active
	button.Active = not active
	button.Active = active
end

function ArrowGraphic(size,dir,scaled,template)
	local Frame = Create('Frame',{
		Name = "Arrow Graphic";
		BorderSizePixel = 0;
		Size = UDim2.new(0,size,0,size);
		Transparency = 1;
	})
	if not template then
		template = Instance.new("Frame")
		template.BorderSizePixel = 0
	end

	local transform
	if dir == nil or dir == 'Up' then
		function transform(p,s) return p,s end
	elseif dir == 'Down' then
		function transform(p,s) return UDim2.new(0,p.X.Offset,0,size-p.Y.Offset-1),s end
	elseif dir == 'Left' then
		function transform(p,s) return UDim2.new(0,p.Y.Offset,0,p.X.Offset),UDim2.new(0,s.Y.Offset,0,s.X.Offset) end
	elseif dir == 'Right' then
		function transform(p,s) return UDim2.new(0,size-p.Y.Offset-1,0,p.X.Offset),UDim2.new(0,s.Y.Offset,0,s.X.Offset) end
	end

	local scale
	if scaled then
		function scale(p,s) return UDim2.new(p.X.Offset/size,0,p.Y.Offset/size,0),UDim2.new(s.X.Offset/size,0,s.Y.Offset/size,0) end
	else
		function scale(p,s) return p,s end
	end

	local o = math.floor(size/4)
	if size%2 == 0 then
		local n = size/2-1
		for i = 0,n do
			local t = template:Clone()
			local p,s = scale(transform(
				UDim2.new(0,n-i,0,o+i),
				UDim2.new(0,(i+1)*2,0,1)
			))
			t.Position = p
			t.Size = s
			t.Parent = Frame
		end
	else
		local n = (size-1)/2
		for i = 0,n do
			local t = template:Clone()
			local p,s = scale(transform(
				UDim2.new(0,n-i,0,o+i),
				UDim2.new(0,i*2+1,0,1)
			))
			t.Position = p
			t.Size = s
			t.Parent = Frame
		end
	end
	if size%4 > 1 then
		local t = template:Clone()
		local p,s = scale(transform(
			UDim2.new(0,0,0,size-o-1),
			UDim2.new(0,size,0,1)
		))
		t.Position = p
		t.Size = s
		t.Parent = Frame
	end
	return Frame
end

function GripGraphic(size,dir,spacing,scaled,template)
	local Frame = Create('Frame',{
		Name = "Grip Graphic";
		BorderSizePixel = 0;
		Size = UDim2.new(0,size.x,0,size.y);
		Transparency = 1;
	})
	if not template then
		template = Instance.new("Frame")
		template.BorderSizePixel = 0
	end

	spacing = spacing or 2

	local scale
	if scaled then
		function scale(p) return UDim2.new(p.X.Offset/size.x,0,p.Y.Offset/size.y,0) end
	else
		function scale(p) return p end
	end

	if dir == 'Vertical' then
		for i=0,size.x-1,spacing do
			local t = template:Clone()
			t.Size = scale(UDim2.new(0,1,0,size.y))
			t.Position = scale(UDim2.new(0,i,0,0))
			t.Parent = Frame
		end
	elseif dir == nil or dir == 'Horizontal' then
		for i=0,size.y-1,spacing do
			local t = template:Clone()
			t.Size = scale(UDim2.new(0,size.x,0,1))
			t.Position = scale(UDim2.new(0,0,0,i))
			t.Parent = Frame
		end
	end

	return Frame
end

do
	local mt = {
		__index = {
			GetScrollPercent = function(self)
				return self.ScrollIndex/(self.TotalSpace-self.VisibleSpace)
			end;
			CanScrollDown = function(self)
				return self.ScrollIndex + self.VisibleSpace < self.TotalSpace
			end;
			CanScrollUp = function(self)
				return self.ScrollIndex > 0
			end;
			ScrollDown = function(self)
				self.ScrollIndex = self.ScrollIndex + self.PageIncrement
				self:Update()
			end;
			ScrollUp = function(self)
				self.ScrollIndex = self.ScrollIndex - self.PageIncrement
				self:Update()
			end;
			ScrollTo = function(self,index)
				self.ScrollIndex = index
				self:Update()
			end;
			SetScrollPercent = function(self,percent)
				self.ScrollIndex = math.floor((self.TotalSpace - self.VisibleSpace)*percent + 0.5)
				self:Update()
			end;
		};
	}
	mt.__index.CanScrollRight = mt.__index.CanScrollDown
	mt.__index.CanScrollLeft = mt.__index.CanScrollUp
	mt.__index.ScrollLeft = mt.__index.ScrollUp
	mt.__index.ScrollRight = mt.__index.ScrollDown

	function ScrollBar(horizontal)
		-- create row scroll bar
		local ScrollFrame = Create('Frame',{
			Name = "ScrollFrame";
			Position = horizontal and UDim2.new(0,0,1,-ScrollBarWidth) or UDim2.new(1,-ScrollBarWidth,0,0);
			Size = horizontal and UDim2.new(1,0,0,ScrollBarWidth) or UDim2.new(0,ScrollBarWidth,1,0);
			BackgroundTransparency = 1;
			Create('ImageButton',{
				Name = "ScrollDown";
				Position = horizontal and UDim2.new(1,-ScrollBarWidth,0,0) or UDim2.new(0,0,1,-ScrollBarWidth);
				Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
				BackgroundColor3 = ScrollStyles.Button;
				BorderColor3 = ScrollStyles.Border;
				--BorderSizePixel = 0;
			});
			Create('ImageButton',{
				Name = "ScrollUp";
				Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
				BackgroundColor3 = ScrollStyles.Button;
				BorderColor3 = ScrollStyles.Border;
				--BorderSizePixel = 0;
			});
			Create('ImageButton',{
				Name = "ScrollBar";
				Size = horizontal and UDim2.new(1,-ScrollBarWidth*2,1,0) or UDim2.new(1,0,1,-ScrollBarWidth*2);
				Position = horizontal and UDim2.new(0,ScrollBarWidth,0,0) or UDim2.new(0,0,0,ScrollBarWidth);
				AutoButtonColor = false;
				BackgroundColor3 = Color3.new(0.94902, 0.94902, 0.94902);
				BorderColor3 = ScrollStyles.Border;
				--BorderSizePixel = 0;
				Create('ImageButton',{
					Name = "ScrollThumb";
					AutoButtonColor = false;
					Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
					BackgroundColor3 = ScrollStyles.Button;
					BorderColor3 = ScrollStyles.Border;
					--BorderSizePixel = 0;
				});
			});
		})

		local graphicTemplate = Create('Frame',{
			Name="Graphic";
			BorderSizePixel = 0;
			BackgroundColor3 = ScrollStyles.Border;
		})
		local graphicSize = ScrollBarWidth/2

		local ScrollDownFrame = ScrollFrame.ScrollDown
			local ScrollDownGraphic = ArrowGraphic(graphicSize,horizontal and 'Right' or 'Down',true,graphicTemplate)
			ScrollDownGraphic.Position = UDim2.new(0.5,-graphicSize/2,0.5,-graphicSize/2)
			ScrollDownGraphic.Parent = ScrollDownFrame
		local ScrollUpFrame = ScrollFrame.ScrollUp
			local ScrollUpGraphic = ArrowGraphic(graphicSize,horizontal and 'Left' or 'Up',true,graphicTemplate)
			ScrollUpGraphic.Position = UDim2.new(0.5,-graphicSize/2,0.5,-graphicSize/2)
			ScrollUpGraphic.Parent = ScrollUpFrame
		local ScrollBarFrame = ScrollFrame.ScrollBar
		local ScrollThumbFrame = ScrollBarFrame.ScrollThumb
		do
			local size = ScrollBarWidth*3/8
			local Decal = GripGraphic(Vector2.new(size,size),horizontal and 'Vertical' or 'Horizontal',2,graphicTemplate)
			Decal.Position = UDim2.new(0.5,-size/2,0.5,-size/2)
			Decal.Parent = ScrollThumbFrame
		end

		local MouseDrag = Create('ImageButton',{
			Name = "MouseDrag";
			Position = UDim2.new(-0.25,0,-0.25,0);
			Size = UDim2.new(1.5,0,1.5,0);
			Transparency = 1;
			AutoButtonColor = false;
			Active = true;
			ZIndex = 10;
		})

		local Class = setmetatable({
			GUI = ScrollFrame;
			ScrollIndex = 0;
			VisibleSpace = 0;
			TotalSpace = 0;
			PageIncrement = 1;
		},mt)

		local UpdateScrollThumb
		if horizontal then
			function UpdateScrollThumb()
				ScrollThumbFrame.Size = UDim2.new(Class.VisibleSpace/Class.TotalSpace,0,0,ScrollBarWidth)
				if ScrollThumbFrame.AbsoluteSize.x < ScrollBarWidth then
					ScrollThumbFrame.Size = UDim2.new(0,ScrollBarWidth,0,ScrollBarWidth)
				end
				local barSize = ScrollBarFrame.AbsoluteSize.x
				ScrollThumbFrame.Position = UDim2.new(Class:GetScrollPercent()*(barSize - ScrollThumbFrame.AbsoluteSize.x)/barSize,0,0,0)
			end
		else
			function UpdateScrollThumb()
				ScrollThumbFrame.Size = UDim2.new(0,ScrollBarWidth,Class.VisibleSpace/Class.TotalSpace,0)
				if ScrollThumbFrame.AbsoluteSize.y < ScrollBarWidth then
					ScrollThumbFrame.Size = UDim2.new(0,ScrollBarWidth,0,ScrollBarWidth)
				end
				local barSize = ScrollBarFrame.AbsoluteSize.y
				ScrollThumbFrame.Position = UDim2.new(0,0,Class:GetScrollPercent()*(barSize - ScrollThumbFrame.AbsoluteSize.y)/barSize,0)
			end
		end

		local lastDown
		local lastUp
		local scrollStyle = {BackgroundColor3=ScrollStyles.Border,BackgroundTransparency=0}
		local scrollStyle_ds = {BackgroundColor3=ScrollStyles.Border,BackgroundTransparency=0.7}

		local function Update()
			local t = Class.TotalSpace
			local v = Class.VisibleSpace
			local s = Class.ScrollIndex
			if v <= t then
				if s > 0 then
					if s + v > t then
						Class.ScrollIndex = t - v
					end
				else
					Class.ScrollIndex = 0
				end
			else
				Class.ScrollIndex = 0
			end

			if Class.UpdateCallback then
				if Class.UpdateCallback(Class) == false then
					return
				end
			end

			local down = Class:CanScrollDown()
			local up = Class:CanScrollUp()
			if down ~= lastDown then
				lastDown = down
				ScrollDownFrame.Active = down
				ScrollDownFrame.AutoButtonColor = down
				local children = ScrollDownGraphic:GetChildren()
				local style = down and scrollStyle or scrollStyle_ds
				for i = 1,#children do
					Create(children[i],style)
				end
			end
			if up ~= lastUp then
				lastUp = up
				ScrollUpFrame.Active = up
				ScrollUpFrame.AutoButtonColor = up
				local children = ScrollUpGraphic:GetChildren()
				local style = up and scrollStyle or scrollStyle_ds
				for i = 1,#children do
					Create(children[i],style)
				end
			end
			ScrollThumbFrame.Visible = down or up
			UpdateScrollThumb()
		end
		Class.Update = Update

		SetZIndexOnChanged(ScrollFrame)

		local scrollEventID = 0
		ScrollDownFrame.MouseButton1Down:connect(function()
			scrollEventID = tick()
			local current = scrollEventID
			local up_con
			up_con = MouseDrag.MouseButton1Up:connect(function()
				scrollEventID = tick()
				MouseDrag.Parent = nil
				ResetButtonColor(ScrollDownFrame)
				up_con:disconnect(); drag = nil
			end)
			MouseDrag.Parent = GetScreen(ScrollFrame)
			Class:ScrollDown()
			wait(0.2) -- delay before auto scroll
			while scrollEventID == current do
				Class:ScrollDown()
				if not Class:CanScrollDown() then break end
				wait()
			end
		end)

		ScrollDownFrame.MouseButton1Up:connect(function()
			scrollEventID = tick()
		end)

		ScrollUpFrame.MouseButton1Down:connect(function()
			scrollEventID = tick()
			local current = scrollEventID
			local up_con
			up_con = MouseDrag.MouseButton1Up:connect(function()
				scrollEventID = tick()
				MouseDrag.Parent = nil
				ResetButtonColor(ScrollUpFrame)
				up_con:disconnect(); drag = nil
			end)
			MouseDrag.Parent = GetScreen(ScrollFrame)
			Class:ScrollUp()
			wait(0.2)
			while scrollEventID == current do
				Class:ScrollUp()
				if not Class:CanScrollUp() then break end
				wait()
			end
		end)

		ScrollUpFrame.MouseButton1Up:connect(function()
			scrollEventID = tick()
		end)

		if horizontal then
			ScrollBarFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local current = scrollEventID
				local up_con
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollUpFrame)
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
				if x > ScrollThumbFrame.AbsolutePosition.x then
					Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if x < ScrollThumbFrame.AbsolutePosition.x + ScrollThumbFrame.AbsoluteSize.x then break end
						Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
						wait()
					end
				else
					Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if x > ScrollThumbFrame.AbsolutePosition.x then break end
						Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
						wait()
					end
				end
			end)
		else
			ScrollBarFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local current = scrollEventID
				local up_con
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollUpFrame)
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
				if y > ScrollThumbFrame.AbsolutePosition.y then
					Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if y < ScrollThumbFrame.AbsolutePosition.y + ScrollThumbFrame.AbsoluteSize.y then break end
						Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
						wait()
					end
				else
					Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if y > ScrollThumbFrame.AbsolutePosition.y then break end
						Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
						wait()
					end
				end
			end)
		end

		if horizontal then
			ScrollThumbFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local mouse_offset = x - ScrollThumbFrame.AbsolutePosition.x
				local drag_con
				local up_con
				drag_con = MouseDrag.MouseMoved:connect(function(x,y)
					local bar_abs_pos = ScrollBarFrame.AbsolutePosition.x
					local bar_drag = ScrollBarFrame.AbsoluteSize.x - ScrollThumbFrame.AbsoluteSize.x
					local bar_abs_one = bar_abs_pos + bar_drag
					x = x - mouse_offset
					x = x < bar_abs_pos and bar_abs_pos or x > bar_abs_one and bar_abs_one or x
					x = x - bar_abs_pos
					Class:SetScrollPercent(x/(bar_drag))
				end)
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollThumbFrame)
					drag_con:disconnect(); drag_con = nil
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
			end)
		else
			ScrollThumbFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local mouse_offset = y - ScrollThumbFrame.AbsolutePosition.y
				local drag_con
				local up_con
				drag_con = MouseDrag.MouseMoved:connect(function(x,y)
					local bar_abs_pos = ScrollBarFrame.AbsolutePosition.y
					local bar_drag = ScrollBarFrame.AbsoluteSize.y - ScrollThumbFrame.AbsoluteSize.y
					local bar_abs_one = bar_abs_pos + bar_drag
					y = y - mouse_offset
					y = y < bar_abs_pos and bar_abs_pos or y > bar_abs_one and bar_abs_one or y
					y = y - bar_abs_pos
					Class:SetScrollPercent(y/(bar_drag))
				end)
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollThumbFrame)
					drag_con:disconnect(); drag_con = nil
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
			end)
		end

		function Class:Destroy()
			ScrollFrame:Destroy()
			MouseDrag:Destroy()
			for k in pairs(Class) do
				Class[k] = nil
			end
			setmetatable(Class,nil)
		end

		Update()

		return Class
	end
end

-- End Scrollbar

local scrollBar = ScrollBar(false)
scrollBar.PageIncrement = 16
Create(scrollBar.GUI,{
	Position = UDim2.new(1,0,0,0);
	Size = UDim2.new(0,ScrollBarWidth,1,0);
	Parent = editorGrid;
})

local scrollBarH = ScrollBar(true)
scrollBarH.PageIncrement = 8
Create(scrollBarH.GUI,{
	Position = UDim2.new(0,0,1,0);
	Size = UDim2.new(1,0,0,ScrollBarWidth);
	Parent = editorGrid;
})

local entries = {}

local grid = {}

local count = 1
local xCount = 1

local lineSpan = 0

for i = 0,490,8 do
	local newRow = {}
	for j = 0,390,16 do
		local cellText = Instance.new("TextLabel",editorGrid)
		cellText.BackgroundTransparency = 1
		cellText.BorderSizePixel = 0
		cellText.Text = ""
		cellText.Position = UDim2.new(0,i,0,j)
		cellText.Size = UDim2.new(0,8,0,16)
		cellText.Font = Enum.Font.SourceSans
		cellText.FontSize = Enum.FontSize.Size18
		table.insert(newRow,cellText)
		xCount = xCount + 1
	end
	table.insert(grid,newRow)
	count = count + 1
	xCount = 1
end

local syntaxHighlightList = {
	{["Keyword"] = "for", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "local", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "if", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "then", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "do", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "while", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "end", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "function", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "string", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "table", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "game", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "workspace", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "return", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "break", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "elseif", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "in", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "pairs", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true},
	{["Keyword"] = "ipairs", ["Color"] = Color3.new(0, 0, 127/255), ["Independent"] = true}
}

function checkMouseInGui(gui)
	if gui == nil then return false end
	local plrMouse = game:GetService("Players").LocalPlayer:GetMouse()
	local guiPosition = gui.AbsolutePosition
	local guiSize = gui.AbsoluteSize	
	
	if plrMouse.X >= guiPosition.x and plrMouse.X <= guiPosition.x + guiSize.x and plrMouse.Y >= guiPosition.y and plrMouse.Y <= guiPosition.y + guiSize.y then
		return true
	else
		return false
	end
end

function AddZeros(num,reach)
	local toConvert = tostring(num)
	while #toConvert < reach do
		toConvert = " "..toConvert
	end
	return toConvert
end

function buildScript(source,xOff,yOff,override)
	local buildingRows = true
	local buildScr = source
	
	local totalLines = 0
	
	--print(xOff,yOff)
	
	if currentSource ~= source then
		currentSource = source
	end

	if override then
		currentSource = source
		entries = {}
		while buildingRows do
			local x,y = string.find(buildScr,"\n")
			if x and y then
				table.insert(entries,string.sub(buildScr,1,y))
				buildScr = string.sub(buildScr,y+1,string.len(buildScr))
			else
				buildingRows = false
				table.insert(entries,buildScr)
			end
		end
	end
	
	totalLines = #entries
	lineSpan = #tostring(totalLines)
	
	if lineSpan == 1 then lineSpan = 2 end
	
	local currentRow = 1
	local currentColumn = 2 + lineSpan
	
	local colorTime = 0
	local colorReplace = nil
	
	local inString = false
	
	local workingEntries = entries
	
	--[[
	for i,v in pairs(entries) do
		table.insert(workingEntries,v)
	end
	
	for i = 1,yOff do
		table.remove(workingEntries,1)
	end
	--]]
	
	local delayance = xOff

	for i = 1,#grid do
		for j = 1,#grid[i] do
			if i <= lineSpan then
				local newNum = AddZeros(yOff + j,lineSpan)
				local newDigit =  string.sub(newNum,i,i)
				if newDigit == " " then
					grid[i][j].Text = ""
				else
					grid[i][j].Text = newDigit
				end
				grid[i][j].BackgroundTransparency = 0
				grid[i][j].BackgroundColor3 = Color3.new(163/255, 162/255, 165/255)
				--grid[i][j].Font = Enum.Font.SourceSansBold
			elseif i == lineSpan + 1 then
				grid[i][j].Text = ""
				grid[i][j].BackgroundTransparency = 0
				grid[i][j].BackgroundColor3 = Color3.new(200/255, 200/255, 200/255)
				--grid[i][j].Font = Enum.Font.SourceSans
			else
				grid[i][j].Text = ""
				grid[i][j].BackgroundTransparency = 1
				--grid[i][j].Font = Enum.Font.SourceSans
			end
		end
	end
	
	while true do
		if currentRow > #workingEntries or currentRow > #grid[1] then break end
		local entry = workingEntries[currentRow+yOff]
		while string.len(entry) > 0 do
			if string.sub(entry,1,1) == "\t" then entry = "    "..string.sub(entry,2) end
			
			if currentColumn > #grid then break end
			
			if delayance == 0 then
				grid[currentColumn][currentRow].Text = string.sub(entry,1,1)
			end
			
			-- Coloring
			
			if not inString then
				for i,v in pairs(syntaxHighlightList) do
					if string.sub(entry,1,string.len(v["Keyword"])) == v["Keyword"] then
						if v["Independent"] then
							local outCheck = string.len(v["Keyword"])+1
							local outEntry = string.sub(entry,outCheck,outCheck)
							if not string.find(outEntry,"%w") then
								colorTime = string.len(v["Keyword"])
								colorReplace = v["Color"]
							end
						else
							colorTime = string.len(v["Keyword"])
							colorReplace = v["Color"]
						end
					end
				end
			end
			
			if string.sub(entry,1,1) == "\"" and string.match(entry,"\".+\"") then
				inString = true
				colorTime = string.len(string.match(entry,"\".+\""))
				colorReplace = Color3.new(170/255, 0, 1)
			end
			
			if colorTime > 0 then
				colorTime = colorTime - 1
				grid[currentColumn][currentRow].TextColor3 = colorReplace
				if colorTime == 0 then inString = false end
			else
				grid[currentColumn][currentRow].TextColor3 = Color3.new(0,0,0)
				inString = false
			end
			
			if delayance == 0 then
				currentColumn = currentColumn + 1
			else
				delayance = delayance - 1
			end
			entry = string.sub(entry,2,string.len(entry))
		end
		currentRow = currentRow + 1
		currentColumn = 2 + lineSpan
		colorTime = 0
		delayance = xOff
		inString = false
	end
end

function scrollBar.UpdateCallback(self)
	scrollBar.TotalSpace = #entries * 16
	scrollBar.VisibleSpace = editorGrid.AbsoluteSize.Y
	buildScript(currentSource,math.floor(scrollBarH.ScrollIndex/8),math.floor(scrollBar.ScrollIndex/16))
end

function scrollBarH.UpdateCallback(self)
	scrollBarH.TotalSpace = (getLongestEntry(entries) + 1 + lineSpan) * 8
	scrollBarH.VisibleSpace = editorGrid.AbsoluteSize.X
	buildScript(currentSource,math.floor(scrollBarH.ScrollIndex/8),math.floor(scrollBar.ScrollIndex/16))
end

function getLongestEntry(tab)
	local longest = 0
	for i,v in pairs(tab) do
		if string.len(v) > longest then
			longest = string.len(v)
		end
	end
	return longest
end

function decompileS(obj)
	local src = "print(\"Hello world!\")"
	pcall(function()
		if obj.Source ~= "" then
			src = obj.Source
		else
			src = decompile(obj)
		end
	end)
	return src
end

function openScript(scrObj)
	if scrObj:IsA("LocalScript") then
		scrObj.Archivable = true
		scrObj = scrObj:Clone()
		scrObj.Disabled = true
	end
	
	local scrName = scrObj.Name
	local scrSource = decompileS(scrObj)
	
	table.insert(memoryScripts,{Name = scrName,Source = scrSource})
	
	local newTab = entryTemplate:Clone()
	newTab.Button.Text = scrName
	newTab.Position = UDim2.new(0,#scriptBar:GetChildren() * 100,0,0)
	newTab.Visible = true
	
	newTab.Button.MouseButton1Down:connect(function()
		for i,v in pairs(scriptBar:GetChildren()) do
			if v == newTab then
				editingIndex = i
				buildScript(memoryScripts[i].Source,0,0,true)
				scrollBar:ScrollTo(1)
				scrollBar:Update()
				scrollBarH:ScrollTo(1)
				scrollBarH:Update()
			end
		end
	end)
	
	newTab.Close.MouseButton1Click:connect(function()
		for i,v in pairs(scriptBar:GetChildren()) do
			if v == newTab then
				table.remove(memoryScripts,i)
				if editingIndex == i then
					editingIndex = #memoryScripts
					if editingIndex > 0 then
						buildScript(memoryScripts[#memoryScripts].Source,0,0,true)
					else
						buildScript("",0,0,true)
					end
				end
				
				scrollBar:ScrollTo(1)
				scrollBar:Update()
				scrollBarH:ScrollTo(1)
				scrollBarH:Update()
				
				for i2 = i,#scriptBar:GetChildren() do
					scriptBar:GetChildren()[i2].Position = scriptBar:GetChildren()[i2].Position + UDim2.new(0,-100,0,0)
				end
				if editingIndex > i then
					editingIndex = editingIndex - 1
				end
				newTab:Destroy()
			end
		end
	end)
	
	editingIndex = #memoryScripts
	buildScript(scrSource,0,0,true)
	
	newTab.Parent = scriptBar
end

function updateScriptBar()
	local entryCount = 0
	
	scriptBarLeft.Active = false
	scriptBarLeft.AutoButtonColor = false
	for i,v in pairs(scriptBarLeft["Arrow Graphic"]:GetChildren()) do
		v.BackgroundTransparency = 0.7
	end
	scriptBarRight.Active = false
	scriptBarRight.AutoButtonColor = false
	for i,v in pairs(scriptBarRight["Arrow Graphic"]:GetChildren()) do
		v.BackgroundTransparency = 0.7
	end
	for i,v in pairs(scriptBar:GetChildren()) do
		if v.Position.X.Offset < 0 then
			scriptBarLeft.Active = true
			scriptBarLeft.AutoButtonColor = true
			for i,v in pairs(scriptBarLeft["Arrow Graphic"]:GetChildren()) do
				v.BackgroundTransparency = 0
			end
		elseif v.Position.X.Offset >= 0 then
			entryCount = entryCount + 1
			if entryCount == 5 then
				scriptBarRight.Active = true
				scriptBarRight.AutoButtonColor = true
				for i,v in pairs(scriptBarRight["Arrow Graphic"]:GetChildren()) do
					v.BackgroundTransparency = 0
				end
			end
		end
	end
end

scriptBar.ChildAdded:connect(updateScriptBar)
scriptBar.ChildRemoved:connect(updateScriptBar)

scriptBarLeft.MouseButton1Click:connect(function()
	if scriptBarLeft.Active == false then return end
	for i,v in pairs(scriptBar:GetChildren()) do
		v.Position = v.Position + UDim2.new(0,100,0,0)
	end
	updateScriptBar()
end)

scriptBarRight.MouseButton1Click:connect(function()
	if scriptBarRight.Active == false then return end
	for i,v in pairs(scriptBar:GetChildren()) do
		v.Position = v.Position + UDim2.new(0,-100,0,0)
	end
	updateScriptBar()
end)

mouse.Button1Down:connect(function()
	if checkMouseInGui(editorGrid) then
		--print("LETS EDIT!")
	end
end)

openEvent.Event:connect(function(...)
	top.Visible = true
	local args = {...}
	if #args > 0 then
		openScript(args[1])
	end
end)

clipboardButton.MouseButton1Click:connect(function()
	if Clipboard and Clipboard.set then
		Clipboard.set(currentSource)
	elseif CopyString then
		CopyString(currentSource)
	end
end)

closeButton.MouseButton1Click:connect(function()
	top.Visible = false
end)

--[[
local scr = script.Parent:WaitForChild("Scr")
local scr2 = script.Parent:WaitForChild("Scr2")
local scr3 = script.Parent:WaitForChild("Scr3")
local scr4 = script.Parent:WaitForChild("TOS")
local scr5 = script.Parent:WaitForChild("HW")
--]]

buildScript("",0,0,true)
--[[
openScript(scr)
openScript(scr2)
openScript(scr3)
openScript(scr4)
openScript(scr5)
--]]

scrollBar:Update()
scrollBarH:Update()
end))
TextButton116.Name = "Close"
TextButton116.Parent = Frame92
TextButton116.Position = UDim2.new(1, -20, 0, 0)
TextButton116.Transparency = 1
TextButton116.Size = UDim2.new(0, 20, 0, 20)
TextButton116.BackgroundColor = BrickColor.new("Institutional white")
TextButton116.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton116.BackgroundTransparency = 1
TextButton116.BorderColor = BrickColor.new("Really black")
TextButton116.BorderColor3 = Color3.new(0, 0, 0)
TextButton116.ZIndex = 5
TextButton116.Font = Enum.Font.SourceSans
TextButton116.FontSize = Enum.FontSize.Size14
TextButton116.Text = "X"
TextButton116.TextSize = 14
Frame117.Name = "IntroFrame"
Frame117.Parent = ScreenGui0
Frame117.Position = UDim2.new(1, 30, 0, 0)
Frame117.Size = UDim2.new(0, 301, 1, 0)
Frame117.BackgroundColor = BrickColor.new("White")
Frame117.BackgroundColor3 = Color3.new(0.960784, 0.960784, 0.960784)
Frame117.BorderSizePixel = 0
Frame117.ZIndex = 2
Frame118.Name = "Main"
Frame118.Parent = Frame117
Frame118.Position = UDim2.new(0, -30, 0, 0)
Frame118.Size = UDim2.new(0, 30, 0, 90)
Frame118.BackgroundColor = BrickColor.new("White")
Frame118.BackgroundColor3 = Color3.new(0.960784, 0.960784, 0.960784)
Frame118.BorderSizePixel = 0
Frame118.ZIndex = 2
ImageLabel119.Name = "Slant"
ImageLabel119.Parent = Frame117
ImageLabel119.Position = UDim2.new(0, -30, 0, 90)
ImageLabel119.Rotation = 180
ImageLabel119.Transparency = 1
ImageLabel119.Size = UDim2.new(0, 30, 0, 30)
ImageLabel119.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel119.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel119.BackgroundTransparency = 1
ImageLabel119.ZIndex = 2
ImageLabel119.Image = "rbxassetid://1513966937"
ImageLabel119.ImageColor3 = Color3.new(0.960784, 0.960784, 0.960784)
Frame120.Name = "Main"
Frame120.Parent = Frame117
Frame120.Position = UDim2.new(0, -30, 0, 0)
Frame120.Size = UDim2.new(0, 30, 0, 90)
Frame120.BackgroundColor = BrickColor.new("White")
Frame120.BackgroundColor3 = Color3.new(0.960784, 0.960784, 0.960784)
Frame120.BorderSizePixel = 0
Frame120.ZIndex = 2
ImageLabel121.Name = "Sad"
ImageLabel121.Parent = Frame117
ImageLabel121.Position = UDim2.new(0, 50, 1, -250)
ImageLabel121.Transparency = 1
ImageLabel121.Size = UDim2.new(0, 200, 0, 200)
ImageLabel121.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel121.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel121.BackgroundTransparency = 1
ImageLabel121.ZIndex = 2
ImageLabel121.Image = "rbxassetid://483437370"
ImageLabel121.ImageColor3 = Color3.new(0.960784, 0.960784, 0.960784)
TextLabel122.Name = "Creator"
TextLabel122.Parent = Frame117
TextLabel122.Position = UDim2.new(0, 80, 0, 300)
TextLabel122.Transparency = 1
TextLabel122.Size = UDim2.new(0, 140, 0, 30)
TextLabel122.BackgroundColor = BrickColor.new("Institutional white")
TextLabel122.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel122.BackgroundTransparency = 1
TextLabel122.ZIndex = 2
TextLabel122.Font = Enum.Font.SourceSansBold
TextLabel122.FontSize = Enum.FontSize.Size28
TextLabel122.Text = "By Moon"
TextLabel122.TextSize = 28
TextLabel122.TextWrap = true
TextLabel122.TextWrapped = true
TextLabel123.Name = "Title"
TextLabel123.Parent = Frame117
TextLabel123.Position = UDim2.new(0, 100, 0, 150)
TextLabel123.Transparency = 1
TextLabel123.Size = UDim2.new(0, 100, 0, 60)
TextLabel123.BackgroundColor = BrickColor.new("Institutional white")
TextLabel123.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel123.BackgroundTransparency = 1
TextLabel123.ZIndex = 2
TextLabel123.Font = Enum.Font.SourceSansBold
TextLabel123.FontSize = Enum.FontSize.Size60
TextLabel123.Text = "DEX"
TextLabel123.TextSize = 60
TextLabel123.TextWrap = true
TextLabel123.TextWrapped = true
TextLabel124.Name = "Version"
TextLabel124.Parent = Frame117
TextLabel124.Position = UDim2.new(0, 100, 0, 210)
TextLabel124.Transparency = 1
TextLabel124.Size = UDim2.new(0, 100, 0, 30)
TextLabel124.BackgroundColor = BrickColor.new("Institutional white")
TextLabel124.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel124.BackgroundTransparency = 1
TextLabel124.ZIndex = 2
TextLabel124.Font = Enum.Font.SourceSansBold
TextLabel124.FontSize = Enum.FontSize.Size28
TextLabel124.Text = "v3"
TextLabel124.TextSize = 28
TextLabel124.TextWrap = true
TextLabel124.TextWrapped = true
Frame125.Name = "SaveMapWindow"
Frame125.Parent = ScreenGui0
Frame125.Position = UDim2.new(1, 0, 0, 0)
Frame125.Transparency = 0.10000000149012
Frame125.Size = UDim2.new(0, 300, 1, 0)
Frame125.BackgroundColor = BrickColor.new("Institutional white")
Frame125.BackgroundColor3 = Color3.new(1, 1, 1)
Frame125.BackgroundTransparency = 0.10000000149012
Frame125.BorderColor = BrickColor.new("Light grey")
Frame125.BorderColor3 = Color3.new(0.74902, 0.74902, 0.74902)
Frame125.BorderSizePixel = 0
Frame126.Name = "Header"
Frame126.Parent = Frame125
Frame126.Size = UDim2.new(1, 0, 0, 17)
Frame126.BackgroundColor = BrickColor.new("Lily white")
Frame126.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame126.BorderColor = BrickColor.new("Sand violet metallic")
Frame126.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame126.BorderSizePixel = 0
TextLabel127.Parent = Frame126
TextLabel127.Position = UDim2.new(0, 4, 0, 0)
TextLabel127.Transparency = 1
TextLabel127.Size = UDim2.new(1, -4, 1, 0)
TextLabel127.BackgroundTransparency = 1
TextLabel127.BorderSizePixel = 0
TextLabel127.Font = Enum.Font.SourceSans
TextLabel127.FontSize = Enum.FontSize.Size14
TextLabel127.Text = "Map Downloader"
TextLabel127.TextColor = BrickColor.new("Really black")
TextLabel127.TextColor3 = Color3.new(0, 0, 0)
TextLabel127.TextSize = 14
TextLabel127.TextXAlignment = Enum.TextXAlignment.Left
Frame128.Name = "MapSettings"
Frame128.Parent = Frame125
Frame128.Position = UDim2.new(0, 0, 0, 200)
Frame128.Transparency = 1
Frame128.Size = UDim2.new(1, 0, 0, 240)
Frame128.BackgroundColor = BrickColor.new("Institutional white")
Frame128.BackgroundColor3 = Color3.new(1, 1, 1)
Frame128.BackgroundTransparency = 1
Frame129.Name = "Terrain"
Frame129.Parent = Frame128
Frame129.Position = UDim2.new(0, 0, 0, 60)
Frame129.Transparency = 1
Frame129.Size = UDim2.new(1, 0, 0, 60)
Frame129.BackgroundColor = BrickColor.new("Institutional white")
Frame129.BackgroundColor3 = Color3.new(1, 1, 1)
Frame129.BackgroundTransparency = 1
TextLabel130.Name = "SName"
TextLabel130.Parent = Frame129
TextLabel130.Position = UDim2.new(0, 10, 0, 0)
TextLabel130.Transparency = 1
TextLabel130.Size = UDim2.new(1, -20, 0, 30)
TextLabel130.BackgroundColor = BrickColor.new("Institutional white")
TextLabel130.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel130.BackgroundTransparency = 1
TextLabel130.Font = Enum.Font.SourceSans
TextLabel130.FontSize = Enum.FontSize.Size18
TextLabel130.Text = "Save Terrain"
TextLabel130.TextSize = 18
TextLabel130.TextXAlignment = Enum.TextXAlignment.Left
TextLabel131.Name = "Status"
TextLabel131.Parent = Frame129
TextLabel131.Position = UDim2.new(0, 60, 0, 30)
TextLabel131.Transparency = 1
TextLabel131.Size = UDim2.new(0, 50, 0, 15)
TextLabel131.BackgroundColor = BrickColor.new("Institutional white")
TextLabel131.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel131.BackgroundTransparency = 1
TextLabel131.Font = Enum.Font.SourceSans
TextLabel131.FontSize = Enum.FontSize.Size18
TextLabel131.Text = "Off"
TextLabel131.TextSize = 18
TextLabel131.TextXAlignment = Enum.TextXAlignment.Left
TextButton132.Name = "Change"
TextButton132.Parent = Frame129
TextButton132.Position = UDim2.new(0, 10, 0, 30)
TextButton132.Size = UDim2.new(0, 40, 0, 15)
TextButton132.BackgroundColor = BrickColor.new("Quill grey")
TextButton132.BackgroundColor3 = Color3.new(0.862745, 0.862745, 0.862745)
TextButton132.BorderSizePixel = 0
TextButton132.Font = Enum.Font.SourceSans
TextButton132.FontSize = Enum.FontSize.Size14
TextButton132.Text = ""
TextButton132.TextSize = 14
TextLabel133.Name = "OnBar"
TextLabel133.Parent = TextButton132
TextLabel133.Size = UDim2.new(0, 0, 0, 15)
TextLabel133.BackgroundColor = BrickColor.new("Electric blue")
TextLabel133.BackgroundColor3 = Color3.new(0, 0.576471, 0.862745)
TextLabel133.BorderSizePixel = 0
TextLabel133.Font = Enum.Font.SourceSans
TextLabel133.FontSize = Enum.FontSize.Size14
TextLabel133.Text = ""
TextLabel133.TextSize = 14
TextLabel134.Name = "Bar"
TextLabel134.Parent = TextButton132
TextLabel134.Position = UDim2.new(0, -2, 0, -2)
TextLabel134.Size = UDim2.new(0, 10, 0, 19)
TextLabel134.BackgroundColor = BrickColor.new("Really black")
TextLabel134.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel134.BorderSizePixel = 0
TextLabel134.ClipsDescendants = true
TextLabel134.Font = Enum.Font.SourceSans
TextLabel134.FontSize = Enum.FontSize.Size14
TextLabel134.Text = ""
TextLabel134.TextSize = 14
Frame135.Name = "Lighting"
Frame135.Parent = Frame128
Frame135.Position = UDim2.new(0, 0, 0, 120)
Frame135.Transparency = 1
Frame135.Size = UDim2.new(1, 0, 0, 60)
Frame135.BackgroundColor = BrickColor.new("Institutional white")
Frame135.BackgroundColor3 = Color3.new(1, 1, 1)
Frame135.BackgroundTransparency = 1
TextLabel136.Name = "SName"
TextLabel136.Parent = Frame135
TextLabel136.Position = UDim2.new(0, 10, 0, 0)
TextLabel136.Transparency = 1
TextLabel136.Size = UDim2.new(1, -20, 0, 30)
TextLabel136.BackgroundColor = BrickColor.new("Institutional white")
TextLabel136.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel136.BackgroundTransparency = 1
TextLabel136.Font = Enum.Font.SourceSans
TextLabel136.FontSize = Enum.FontSize.Size18
TextLabel136.Text = "Lighting Properties"
TextLabel136.TextSize = 18
TextLabel136.TextXAlignment = Enum.TextXAlignment.Left
TextLabel137.Name = "Status"
TextLabel137.Parent = Frame135
TextLabel137.Position = UDim2.new(0, 60, 0, 30)
TextLabel137.Transparency = 1
TextLabel137.Size = UDim2.new(0, 50, 0, 15)
TextLabel137.BackgroundColor = BrickColor.new("Institutional white")
TextLabel137.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel137.BackgroundTransparency = 1
TextLabel137.Font = Enum.Font.SourceSans
TextLabel137.FontSize = Enum.FontSize.Size18
TextLabel137.Text = "Off"
TextLabel137.TextSize = 18
TextLabel137.TextXAlignment = Enum.TextXAlignment.Left
TextButton138.Name = "Change"
TextButton138.Parent = Frame135
TextButton138.Position = UDim2.new(0, 10, 0, 30)
TextButton138.Size = UDim2.new(0, 40, 0, 15)
TextButton138.BackgroundColor = BrickColor.new("Quill grey")
TextButton138.BackgroundColor3 = Color3.new(0.862745, 0.862745, 0.862745)
TextButton138.BorderSizePixel = 0
TextButton138.Font = Enum.Font.SourceSans
TextButton138.FontSize = Enum.FontSize.Size14
TextButton138.Text = ""
TextButton138.TextSize = 14
TextLabel139.Name = "OnBar"
TextLabel139.Parent = TextButton138
TextLabel139.Size = UDim2.new(0, 0, 0, 15)
TextLabel139.BackgroundColor = BrickColor.new("Electric blue")
TextLabel139.BackgroundColor3 = Color3.new(0, 0.576471, 0.862745)
TextLabel139.BorderSizePixel = 0
TextLabel139.Font = Enum.Font.SourceSans
TextLabel139.FontSize = Enum.FontSize.Size14
TextLabel139.Text = ""
TextLabel139.TextSize = 14
TextLabel140.Name = "Bar"
TextLabel140.Parent = TextButton138
TextLabel140.Position = UDim2.new(0, -2, 0, -2)
TextLabel140.Size = UDim2.new(0, 10, 0, 19)
TextLabel140.BackgroundColor = BrickColor.new("Really black")
TextLabel140.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel140.BorderSizePixel = 0
TextLabel140.ClipsDescendants = true
TextLabel140.Font = Enum.Font.SourceSans
TextLabel140.FontSize = Enum.FontSize.Size14
TextLabel140.Text = ""
TextLabel140.TextSize = 14
Frame141.Name = "CameraInstances"
Frame141.Parent = Frame128
Frame141.Position = UDim2.new(0, 0, 0, 180)
Frame141.Transparency = 1
Frame141.Size = UDim2.new(1, 0, 0, 60)
Frame141.BackgroundColor = BrickColor.new("Institutional white")
Frame141.BackgroundColor3 = Color3.new(1, 1, 1)
Frame141.BackgroundTransparency = 1
TextLabel142.Name = "SName"
TextLabel142.Parent = Frame141
TextLabel142.Position = UDim2.new(0, 10, 0, 0)
TextLabel142.Transparency = 1
TextLabel142.Size = UDim2.new(1, -20, 0, 30)
TextLabel142.BackgroundColor = BrickColor.new("Institutional white")
TextLabel142.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel142.BackgroundTransparency = 1
TextLabel142.Font = Enum.Font.SourceSans
TextLabel142.FontSize = Enum.FontSize.Size18
TextLabel142.Text = "Camera Instances"
TextLabel142.TextSize = 18
TextLabel142.TextXAlignment = Enum.TextXAlignment.Left
TextLabel143.Name = "Status"
TextLabel143.Parent = Frame141
TextLabel143.Position = UDim2.new(0, 60, 0, 30)
TextLabel143.Transparency = 1
TextLabel143.Size = UDim2.new(0, 50, 0, 15)
TextLabel143.BackgroundColor = BrickColor.new("Institutional white")
TextLabel143.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel143.BackgroundTransparency = 1
TextLabel143.Font = Enum.Font.SourceSans
TextLabel143.FontSize = Enum.FontSize.Size18
TextLabel143.Text = "Off"
TextLabel143.TextSize = 18
TextLabel143.TextXAlignment = Enum.TextXAlignment.Left
TextButton144.Name = "Change"
TextButton144.Parent = Frame141
TextButton144.Position = UDim2.new(0, 10, 0, 30)
TextButton144.Size = UDim2.new(0, 40, 0, 15)
TextButton144.BackgroundColor = BrickColor.new("Quill grey")
TextButton144.BackgroundColor3 = Color3.new(0.862745, 0.862745, 0.862745)
TextButton144.BorderSizePixel = 0
TextButton144.Font = Enum.Font.SourceSans
TextButton144.FontSize = Enum.FontSize.Size14
TextButton144.Text = ""
TextButton144.TextSize = 14
TextLabel145.Name = "OnBar"
TextLabel145.Parent = TextButton144
TextLabel145.Size = UDim2.new(0, 0, 0, 15)
TextLabel145.BackgroundColor = BrickColor.new("Electric blue")
TextLabel145.BackgroundColor3 = Color3.new(0, 0.576471, 0.862745)
TextLabel145.BorderSizePixel = 0
TextLabel145.Font = Enum.Font.SourceSans
TextLabel145.FontSize = Enum.FontSize.Size14
TextLabel145.Text = ""
TextLabel145.TextSize = 14
TextLabel146.Name = "Bar"
TextLabel146.Parent = TextButton144
TextLabel146.Position = UDim2.new(0, -2, 0, -2)
TextLabel146.Size = UDim2.new(0, 10, 0, 19)
TextLabel146.BackgroundColor = BrickColor.new("Really black")
TextLabel146.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel146.BorderSizePixel = 0
TextLabel146.ClipsDescendants = true
TextLabel146.Font = Enum.Font.SourceSans
TextLabel146.FontSize = Enum.FontSize.Size14
TextLabel146.Text = ""
TextLabel146.TextSize = 14
Frame147.Name = "Scripts"
Frame147.Parent = Frame128
Frame147.Transparency = 1
Frame147.Size = UDim2.new(1, 0, 0, 60)
Frame147.BackgroundColor = BrickColor.new("Institutional white")
Frame147.BackgroundColor3 = Color3.new(1, 1, 1)
Frame147.BackgroundTransparency = 1
TextLabel148.Name = "SName"
TextLabel148.Parent = Frame147
TextLabel148.Position = UDim2.new(0, 10, 0, 0)
TextLabel148.Transparency = 1
TextLabel148.Size = UDim2.new(1, -20, 0, 30)
TextLabel148.BackgroundColor = BrickColor.new("Institutional white")
TextLabel148.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel148.BackgroundTransparency = 1
TextLabel148.Font = Enum.Font.SourceSans
TextLabel148.FontSize = Enum.FontSize.Size18
TextLabel148.Text = "Save Scripts"
TextLabel148.TextSize = 18
TextLabel148.TextXAlignment = Enum.TextXAlignment.Left
TextLabel149.Name = "Status"
TextLabel149.Parent = Frame147
TextLabel149.Position = UDim2.new(0, 60, 0, 30)
TextLabel149.Transparency = 1
TextLabel149.Size = UDim2.new(0, 50, 0, 15)
TextLabel149.BackgroundColor = BrickColor.new("Institutional white")
TextLabel149.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel149.BackgroundTransparency = 1
TextLabel149.Font = Enum.Font.SourceSans
TextLabel149.FontSize = Enum.FontSize.Size18
TextLabel149.Text = "Off"
TextLabel149.TextSize = 18
TextLabel149.TextXAlignment = Enum.TextXAlignment.Left
TextButton150.Name = "Change"
TextButton150.Parent = Frame147
TextButton150.Position = UDim2.new(0, 10, 0, 30)
TextButton150.Size = UDim2.new(0, 40, 0, 15)
TextButton150.BackgroundColor = BrickColor.new("Quill grey")
TextButton150.BackgroundColor3 = Color3.new(0.862745, 0.862745, 0.862745)
TextButton150.BorderSizePixel = 0
TextButton150.Font = Enum.Font.SourceSans
TextButton150.FontSize = Enum.FontSize.Size14
TextButton150.Text = ""
TextButton150.TextSize = 14
TextLabel151.Name = "OnBar"
TextLabel151.Parent = TextButton150
TextLabel151.Size = UDim2.new(0, 0, 0, 15)
TextLabel151.BackgroundColor = BrickColor.new("Electric blue")
TextLabel151.BackgroundColor3 = Color3.new(0, 0.576471, 0.862745)
TextLabel151.BorderSizePixel = 0
TextLabel151.Font = Enum.Font.SourceSans
TextLabel151.FontSize = Enum.FontSize.Size14
TextLabel151.Text = ""
TextLabel151.TextSize = 14
TextLabel152.Name = "Bar"
TextLabel152.Parent = TextButton150
TextLabel152.Position = UDim2.new(0, -2, 0, -2)
TextLabel152.Size = UDim2.new(0, 10, 0, 19)
TextLabel152.BackgroundColor = BrickColor.new("Really black")
TextLabel152.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel152.BorderSizePixel = 0
TextLabel152.ClipsDescendants = true
TextLabel152.Font = Enum.Font.SourceSans
TextLabel152.FontSize = Enum.FontSize.Size14
TextLabel152.Text = ""
TextLabel152.TextSize = 14
TextLabel153.Name = "ToSave"
TextLabel153.Parent = Frame125
TextLabel153.Position = UDim2.new(0, 0, 0, 17)
TextLabel153.Transparency = 1
TextLabel153.Size = UDim2.new(1, 0, 0, 20)
TextLabel153.BackgroundTransparency = 1
TextLabel153.Font = Enum.Font.SourceSans
TextLabel153.FontSize = Enum.FontSize.Size18
TextLabel153.Text = "To Save"
TextLabel153.TextColor = BrickColor.new("Really black")
TextLabel153.TextColor3 = Color3.new(0, 0, 0)
TextLabel153.TextSize = 18
Frame154.Name = "CopyList"
Frame154.Parent = Frame125
Frame154.Position = UDim2.new(0, 0, 0, 37)
Frame154.Transparency = 0.80000001192093
Frame154.Size = UDim2.new(1, 0, 0, 163)
Frame154.BackgroundColor = BrickColor.new("Institutional white")
Frame154.BackgroundColor3 = Color3.new(1, 1, 1)
Frame154.BackgroundTransparency = 0.80000001192093
Frame155.Name = "Bottom"
Frame155.Parent = Frame125
Frame155.Position = UDim2.new(0, 0, 1, -50)
Frame155.Size = UDim2.new(1, 0, 0, 50)
Frame155.BackgroundColor = BrickColor.new("Lily white")
Frame155.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame155.BorderColor = BrickColor.new("Sand violet metallic")
Frame155.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
TextLabel156.Parent = Frame155
TextLabel156.Position = UDim2.new(0, 4, 0, 0)
TextLabel156.Transparency = 1
TextLabel156.Size = UDim2.new(1, -4, 1, 0)
TextLabel156.BackgroundTransparency = 1
TextLabel156.Font = Enum.Font.SourceSans
TextLabel156.FontSize = Enum.FontSize.Size14
TextLabel156.Text = "After the map saves, open a new place on studio, then right click Lighting and Insert from file, then select your file and run the unpacker script inside the folder."
TextLabel156.TextColor = BrickColor.new("Really black")
TextLabel156.TextColor3 = Color3.new(0, 0, 0)
TextLabel156.TextSize = 14
TextLabel156.TextWrap = true
TextLabel156.TextWrapped = true
TextLabel156.TextXAlignment = Enum.TextXAlignment.Left
TextLabel156.TextYAlignment = Enum.TextYAlignment.Top
TextButton157.Name = "Save"
TextButton157.Parent = Frame125
TextButton157.Position = UDim2.new(0, 0, 1, -80)
TextButton157.Transparency = 0.80000001192093
TextButton157.Size = UDim2.new(1, 0, 0, 30)
TextButton157.BackgroundColor = BrickColor.new("White")
TextButton157.BackgroundColor3 = Color3.new(0.941177, 0.941177, 0.941177)
TextButton157.BackgroundTransparency = 0.80000001192093
TextButton157.BorderColor = BrickColor.new("Really black")
TextButton157.BorderColor3 = Color3.new(0, 0, 0)
TextButton157.Font = Enum.Font.SourceSans
TextButton157.FontSize = Enum.FontSize.Size18
TextButton157.Text = "Save"
TextButton157.TextSize = 18
TextBox158.Name = "FileName"
TextBox158.Parent = Frame125
TextBox158.Position = UDim2.new(0, 0, 1, -105)
TextBox158.Transparency = 0.60000002384186
TextBox158.Size = UDim2.new(1, 0, 0, 25)
TextBox158.BackgroundColor = BrickColor.new("White")
TextBox158.BackgroundColor3 = Color3.new(0.941177, 0.941177, 0.941177)
TextBox158.BackgroundTransparency = 0.60000002384186
TextBox158.Font = Enum.Font.SourceSans
TextBox158.FontSize = Enum.FontSize.Size18
TextBox158.Text = "PlaceName"
TextBox158.TextSize = 18
TextBox158.TextXAlignment = Enum.TextXAlignment.Left
Frame159.Name = "Entry"
Frame159.Parent = Frame125
Frame159.Visible = false
Frame159.Transparency = 1
Frame159.Size = UDim2.new(1, 0, 0, 22)
Frame159.BackgroundColor = BrickColor.new("Institutional white")
Frame159.BackgroundColor3 = Color3.new(1, 1, 1)
Frame159.BackgroundTransparency = 1
TextButton160.Name = "Change"
TextButton160.Parent = Frame159
TextButton160.Position = UDim2.new(0, 10, 0, 1)
TextButton160.Transparency = 0.60000002384186
TextButton160.Size = UDim2.new(0, 20, 0, 20)
TextButton160.BackgroundColor = BrickColor.new("Institutional white")
TextButton160.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton160.BackgroundTransparency = 0.60000002384186
TextButton160.ZIndex = 2
TextButton160.Font = Enum.Font.SourceSans
TextButton160.FontSize = Enum.FontSize.Size18
TextButton160.Text = ""
TextButton160.TextColor = BrickColor.new("Institutional white")
TextButton160.TextColor3 = Color3.new(1, 1, 1)
TextButton160.TextSize = 18
TextLabel161.Name = "enabled"
TextLabel161.Parent = TextButton160
TextLabel161.Position = UDim2.new(0, 3, 0, 3)
TextLabel161.Transparency = 0.40000000596046
TextLabel161.Size = UDim2.new(0, 14, 0, 14)
TextLabel161.BackgroundColor = BrickColor.new("Dark stone grey")
TextLabel161.BackgroundColor3 = Color3.new(0.380392, 0.380392, 0.380392)
TextLabel161.BackgroundTransparency = 0.40000000596046
TextLabel161.BorderSizePixel = 0
TextLabel161.Font = Enum.Font.SourceSans
TextLabel161.FontSize = Enum.FontSize.Size14
TextLabel161.Text = ""
TextLabel161.TextSize = 14
TextLabel162.Name = "Info"
TextLabel162.Parent = Frame159
TextLabel162.Position = UDim2.new(0, 40, 0, 0)
TextLabel162.Transparency = 1
TextLabel162.Size = UDim2.new(1, -40, 0, 22)
TextLabel162.BackgroundTransparency = 1
TextLabel162.Font = Enum.Font.SourceSans
TextLabel162.FontSize = Enum.FontSize.Size18
TextLabel162.Text = "Workspace"
TextLabel162.TextColor = BrickColor.new("Really black")
TextLabel162.TextColor3 = Color3.new(0, 0, 0)
TextLabel162.TextSize = 18
TextLabel162.TextXAlignment = Enum.TextXAlignment.Left
Frame163.Name = "RemoteDebugWindow"
Frame163.Parent = ScreenGui0
Frame163.Position = UDim2.new(1, 0, 0, 0)
Frame163.Transparency = 0.10000000149012
Frame163.Size = UDim2.new(0, 300, 1, 0)
Frame163.BackgroundColor = BrickColor.new("Institutional white")
Frame163.BackgroundColor3 = Color3.new(1, 1, 1)
Frame163.BackgroundTransparency = 0.10000000149012
Frame163.BorderColor = BrickColor.new("Light grey")
Frame163.BorderColor3 = Color3.new(0.74902, 0.74902, 0.74902)
Frame163.BorderSizePixel = 0
Frame164.Name = "Header"
Frame164.Parent = Frame163
Frame164.Size = UDim2.new(1, 0, 0, 17)
Frame164.BackgroundColor = BrickColor.new("Lily white")
Frame164.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame164.BorderColor = BrickColor.new("Sand violet metallic")
Frame164.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
TextLabel165.Parent = Frame164
TextLabel165.Position = UDim2.new(0, 4, 0, 0)
TextLabel165.Transparency = 1
TextLabel165.Size = UDim2.new(1, -4, 1, 0)
TextLabel165.BackgroundTransparency = 1
TextLabel165.Font = Enum.Font.SourceSans
TextLabel165.FontSize = Enum.FontSize.Size14
TextLabel165.Text = "Remote Debugger"
TextLabel165.TextColor = BrickColor.new("Really black")
TextLabel165.TextColor3 = Color3.new(0, 0, 0)
TextLabel165.TextSize = 14
TextLabel165.TextXAlignment = Enum.TextXAlignment.Left
BindableFunction166.Name = "GetSetting"
BindableFunction166.Parent = Frame163
TextLabel167.Name = "Desc"
TextLabel167.Parent = Frame163
TextLabel167.Position = UDim2.new(0, 0, 0, 20)
TextLabel167.Transparency = 1
TextLabel167.Size = UDim2.new(1, 0, 0, 40)
TextLabel167.BackgroundColor = BrickColor.new("Institutional white")
TextLabel167.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel167.BackgroundTransparency = 1
TextLabel167.Font = Enum.Font.SourceSans
TextLabel167.FontSize = Enum.FontSize.Size32
TextLabel167.Text = "Have fun with remotes"
TextLabel167.TextSize = 32
TextLabel167.TextWrap = true
TextLabel167.TextWrapped = true
Frame168.Name = "About"
Frame168.Parent = ScreenGui0
Frame168.Position = UDim2.new(1, 0, 0, 0)
Frame168.Size = UDim2.new(0, 300, 1, 0)
Frame168.Active = true
Frame168.BackgroundColor = BrickColor.new("Lily white")
Frame168.BackgroundColor3 = Color3.new(0.913726, 0.913726, 0.913726)
Frame168.BorderColor = BrickColor.new("Sand violet metallic")
Frame168.BorderColor3 = Color3.new(0.584314, 0.584314, 0.584314)
Frame168.BorderSizePixel = 0
Frame168.Draggable = true
Frame168.ZIndex = 2
ImageLabel169.Name = "Sad"
ImageLabel169.Parent = Frame168
ImageLabel169.Position = UDim2.new(0, 50, 1, -250)
ImageLabel169.Transparency = 1
ImageLabel169.Size = UDim2.new(0, 200, 0, 200)
ImageLabel169.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel169.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel169.BackgroundTransparency = 1
ImageLabel169.ZIndex = 2
ImageLabel169.Image = "rbxassetid://483437370"
ImageLabel169.ImageColor3 = Color3.new(0.960784, 0.960784, 0.960784)
TextLabel170.Name = "Creator"
TextLabel170.Parent = Frame168
TextLabel170.Position = UDim2.new(0, 80, 0, 300)
TextLabel170.Transparency = 1
TextLabel170.Size = UDim2.new(0, 140, 0, 30)
TextLabel170.BackgroundColor = BrickColor.new("Institutional white")
TextLabel170.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel170.BackgroundTransparency = 1
TextLabel170.ZIndex = 2
TextLabel170.Font = Enum.Font.SourceSansBold
TextLabel170.FontSize = Enum.FontSize.Size28
TextLabel170.Text = "By Moon"
TextLabel170.TextSize = 28
TextLabel170.TextWrap = true
TextLabel170.TextWrapped = true
TextLabel171.Name = "Title"
TextLabel171.Parent = Frame168
TextLabel171.Position = UDim2.new(0, 100, 0, 150)
TextLabel171.Transparency = 1
TextLabel171.Size = UDim2.new(0, 100, 0, 60)
TextLabel171.BackgroundColor = BrickColor.new("Institutional white")
TextLabel171.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel171.BackgroundTransparency = 1
TextLabel171.ZIndex = 2
TextLabel171.Font = Enum.Font.SourceSansBold
TextLabel171.FontSize = Enum.FontSize.Size60
TextLabel171.Text = "DEX"
TextLabel171.TextSize = 60
TextLabel171.TextWrap = true
TextLabel171.TextWrapped = true
TextLabel172.Name = "Version"
TextLabel172.Parent = Frame168
TextLabel172.Position = UDim2.new(0, 100, 0, 210)
TextLabel172.Transparency = 1
TextLabel172.Size = UDim2.new(0, 100, 0, 30)
TextLabel172.BackgroundColor = BrickColor.new("Institutional white")
TextLabel172.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel172.BackgroundTransparency = 1
TextLabel172.ZIndex = 2
TextLabel172.Font = Enum.Font.SourceSansBold
TextLabel172.FontSize = Enum.FontSize.Size28
TextLabel172.Text = "v3"
TextLabel172.TextSize = 28
TextLabel172.TextWrap = true
TextLabel172.TextWrapped = true
ImageButton173.Name = "Toggle"
ImageButton173.Parent = ScreenGui0
ImageButton173.Position = UDim2.new(1, 0, 0, 0)
ImageButton173.Rotation = 180
ImageButton173.Transparency = 1
ImageButton173.Size = UDim2.new(0, 40, 0, 40)
ImageButton173.BackgroundColor = BrickColor.new("Institutional white")
ImageButton173.BackgroundColor3 = Color3.new(1, 1, 1)
ImageButton173.BackgroundTransparency = 1
ImageButton173.Image = "rbxassetid://1513966937"
ImageButton173.ImageColor3 = Color3.new(0.913726, 0.913726, 0.913726)
TextLabel174.Parent = ImageButton173
TextLabel174.Position = UDim2.new(0, 2, 0, 10)
TextLabel174.Rotation = 180
TextLabel174.Transparency = 1
TextLabel174.Size = UDim2.new(0, 30, 0, 30)
TextLabel174.BackgroundColor = BrickColor.new("Institutional white")
TextLabel174.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel174.BackgroundTransparency = 1
TextLabel174.Font = Enum.Font.SourceSans
TextLabel174.FontSize = Enum.FontSize.Size24
TextLabel174.Text = "<"
TextLabel174.TextSize = 24
TextLabel174.TextWrap = true
TextLabel174.TextWrapped = true
for i,v in pairs(mas:GetChildren()) do
	v.Parent = game:GetService("Players").LocalPlayer.PlayerGui
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end