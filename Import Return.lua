local BTRequires = {}
local BTCacheRequires = {}
local RealRequire = require

local function require(asset)
	if asset and type(asset) == "string" then
		if BTCacheRequires[asset] then
			return BTCacheRequires[asset]
		elseif BTRequires[asset] then
			local result = BTRequires[asset]()
			BTCacheRequires[asset] = result
			return result
		end
	end
	return RealRequire(asset)
end

function BTRequires.SupportLibrary()
	local SupportLibrary = {};

	function SupportLibrary.FindTableOccurrences(Haystack, Needle)
		-- Returns the positions of instances of `needle` in table `haystack`

		local Positions = {};

		-- Add any indexes from `Haystack` that are `Needle`
		for Index, Value in pairs(Haystack) do
			if Value == Needle then
				table.insert(Positions, Index);
			end;
		end;

		return Positions;
	end;

	function SupportLibrary.FindTableOccurrence(Haystack, Needle)
		-- Returns one occurrence of `Needle` in `Haystack`

		-- Search for the first instance of `Needle` found and return it
		for Index, Value in pairs(Haystack) do
			if Value == Needle then
				return Index;
			end;
		end;

		-- If no occurrences exist, return `nil`
		return nil;

	end;

	function SupportLibrary.IsInTable(Haystack, Needle)
		-- Returns whether the given `Needle` can be found within table `Haystack`

		-- Go through every value in `Haystack` and return whether `Needle` is found
		for _, Value in pairs(Haystack) do
			if Value == Needle then
				return true;
			end;
		end;

		-- If no instances were found, return false
		return false;
	end;

	function SupportLibrary.DoTablesMatch(A, B)
		-- Returns whether the values of tables A and B are the same

		-- Check B table differences
		for Index in pairs(A) do
			if A[Index] ~= B[Index] then
				return false;
			end;
		end;

		-- Check A table differences
		for Index in pairs(B) do
			if B[Index] ~= A[Index] then
				return false;
			end;
		end;

		-- Return true if no differences
		return true;
	end;

	function SupportLibrary.Round(Number, Places)
		-- Returns `Number` rounded to the given number of decimal places (from lua-users)

		-- Ensure that `Number` is a number
		if type(Number) ~= 'number' then
			return;
		end;

		-- Round the number
		local Multiplier = 10 ^ (Places or 0);
		local RoundedNumber = math.floor(Number * Multiplier + 0.5) / Multiplier;

		-- Return the rounded number
		return RoundedNumber;
	end;

	function SupportLibrary.CloneTable(Table)
		-- Returns a copy of `Table`

		local ClonedTable = {};

		-- Copy all values into `ClonedTable`
		for Key, Value in pairs(Table) do
			ClonedTable[Key] = Value;
		end;

		-- Return the clone
		return ClonedTable;
	end;

	function SupportLibrary.GetAllDescendants(Parent)
		-- Recursively gets all the descendants of `Parent` and returns them

		local Descendants = {};

		for _, Child in pairs(Parent:GetChildren()) do

			-- Add the direct descendants of `Parent`
			table.insert(Descendants, Child);

			-- Add the descendants of each child
			for _, Subchild in pairs(SupportLibrary.GetAllDescendants(Child)) do
				table.insert(Descendants, Subchild);
			end;

		end;

		return Descendants;
	end;

	function SupportLibrary.GetDescendantCount(Parent)
		-- Recursively gets a count of all the descendants of `Parent` and returns them

		local Count = 0;

		for _, Child in pairs(Parent:GetChildren()) do

			-- Count the direct descendants of `Parent`
			Count = Count + 1;

			-- Count and add the descendants of each child
			Count = Count + SupportLibrary.GetDescendantCount(Child);

		end;

		return Count;
	end;

	function SupportLibrary.CloneParts(Parts)
		-- Returns a table of cloned `Parts`

		local Clones = {};

		-- Copy the parts into `Clones`
		for Index, Part in pairs(Parts) do
			Clones[Index] = Part:Clone();
		end;

		return Clones;
	end;

	function SupportLibrary.SplitString(String, Delimiter)
		-- Returns a table of string `String` split by pattern `Delimiter`

		local StringParts = {};
		local Pattern = ('([^%s]+)'):format(Delimiter);

		-- Capture each separated part
		String:gsub(Pattern, function (Part)
			table.insert(StringParts, Part);
		end);

		return StringParts;
	end;

	function SupportLibrary.GetChildOfClass(Parent, ClassName, Inherit)
		-- Returns the first child of `Parent` that is of class `ClassName`
		-- or nil if it couldn't find any

		-- Look for a child of `Parent` of class `ClassName` and return it
		if not Inherit then
			for _, Child in pairs(Parent:GetChildren()) do
				if Child.ClassName == ClassName then
					return Child;
				end;
			end;
		else
			for _, Child in pairs(Parent:GetChildren()) do
				if Child:IsA(ClassName) then
					return Child;
				end;
			end;
		end;

		return nil;
	end;

	function SupportLibrary.GetChildrenOfClass(Parent, ClassName, Inherit)
		-- Returns a table containing the children of `Parent` that are
		-- of class `ClassName`

		local Matches = {};

		if not Inherit then
			for _, Child in pairs(Parent:GetChildren()) do
				if Child.ClassName == ClassName then
					table.insert(Matches, Child);
				end;
			end;
		else
			for _, Child in pairs(Parent:GetChildren()) do
				if Child:IsA(ClassName) then
					table.insert(Matches, Child);
				end;
			end;
		end;

		return Matches;
	end;

	function SupportLibrary.HSVToRGB(Hue, Saturation, Value)
		-- Returns the RGB equivalent of the given HSV-defined color
		-- (adapted from some code found around the web)

		-- If it's achromatic, just return the value
		if Saturation == 0 then
			return Value;
		end;

		-- Get the hue sector
		local HueSector = math.floor(Hue / 60);
		local HueSectorOffset = (Hue / 60) - HueSector;

		local P = Value * (1 - Saturation);
		local Q = Value * (1 - Saturation * HueSectorOffset);
		local T = Value * (1 - Saturation * (1 - HueSectorOffset));

		if HueSector == 0 then
			return Value, T, P;
		elseif HueSector == 1 then
			return Q, Value, P;
		elseif HueSector == 2 then
			return P, Value, T;
		elseif HueSector == 3 then
			return P, Q, Value;
		elseif HueSector == 4 then
			return T, P, Value;
		elseif HueSector == 5 then
			return Value, P, Q;
		end;
	end;

	function SupportLibrary.RGBToHSV(Red, Green, Blue)
		-- Returns the HSV equivalent of the given RGB-defined color
		-- (adapted from some code found around the web)

		local Hue, Saturation, Value;

		local MinValue = math.min(Red, Green, Blue);
		local MaxValue = math.max(Red, Green, Blue);

		Value = MaxValue;

		local ValueDelta = MaxValue - MinValue;

		-- If the color is not black
		if MaxValue ~= 0 then
			Saturation = ValueDelta / MaxValue;

		-- If the color is purely black
		else
			Saturation = 0;
			Hue = -1;
			return Hue, Saturation, Value;
		end;

		if Red == MaxValue then
			Hue = (Green - Blue) / ValueDelta;
		elseif Green == MaxValue then
			Hue = 2 + (Blue - Red) / ValueDelta;
		else
			Hue = 4 + (Red - Green) / ValueDelta;
		end;

		Hue = Hue * 60;
		if Hue < 0 then
			Hue = Hue + 360;
		end;

		return Hue, Saturation, Value;
	end;

	function SupportLibrary.IdentifyCommonItem(Items)
		-- Returns the common item in table `Items`, or `nil` if
		-- they vary

		local CommonItem = nil;

		for ItemIndex, Item in pairs(Items) do

			-- Set the initial item to compare against
			if ItemIndex == 1 then
				CommonItem = Item;

			-- Check if this item is the same as the rest
			else
				-- If it isn't the same, there is no common item, so just stop right here
				if Item ~= CommonItem then
					return nil;
				end;
			end;

		end;

		-- Return the common item
		return CommonItem;
	end;

	function SupportLibrary.IdentifyCommonProperty(Items, Property)
		-- Returns the common `Property` value in the instances given in `Items`

		local PropertyVariations = {};

		-- Capture all the variations of the property value
		for _, Item in pairs(Items) do
			table.insert(PropertyVariations, Item[Property]);
		end;

		-- Return the common property value
		return SupportLibrary.IdentifyCommonItem(PropertyVariations);

	end;

	function SupportLibrary.CreateSignal()
		-- Returns a ROBLOX-like signal for connections (RbxUtility's is buggy)

		local Signal = {
			Connections	= {};

			-- Provide a function to connect an event handler
			Connect = function (Signal, Handler)

				-- Register the handler
				table.insert(Signal.Connections, Handler);

				-- Return a controller for this connection
				local ConnectionController = {

					-- Include a reference to the connection's handler
					Handler = Handler;

					-- Provide a way to disconnect this connection
					Disconnect = function (Connection)
						local ConnectionSearch = SupportLibrary.FindTableOccurrences(Signal.Connections, Connection.Handler);
						if #ConnectionSearch > 0 then
							local ConnectionIndex = ConnectionSearch[1];
							table.remove(Signal.Connections, ConnectionIndex);
						end;
					end;

				};

				-- Add compatibility aliases
				ConnectionController.disconnect = ConnectionController.Disconnect;

				-- Return the connection's controller
				return ConnectionController;

			end;

			-- Provide a function to trigger any connections' handlers
			Fire = function (Signal, ...)
				for _, Connection in pairs(Signal.Connections) do
					Connection(...);
				end;
			end;
		};

		-- Add compatibility aliases
		Signal.connect	= Signal.Connect;
		Signal.fire		= Signal.Fire;

		return Signal;
	end;

	function SupportLibrary.GetPartCorners(Part)
		-- Returns a table of the given part's corners' CFrames

		-- Make references to functions called a lot for efficiency
		local Insert = table.insert;
		local ToWorldSpace = CFrame.new().toWorldSpace;
		local NewCFrame = CFrame.new;

		-- Get info about the part
		local PartCFrame = Part.CFrame;
		local SizeX, SizeY, SizeZ = Part.Size.x / 2, Part.Size.y / 2, Part.Size.z / 2;

		-- Get each corner
		local Corners = {};
		Insert(Corners, ToWorldSpace(PartCFrame, NewCFrame(SizeX, SizeY, SizeZ)));
		Insert(Corners, ToWorldSpace(PartCFrame, NewCFrame(-SizeX, SizeY, SizeZ)));
		Insert(Corners, ToWorldSpace(PartCFrame, NewCFrame(SizeX, -SizeY, SizeZ)));
		Insert(Corners, ToWorldSpace(PartCFrame, NewCFrame(SizeX, SizeY, -SizeZ)));
		Insert(Corners, ToWorldSpace(PartCFrame, NewCFrame(-SizeX, SizeY, -SizeZ)));
		Insert(Corners, ToWorldSpace(PartCFrame, NewCFrame(-SizeX, -SizeY, SizeZ)));
		Insert(Corners, ToWorldSpace(PartCFrame, NewCFrame(SizeX, -SizeY, -SizeZ)));
		Insert(Corners, ToWorldSpace(PartCFrame, NewCFrame(-SizeX, -SizeY, -SizeZ)));

		return Corners;
	end;

	function SupportLibrary.CreatePart(PartType)
		-- Creates and returns new part based on `PartType` with sensible defaults

		local NewPart;

		if PartType == 'Normal' then
			NewPart = Instance.new('Part');
			NewPart.Size = Vector3.new(4, 1, 2);

		elseif PartType == 'Truss' then
			NewPart = Instance.new('TrussPart');

		elseif PartType == 'Wedge' then
			NewPart = Instance.new('WedgePart');
			NewPart.Size = Vector3.new(4, 1, 2);

		elseif PartType == 'Corner' then
			NewPart = Instance.new('CornerWedgePart');

		elseif PartType == 'Cylinder' then
			NewPart = Instance.new('Part');
			NewPart.Shape = 'Cylinder';
			NewPart.TopSurface = Enum.SurfaceType.Smooth;
			NewPart.BottomSurface = Enum.SurfaceType.Smooth;
			NewPart.Size = Vector3.new(2, 2, 2);

		elseif PartType == 'Ball' then
			NewPart = Instance.new('Part');
			NewPart.Shape = 'Ball';
			NewPart.TopSurface = Enum.SurfaceType.Smooth;
			NewPart.BottomSurface = Enum.SurfaceType.Smooth;

		elseif PartType == 'Seat' then
			NewPart = Instance.new('Seat');
			NewPart.Size = Vector3.new(4, 1, 2);

		elseif PartType == 'Vehicle Seat' then
			NewPart = Instance.new('VehicleSeat');
			NewPart.Size = Vector3.new(4, 1, 2);

		elseif PartType == 'Spawn' then
			NewPart = Instance.new('SpawnLocation');
			NewPart.Size = Vector3.new(4, 1, 2);
		end;

		-- Make sure the part is anchored
		NewPart.Anchored = true;

		return NewPart;
	end;

	function SupportLibrary.ImportServices()
		-- Adds references to common services into the calling environment

		-- Get the calling environment
		local CallingEnvironment = getfenv(2);

		-- Add the services
		CallingEnvironment.Workspace = Game:GetService 'Workspace';
		CallingEnvironment.Players = Game:GetService 'Players';
		CallingEnvironment.MarketplaceService = Game:GetService 'MarketplaceService';
		CallingEnvironment.ContentProvider = Game:GetService 'ContentProvider';
		CallingEnvironment.SoundService = Game:GetService 'SoundService';
		CallingEnvironment.UserInputService = Game:GetService 'UserInputService';
		CallingEnvironment.SelectionService = Game:GetService 'Selection';
		--CallingEnvironment.CoreGui = Game:GetService 'CoreGui';
		CallingEnvironment.HttpService = Game:GetService 'HttpService';
		CallingEnvironment.ChangeHistoryService = Game:GetService 'ChangeHistoryService';
		CallingEnvironment.ReplicatedStorage = Game:GetService 'ReplicatedStorage';
		CallingEnvironment.GroupService = Game:GetService 'GroupService';
		CallingEnvironment.ServerScriptService = Game:GetService 'ServerScriptService';
		CallingEnvironment.ServerStorage = Game:GetService 'ServerStorage';
		CallingEnvironment.StarterGui = Game:GetService 'StarterGui';
		CallingEnvironment.RunService = Game:GetService 'RunService';
	end;

	function SupportLibrary.GetListMembers(List, MemberName)
		-- Gets the given member for each object in the given list table

		local Members = {};

		-- Collect the member values for each item in the list
		for _, Item in pairs(List) do
			table.insert(Members, Item[MemberName]);
		end;

		-- Return the members
		return Members;

	end;

	function SupportLibrary.AddUserInputListener(InputState, InputType, CatchAll, Callback)
		-- Connects to the given user input event and takes care of standard boilerplate code

		-- Turn the given `InputType` string into a proper enum
		local InputType = Enum.UserInputType[InputType];

		-- Create a UserInputService listener based on the given `InputState`
		return Game:GetService('UserInputService')['Input' .. InputState]:connect(function (Input, GameProcessedEvent)

			-- Make sure this input was not captured by the client (unless `CatchAll` is enabled)
			if GameProcessedEvent and not CatchAll then
				return;
			end;

			-- Make sure this is the right input type
			if Input.UserInputType ~= InputType then
				return;
			end;

			-- Make sure any key input did not occur while typing into a UI
			if InputType == Enum.UserInputType.Keyboard and Game:GetService('UserInputService'):GetFocusedTextBox() then
				return;
			end;

			-- Call back upon passing all conditions
			Callback(Input);

		end);

	end;

	function SupportLibrary.AddGuiInputListener(Gui, InputState, InputType, CatchAll, Callback)
		-- Connects to the given GUI user input event and takes care of standard boilerplate code

		-- Turn the given `InputType` string into a proper enum
		local InputType = Enum.UserInputType[InputType];

		-- Create a UserInputService listener based on the given `InputState`
		return Gui['Input' .. InputState]:connect(function (Input, GameProcessedEvent)

			-- Make sure this input was not captured by the client (unless `CatchAll` is enabled)
			if GameProcessedEvent and not CatchAll then
				return;
			end;

			-- Make sure this is the right input type
			if Input.UserInputType ~= InputType then
				return;
			end;

			-- Call back upon passing all conditions
			Callback(Input);

		end);

	end;

	function SupportLibrary.AreKeysPressed(...)
		-- Returns whether the given keys are pressed

		local RequestedKeysPressed = 0;

		-- Get currently pressed keys
		local PressedKeys = SupportLibrary.GetListMembers(Game:GetService('UserInputService'):GetKeysPressed(), 'KeyCode');

		-- Go through each requested key
		for _, Key in pairs({ ... }) do

			-- Count requested keys that are pressed
			if SupportLibrary.IsInTable(PressedKeys, Key) then
				RequestedKeysPressed = RequestedKeysPressed + 1;
			end;

		end;

		-- Return whether all the requested keys are pressed or not
		return RequestedKeysPressed == #{...};

	end;

	function SupportLibrary.ConcatTable(DestinationTable, SourceTable)
		-- Inserts all values of SourceTable into DestinationTable

		-- Add each value from `SourceTable` into `DestinationTable`
		for _, Value in ipairs(SourceTable) do
			table.insert(DestinationTable, Value);
		end;

		-- Return the destination table
		return DestinationTable;
	end;

	function SupportLibrary.ClearTable(Table)
		-- Clears out every value in `Table`

		-- Clear each index
		for Index in pairs(Table) do
			Table[Index] = nil;
		end;

		-- Return the given table
		return Table;
	end;

	function SupportLibrary.Values(Table)
		-- Returns all the values in the given table

		local Values = {};

		-- Go through each key and get each value
		for _, Value in pairs(Table) do
			table.insert(Values, Value);
		end;

		-- Return the values
		return Values;
	end;

	function SupportLibrary.Keys(Table)
		-- Returns all the keys in the given table

		local Keys = {};

		-- Go through each key and get each value
		for Key in pairs(Table) do
			table.insert(Keys, Key);
		end;

		-- Return the values
		return Keys;
	end;

	function SupportLibrary.Call(Function, ...)
		-- Returns a callback to `Function` with the given arguments
		local Args = { ... };
		return function (...)
			return Function(unpack(
				SupportLibrary.ConcatTable(SupportLibrary.CloneTable(Args), { ... })
			));
		end;
	end;

	function SupportLibrary.Trim(String)
		-- Returns a trimmed version of `String` (adapted from code from lua-users)
		return (String:gsub("^%s*(.-)%s*$", "%1"));
	end

	function SupportLibrary.ChainCall(...)
		-- Returns function that passes arguments through given functions and returns the final result

		-- Get the given chain of functions
		local Chain = { ... };

		-- Return the chaining function
		return function (...)

			-- Get arguments
			local Arguments = { ... };

			-- Go through each function and store the returned data to reuse in the next function's arguments 
			for _, Function in ipairs(Chain) do
				Arguments = { Function(unpack(Arguments)) };
			end;

			-- Return the final returned data
			return unpack(Arguments);

		end;

	end;

	function SupportLibrary.CountKeys(Table)
		-- Returns the number of keys in `Table`

		local Count = 0;

		-- Count each key
		for _ in pairs(Table) do
			Count = Count + 1;
		end;

		-- Return the count
		return Count;

	end;

	function SupportLibrary.Slice(Table, Start, End)
		-- Returns values from `Start` to `End` in `Table`

		local Slice = {};

		-- Go through the given indices
		for Index = Start, End do
			table.insert(Slice, Table[Index]);
		end;

		-- Return the slice
		return Slice;

	end;

	function SupportLibrary.FlipTable(Table)
		-- Returns a table with keys and values in `Table` swapped

		local FlippedTable = {};

		-- Flip each key and value
		for Key, Value in pairs(Table) do
			FlippedTable[Value] = Key;
		end;

		-- Return the flipped table
		return FlippedTable;

	end;

	function SupportLibrary.ScheduleRecurringTask(TaskFunction, Interval)
		-- Repeats `Task` every `Interval` seconds until stopped

		-- Create a task object
		local Task = {

			-- A switch determining if it's running or not
			Running = true;

			-- A function to stop this task
			Stop = function (Task)
				Task.Running = false;
			end;

			-- References to the task function and set interval
			TaskFunction = TaskFunction;
			Interval = Interval;

		};

		coroutine.wrap(function (Task)

			-- Repeat the task
			while wait(Task.Interval) and Task.Running do
				Task.TaskFunction();
			end;

		end)(Task);

		-- Return the task object
		return Task;

	end;

	function SupportLibrary.Clamp(Number, Minimum, Maximum)
		-- Returns the given number, clamped according to the provided min/max

		-- Clamp the number
		if Minimum and Number < Minimum then
			Number = Minimum;
		elseif Maximum and Number > Maximum then
			Number = Maximum;
		end;

		-- Return the clamped number
		return Number;

	end;

	function SupportLibrary.ReverseTable(Table)
		-- Returns a new table with values in the opposite order

		local ReversedTable = {};

		-- Copy each value at the opposite key
		for Index, Value in ipairs(Table) do
			ReversedTable[#Table - Index + 1] = Value;
		end;

		-- Return the reversed table
		return ReversedTable;

	end;

	return SupportLibrary;
end

function BTRequires.SerializationV3()
	local Serialization = {};

	-- Import services
	Support = require('SupportLibrary');
	Support.ImportServices();

	local Types = {
		Part = 0,
		WedgePart = 1,
		CornerWedgePart = 2,
		VehicleSeat = 3,
		Seat = 4,
		TrussPart = 5,
		SpecialMesh = 6,
		Texture = 7,
		Decal = 8,
		PointLight = 9,
		SpotLight = 10,
		SurfaceLight = 11,
		Smoke = 12,
		Fire = 13,
		Sparkles = 14,
		Model = 15
	};

	local DefaultNames = {
		Part = 'Part',
		WedgePart = 'Wedge',
		CornerWedgePart = 'CornerWedge',
		VehicleSeat = 'VehicleSeat',
		Seat = 'Seat',
		TrussPart = 'Truss',
		SpecialMesh = 'Mesh',
		Texture = 'Texture',
		Decal = 'Decal',
		PointLight = 'PointLight',
		SpotLight = 'SpotLight',
		SurfaceLight = 'SurfaceLight',
		Smoke = 'Smoke',
		Fire = 'Fire',
		Sparkles = 'Sparkles',
		Model = 'Model'
	};

	function Serialization.SerializeModel(Items)
		-- Returns a serialized version of the given model

		-- Filter out non-serializable items in `Items`
		local SerializableItems = {};
		for Index, Item in ipairs(Items) do
			table.insert(SerializableItems, Types[Item.ClassName] and Item or nil);
		end;
		Items = SerializableItems;

		-- Get a snapshot of the content
		local Keys = Support.FlipTable(Items);

		local Data = {};
		Data.Version = 3;
		Data.Items = {};

		-- Serialize each item in the model
		for Index, Item in pairs(Items) do

			if Item:IsA 'BasePart' then
				local Datum = {};
				Datum[1] = Types[Item.ClassName];
				Datum[2] = Keys[Item.Parent] or 0;
				Datum[3] = Item.Name == DefaultNames[Item.ClassName] and '' or Item.Name;
				Datum[4] = Item.Size.X;
				Datum[5] = Item.Size.Y;
				Datum[6] = Item.Size.Z;
				Support.ConcatTable(Datum, { Item.CFrame:components() });
				Datum[19] = Item.Color.r;
				Datum[20] = Item.Color.g;
				Datum[21] = Item.Color.b;
				Datum[22] = Item.Material.Value;
				Datum[23] = Item.Anchored and 1 or 0;
				Datum[24] = Item.CanCollide and 1 or 0;
				Datum[25] = Item.Reflectance;
				Datum[26] = Item.Transparency;
				Datum[27] = Item.TopSurface.Value;
				Datum[28] = Item.BottomSurface.Value;
				Datum[29] = Item.FrontSurface.Value;
				Datum[30] = Item.BackSurface.Value;
				Datum[31] = Item.LeftSurface.Value;
				Datum[32] = Item.RightSurface.Value;
				Data.Items[Index] = Datum;
			end;

			if Item.ClassName == 'Part' then
				local Datum = Data.Items[Index];
				Datum[33] = Item.Shape.Value;
			end;

			if Item.ClassName == 'VehicleSeat' then
				local Datum = Data.Items[Index];
				Datum[33] = Item.MaxSpeed;
				Datum[34] = Item.Torque;
				Datum[35] = Item.TurnSpeed;
			end;

			if Item.ClassName == 'TrussPart' then
				local Datum = Data.Items[Index];
				Datum[33] = Item.Style.Value;
			end;

			if Item.ClassName == 'SpecialMesh' then
				local Datum = {};
				Datum[1] = Types[Item.ClassName];
				Datum[2] = Keys[Item.Parent] or 0;
				Datum[3] = Item.Name == DefaultNames[Item.ClassName] and '' or Item.Name;
				Datum[4] = Item.MeshType.Value;
				Datum[5] = Item.MeshId;
				Datum[6] = Item.TextureId;
				Datum[7] = Item.Offset.X;
				Datum[8] = Item.Offset.Y;
				Datum[9] = Item.Offset.Z;
				Datum[10] = Item.Scale.X;
				Datum[11] = Item.Scale.Y;
				Datum[12] = Item.Scale.Z;
				Datum[13] = Item.VertexColor.X;
				Datum[14] = Item.VertexColor.Y;
				Datum[15] = Item.VertexColor.Z;
				Data.Items[Index] = Datum;
			end;

			if Item:IsA 'Decal' then
				local Datum = {};
				Datum[1] = Types[Item.ClassName];
				Datum[2] = Keys[Item.Parent] or 0;
				Datum[3] = Item.Name == DefaultNames[Item.ClassName] and '' or Item.Name;
				Datum[4] = Item.Texture;
				Datum[5] = Item.Transparency;
				Datum[6] = Item.Face.Value;
				Data.Items[Index] = Datum;
			end;

			if Item.ClassName == 'Texture' then
				local Datum = Data.Items[Index];
				Datum[7] = Item.StudsPerTileU;
				Datum[8] = Item.StudsPerTileV;
			end;

			if Item:IsA 'Light' then
				local Datum = {};
				Datum[1] = Types[Item.ClassName];
				Datum[2] = Keys[Item.Parent] or 0;
				Datum[3] = Item.Name == DefaultNames[Item.ClassName] and '' or Item.Name;
				Datum[4] = Item.Brightness;
				Datum[5] = Item.Color.r;
				Datum[6] = Item.Color.g;
				Datum[7] = Item.Color.b;
				Datum[8] = Item.Enabled and 1 or 0;
				Datum[9] = Item.Shadows and 1 or 0;
				Data.Items[Index] = Datum;
			end;

			if Item.ClassName == 'PointLight' then
				local Datum = Data.Items[Index];
				Datum[10] = Item.Range;
			end;

			if Item.ClassName == 'SpotLight' then
				local Datum = Data.Items[Index];
				Datum[10] = Item.Range;
				Datum[11] = Item.Angle;
				Datum[12] = Item.Face.Value;
			end;

			if Item.ClassName == 'SurfaceLight' then
				local Datum = Data.Items[Index];
				Datum[10] = Item.Range;
				Datum[11] = Item.Angle;
				Datum[12] = Item.Face.Value;
			end;

			if Item.ClassName == 'Smoke' then
				local Datum = {};
				Datum[1] = Types[Item.ClassName];
				Datum[2] = Keys[Item.Parent] or 0;
				Datum[3] = Item.Name == DefaultNames[Item.ClassName] and '' or Item.Name;
				Datum[4] = Item.Enabled and 1 or 0;
				Datum[5] = Item.Color.r;
				Datum[6] = Item.Color.g;
				Datum[7] = Item.Color.b;
				Datum[8] = Item.Size;
				Datum[9] = Item.RiseVelocity;
				Datum[10] = Item.Opacity;
				Data.Items[Index] = Datum;
			end;

			if Item.ClassName == 'Fire' then
				local Datum = {};
				Datum[1] = Types[Item.ClassName];
				Datum[2] = Keys[Item.Parent] or 0;
				Datum[3] = Item.Name == DefaultNames[Item.ClassName] and '' or Item.Name;
				Datum[4] = Item.Enabled and 1 or 0;
				Datum[5] = Item.Color.r;
				Datum[6] = Item.Color.g;
				Datum[7] = Item.Color.b;
				Datum[8] = Item.SecondaryColor.r;
				Datum[9] = Item.SecondaryColor.g;
				Datum[10] = Item.SecondaryColor.b;
				Datum[11] = Item.Heat;
				Datum[12] = Item.Size;
				Data.Items[Index] = Datum;
			end;

			if Item.ClassName == 'Sparkles' then
				local Datum = {};
				Datum[1] = Types[Item.ClassName];
				Datum[2] = Keys[Item.Parent] or 0;
				Datum[3] = Item.Name == DefaultNames[Item.ClassName] and '' or Item.Name;
				Datum[4] = Item.Enabled and 1 or 0;
				Datum[5] = Item.SparkleColor.r;
				Datum[6] = Item.SparkleColor.g;
				Datum[7] = Item.SparkleColor.b;
				Data.Items[Index] = Datum;
			end;

			if Item.ClassName == 'Model' then
				local Datum = {};
				Datum[1] = Types[Item.ClassName];
				Datum[2] = Keys[Item.Parent] or 0;
				Datum[3] = Item.Name == DefaultNames[Item.ClassName] and '' or Item.Name;
				Datum[4] = Item.PrimaryPart and Keys[Item.PrimaryPart] or 0;
				Data.Items[Index] = Datum;
			end;

			-- Spread the workload over time to avoid locking up the CPU
			if Index % 100 == 0 then
				wait(0.01);
			end;

		end;

		-- Return the serialized data
		return HttpService:JSONEncode(Data);

	end;

	function Serialization.InflateBuildData(Data)
		-- Returns an inflated version of the given build data

		local Build = {};
		local Instances = {};

		-- Create each instance
		for Index, Datum in ipairs(Data.Items) do

			-- Inflate BaseParts
			if Datum[1] == Types.Part
				or Datum[1] == Types.WedgePart
				or Datum[1] == Types.CornerWedgePart
				or Datum[1] == Types.VehicleSeat
				or Datum[1] == Types.Seat
				or Datum[1] == Types.TrussPart
			then
				local Item = Instance.new(Support.FindTableOccurrence(Types, Datum[1]));
				Item.Size = Vector3.new(unpack(Support.Slice(Datum, 4, 6)));
				Item.CFrame = CFrame.new(unpack(Support.Slice(Datum, 7, 18)));
				Item.Color = Color3.new(Datum[19], Datum[20], Datum[21]);
				Item.Material = Datum[22];
				Item.Anchored = Datum[23] == 1;
				Item.CanCollide = Datum[24] == 1;
				Item.Reflectance = Datum[25];
				Item.Transparency = Datum[26];
				Item.TopSurface = Datum[27];
				Item.BottomSurface = Datum[28];
				Item.FrontSurface = Datum[29];
				Item.BackSurface = Datum[30];
				Item.LeftSurface = Datum[31];
				Item.RightSurface = Datum[32];

				-- Register the part
				Instances[Index] = Item;
			end;

			-- Inflate specific Part properties
			if Datum[1] == Types.Part then
				local Item = Instances[Index];
				Item.Shape = Datum[33];
			end;

			-- Inflate specific VehicleSeat properties
			if Datum[1] == Types.VehicleSeat then
				local Item = Instances[Index];
				Item.MaxSpeed = Datum[33];
				Item.Torque = Datum[34];
				Item.TurnSpeed = Datum[35];
			end;

			-- Inflate specific TrussPart properties
			if Datum[1] == Types.TrussPart then
				local Item = Instances[Index];
				Item.Style = Datum[33];
			end;

			-- Inflate SpecialMesh instances
			if Datum[1] == Types.SpecialMesh then
				local Item = Instance.new('SpecialMesh');
				Item.MeshType = Datum[4];
				Item.MeshId = Datum[5];
				Item.TextureId = Datum[6];
				Item.Offset = Vector3.new(unpack(Support.Slice(Datum, 7, 9)));
				Item.Scale = Vector3.new(unpack(Support.Slice(Datum, 10, 12)));
				Item.VertexColor = Vector3.new(unpack(Support.Slice(Datum, 13, 15)));

				-- Register the mesh
				Instances[Index] = Item;
			end;

			-- Inflate Decal instances
			if Datum[1] == Types.Decal or Datum[1] == Types.Texture then
				local Item = Instance.new(Support.FindTableOccurrence(Types, Datum[1]));
				Item.Texture = Datum[4];
				Item.Transparency = Datum[5];
				Item.Face = Datum[6];

				-- Register the Decal
				Instances[Index] = Item;
			end;

			-- Inflate specific Texture properties
			if Datum[1] == Types.Texture then
				local Item = Instances[Index];
				Item.StudsPerTileU = Datum[7];
				Item.StudsPerTileV = Datum[8];
			end;

			-- Inflate Light instances
			if Datum[1] == Types.PointLight
				or Datum[1] == Types.SpotLight
				or Datum[1] == Types.SurfaceLight
			then
				local Item = Instance.new(Support.FindTableOccurrence(Types, Datum[1]));
				Item.Brightness = Datum[4];
				Item.Color = Color3.new(unpack(Support.Slice(Datum, 5, 7)));
				Item.Enabled = Datum[8] == 1;
				Item.Shadows = Datum[9] == 1;

				-- Register the light
				Instances[Index] = Item;
			end;

			-- Inflate specific PointLight properties
			if Datum[1] == Types.PointLight then
				local Item = Instances[Index];
				Item.Range = Datum[10];
			end;

			-- Inflate specific SpotLight properties
			if Datum[1] == Types.SpotLight then
				local Item = Instances[Index];
				Item.Range = Datum[10];
				Item.Angle = Datum[11];
				Item.Face = Datum[12];
			end;

			-- Inflate specific SurfaceLight properties
			if Datum[1] == Types.SurfaceLight then
				local Item = Instances[Index];
				Item.Range = Datum[10];
				Item.Angle = Datum[11];
				Item.Face = Datum[12];
			end;

			-- Inflate Smoke instances
			if Datum[1] == Types.Smoke then
				local Item = Instance.new('Smoke');
				Item.Enabled = Datum[4] == 1;
				Item.Color = Color3.new(unpack(Support.Slice(Datum, 5, 7)));
				Item.Size = Datum[8];
				Item.RiseVelocity = Datum[9];
				Item.Opacity = Datum[10];

				-- Register the smoke
				Instances[Index] = Item;
			end;

			-- Inflate Fire instances
			if Datum[1] == Types.Fire then
				local Item = Instance.new('Fire');
				Item.Enabled = Datum[4] == 1;
				Item.Color = Color3.new(unpack(Support.Slice(Datum, 5, 7)));
				Item.SecondaryColor = Color3.new(unpack(Support.Slice(Datum, 8, 10)));
				Item.Heat = Datum[11];
				Item.Size = Datum[12];

				-- Register the fire
				Instances[Index] = Item;
			end;

			-- Inflate Sparkles instances
			if Datum[1] == Types.Sparkles then
				local Item = Instance.new('Sparkles');
				Item.Enabled = Datum[4] == 1;
				Item.SparkleColor = Color3.new(unpack(Support.Slice(Datum, 5, 7)));

				-- Register the instance
				Instances[Index] = Item;
			end;

			-- Inflate Model instances
			if Datum[1] == Types.Model then
				local Item = Instance.new('Model');

				-- Register the model
				Instances[Index] = Item;
			end;

		end;

		-- Set object values on each instance
		for Index, Datum in pairs(Data.Items) do

			-- Get the item's instance
			local Item = Instances[Index];

			-- Set each item's parent and name
			if Item and Datum[1] <= 15 then
				Item.Name = (Datum[3] == '') and DefaultNames[Item.ClassName] or Datum[3];
				if Datum[2] == 0 then
					table.insert(Build, Item);
				else
					Item.Parent = Instances[Datum[2]];
				end;
			end;

			-- Set model primary parts
			if Item and Datum[1] == 15 then
				Item.PrimaryPart = (Datum[4] ~= 0) and Instances[Datum[4]] or nil;
			end;

		end;

		-- Return the model
		return Build;

	end;

	-- Return the API
	return Serialization;
end

------------------------------------------------------------

local HttpService = game:GetService('HttpService')
--local CoreGui = game:GetService('CoreGui')
local Workspace = game:GetService('Workspace')
local Selection = game:GetService('Selection')
local export_base_url = 'http://www.f3xteam.com/bt/export/%s';

local GUI;

------------------------------------------
-- Load external dependencies
------------------------------------------
--local SerializationV1 = require(script.SerializationV1)
--local SerializationV2 = require(script.SerializationV2)
local SerializationV3 = require('SerializationV3')

------------------------------------------
-- Define functions that are depended-upon
------------------------------------------

function import( creation_id )

	-- Try to download the creation
	local creation_data;
	local download_attempt, download_error = ypcall( function ()
		creation_data = HttpService:GetAsync( export_base_url:format( creation_id ) );
	end );

	-- Fail graciously
	if not download_attempt and download_error == 'Http requests are not enabled' then
		print 'Import from Building Tools by F3X: Please enable HTTP requests (see http://wiki.roblox.com/index.php?title=Sending_HTTP_requests#Http_requests_are_not_enabled)';
		--warn( 'Please enable HTTP requests (see Output)', 'Got it' );
		return false, 1;
	end;
	if not download_attempt then
		--print( 'Import from Building Tools by F3X (download request error): ' .. tostring( download_error ) );
		--warn( "We couldn't get your creation", 'Oh' );
		return false, 2, download_error;
	end;
	if not ( creation_data and type( creation_data ) == 'string' and creation_data:len() > 0 ) then
		--warn( "We couldn't get your creation", ':(' );
		return false, 3;
	end;
	if not pcall( function () creation_data = HttpService:JSONDecode( creation_data ); end ) then
		--warn( "We couldn't get your creation", ":'(" );
		return false, 5;
	end;

	-- Create a container to hold the creation
	local Container = Instance.new('Model');
	Container.Name = 'BTExport';

	-- Inflate legacy v1 export data
	if creation_data.version == 1 then
		SerializationV1(creation_data, Container)
		Container:MakeJoints()
		--Selection:Set({ Container })
		return Container
	-- Parse builds with serialization format version 2
	elseif creation_data.Version == 2 then

		-- Inflate the build data
		local Parts = SerializationV2.InflateBuildData(creation_data);

		-- Parent the build into the export container
		for _, Part in pairs(Parts) do
			Part.Parent = Container;
		end;

		-- Finalize the import
		Container:MakeJoints();
		--Selection:Set { Container };
		return true, Container
	-- Parse builds with serialization format version 3
	elseif creation_data.Version == 3 then

		-- Inflate the build data
		local Parts = SerializationV3.InflateBuildData(creation_data);

		-- Parent the build into the export container
		for _, Part in pairs(Parts) do
			Part.Parent = Container;
		end;

		-- Finalize the import
		Container:MakeJoints();
		--Selection:Set { Container };
		return true, Container
	end;

end

return import