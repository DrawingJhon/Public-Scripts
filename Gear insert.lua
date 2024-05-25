--|ROBLOX SCRIPT BUILDER|--
--|LOCAL SCRIPT|--
--|GEAR INSERT SCRIPT|--
 
gear_ids={3157668507} --insert gear asset ids
--------------------------------------
keep_gear_when_dead = false
---Source---
local player=game.Players.JhonXD2006
for i,v in pairs(gear_ids) do
	local id=tonumber(v)
	if id~=nil then
		game:GetService("InsertService"):LoadAsset(id):GetChildren()[1].Parent=workspace
		if keep_gear_when_dead == true then
			game:GetService("InsertService"):LoadAsset(id):GetChildren()[1].Parent=player.StarterGear
		end
	end
end