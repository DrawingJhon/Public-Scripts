if game:GetService("RunService"):IsClient() then error("The script is server side, use h/ and not hl/ to run script") end
if owner.Character == nil then return end
owner.AutoJumpEnabled = false
if owner.Character then
	if owner.Character:findFirstChildOfClass("Humanoid") then
		owner.Character:findFirstChildOfClass("Humanoid").AutoJumpEnabled = false
	end
end

local remote = Instance.new("RemoteEvent")
remote.Name = "FlyRemote"

local cam1 = CFrame.new(0, 0, 0)
local cam2 = CFrame.new(0, 0, 0)
remote.OnServerEvent:Connect(function(plr, arg1, arg2)
	if arg1 == "cam" then
		cam1 = arg2
	elseif arg1 == "cam2" then
		cam2 = arg2
	end
end)

remote.Parent = NLS([==[
local plr = game:GetService("Players").LocalPlayer
local remote = script:WaitForChild("FlyRemote")
spawn(function()
	while true do
		remote:FireServer("cam", workspace.CurrentCamera.CoordinateFrame)
		wait()
	end
end)
spawn(function()
	while true do
		remote:FireServer("cam2", workspace.CurrentCamera.CoordinateFrame.lookVector)
		wait()
	end
end)
local mouse = plr:GetMouse()
mouse.KeyDown:Connect(function(key)
	remote:FireServer("KeyDown", key)
end)
mouse.KeyUp:Connect(function(key)
	remote:FireServer("KeyUp", key)
end)

]==], owner.PlayerGui)

local plr = owner
local mouse = plr:GetMouse()

localplayer = plr

if workspace:FindFirstChild("Core") then
	workspace.Core:Destroy()
end
		
local Core = Instance.new("Part")
Core.Name = "Core"
Core.Size = Vector3.new(0.05, 0.05, 0.05)

spawn(function()
	Core.Parent = workspace
	local Weld = Instance.new("Weld", Core)
	Weld.Part0 = Core
	Weld.Part1 = owner.Character:findFirstChild("LowerTorso")
	owner.CharacterAdded:Connect(function(char)
		Weld.Part1 = char:findFirstChild("LowerTorso") or char:findFirstChild("Torso")
		wait()
	end)
	Weld.C0 = CFrame.new(0, 0, 0)
end)
		
workspace:WaitForChild("Core")
		
local torso = workspace.Core
flying = true
local speed=10
local keys={a=false,d=false,w=false,s=false} 
local e1
local e2
local function start()
	local pos = Instance.new("BodyPosition",torso)
	local gyro = Instance.new("BodyGyro",torso)
	pos.Name="EPIXPOS"
	pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
	pos.position = torso.Position
	gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
	gyro.cframe = torso.CFrame
	repeat
		wait()
		localplayer.Character.Humanoid.PlatformStand=true
		local new=gyro.cframe - gyro.cframe.p + pos.position
		if not keys.w and not keys.s and not keys.a and not keys.d then
			speed=5
		end
		if keys.w then 
			new = new + cam2 * speed
			speed=speed+0
		end
		if keys.s then 
			new = new - cam2 * speed
			speed=speed+0
		end
		if keys.d then 
			new = new * CFrame.new(speed,0,0)
			speed=speed+0
		end
		if keys.a then 
			new = new * CFrame.new(-speed,0,0)
			speed=speed+0
		end
		if speed>10 then
			speed=5
		end
		pos.position=new.p
		if keys.w then
			gyro.cframe = cam1*CFrame.Angles(-math.rad(speed*0),0,0)
		elseif keys.s then
			gyro.cframe = cam1*CFrame.Angles(math.rad(speed*0),0,0)
		else
			gyro.cframe = cam1
		end
	until flying == false
	if gyro then gyro:Destroy() end
	if pos then pos:Destroy() end
	flying=false
	localplayer.Character.Humanoid.PlatformStand=false
	speed=10
end
e1 = remote.OnServerEvent:connect(function(plr, arg1, arg2)
	local key
	if arg1 ~= "KeyDown" then
		return
	else
		key = arg2
	end
	if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
	if key=="w" then
		keys.w=true
	elseif key=="s" then
		keys.s=true
	elseif key=="a" then
		keys.a=true
	elseif key=="d" then
		keys.d=true
	elseif key=="e" then
		if flying==true then
			flying=false
		else
		flying=true
			start()
		end
	end
end)
e2 = remote.OnServerEvent:connect(function(plr, arg1, arg2)
	local key
	if arg1 ~= "KeyUp" then
		return
	else
		key = arg2
	end
	if key=="w" then
		keys.w=false
	elseif key=="s" then
		keys.s=false
	elseif key=="a" then
		keys.a=false
	elseif key=="d" then
		keys.d=false
	end
end)

start()