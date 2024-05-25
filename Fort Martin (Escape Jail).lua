local player = game.Players.LocalPlayer
local controlModule = player.PlayerScripts.PlayerModule.ControlModule

local function getRoot()
	return player.Character and player.Character:FindFirstChild("HumanoidRootPart")
end

if _G.Reset then
	_G.Reset()
end

local old; old = hookmetamethod(game, "__newindex", newcclosure(function(self, index, value)
	if index == "CFrame" and self == getRoot() and getfenv(2).script == controlModule then
		return
	end
	return old(self, index, value)
end))

_G.Reset = function()
	local mt = getrawmetatable(game)
	setreadonly(mt, false)
	mt.__newindex = old
	setreadonly(mt, true)
end

print("APPLIED")