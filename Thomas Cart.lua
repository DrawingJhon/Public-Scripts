local function setCartMesh(cart)
	if cart.Name == "Cart" and cart:IsA("Model") and cart.Parent:IsA("Model") then
		local rocketMesh = cart["Rocket Mesh"]
		local mesh = rocketMesh.Mesh
		mesh.MeshId = "rbxassetid://431017802"
		mesh.TextureId = "rbxassetid://431017809"
		mesh.Scale = Vector3.new(0.020,0.020,0.015)
		local weld = rocketMesh:findFirstChildOfClass("ManualWeld")
		weld.C0 = weld.C0 * CFrame.Angles(0, math.rad(180), 0) * CFrame.new(-1.3, 0, 5)
	end
end

for i, v in pairs(workspace:GetChildren()) do
	if v.Name == "Cart" and v:IsA("Model") then
		for k, c in pairs(v:GetChildren()) do
			setCartMesh(c)
		end
		v.ChildAdded:Connect(setCartMesh)
	end
end

if workspace:findFirstChild("THOMAS_SOUND") then
	workspace.THOMAS_SOUND:Destroy()
end
local sound = Instance.new("Sound")
sound.Name = "THOMAS_SOUND"
sound.SoundId = "rbxassetid://2278659857"
sound.Parent = workspace
sound.Looped = true
sound:Play()