plrs = game:GetService("Players")
local prefix = ";"
--[[local comp = true
while wait(0.5) do
	for i, v in pairs(plrs:GetChildren()) do
		if v.ClassName == "Player" then
			v.Chatted:Connect(function(msg)
				--if string.match(msg, "lol", 1) then
				if msg == "no" or msg == "yes" then
					if comp == true then
						print("Hello world")
						comp = false
						wait()
						comp = true
					end
				end
			end)
		end
	end
end]]
for i, v in pairs(plrs:GetChildren()) do
	if v.ClassName == "Player" then
		v.Chatted:connect(function(msg)
			if msg == prefix.."kill" then
				if v.Character:findFirstChild("Humanoid") then
					if v.Character.Humanoid.Health ~= 0 then
						v.Character.Humanoid.Health = 0
					end
				end
			elseif msg == prefix.."re" or msg == prefix.."respawn" or msg == prefix.."reset" or msg == prefix.."re me" then
				v:LoadCharacter()
			elseif msg == "/re" then
				print(mgs:sub(5))
			end
		end)
	end
end
--[[local h = Instance.new("Hint", workspace)
h.Text = "Don't type g/c"
for i, v in pairs(plrs:GetChildren()) do
	if v.ClassName ==  "Player" then
		v.Chatted:connect(function(msg)
			if msg == "g/c" or msg == "G/c" or msg == "g/C" or msg == "G/C" or msg == "g/clean" then
				if v.Character:findFirstChild("Humanoid") then
					if v.Character.Humanoid.Health ~= 0 then
						v.Character.Humanoid.Health = 0
					end
				end
			end
		end)
	end
end]]