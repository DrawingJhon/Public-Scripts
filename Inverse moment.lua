for i, v in pairs(workspace:GetDescendants()) do
	if v:IsA("BasePart") and not v:IsA("Terrain") then
		local pos = v.Position
		local rot = v.Rotation
		v.Position = Vector3.new(pos.X,pos.Y,-pos.Z + 78)
		v.Rotation = Vector3.new(-rot.X, -rot.Y, rot.Z)
	end
end

for i, v in pairs(workspace:GetDescendants()) do
	if v:IsA("BasePart") and v.Name == "Regen" and v.Parent:IsA("Model") and v:findFirstChild("Script") then
		local cartModel = v.Parent
		local initCFrame = v.CFrame
		cartModel.ChildAdded:Connect(function(cart)
			if cart.Name == "Cart" and cart:IsA("Model") then
				cart:PivotTo(initCFrame * CFrame.new(-3.5, 3, -2))
			end
		end)
	end
end

shared.Server.Admin.RunCommand(":setmessage Hmm, something is wrong here...")