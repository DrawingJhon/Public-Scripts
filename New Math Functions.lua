local function pingpong(min, max, val)
	if (val - min) / (max - min) % 2 < 1 then
		return (val - min) % (max - min) + min
	else
		return max - (val - min) % (max - min) + min
	end
end

local function mrepeat(min, max, val)
	return (val - min) % (max - min) + min
end