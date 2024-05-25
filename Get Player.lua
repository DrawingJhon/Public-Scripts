local Players = game:GetService("Players")
for i, v in pairs(Players:GetChildren()) do
	v.Chatted:connect(function(msg)
		if msg:sub(1,1) == "/" then	
			for i, plr in pairs(Players:GetChildren()) do
				local lel = msg:sub(2)
				local low = lel:lower()
				local len = string.len(low)
				local ple = plr.Name:sub(1,len)
				if low == ple:lower() then
					print(plr.Name)
				end
			end
		end
	end)
end