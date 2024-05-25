local Players = game:GetService("Players")
for i, plr in pairs(Players:GetChildren()) do
	plr.Chatted:connect(function(msg)
		if msg == "get/partkill" or msg == "g/pk" or msg == "get/pk" or msg == "g/partkill" then
			local h = plr.Character:findFirstChild("Humanoid")
			if h ~= nil then
				h.Health = 99999999999999999999999999
				wait()
				local p = Instance.new("Part", workspace)
				p.Position = plr.Character:findFirstChild("Head").Position
				p.TopSurface = Enum.SurfaceType.Smooth
				p.BottomSurface = Enum.SurfaceType.Smooth
				p.Anchored = true
				p.Touched:connect(function(hit)
					local hm = hit.Parent:findFirstChild("Humanoid")
					if hm ~= nil then
						hm.Health = hm.Health - 100
					end
				end)
			end
		end
	end)
end