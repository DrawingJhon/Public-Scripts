local LocalPlayer = game:GetService("Players").LocalPlayer

local protect = newcclosure or protect_function

local oldnmcl; oldnmcl = hookmetamethod(game, "__namecall", protect(function(self, ...)
	local method = getnamecallmethod()
	if self == LocalPlayer and (method == "Kick" or method == "kick") then
		return
	end
	return oldnmcl(self, ...)
end))
	
local old; old = hookfunction(LocalPlayer.Kick, protect(function(self, ...)
	if self ~= LocalPlayer then
		old(self, ...)
	end
end))