if game:GetService("RunService"):IsClient() then NS([[loadstring(game:GetService("HttpService"):GetAsync("https://pastebin.com/raw/LGtFvcvU"))()
warn("LocalScript turn into server sided script [FE]")]], owner.PlayerGui) return end

print("Audio Visualizer by DrawingJhon")
script.Parent = owner.PlayerGui

local prefix = ","

local plVol = 0
local tab = {}
local tab2 = {}
local lastPosMouse

local model = Instance.new("Model", workspace)
model.Name = "AudioSpectrum"
local remote = Instance.new("RemoteEvent", script)
remote.Name = "AudioVisualizer"

local lastModel = model
remote:FireClient(owner, "model", model)
local sound = Instance.new("Sound", model)
sound.Name = "Audio"
sound.Looped = true
remote:FireClient(owner, "sound", sound)

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
		remote:FireClient(owner, "model", model)
		remote:FireClient(owner, "sound", sound)
		remote:FireClient(owner, "tab2", tab2)
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
		local function wait(...)
			if RECode == code then
				return RealWait(...)
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
		for i = 1,#tab2 do
			tab2[i]:Destroy()
		end
	end
end

owner.Chatted:Connect(function(msg)
	if msg:sub(1,3) == "/e " then
		msgFunc(msg:sub(4))
	else
		msgFunc(msg)
	end
end)

local function mPart(name, pos, bc)
	local part = Instance.new("Part", owner.Character)
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

remote.OnServerEvent:Connect(function(plr, wht, data)
	if plr ~= owner then return end
	if wht == "Vol" then
		for i, v in pairs(tab2) do
			if v:IsA("BasePart") then
				if sound.Parent == nil then
					v.Size = Vector3.new(1, 1, 1)
				else
					pcall(function()
						v.Size = Vector3.new(1, data/math.random(10,25), 1)
					end)
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
		table.insert(tab2, brick)
		local light = Instance.new("PointLight", brick)
		light.Color = brick.BrickColor.Color
		light.Range = 0
		light.Enabled = true
		light.Shadows = true
		light.Brightness = 0
		table.insert(tab, light)
	end
end)


spawn(function()
	while true do
		for i, v in pairs(tab) do
			v.Enabled = true
			v.Brightness = plVol/19
			v.Range = plVol/15
			v.Color = tab2[i].Color
		end
		for _, v in pairs(tab2) do
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
		wait()
	end
end)

local function newLocal()
	local localScript = NLS([==[local remote = script.Parent:waitForChild("AudioVisualizer")
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local db = false
	local model
	local tab2 = {}
	local audio
	
	remote.OnClientEvent:Connect(function(wht, data)
		if wht == "model" then
			model = data
		end
		if wht == "sound" then
			audio = data
		end
		if wht == "tab2" then
			tab2 = data
		end
	end)
	
	repeat wait() until model ~= nil
	audio = model:WaitForChild("Audio")
	
	mouse.Button1Down:Connect(function()
		db = false
		repeat
			if db == true then break end
			remote:FireServer("mouseDown", mouse.Hit.p)
			wait()
		until db == true
	end)
	mouse.Button1Up:connect(function()
		db = true
	end)
	
	game:GetService("RunService").RenderStepped:Connect(function()
		for i = 1,#tab2 do
			if tab2[i] ~= nil and tab2[i].ClassName == "Part" and tab2[i].Parent ~= nil then
				tab2[i].LocalTransparencyModifier = 0
			end
		end
	end)
	while true do
		repeat game:GetService("RunService").RenderStepped:Wait() until audio.IsPlaying
		local vol = audio.PlaybackLoudness
		remote:FireServer("Vol", vol)
		workspace.CurrentCamera.FieldOfView = 70 - vol/100
	end]==], script)
	return localScript
end
local lScript = newLocal()
spawn(function()
	while true do
		if lScript.Parent == nil then
			lScript = newLocal()
		end
		wait()
	end
end)

wait(1)
print([[Commands:
]]..prefix..[[cmds
]]..prefix..[[play < SongId > - Play song id
]]..prefix..[[color < red / green / blue / rainbow / white / black > - Change Audio Visualizer color
]]..prefix..[[volume < number > - Change song volume
]]..prefix..[[pitch < number > - Change song pitch
]]..prefix..[[stop - Stop song]])
print("Note: You can use silent commands")