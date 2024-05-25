local Run = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
Character.Archivable = true
local Gui = Player:findFirstChildOfClass("PlayerGui")
local screen = Instance.new("ScreenGui", Gui)
screen.Name = "Xd"
local ViewportFrame = Instance.new("ViewportFrame", screen)
ViewportFrame.Size = UDim2.new(0, 300, 0, 300)
ViewportFrame.AnchorPoint = Vector2.new(1, 0)
ViewportFrame.Position = UDim2.new(1, 0, 0, 0)
local ViewportCamera = Instance.new("Camera", ViewportFrame)
ViewportFrame.CurrentCamera = ViewportCamera
ViewportCamera.CFrame = workspace.CurrentCamera.CFrame
local char = Character:Clone()
char.Parent = ViewportFrame
char.Humanoid.DisplayName = " "
Run.RenderStepped:Connect(function()
	for i, v in pairs(Character:GetChildren()) do
		for _, c in pairs(char:GetChildren()) do
			if c.Name == v.Name then
				if c:IsA("BasePart") then
					c.CFrame = v.CFrame
				elseif c:IsA("Accessory") then
					local handle = c:findFirstChild("Handle")
					local handle2 = v:findFirstChild("Handle")
					if handle and handle2 then
						handle.CFrame = handle2.CFrame
					end
				end
			end
		end
	end
end)