for i, v in pairs(game:GetChildren()) do
	pcall(function()
		local asdasucfsqadc = v.Name
		for _, child in pairs(v:GetDescendants()) do
			if child:IsA("BaseScript") then
				pcall(function()
					child:Destroy()
				end)
			end
		end
	end)
end