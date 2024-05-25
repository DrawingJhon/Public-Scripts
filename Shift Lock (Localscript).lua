local MobileCameraFramework = {}
local players = game:GetService("Players")
local runservice = game:GetService("RunService")
local CAS = game:GetService("ContextActionService")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local humanoid = character.Humanoid
local camera = workspace.CurrentCamera
local mouse = player:GetMouse()
local button = {}
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local DEFAULT_MOUSE_LOCK_CURSOR = "rbxasset://textures/MouseLockedCursor.png"

--Visiblity
uis = game:GetService("UserInputService")
ismobile = false --uis.TouchEnabled
button.Visible = ismobile

local states = {
	OFF = "rbxasset://textures/ui/mouseLock_off@2x.png",
	ON = "rbxasset://textures/ui/mouseLock_on@2x.png"
}
local MAX_LENGTH = 900000
local active = false
local ENABLED_OFFSET = CFrame.new(1.7, 0, 0)
local DISABLED_OFFSET = CFrame.new(-1.7, 0, 0)
local function UpdateImage(STATE)
	button.Image = states[STATE]
end
local function UpdateAutoRotate(BOOL)
	humanoid.AutoRotate = BOOL
end
local function GetUpdatedCameraCFrame(ROOT, CAMERA)
	return CFrame.new(root.Position, Vector3.new(CAMERA.CFrame.LookVector.X * MAX_LENGTH, root.Position.Y, CAMERA.CFrame.LookVector.Z * MAX_LENGTH))
end

local function isFirstPerson()
    local character = game:GetService("Players").LocalPlayer.Character
	local head = character and character:findFirstChild("Head")
	if head and head:IsA("BasePart") then
		if (character.Head.CFrame.p - camera.CFrame.p).magnitude < 1 then
			return true
		else
			return false
		end
	end
end

local function EnableShiftlock()
	if isFirstPerson() then return end
	mouse.Icon = DEFAULT_MOUSE_LOCK_CURSOR
	UpdateAutoRotate(false)
	UpdateImage("ON")
	UserGameSettings.RotationType = Enum.RotationType.CameraRelative
	uis.MouseBehavior = Enum.MouseBehavior.LockCenter
	root.CFrame = GetUpdatedCameraCFrame(root, camera)
	camera.CFrame = camera.CFrame * ENABLED_OFFSET
end
local function DisableShiftlock()
	mouse.Icon = ""
	UpdateAutoRotate(true)
	UpdateImage("OFF")
	camera.CFrame = camera.CFrame * DISABLED_OFFSET
	pcall(function()
		active:Disconnect()
		active = nil
	end)
end
UpdateImage("OFF")
active = false
function ShiftLock()
	if not active then
		active = runservice.RenderStepped:Connect(function()
			EnableShiftlock()
		end)
	else
		DisableShiftlock()
	end
end
local ShiftLockButton = CAS:BindAction("ShiftLOCK", ShiftLock, false, "On")
CAS:SetPosition("ShiftLOCK", UDim2.new(0.8, 0, 0.8, 0))
local AllowedToShiftLock = true
uis.InputBegan:Connect(function(input)
	if not AllowedToShiftLock then return end
	if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
		ShiftLock()
	end
end)

player.Chatted:Connect(function(msg)
	msg = msg:gsub("^/e ", "")
	if msg:lower() == "/enableshiftlock" then
		AllowedToShiftLock = true
		warn("Shift lock enabled")
	elseif msg:lower() == "/disableshiftlock" then
		AllowedToShiftLock = false
		DisableShiftlock()
		warn("Shift lock disabled")
	end
end)