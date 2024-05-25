wait(2)
if game.ServerStorage:findFirstChild("Correct") == nil then
	while true do
		local h = Instance.new("Hint", workspace)
		h.Text = "Ha habido un fallo inesperado y el servidor no ha cargado correctamente"
		wait(6)
		if workspace:findFirstChild("Message") then
			h.Text = 'Algunos comandos como el "get/utg, get/script,etc." no funcionarán'
			wait(6)
			if workspace:findFirstChild("Message") then
				h.Text = "Salga y vuelva a entrar para cambiar de server y que todo funcione correctamente"
				wait(7)
			else
				local m = Instance.new("Hint", workspace)
				m.Text = "Salga y vuelva a entrar para cambiar de server y que todo funcione correctamente"
				wait(7)
			end
		else
			local j = Instance.new("Hint", workspace)
			j.Text = 'Algunos comandos como el "get/utg, get/script,etc." no funcionarán'
			wait(6)
			if workspace:findFirstChild("Message") then
				j.Text = "Salga y vuelva a entrar para cambiar de server y que todo funcione correctamente"
				wait(7)
			else
				local p = Instance.new("Hint", workspace)
				p.Text = "Salga y vuelva a entrar para cambiar de server y que todo funcione correctamente"
				wait(7)
			end
		end
	end
end