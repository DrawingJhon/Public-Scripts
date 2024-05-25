while wait() do
function onTouched(part)
	local h = game.Workspace.Bruh:FindFirstChild("Humanoid")
	if h ~= nil then
		h.Health = h.Health - 100
	end
end
end
workspace:WaitForChild("Bruh").Touched:connect(onTouched)