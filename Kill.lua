--Simple kill all xd
wait()
script.Parent = game.Lighting
local function scann(part)
	for i,v in pairs(part:GetChildren()) do
		scann(v)
		if v.ClassName == "Part" then
			v:destroy()
		end
		if v.ClassName == "Humanoid" then
			v.Health = 0
		end
		if v.ClassName == "Seat" then
			v:destroy()
		end
		if v.ClassName == "SpawnLocation" then
			v:destroy()
		end
		if v.ClassName == "MeshPart" then
			v:destroy()
		end
		if v.ClassName == "Sound" then
			v:destroy()
		end
	end
end