local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()
local Render = game:GetService("RunService").RenderStepped
local Controller = require(plr:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
local cam = workspace.CurrentCamera
local lastZoom = plr.CameraMaxZoomDistance
local lastCamCFrame = cam.CFrame
local CameraPart = Instance.new("Part")
CameraPart.CanCollide = false
CameraPart.Transparency = 1
CameraPart.CFrame = lastCamCFrame
CameraPart.Parent = workspace
local bp = Instance.new("BodyPosition", CameraPart)
bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bp.Position = CameraPart.Position
bp.D = 700
local Enabled = false

local function Start()
	Enabled = true
	Controller:Disable()
	plr.CameraMaxZoomDistance = 0
	plr.CameraMinZoomDistance = 0
	bp.Position = cam.CFrame.p
	cam.CameraSubject = CameraPart
	local pressing = {}
	local vel = 1
	local function SetMovement(key, pos)
		pressing[key] = true
		repeat
			bp.Position = bp.Position + ((cam.CFrame * pos).p - cam.CFrame.p)
			Render:Wait()
		until not pressing[key] or not Enabled
	end
	local KDConn, KUConn
	KDConn = mouse.KeyDown:Connect(function(key)
		if not Enabled then KDConn:Disconnect() return end
		local key = key:lower()
		if key == "w" then
			SetMovement("w", CFrame.new(0, 0, -vel))
		elseif key == "d" then
			SetMovement("d", CFrame.new(vel, 0, 0))
		elseif key == "s" then
			SetMovement("s", CFrame.new(0, 0, vel))
		elseif key == "a" then
			SetMovement("a", CFrame.new(-vel, 0, 0))
		elseif key == "e" then
			SetMovement("e", CFrame.new(0, vel, 0))
		elseif key == "q" then
			SetMovement("q", CFrame.new(0, -vel, 0))
		end
	end)
	KUConn = mouse.KeyUp:Connect(function(key)
		if not Enabled then KUConn:Disconnect() return end
		local key = key:lower()
		pressing[key] = false
	end)
end
local function End()
	Enabled = false
	Controller:Enable()
	cam.CameraSubject = plr.Character and plr.Character:findFirstChildOfClass("Humanoid")
	plr.CameraMaxZoomDistance = lastZoom
	wait()
	cam.CFrame = lastCamCFrame
end

mouse.KeyDown:Connect(function(k)
	if k:lower() == "c" then
		if Enabled then
			End()
		else
			Start()
		end
	end
end)