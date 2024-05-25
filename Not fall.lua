local plr = game:GetService("Players").LocalPlayer
local function moveP(h)
	local rNum1 = math.random(-50, 50)
	local rNum2 = math.random(-50, 50)
	local lastR = h.Rotation
	h.CFrame = CFrame.new(rNum1, 5, rNum2) * CFrame.Angles(math.rad(lastR.X), math.rad(lastR.Y), math.rad(lastR.Z))
	local body = Instance.new("BodyPosition",h)
	body.Position = Vector3.new(rNum1, 5, rNum2)
	body.MaxForce = Vector3.new(0, math.huge, 0)
	wait(1)
	body:Destroy()
end
while true do
	if plr.Character then
		if plr.Character:findFirstChild("HumanoidRootPart") then
			local hum = plr.Character:findFirstChild("HumanoidRootPart")
			if hum.Position.Y < -200 then
				moveP(hum)
			end
		elseif plr.Character:findFirstChildOfClass("Humanoid") then
			local hum = plr.Character:findFirstChildOfClass("Humanoid")
			if hum.Torso ~= nil then
				if hum.Torso.Position.Y < -200 then
					moveP(hum.Torso)
				end
			end
		end
	end
	wait()
end