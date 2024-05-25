print("Audio Visualizer by DrawingJhon")

local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
local render = game:GetService("RunService").RenderStepped
script.Parent = player.PlayerGui
local prefix = ","

local plVol = 0
local parts = {}
local lights = {}
local lastPosMouse

local model = Instance.new("Model", workspace)
model.Name = "AudioSpectrum"

local lastModel = model
local sound = Instance.new("Sound", model)
sound.Name = "Audio"
sound.Looped = true

spawn(function()
	wait(1.5)
	while true do
		if model.Parent == nil then
			model = Instance.new("Model", workspace)
			model.Name = "AudioSpectrum"
			sound = Instance.new("Sound", model)
			sound.Name = "Audio"
			sound.Looped = true
		end
		wait()
	end
end)

local colors = {
	red = true;
	green = false;
	blue = false;
	white = false;
	black = false;
	rainbow = false;
}
function cFalse()
	colors.red = false
	colors.green = false
	colors.blue = false
	colors.white = false
	colors.black = false
	colors.rainbow = false
end
local RainbowColor = Color3.new()
local RECode = math.random()

function StartRainbowify()
	coroutine.wrap(function()
		local code = math.random()
		RECode = code
		local RealWait = wait
		local function wait(num)
			if RECode == code then
				return RealWait(num)
			end
			coroutine.yield()
		end
		while true do
    			RainbowColor = Color3.new(255/255,0/255,0/255)
    			for i = 0,255,10 do
				wait()
				RainbowColor = Color3.new(255/255,i/255,0/255)
    			end
    			for i = 255,0,-10 do
				wait()
				RainbowColor = Color3.new(i/255,255/255,0/255)
			end
    			for i = 0,255,10 do
				wait()
				RainbowColor = Color3.new(0/255,255/255,i/255)
    			end
			for i = 255,0,-10 do
				wait()
				RainbowColor = Color3.new(0/255,i/255,255/255)
			end
			for i = 0,255,10 do
				wait()
				RainbowColor = Color3.new(i/255,0/255,255/255)
			end
			for i = 255,0,-10 do
				wait()
				RainbowColor = Color3.new(255/255,0/255,i/255)
    			end
		end
	end)()
end

function msgFunc(msg)
	local p = prefix
	if msg:lower():sub(1,6) == p.."play " then
		local id = msg:sub(7)
		if model:findFirstChildOfClass("Sound") then
			local sound = model:findFirstChildOfClass("Sound")
			sound.Name = "Audio"
			sound:Stop()
			sound.SoundId = "rbxassetid://"..id
			sound:Play()
		else
			sound = Instance.new("Sound", model)
			sound.Name = "Audio"
			sound.Looped = true
			sound.SoundId = "rbxassetid://"..id
			sound:Play()
		end
	end
	if msg:lower():sub(1,5) == p.."stop" then
		sound:Stop()
	end
	if msg:lower():sub(1,7) == p.."color " then
		local msg = msg:sub(8)
		if msg:lower() == "red" then
			cFalse()
			colors.red = true
		end
		if msg:lower() == "blue" then
			cFalse()
			colors.blue = true
		end
		if msg:lower() == "green" then
			cFalse()
			colors.green = true
		end
		if msg:lower() == "black" then
			cFalse()
			colors.black = true
		end
		if msg:lower() == "white" then
			cFalse()
			colors.white = true
		end
		if msg:lower() == "rainbow" then
			cFalse()
			StartRainbowify()
			colors.rainbow = true
		end
	end
	if msg:lower():sub(1,8) == p.."volume " then
		sound.Volume = msg:sub(9)
	end
	if msg:lower():sub(1,7) == p.."pitch " then
		sound.Pitch = msg:sub(8)
	end
	if msg:lower() == p.."clear" then
		for i = 1,#parts do
			parts[i]:Destroy()
		end
	end
end

player.Chatted:Connect(function(msg)
	if msg:sub(1,3) == "/e " then
		msgFunc(msg:sub(4))
	else
		msgFunc(msg)
	end
end)

local function mPart(name, pos, bc)
	local part = Instance.new("Part", player.Character)
	part.Anchored = true
	part.Transparency = 0
	part.Name = name
	part.CFrame = CFrame.new(pos)
	part.Color = bc
	part.Material = "Neon"
	part.TopSurface = "Smooth"
	part.BottomSurface = "Smooth"
	return part
end

function fireAction(wht, data)
	if wht == "Vol" then
		for i, v in pairs(parts) do
			if v:IsA("BasePart") then
				if sound.Parent == nil then
					v.Size = Vector3.new(1, 1, 1)
				else
					v.Size = Vector3.new(1, data/math.random(10,25), 1)
				end
			end
		end
		plVol = data
	end
	if wht == "mouseDown" then
		if data == lastPosMouse then return else lastPosMouse = data end
		local brick = mPart("Part", data, Color3.new(0, 0, 0))
		brick.CanCollide = false
		brick.Size = Vector3.new(1, 1, 1)
		table.insert(parts, brick)
		local light = Instance.new("PointLight", brick)
		light.Color = brick.BrickColor.Color
		light.Range = 0
		light.Enabled = true
		light.Shadows = true
		light.Brightness = 0
		table.insert(lights, light)
	end
end


spawn(function()
	while true do
		for i, v in pairs(lights) do
			v.Enabled = true
			v.Brightness = plVol/19
			v.Range = plVol/15
			v.Color = parts[i].Color
		end
		for _, v in pairs(parts) do
			if sound.Parent == nil or sound.IsPlaying == false then
				v.BrickColor = BrickColor.new(Color3.new(0, 0, 0)) v.Size = Vector3.new(1, 1, 1)
			elseif colors.red == true then
				v.BrickColor = BrickColor.new(Color3.new(plVol/200, 0, 0))
			elseif colors.green == true then
				v.BrickColor = BrickColor.new(Color3.new(0, plVol/200, 0))
			elseif colors.blue == true then
				v.BrickColor = BrickColor.new(Color3.new(0, 0, plVol/200))
			elseif colors.white == true then
				v.BrickColor = BrickColor.new(Color3.new(255, 255, 255))
			elseif colors.black == true then
				v.BrickColor = BrickColor.new(Color3.new(0, 0, 0))
			elseif colors.rainbow == true then
				v.Color = RainbowColor
			end
		end
		render:Wait()
	end
end)

local db = false
local audio = sound
	
repeat wait() until model ~= nil

mouse.Button1Down:Connect(function()
	db = false
	repeat
		if db == true then break end
		fireAction("mouseDown", mouse.Hit.p)
		wait()
	until db == true
end)
mouse.Button1Up:connect(function()
	db = true
end)

render:Connect(function()
	for i = 1,#parts do
		if parts[i] ~= nil and parts[i].ClassName == "Part" and parts[i].Parent ~= nil then
			parts[i].LocalTransparencyModifier = 0
		end
	end
end)
spawn(function()
	while true do
		repeat render:Wait() until audio.IsPlaying
		local vol = audio.PlaybackLoudness
		fireAction("Vol", vol)
		workspace.CurrentCamera.FieldOfView = 70 - vol/100
	end
end)
wait(.1)
print([[Commands:
]]..prefix..[[cmds
]]..prefix..[[play < SongId > - Play song id
]]..prefix..[[color < red / green / blue / rainbow / white / black > - Change Audio Visualizer color
]]..prefix..[[volume < number > - Change song volume
]]..prefix..[[pitch < number > - Change song pitch
]]..prefix..[[stop - Stop song]])
print("Note: You can use silent commands")