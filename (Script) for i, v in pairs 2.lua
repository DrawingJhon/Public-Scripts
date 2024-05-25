local Model1 = Instance.new("Model", game.Workspace)
local ns = game.Workspace:GetChildren()

for i, v in pairs(ns) do
	if v:IsA("Part") then
		v.Parent = Model1
	end
end