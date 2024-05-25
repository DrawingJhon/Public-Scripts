local Players = game:GetService("Players")
local plr = Players.JhonXD2006
plr.Chatted:connect(function(message)
	if message:sub(1,1):lower() == "/" then
		local len = string.len(message:sub(2))
		local msg = string.lower(message:sub(2))
		local num = math.random(1,2)
		if num == 1 then
			for i = 1,len do
				if i % 2 == 0 then
					msg = msg:sub(1,i - 1)..msg:sub(i,i):upper()..msg:sub(i + 1):lower()
				end
			end
		elseif num == 2 then
			for i = 1,len do
				if i % 2 ~= 0 then
					msg = msg:sub(1,i - 1)..msg:sub(i,i):upper()..msg:sub(i + 1):lower()
				end
			end
		end
		print(msg)
	end
end)