--Script creado por: JhonXD2006

--local admins = {"JhonXD2006"}
local service = game:GetService("Players")
local p = "/"

function getPlayer(shortcut)
    local player = nil
    local g = game.Players:GetPlayers()
    for i = 1, #g do
        if string.lower(string.sub(g[i].Name, 1, string.len(shortcut))) == string.lower(shortcut) then
            player = g[i]
            break
        end
    end
    return player
end

local function SoundComp()
	if workspace:findFirstChildOfClass("Sound") then
		workspace:findFirstChildOfClass("Sound"):Destroy()
		local Sound = Instance.new("Sound", workspace)
		Sound.Name = "AdminSound"
		Sound.SoundId = "rbxassetid://"..MyID
		Sound.Looped = true
		Sound.Volume = 1
		Sound:Play()
	else 
		local Sound1 = Instance.new("Sound", workspace)
		Sound1.Name = "AdminSound"
		Sound1.SoundId = "rbxassetid://"..MyID
		Sound1.Looped = true
		Sound1.Volume = 1
		Sound1:Play()
	end
end

local function listmusic()
	if msg == "/play tacos" or msg == "/play TACOS" then
		local MyID = "142376088"
		SoundComp()
	end
end

for i, player in pairs(service:GetChildren()) do
	player.Chatted:connect(function(msg)
		if player.Name == "JhonXD2006" or player.Name == "ImNai2" or player.Name == "Its_Carla23" then
			if msg == p.."re" or msg == p.."respawn" or msg == p.."re me" or mgs == p.."respawn me" then
				player:LoadCharacter()
			elseif msg == p.."re all" or msg == p.."respawn all" then
				for i, v in pairs(service:GetChildren()) do
					v:LoadCharacter()
				end
			elseif msg == p.."re others" or msg == p.."respawn others" then
				for i, v in pairs(service:GetChildren()) do
					if v.Name ~= player.Name then
						v:LoadCharacter()
					end
				end
			elseif msg:sub(1, 4) == p.."re " then
				local t = service:findFirstChild(msg:sub(5))
				if t then
					t:LoadCharacter()
				else
					warn("The player doesn't exist")
				end
			end

			if msg == p.."kill" or msg==p.."kill me" or msg==p.."Kill me" or msg == p.."Kill" then
				local h = player.Character:findFirstChildOfClass("Humanoid")
				if h ~= nil then
					h.Health = 0
				end
			elseif msg == p.."kill all" or msg == p.."Kill all" then
				for i, v in pairs(service:GetChildren()) do
					if v.Character:findFirstChildOfClass("Humanoid") then
						v.Character:findFirstChildOfClass("Humanoid").Health = 0
					end
				end
			elseif msg == p.."kill others" or msg == p.."Kill others" then
				for i, v in pairs(service:GetChildren()) do
					if v.Name ~= player.Name then
						if v.Character:findFirstChildOfClass("Humanoid") then
							v.Character:findFirstChildOfClass("Humanoid").Health = 0
						end
					end
				end
			elseif msg:sub(1, 6) == p.."kill " or msg:sub(1, 6) == p.."Kill " then
				local t1 = service:findFirstChild(msg:sub(7))
				if t1 then
					local h1 = t1.Character:findFirstChildOfClass("Humanoid")
					if h1 ~= nil then
						h1.Health = 0
					end
				else
					warn("The player doesn't exist")
				end
			end
			if msg == p.."boom" or msg == p.."BOOM" or msg == p.."Boom" or msg == p.."bOOM" or msg == p.."explode" or msg == p.."Explode" or msg == p.."EXPLODE" or msg == p.."eXPLODE" or msg == p.."boom me" or msg == p.."Boom me" or msg == p.."BOOM ME" or msg == p.."Explode me" or msg == p.."EXPLODE ME" then	
				local h2 = player.Character:findFirstChild("HumanoidRootPart")
				if h2 then
					local b = Instance.new("Explosion", workspace)
					b.Position = h2.Position
				end
			elseif msg == p.."boom all" or msg == p.."explode all" or msg == p.."BOOM ALL" or msg == p.."BOOM ALL" or msg == p.."Boom all" or msg == p.."Explode all" then
				for i, v in pairs(service:GetChildren()) do
					local h3 = v.Character:findFirstChild("HumanoidRootPart")
					if h3 then
						local b1 = Instance.new("Explosion", workspace)
						b1.Position = h3.Position
					end
				end
			elseif msg:sub(1, 6) == p.."BOOM " or msg:sub(1, 6) == p.."boom " or msg:sub(1,6) == p.."Boom " or msg:sub(1, 6) == p.."bOOM " then
				local t2 = service:findFirstChild(msg:sub(7))
				if t2 then
					local h4 = t2.Character:findFirstChild("HumanoidRootPart")
					if h4 then
						local b2 = Instance.new("Explosion", workspace)
						b2.Position = h4.Position
					end
				else
					warn("The player doesn't exist")
				end	
			end
			if msg == p.."punish" or msg == p.."PUNISH" or msg == p.."punish me" or msg == p.."PUNISH ME" then
				player.Character:Destroy()
			elseif msg == p.."punish all" or msg == p.."PUNISH ALL" or msg == p.."Punish All" or msg == p.."Punish all" then
				for i, v in pairs(service:GetChildren()) do
					v.Character:Destroy()
				end
			elseif msg == p.."punish others" or msg == p.."PUNISH OTHERS" or msg == p.."Punish Others" or msg == p.."Punish others" then
				for i, v in pairs(service:GetChildren()) do
					if v.Name ~= player.Name then
						local ch3 = v:findFirstChild("Character")
						if ch3 then
							ch3:Destroy()
						end
					end
				end
			elseif msg:sub(1, 8) == p.."punish " or msg:sub(1, 8) == p.."PUNISH " or msg:sub(1, 8) == p.."Punish" then
				local t3 = service:findFirstChild(msg:sub(9))
				if t3 then 
					t3.Character:Destroy()
				else
					warn("The player doesn't exist")
				end
			end
			if msg:sub(1,4) == p.."ht " or msg:sub(1,4) == p.."HT " then
				local hint1 = Instance.new("Hint", workspace)
				hint1.Text = msg:sub(5)
				hint1.Name = "Dont"
			elseif msg:sub(1,6) == p.."hint " or msg:sub(1,6) == p.."HINT " or msg:sub(1,6) == p.."Hint" then
				local hint = Instance.new("Hint", workspace)
				hint.Text = msg:sub(7)
				hint.Name = "Dont"
			end
			if msg:sub(1,3) == p.."m " or msg:sub(1,3) == p.."M " then
				--local nose = workspace:findFirstChild("Message")
				if nose then
					nose:Destroy()
					local message = Instance.new("Message", workspace)
					message.Text = msg:sub(4)
					wait(5)
					if workspace:findFirstChild("Message") ~= nil then
						game.Workspace.Message:Destroy()
					end
				else
					local message1 = Instance.new("Message", workspace)
					message1.Text = msg:sub(4)
					wait(5)
					if workspace:findFirstChild("Message") ~= nil then
						game.Workspace.Message:Destroy()
					end
				end
			end
			if msg:sub(1,7) == p.."music " or msg:sub(1,7) == p.."MUSIC " or msg:sub(1,7) == p.."Music" then
				if workspace:findFirstChild("AdminSound") then
					workspace.AdminSound:Destroy()
					wait()
					local music = Instance.new("Sound", workspace)
					music.SoundId = "rbxassetid://"..msg:sub(7)
					music.Volume = 1
					music.Looped = true
					music.Name = "AdminSound"
					music:Play()
				else
					local music1 = Instance.new("Sound", workspace)
					music1.SoundId = "rbxassetid://"..msg:sub(7)
					music1.Volume = 1
					music1.Looped = true
					music1.Name = "AdminSound"
					music1:Play()
				end
			elseif msg:sub(1,8) == p.."volume " or msg:sub(1,8) == p.."VOLUME " or msg == p.."Volume " then
				local ch = workspace:findFirstChild("AdminSound")
				if ch ~= nil then
					ch.Volume = msg:sub(9)
				end
			elseif msg:sub(1,7) == p.."pitch " or msg:sub(1,7) == p.."Pitch " or msg:sub(1,7) == p.."PITCH" then
				local ch = workspace:findFirstChild("AdminSound")
				if ch ~= nil then
					ch.Pitch = msg:sub(8)
				end
			end
			--[[if msg:sub(1,6) == p.."Play " or msg:sub(1,6) == p.."play " or msg:sub(1,6) == p.."PLAY " or msg:sub(1,6) == p.."pLAY " then
				listmusic()
			end]]
			if msg:sub(1,10) == p.."speed me " or msg:sub(1,10) == p.."Speed me " or msg:sub(1,10) == p.."SPEED ME " then
				local humanoid = player.Character:findFirstChild("Humanoid")
				if humanoid ~= nil then
					humanoid.WalkSpeed = msg:sub(11)
				end
			end
			--[[elseif msg:sub(1,7) == p.."speed " or msg:sub(1,7) == p.."Speed " or msg:sub(1,7) == p.."SPEED " then
				local number = string.len(msg:sub(8))
				local count = number + 2
			end]]
			if msg:sub(1,3) == p.."s " or msg:sub(1,3) == p.."S " then
				loadstring(msg:sub(4))()
			elseif msg:sub(1,8) == p.."script " or msg:sub(1,8) == p.."SCRIPT " or msg:sub(1,8) == p.."Script " then
				loadstring(msg:sub(9))()
			end
			if msg:sub(1,3) == p.."h " or msg:sub(1,3) == p.."H " then
				loadstring(game:GetService("HttpService"):GetAsync(msg:sub(4)))()
			elseif msg:sub(1,6) == p.."http " or msg:sub(1,6) == p.."Http " or msg:sub(1,6) == p.."HTTP " then
				loadstring(game:GetService("HttpService"):GetAsync(msg:sub(7)))()
			end
			if msg == p.."clear" or msg == p.."Clear" or msg == p.."CLEAR" then
				for i, v in pairs(workspace:GetChildren()) do
					for i, plrs in pairs(game.Players:GetChildren()) do
						if v ~= plrs.Character and v.ClassName ~= "Camera" and v.ClassName ~= "Terrain" then
							v:Destroy()
							wait()
						end
					end
				end
				wait()
				local part = Instance.new("Part", workspace)
				part.Position = Vector3.new(0, -0.5, 0)
				part.Size = Vector3.new(1000, 1, 1000)
				part.Anchored = true
				part.TopSurface = Enum.SurfaceType.Smooth
				part.BottomSurface = Enum.SurfaceType.Smooth
				part.Material = Enum.Material.Grass
				part.BrickColor = BrickColor.new(37)
				part.Locked = true
				part.Name = "Base"
			end --msg end
		end
	end)
end