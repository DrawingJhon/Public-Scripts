if pcall(function() return owner.Explode end) then
	error("Disable sandbox to run this script")
end

local server = shared.Server
local Settings = server.Settings
local Variables = server.Variables
local Functions = server.Functions
local service = server.Service

Variables.PassivePlayers = {}

local selfish = true
local notif = false

local realGetPlayers = _G.realGetPlayers or Functions.GetPlayers
_G.realGetPlayers = realGetPlayers
Functions.GetPlayers = function(plr, argument, options)
    local list = realGetPlayers(plr, argument, options)
    local passives = Variables.PassivePlayers
    local filteredList = {}
 
    if list and type(list) == "table" then
        for i, v in pairs(list) do
            if plr and v ~= plr and (passives[tostring(v.UserId)] or (not selfish and passives[tostring(plr.UserId)])) then
				if notif then
              		Functions.Hint(v.Name.." is not targetable if you or they are in passive mode.", {plr})
				end
            else
                table.insert(filteredList, v)
            end
        end
	end
 
    return filteredList
end
service.GetPlayers = Functions.GetPlayers

server.Commands.TogglePassiveMode = {
	Prefix = Settings.PlayerPrefix;
	Commands = {"passive"};
	Args = {};
	Hidden = false;
	Description = "Toggles passive mode (Prevents players targeting you)";
	Fun = false;
	AdminLevel = "HeadAdmins";
	Function = function(plr, args, data)
		local tab = Variables.PassivePlayers
		local enabled = not tab[tostring(plr.UserId)]
		tab[tostring(plr.UserId)] = enabled
		service.StopLoop("Passive-"..plr.UserId)
		if enabled then
			service.StartLoop("Passive-"..plr.UserId, 2, function()
				local char = plr.Character
				if char then
					local hum = char:findFirstChildOfClass("Humanoid")
					if hum and (hum.MaxHealth ~= math.huge or hum.Health < 9e9) then
						hum.MaxHealth = math.huge
						hum.Health = 9e9
					end
					local FFName = "__ADONIS_PASSIVEFF"
					if not char:findFirstChild(FFName) then
						service.New("ForceField", {Name = FFName;Visible = false;Parent = char})
					end
				end
			end, true)
		end
		Functions.Hint("Passive mode is now "..(enabled and "active" or "inactive"), {plr})
	end
}

print("Done")