function resize(plr, scaled)
	if plr.Character then
		if plr.Character:findFirstChildOfClass("Humanoid") then
			if plr.Character:findFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 then
				plr.Character.Humanoid.BodyDepthScale.Value  = scaled
				plr.Character.Humanoid.BodyHeightScale.Value = scaled
				plr.Character.Humanoid.BodyWidthScale.Value = scaled
				plr.Character.Humanoid.HeadScale.Value = scaled
			end
		end
	end
end
local Players = game:GetService("Players")
local Owner = Players.JhonXD2006
if owner == nil then
	owner = Owner
end
owner.Chatted:Connect(function(msg)
	local parameters = msg:split(" ")
	
	local cmd = table.remove(parameters, 1)
	local plr = table.remove(parameters, 1)
	local size = table.concat(parameters, ' ')

	local msg = msg:lower()
	if cmd == ";resize" then
		if plr:lower() == "me" then
			resize(owner, size)
		elseif plr:lower() == "all" then
			for i, v in pairs(Players:GetPlayers()) do
				resize(v, size)
			end
		elseif plr:lower() == "others" then
			for i, v in pairs(Players:GetPlayers()) do
				if v.Name ~= owner.Name then
					resize(v, size)
				end
			end
		elseif plr:lower() == "random" then
			local numRandom = math.random(1,#Players:GetPlayers())
			for i, v in pairs(Players:GetPlayers()) do
				if v == Players:GetPlayers()[numRandom] then
					resize(v, size)
				end
			end
		else
			for i, v in pairs(Players:GetPlayers()) do
				local m = plr:lower()
				local l = string.len(plr)
				if m == v.Name:lower():sub(1,l) then
					resize(v, size)
				end
			end
		end
	end
end)