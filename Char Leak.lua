local players = game:GetService("Players")

function applyChar(plr, char)
	local success, desc = pcall(players.GetHumanoidDescriptionFromUserId, players, plr.UserId)
	if not success then
		warn("Unable to get avatar for "..plr.Name..": "..tostring(desc))
		return
	end

	if char and not char:findFirstChild("AppliedDescription") then
		local hum = char:findFirstChildOfClass("Humanoid")
		if hum then
			for i, v in pairs(char:GetChildren()) do
				if v:IsA("Accoutrement") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("Body Colors") then
					v:Destroy()
				end
			end
			Instance.new("BoolValue", char).Name = "AppliedDescription"
			hum:ApplyDescriptionClientServer(desc)
		end
	end
end

function newThread(func, ...)
	return coroutine.resume(coroutine.create(func), ...)
end

function hookPlayer(plr)
	if plr == players.LocalPlayer then return end
	if plr.Character then
		newThread(applyChar, plr, plr.Character)
	end
	plr.CharacterAdded:Connect(function(char)
		wait(2)
		applyChar(plr, char)
	end)
end

for i, v in pairs(players:GetPlayers()) do
	newThread(hookPlayer, v)
end

players.PlayerAdded:Connect(hookPlayer)