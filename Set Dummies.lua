script.Name = "asdf"
script.Parent = nil

local function make(dum)
	if not dum.Name:match("Dummy") then return end
	if game:GetService("Players"):GetPlayerFromCharacter(dum) then return end
	local c = false
	local function scann(part)
		if part:IsA("CharacterMesh") or part:IsA("Accessory") then
			if part:IsA("Accessory") and c then
				return
			elseif part:IsA("Accessory") then
				c = true
			end
			coroutine.wrap(function()
				for i = 1,100 do
					part:Destroy()
					wait()
				end
			end)()
		end
	end
	dum.ChildAdded:Connect(scann)
	for i, v in pairs(dum:GetChildren()) do
		scann(v)
	end
	local conn
	dum.Name = "Default Dummy"
	conn = dum.Changed:Connect(function(a)
		if a == "Name" then
			dum.Name = "Default Dummy"
			conn:Disconnect()
		end
	end)
end
for i, v in pairs(workspace:GetChildren()) do
	make(v)
end
workspace.ChildAdded:connect(make)