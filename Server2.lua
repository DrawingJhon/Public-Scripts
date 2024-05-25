script.Parent = nil

print("Commands Update")
local p = "/"
local p2 = "get/"
local p3 = "g/"
local pC = "c/" or "clear/"
local runScript
local http = game:GetService("HttpService")
local Players = game:GetService("Players")

local walls = false
local scripts = true
local tacos = false
local moderation = true
local hamburgers = false

local req = require(5576043691)
function NS(code, who)
    req.NS([[local owner = game:GetService("Players"):findFirstChild(']]..who.Name..[[')
function NLS(code, parent) local nls = require(5576043691).NLS([==[local owner = game:GetService('Players').LocalPlayer
 ]==]..code, parent) return nls end
function LoadLibrary(idk)
    return {Create = function(object)
            local ob = Instance.new(object)
            return function(properties)
                if typeof(properties) == "table" then
                    for pr, val in pairs(properties) do
                    ob[pr] = val
                    end
                end
                return ob
            end
        end
    }
end
]]..code)
end
local function getWalls()
	local WallFront = Instance.new("Part", game.Workspace)
	local WallBack = Instance.new("Part", game.Workspace)
	local WallRight = Instance.new("Part", game.Workspace)
	local WallLeft = Instance.new("Part", game.Workspace)

	WallFront.Name = "FrontWall"
	WallBack.Name = "BackWall"
	WallRight.Name = "RightWall"
	WallLeft.Name = "LeftWall"
	 
	WallFront.Locked = true
	WallBack.Locked = true
	WallRight.Locked = true
	WallLeft.Locked = true
 	
	WallFront.Position = Vector3.new(0, 100, -499.5)
	WallFront.Size = Vector3.new(1000, 200, 1)
	WallBack.Position = Vector3.new(0, 100, 499.5)
	WallBack.Size = Vector3.new(1000, 200, 1)
	WallRight.Position = Vector3.new(499.5, 100, 0)
	WallRight.Size = Vector3.new(1, 200, 1000)
	WallLeft.Position = Vector3.new(-499.5, 100, 0)
	WallLeft.Size = Vector3.new(1, 200, 1000)
 
	WallFront.BottomSurface = Enum.SurfaceType.Smooth
	WallFront.TopSurface = Enum.SurfaceType.Smooth
	WallBack.BottomSurface = Enum.SurfaceType.Smooth
	WallBack.TopSurface = Enum.SurfaceType.Smooth
	WallRight.BottomSurface = Enum.SurfaceType.Smooth
	WallRight.TopSurface = Enum.SurfaceType.Smooth
	WallLeft.BottomSurface = Enum.SurfaceType.Smooth
	WallLeft.TopSurface = Enum.SurfaceType.Smooth
 
	WallFront.Material = Enum.Material.Grass
	WallBack.Material = Enum.Material.Grass
	WallRight.Material = Enum.Material.Grass
	WallLeft.Material = Enum.Material.Grass
 
	WallFront.Anchored = true
	WallBack.Anchored = true
	WallRight.Anchored = true
	WallLeft.Anchored = true
 
	WallFront.BrickColor = BrickColor.new(37)
	WallBack.BrickColor = BrickColor.new(37)
	WallRight.BrickColor = BrickColor.new(37)
	WallLeft.BrickColor = BrickColor.new(37)
end
game.Players.PlayerAdded:connect(function(plr)
	plr.Chatted:connect(function(msg)
		local function find(str, endstr, word)
			local pos = msg:sub(str, endstr)
			local px = pos:lower()
			if px:find(word) then
				return true
			else
				return false
			end
		end
		local function find1(str, word)
			local pz = string.len(word)
			local alv = pz - 1
			local pos = msg:sub(str, str + alv)
			local px = pos:lower()
			local long = string.len(msg)
			if pz == long and px:find(word) then
				return true
			else
				return false
			end
		end		
		local function findS(str, word)
			local pos = msg:sub(str)
			local px = pos:lower()
			if px == word then
				runScript = word
			end
		end
		local function onlyFind(str, word)
			local ps = msg:sub(str)
			local lol = ps:lower()
			local wordLeng = string.len(word)
			local msgLeng = string.len(msg)
			if lol:find(word) and wordLeng == msgLeng then
				return true
			else
				return false
			end
		end
		if msg:lower() == p.."re" or msg:lower() == p.."respawn" then
			plr:LoadCharacter()
		end
		if msg:lower() == p.."kill" then
			local h = plr.Character:findFirstChildOfClass("Humanoid")
			if h ~= nil then
				h.Health = 0
			end
		end
		if msg:lower() == p2.."part" or msg:lower() == p3.."part" then
			local ph = plr.Character:findFirstChild("Right Leg")
			if ph ~= nil then
				local p = Instance.new("Part", workspace)
				p.Position = ph.Position
				p.Anchored = true
				p.TopSurface = Enum.SurfaceType.Smooth
				p.BottomSurface = Enum.SurfaceType.Smooth
			elseif plr.Character:findFirstChild("Head") then
				local p1 = Instance.new("Part", workspace)
				p1.Position = plr.Character:findFirstChild("Head").Position
				p1.Anchored = true
				p1.TopSurface = Enum.SurfaceType.Smooth
				p1.BottomSurface = Enum.SurfaceType.Smooth
			else
				local p = Instance.new("Part", workspace)
				p.Position = Vector3.new(0, 1, 0)
				p.Anchored = true
				p.TopSurface = Enum.SurfaceType.Smooth
				p.BottomSurface = Enum.SurfaceType.Smooth
			end
		elseif msg:lower() == p2.."kp" or msg:lower() == p2.."killerpart" or msg:lower() == p3.."killerpart" or msg:lower() == p3.."kp" then
			local ph = plr.Character:findFirstChild("Right Leg")
			if ph ~= nil then
				local p = Instance.new("Part", workspace)
				p.Position = ph.Position
				p.Anchored = true
				p.TopSurface = Enum.SurfaceType.Smooth
				p.BottomSurface = Enum.SurfaceType.Smooth
				p.Touched:connect(function(hit)
					local t = hit.Parent:findFirstChild("Humanoid")
					if t ~= nil then
						t.Health = t.Health - 100
					end
				end)
			elseif plr.Character:findFirstChild("Head") then
				local p1 = Instance.new("Part", workspace)
				p1.Position = plr.Character:findFirstChild("Head").Position
				p1.Anchored = true
				p1.TopSurface = Enum.SurfaceType.Smooth
				p1.BottomSurface = Enum.SurfaceType.Smooth
				p1.Touched:connect(function(hit)
					local t = hit.Parent:findFirstChild("Humanoid")
					if t ~= nil then
						t.Health = t.Health - 100
					end
				end)
			else
				local part2 = Instance.new("Part", workspace)
				part2.Position = Vector3.new(0, 1, 0)
				part2.Anchored = true
				part2.TopSurface = Enum.SurfaceType.Smooth
				part2.BottomSurface = Enum.SurfaceType.Smooth
				part2.Touched:connect(function(hit)
					local t = hit.Parent:findFirstChild("Humanoid")
					if t ~= nil then
						t.Health = t.Health - 100
					end
				end)
			end
		end
		if msg:sub(1,8):lower() == "get/utg/" and scripts == true then
			findS(9,"epix")
			if runScript == "epix" then
				require(4832930219):Fire(plr.Name)
				runScript = nil
			end
			findS(9,"adrian")
			if runScript == "adrian" then
				require(3497222070).load(plr.Name)
				runScript = nil
			end
			findS(9,"x")
			if runScript == "x" then
				require(4882817184).no(plr.Name)
				runScript = nil
			end
			findS(9,"dg")
			if runScript == "dg" then
				require(4104425503):DG(plr.Name)
				runScript = nil
			end
			findS(9,"dreaminggui")
			if runScript == "dreaminggui" then
				require(4104425503):DG(plr.Name)
				runScript = nil
			end
			findS(9,"cracking")
			if runScript == "cracking" then
				require(4748605382).new(plr.Name)
				runScript = nil
			end
			findS(9,"premium")
			if runScript == "premium" then
				require(4851841391).usg(plr.Name)
				runScript = nil
			end
			findS(9,"boss")
			if runScript == "boss" then
				require(4932468518).Boss(plr.Name)
				runScript = nil
			end
			findS(9, "pro")
			if runScrpt == "pro" then
				require(4982463052):Fire(plr.Name)
				runScript = nil
			end
			findS(9,"edit")
			if runScript == "edit" then
				require(4982466057):UTG(plr.Name)
				runScript = nil
			end
			findS(9,"islandlife")
			if runScript == "islandlife" then
				require(4924267520).Best(plr.Name)
				runScript = nil
			end
			findS(9,"normal")
			if runScript == "normal" then
				require(5023439370).sex(plr.Name)
				runScript = nil
			end
			findS(9,"adrian2")
			if runScript == "adrian2" then
				require(4934614538):adrian(plr.Name)
				runScript = nil
			end
			findS(9,"islandlife2")
			if runScript == "islandlife2" then
				require(4839004625).Lmao(plr.Name)
				runScript = nil
			end
			findS(9,"troll")
			if runScript == "troll" then
				require(5069396885).CrabUTGv3(plr.Name)
				runScript = nil
			end
		end
		if msg:sub(1,11):lower() == "get/script/" and scripts == true then
			findS(12,"cat")
			if runScript == "cat" then
				require(3274335798).cat(plr.Name)
				runScript = nil
			end
			findS(12,"noobsv5")
			if runScript == "noobsv5" then
				require(4790169289).load(plr.Name)
				runScript = nil
			end
			findS(12,"waterpark")
			if runScript == "waterpark" then
				require(3680167614):Fire(plr.Name)
				runScript = nil
			end
			findS(12,"jojo")
			if runScript == "jojo" then
				require(4902600443)("GER" , plr.Name)
				runScript = nil
			end
			findS(12,"nekov2")
			if runScript == "nekov2" then
				require(4679462782).neko2(plr.Name)
				runScript = nil
			end
			findS(12,"suicide")
			if runScript == "suicide" then
				require(2849585171):Fire(plr.Name,'i baked you a pie')
				runScript = nil
			end
			findS(12,"jailbreakcar")
			if runScript == "jailbreakcar" then
				require(5064167343).Chiron(plr.Name)
				runScript = nil
			end
			findS(12,"voodov1")
			if runScript == "voodov1" then
				require(5131624167).load(plr.Name)
				runScript = nil
			end
		end
		if msg == "get/water" then
			for i, v in pairs(workspace:GetChildren()) do
				if v.ClassName == "Part" then
					local partname = v.Name
					if partname:lower() == "water" then
						game.Workspace.Terrain:FillBlock(v.CFrame, v.Size, Enum.Material.Water)
						wait()
						v:Destroy()
					end
				end
			end
		end	
		if msg:lower() == "get/terrain" or msg:lower() == "g/terrain" then
			for i, v in pairs(workspace:GetChildren()) do
				if v.ClassName == "Part" then
					local partname = v.Name
					if partname:lower() == "terrain" then
						game.Workspace.Terrain:FillBlock(v.CFrame, v.Size, Enum.Material.Grass)
						wait()
						v:Destroy()
					end
				end
			end
		end
		if msg:lower() == p2.."waterpart" or msg:lower() == p3.."waterpart" then
			local RL = plr.Character:findFirstChild("Right Leg")
			if RL ~= nil then
				local p = Instance.new("Part", workspace)
				p.Position = RL.Position
				p.Anchored = true
				p.TopSurface = Enum.SurfaceType.Smooth
				p.BottomSurface = Enum.SurfaceType.Smooth
				p.Name = "water"
				p.Reflectance = 1
			elseif plr.Character:findFirstChild("Head") then
				local p1 = Instance.new("Part", workspace)
				p1.Position = plr.Character:findFirstChild("Head").Position
				p1.Anchored = true
				p1.TopSurface = Enum.SurfaceType.Smooth
				p1.BottomSurface = Enum.SurfaceType.Smooth
				p1.Name = "water"
				p1.Reflectance = 1
			else
				local p = Instance.new("Part", workspace)
				p.Position = Vector3.new(0, 1, 0)
				p.Anchored = true
				p.TopSurface = Enum.SurfaceType.Smooth
				p.BottomSurface = Enum.SurfaceType.Smooth
				p.Name = "water"
				p.Reflectance = 1
			end
		end
		if msg:lower() == p2.."terrainpart" or msg:lower() == p3.."terrrainpart" then
			local ph = plr.Character:findFirstChild("Right Leg")
			if ph ~= nil then
				local p = Instance.new("Part", workspace)
				p.Position = ph.Position
				p.Anchored = true
				p.TopSurface = Enum.SurfaceType.Smooth
				p.BottomSurface = Enum.SurfaceType.Smooth
				p.Name = "terrain"
				p.BrickColor = BrickColor.new("Bright green")
			elseif plr.Character:findFirstChild("Head") then
				local p1 = Instance.new("Part", workspace)
				p1.Position = plr.Character:findFirstChild("Head").Position
				p1.Anchored = true
				p1.TopSurface = Enum.SurfaceType.Smooth
				p1.BottomSurface = Enum.SurfaceType.Smooth
				p1.Name = "terrain"
				p1.BrickColor = BrickColor.new("Bright green")
			else
				local p = Instance.new("Part", workspace)
				p.Position = Vector3.new(0, 1, 0)
				p.Anchored = true
				p.TopSurface = Enum.SurfaceType.Smooth
				p.BottomSurface = Enum.SurfaceType.Smooth
				p.Name = "terrain"
				p.BrickColor = BrickColor.new("Bright green")
			end
		end
		if msg:sub(1,2):lower() == "h/" then
			local link
			pcall(function()
				link = game:GetService("HttpService"):GetAsync(msg:sub(3))
			end)
			if link ~= nil then
				NS(link, plr)
			end
		end
		if msg:lower() == p2.."base" or msg:lower() == p2.."b" or msg:lower() == p3.."base" or msg:lower() == p3.."b" then
			local p = Instance.new("Part", workspace)
			p.Name = "Base"
			p.Anchored = true
			p.Position = Vector3.new(0, -0.5, 0)
			p.Size = Vector3.new(1000, 1, 1000)
			p.TopSurface = Enum.SurfaceType.Smooth
			p.BottomSurface = Enum.SurfaceType.Smooth
			p.Material = Enum.Material.Grass
			p.BrickColor = BrickColor.new("Forest green")
			p.Locked = true
		end
		if msg:lower() == pC.."terrains" then
			workspace.Terrain:Clear()
		end
		if msg:lower() == pC.."spawns" then
			for i, v in pairs(workspace:GetDescendants()) do
				if v.ClassName == "SpawnLocation" then
					v:Destroy()
				end
			end
		end
		if msg:lower() == pC.."all" then
			for i, v in pairs(workspace:GetChildren()) do
				local player = game.Players:GetPlayerFromCharacter(v)
				if not player then
					if v.ClassName ~= "Terrain" and v.ClassName ~= "Camera" then
						v:Destroy()
					end
				end
			end
			local xd = Instance.new("Part", workspace)
			xd.Name = "Base"
			xd.Position = Vector3.new(0, -0.5, 0)
			xd.Size = Vector3.new(1000, 1, 1000)
			xd.Anchored = true
			xd.TopSurface = Enum.SurfaceType.Smooth
			xd.BottomSurface = Enum.SurfaceType.Smooth
			xd.Material = Enum.Material.Grass
			xd.BrickColor = BrickColor.new("Forest green")
			xd.Locked = true
		end
		if msg:lower() == pC.."guis" then
			plr.PlayerGui:ClearAllChildren()
		end
		if msg:lower() == p2.."sand" or msg:lower() == p3.."sand" then
			for i, v in pairs(workspace:GetChildren()) do
				if v.ClassName == "Part" then
					local partName = v.Name
					if partName:lower() == "sand" then
						workspace.Terrain:FillBlock(v.CFrame, v.Size, Enum.Material.Sand)
						wait()
						v:Destroy()
					end
				end
			end
		end
		if msg:lower() == p2.."sandpart" or msg:lower() == p3.."sandpart" then
			local ph = plr.Character:findFirstChild("Right Leg")
			if ph ~= nil then
				local p = Instance.new("Part", workspace)
				p.Position = ph.Position
				p.Anchored = true
				p.TopSurface = Enum.SurfaceType.Smooth
				p.BottomSurface = Enum.SurfaceType.Smooth
				p.Name = "sand"
				p.BrickColor = BrickColor.new("Bright green")
			elseif plr.Character:findFirstChild("Head") then
				local p1 = Instance.new("Part", workspace)
				p1.Position = plr.Character:findFirstChild("Head").Position
				p1.Anchored = true
				p1.TopSurface = Enum.SurfaceType.Smooth
				p1.BottomSurface = Enum.SurfaceType.Smooth
				p1.Name = "sand"
				p1.BrickCOlor = BrickColor.new("Bright green")
			else
				local p = Instance.new("Part", workspace)
				p.Position = Vector3.new(0, 1, 0)
				p.Anchored = true
				p.TopSurface = Enum.SurfaceType.Smooth
				p.BottomSurface = Enum.SurfaceType.Smooth
				p.Name = "sand"
				p.BrickColor = BrickColor.new("Bright green")
			end
		end
		if msg:lower() == p2.."walls" or msg:lower() == p2.."w" or msg:lower() == p3.."walls" or msg:lower() == p3.."w" then
			if walls == false then
				getWalls()
				walls = true
			else
				warn("There are already walls!")
			end
			wait()
			while walls == true do
				if not workspace:findFirstChild("FrontWall") then
					local wF = Instance.new("Part", workspace)
					wF.Position = Vector3.new(0, 100, -499.5)
					wF.Size = Vector3.new(1000, 200, 1)
					wF.Name = "FrontWall"
					wF.Anchored = true
					wF.Locked = true
					wF.TopSurface = Enum.SurfaceType.Smooth
					wF.BottomSurface = Enum.SurfaceType.Smooth
					wF.BrickColor = BrickColor.new(37)
					wF.Material = Enum.Material.Grass
				end
				if not workspace:findFirstChild("BackWall") then
					local wB = Instance.new("Part", workspace)
					wB.Position = Vector3.new(0, 100, 499.5)
					wB.Size = Vector3.new(1000, 200, 1)
					wB.Name = "BackWall"
					wB.Anchored = true
					wB.Locked = true
					wB.TopSurface = Enum.SurfaceType.Smooth
					wB.BottomSurface = Enum.SurfaceType.Smooth
					wB.BrickColor = BrickColor.new(37)
					wB.Material = Enum.Material.Grass
				end
				if not workspace:findFirstChild("RightWall") then
					local wR = Instance.new("Part", workspace)
					wR.Position = Vector3.new(499.5, 100, 0)
					wR.Size = Vector3.new(1, 200, 1000)
					wR.Name = "RightWall"
					wR.Anchored = true
					wR.Locked = true
					wR.TopSurface = Enum.SurfaceType.Smooth
					wR.BottomSurface = Enum.SurfaceType.Smooth
					wR.BrickColor = BrickColor.new(37)
					wR.Material = Enum.Material.Grass
				end
				if not workspace:findFirstChild("LeftWall") then
					local wL = Instance.new("Part", workspace)
					wL.Position = Vector3.new(-499.5, 100, 0)
					wL.Size = Vector3.new(1, 200, 1000)
					wL.Name = "LeftWall"
					wL.Anchored = true
					wL.Locked = true
					wL.TopSurface = Enum.SurfaceType.Smooth
					wL.BottomSurface = Enum.SurfaceType.Smooth
					wL.BrickColor = BrickColor.new(37)
					wL.Material = Enum.Material.Grass
				end
			end
		end
		if msg:lower() == pC.."walls" or msg:lower() == pC.."w" then
			walls = false
			wait()
			workspace:WaitForChild("FrontWall"):Destroy()
			workspace:WaitForChild("BackWall"):Destroy()
			workspace:WaitForChild("RightWall"):Destroy()
			workspace:WaitForChild("LeftWall"):Destroy()
		end
		if msg:lower() == "disable/scripts" and plr.Name == "JhonXD2006" then
			scripts = false
		elseif msg:lower() == "enable/scripts" and plr.Name == "JhonXD2006" then
			scripts = true
		end
		if msg:sub(1,2):lower() == "s/" and scripts == true then
			local success, err = pcall(function()
				NS(msg:sub(3), plr)
			end)
			if err then
				warn("Error "..err)
			end
		end
		if msg:lower() == p2.."tacos" or msg:lower() == p3.."tacos" or msg:lower() == "rain/tacos" then
			tacos = true
			while tacos == true do
				wait(0.1)
				local function rainingTacos()
					local taco = Instance.new("Part",Workspace)
					taco.CanCollide = true
					taco.Anchored = false
					taco.Name = "Taco"
					local m = Instance.new("SpecialMesh",taco)
					m.MeshId = "http://www.roblox.com/asset/?id=14846869"
					m.TextureId = "http://www.roblox.com/asset/?id=14846834"
					local val = Instance.new("StringValue")
					val.Parent = taco
					val.Name = "TacoValue"
					val.Value = "Im taco"
					taco.CFrame = CFrame.new(math.random(-850,850),100,math.random(-850,850))
				end
				spawn(rainingTacos)
			end
		end
		if msg:lower() == "stop/tacos" then
			tacos = false
		end
		if msg:lower() == pC.."music" or msg:lower() == pC.."sound" then
			for i, v in pairs(workspace:GetDescendants()) do
				if v.ClassName == "Sound" then
					v:Destroy()
				end
			end
			for i, v in pairs(game.Chat:GetDescendants()) do
				if v.ClassName == "Sound" then
					v:Destroy()
				end
			end
		end
		if msg:lower() == pC.."tacos" then
			for i, v in pairs(workspace:GetChildren()) do
				if v.Name == "Taco" then
					if v:findFirstChild("TacoValue") then
						if v:findFirstChild("TacoValue").Value == "Im taco" then
							v:Destroy()
						end
					end
				end
			end
		end
		if msg:lower() == "rain/hamburgers" then
			hamburgers = true
			while hamburgers == true do
				wait(0.1)
				local function rainingHamburgers()
					local hamb = Instance.new("Part",Workspace)
					hamb.CanCollide = true
					hamb.Anchored = false
					hamb.Name = "Hamburger"
					local m = Instance.new("SpecialMesh",hamb)
					m.MeshId = "http://www.roblox.com/asset/?id=72909826"
					m.TextureId = "http://www.roblox.com/asset/?id=72909826"
					local val = Instance.new("StringValue")
					val.Parent = hamb
					val.Name = "HamburgerValue"
					val.Value = "Im hamburger"
					taco.CFrame = CFrame.new(math.random(-850,850),100,math.random(-850,850))
				end
				spawn(rainingHamburgers)
			end
		end
		if msg:lower() == "stop/hamburgers" then
			hamburgers = false
		end
		if msg:lower() == "stop/rain" then
			hamburgers = false
			tacos = false
		end
		if msg:lower() == pC.."hamburgers" then
			for i, v in pairs(worksapce:GetChildren()) do
				if v.Name == "Hamburger" then
					if v:FindFirstChild("HamburgerValue") then
						if v:findFirstChild("HamburgerValue").Value == "Im hamburger" then
							v:Destroy()
						end
					end
				end
			end
		end
		if msg:lower() == p2.."d" or msg:lower() == p2.."dummy" or msg:lower() == p3.."d" or msg:lower() == p3.."dummy" then
			if plr.Character then
				if plr.Character:findFirstChild("Head") then
					local dummy = game.ServerStorage:WaitForChild("Dummy").Dummy:Clone()
					dummy.Parent = game.Workspace
					dummy:MoveTo(plr.Character.Head.Position)
					local dd = Instance.new("WeldConstraint",dummy)
					dd.Part0 = dummy.Head
					dd.Part1 = dummy.Torso
				else
					local dummy = game.ServerStorage:WaitForChild("Dummy").Dummy:Clone()
					dummy.Parent = game.Workspace
					local dd = Instance.new("WeldConstraint",dummy)
					dd.Part0 = dummy.Head
					dd.Part1 = dummy.Torso
				end
			else
				local dummy = game.ServerStorage:WaitForChild("Dummy").Dummy:Clone()
				dummy.Parent = game.Workspace
				local dd = Instance.new("WeldConstraint", dummy)
				dd.Part0 = dummy.Head
				dd.Part1 = dummy.Torso
			end
		end
		if msg:lower() == p2.."r6" or msg:lower() == p3.."r6" then
			 local function makeR6()
				plr.CharacterAppearanceId = 56908
				local desc = Players:GetHumanoidDescriptionFromUserId(plr.UserId)
               	plr:LoadCharacterWithHumanoidDescription(desc)
              	plr.CharacterAppearanceId = 0
			end
			if plr.Character then
				local humRootPart = plr.Character:findFirstChild("HumanoidRootPart")
				if humRootPart then
					local pos = humRootPart.CFrame
					makeR6()
					local ch = plr.Character or plr.CharacterAdded:Wait()
					if ch:findFirstChild("HumanoidRootPart") then
						ch:findFirstChild("HumanoidRootPart").CFrame = pos
					end
				else
					makeR6()
				end
			else
				makeR6()
			end
		end
	end)
end)