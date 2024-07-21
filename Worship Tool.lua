local user = "all" -- your name or "all"
local function injectTool(tool)
	local so; so = function(id,par,vol,pit) 
		coroutine.resume(coroutine.create(function()
			local sou = Instance.new("Sound", workspace)
			sou.Volume=vol + 7
			sou.Pitch=pit or 1
			sou.SoundId=id 
			sou:play() 
			game:GetService("Debris"):AddItem(sou,6)
		end))
	end
	local on = false
	tool.Activated:Connect(function()
		if on then return end
		on = true
		local dad = tool.Parent
		dad.Humanoid:LoadAnimation(tool.oof):Play()
		game:GetService'Chat':Chat(dad.Head, ("PRAISE ALLAH "..tostring(math.random(2000)).." TIMES A DAY!!!! ALLAH AKBAR"), "Red")
		wait'5'
		for i = 1,6 do
			local sad = Instance.new'Explosion'
			sad.Position = dad.Head.Position + Vector3.new(math.random(15), math.random(15), math.random(15))
			sad.BlastRadius = 350
			sad.DestroyJointRadiusPercent = 0
			sad.Parent = workspace
		end
		dad:BreakJoints()
		so("rbxassetid://134854740",dad.Head,1,1.3) 
		--so("rbxassetid://2772100516",dad.Head,2.5,1)
		so("rbxassetid://247893371",dad.Head,2.5,1) -- Beautiful nasheed
		so("rbxassetid://137994058",dad.Head,1,1) 
		so("rbxassetid://165969964",dad.Head,1,1) 
	end)
end
local function getWorship(player)
	local tool = Instance.new("Tool")
	tool.Name = "Worship"
	tool.CanBeDropped = false
	tool.RequiresHandle = false
	tool.Enabled = true
	local oof = Instance.new("Animation", tool)
	oof.Name = "oof"
	oof.AnimationId = "rbxassetid://182749109"
	injectTool(tool)
	tool.Parent = player.Backpack
end

local function get(plr)
	getWorship(plr)
	plr.CharacterAdded:Connect(function()
		getWorship(plr)
	end)
end

if user == "all" then
	game:GetService("Players").PlayerAdded:Connect(get)
	for i, plr in pairs(game:GetService("Players"):GetPlayers()) do
		spawn(function()
			get(plr)
		end)
	end
else
	get(game:GetService("Players")[user])
end
