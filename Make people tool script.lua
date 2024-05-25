local function playerTool(plr)
	if plr.Character then
		if plr.Character:findFirstChild("HumanoidRootPart") then
			local tool = Instance.new("Tool",workspace)
			tool.Name = plr.Name
			plr.Character.Parent = tool
			local humRootPart = plr.Character:findFirstChild("HumanoidRootPart")
			humRootPart.Name = "Handle"
			humRootPart.Parent = tool
		end
	end
end

local Players = game:GetService("Players")
local owner = Players.JhonXD2006
owner.Chatted:Connect(function(msg)
	if msg:lower() == "tool/me" then
		playerTool(owner)
	elseif msg:lower() == "tool/random" then
		local numRandom = math.random(1,#Players:GetPlayers())
		for i, v in pairs(Players:GetPlayers()) do
			if v == Players:GetChildren()[numRandom] then
				playerTool(v)
			end
		end
	elseif msg:lower() == "tool/all" then
		for i, v in pairs(Players:GetPlayers()) do
			playerTool(v)
		end
	elseif msg:lower() == "tool/others" then
		for i, v in pairs(Players:GetPlayers()) do
			if v.Name ~= owner.Name then
				playerTool(v)
			end
		end
	elseif msg:sub(1,5):lower() == "tool/" then
		for i, v in pairs(Players:GetPlayers()) do
			local wordLen = string.len(msg:sub(6))
			local word = msg:sub(6):lower()
			if word == v.Name:sub(1,wordLen):lower() then
				playerTool(v)
			end
		end
	end
end)