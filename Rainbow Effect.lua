local Part = game.Workspace.Part -- Poner el part que querais colorear (Efecto arcoíris)
while true do
	Part.Color = Color3.new(255/255,0/255,0/255)
	for i = 0,255,10 do
		wait()
		Part.Color = Color3.new(255/255,i/255,0/255)
	end
	for i = 255,0,-10 do
		wait()
		Part.Color = Color3.new(i/255,255/255,0/255)
	end
	for i = 0,255,10 do
		wait()
		Part.Color = Color3.new(0/255,255/255,i/255)
	end
	for i = 255,0,-10 do
		wait()
		Part.Color = Color3.new(0/255,i/255,255/255)
	end
	for i = 0,255,10 do
		wait()
		Part.Color = Color3.new(i/255,0/255,255/255)
	end
	for i = 255,0,-10 do
		wait()
		Part.Color = Color3.new(255/255,0/255,i/255)
	end
end