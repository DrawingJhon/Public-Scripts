local plrservice = game:GetService("Players")
local function play()
	for i, v in pairs(plrservice:GetChildren()) do
		if v.Character:findFirstChild("Head") then
			cd = Instance.new("ClickDetector")
			cd.Parent = v.Character.Head
			v.Character.Head.ClickDetector.MouseClick:connect(function(plr)
				local explosion = Instance.new("Explosion", workspace)
				explosion.Position = v.Character.Head.Position
				local h = Instance.new("Hint", workspace)
				h.Text = (plr.Name.." exploded "..v.Name.."'s head!")
				--h.Text = plr.Name.." touched "..v.Name.."'s head!"
			end)
		end
		if v.Character:findFirstChild("HumanoidRootPart") then
			cd2 = Instance.new("ClickDetector")
			cd2.Parent = v.Character.HumanoidRootPart
			v.Character.HumanoidRootPart.ClickDetector.MouseClick:connect(function(plr)
				local explosion = Instance.new("Explosion", workspace)
				explosion.Position = v.Character.HumanoidRootPart.Position
				local h = Instance.new("Hint", workspace)
				h.Text = plr.Name.." exploited "..v.Name
			end)
		end
	end
end
play()
for i, v in pairs(plrservice:GetChildren()) do
	if v.Name == "JhonXD2006" then
		v.Chatted:connect(function(msg)
		while wait() do
			if msg == "/p" or msg == "/P" then
				play()
			end
		end)
		end
	end
end