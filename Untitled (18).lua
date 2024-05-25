local RealGame = game
local game = setmetatable({}, {
	__index = function(tab, int)
		if int == "GetService" then
			return function(wht, lol)
				if lol == "Players" then
					return setmetatable(RealGame:GetService("Players"):GetChildren(), {
						__index = function(t, a)
							return owner
						end
					})
				end
				return RealGame:GetService(int)
			end
		end		
		return RealGame[int]
	end,
})

print(game:GetService("Players"))