--By Rufus14
--owner = game.Players[script.Parent.Name]
script.Parent = game:GetService("ServerScriptService")
cannotify = true
canragdollkill = true
function message(msg)
	if cannotify then
		local messagesound = Instance.new("Sound", workspace)
		messagesound.SoundId = "rbxassetid://651986414"
		messagesound.Volume = 5.999
		messagesound:Play()
		game.Debris:AddItem(messagesound, messagesound.TimeLength)
		if owner.Character then
			if owner.Character:findFirstChild("HumanoidRootPart") then
				local pos1 = math.random(-5,5)
				local pos2 = math.random(-5,5)
				local model = Instance.new("Model", owner.Character)
				model.Name = [[(Anti-Skid v4)
				]]..msg
				local human0 = Instance.new("Humanoid", model)
				human0.Name = "MessageHuman0id"
				human0.MaxHealth = 0
				human0.Health = 0
				local part = Instance.new("Part", model)
				part.Size = Vector3.new(0,0,0)
				part.BrickColor = BrickColor.Random()
				part.Material = "ForceField"
				part:BreakJoints()
				part.CanCollide = false
				part.CFrame = owner.Character.HumanoidRootPart.CFrame
				part.Name = "Head"
				local bodyposition = Instance.new("BodyPosition", part)
				bodyposition.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
				bodyposition.Position = owner.Character.HumanoidRootPart.Position
				local function spinandpos()
					while wait() do
						if owner.Character:findFirstChild("HumanoidRootPart") then
							bodyposition.Position = owner.Character:findFirstChild("HumanoidRootPart").Position + Vector3.new(pos1,0,pos2)
						end
						part.CFrame = part.CFrame * CFrame.fromEulerAnglesXYZ(0.02,0.02,0.02)
					end
				end
				local function resize()
					while wait() and part.Size.x < 1.5 do
						part.Size = part.Size + Vector3.new(0.05,0.05,0.05)
					end
					wait(4)
					for i = 1,30 do
						part.Size = part.Size - Vector3.new(0.05,0.05,0.05)
						part.Transparency = part.Transparency + 0.015
						wait()
					end
					model:destroy()
				end
				spawn(spinandpos)
				spawn(resize)
			end
		end
	end
end
function punishplayer(character)
	if not character:findFirstChild("pwned") then
		Instance.new("BoolValue", character).Name = "pwned"
		local function loopremove()
			while wait() do
				for i,v in pairs(character:GetChildren()) do
					if v.ClassName == "Script" or v.ClassName == "LocalScript" then
						v.Disabled = true
					end
				end
			end
		end
		spawn(loopremove)
		local function thotbegone()
			local punishrandom = math.random(1,7)
			for i,v in pairs(character:GetChildren()) do
				if v.ClassName == "Sound" and v.Name ~= "JevilTheme" then
					v:destroy()
				end
				for q,w in pairs(v:GetChildren()) do
					if w.ClassName == "Sound" and w.Name ~= "JevilTheme" then
						w:destroy()
					end
				end
			end
			if punishrandom == 1 then
				for i = 1,10 do
					for q,w in pairs(character:GetChildren()) do
						if w.ClassName == "Part" then
							w.Transparency = w.Transparency + 0.1
						end
						if w.ClassName == "Accessory" then
							if w:findFirstChild("Handle") then
								w.Handle.Transparency = w.Handle.Transparency + 0.1
							end
						end
						if w.Name == "Head" then
							if w:findFirstChildOfClass("Decal") then
								w:findFirstChildOfClass("Decal").Transparency = w:findFirstChildOfClass("Decal").Transparency + 0.1
							end
						end
					end
					wait()
				end
				for q,w in pairs(character:GetChildren()) do
					if w.ClassName == "Part" or w.ClassName == "Accessory" then
						w:destroy()
					end
				end
			elseif punishrandom == 2 then
				character:findFirstChildOfClass("Humanoid").WalkSpeed = 0
				character:findFirstChildOfClass("Humanoid").JumpPower = 0
				local function addweld()
					if character:findFirstChild("Torso") then
						local heead = Instance.new("Weld", character.Torso)
						heead.Part0 = character.Torso
						heead.Part1 = character.Head
						heead.C0 = CFrame.new(0,1.5,0)
						heead.Name = "HeadWeld"
						wait(0.7)
						for i = 0,1 , 0.08 do
							heead.C0 = heead.C0:lerp(CFrame.new(0,1.5,0.4) * CFrame.fromEulerAnglesXYZ(1.2,0,0),i)
							wait()
						end
						wait(0.7)
						while wait() do
							heead.C0 = heead.C0 * CFrame.fromEulerAnglesXYZ(0.5,0.5,0.5)
						end
					elseif character:findFirstChild("UpperTorso") then
						local heead = Instance.new("Weld", character.UpperTorso)
						heead.Part0 = character.UpperTorso
						heead.Part1 = character.Head
						heead.C0 = CFrame.new(0,1.5,0)
						heead.Name = "HeadWeld"
						wait(0.7)
						for i = 0,1 , 0.08 do
							heead.C0 = heead.C0:lerp(CFrame.new(0,1.5,0.4) * CFrame.fromEulerAnglesXYZ(1.2,0,0),i)
							wait()
						end
						wait(0.7)
						while wait() do
							heead.C0 = heead.C0 * CFrame.fromEulerAnglesXYZ(0.5,0.5,0.5)
						end
					end
				end
				spawn(addweld)
				local banhamma = Instance.new("Part", character)
				banhamma.Size = Vector3.new(3, 10, 2)
				banhamma:BreakJoints()
				banhamma.CFrame = character.Head.CFrame * CFrame.new(0,20,0) * CFrame.fromEulerAnglesXYZ(math.pi/2,0,1)
				banhamma.Name = "ban"
				banhamma.Transparency = 1
				banhamma.Anchored = true
				local mesh = Instance.new("SpecialMesh", banhamma)
				mesh.MeshId = "http://www.roblox.com/asset/?id=10604848"
				mesh.TextureId = "http://www.roblox.com/asset/?id=10605252"
				local special = Instance.new("Sound", banhamma)
				special.SoundId = "rbxassetid://427090157"
				special.Volume = 2
				special:Play()
				for i = 1,20 do
					banhamma.Transparency = banhamma.Transparency - 0.05
					if character:findFirstChildOfClass("Humanoid") then
						character:findFirstChildOfClass("Humanoid").JumpPower = 0
						character:findFirstChildOfClass("Humanoid").WalkSpeed = 0
					end
					wait()
				end
				local hammertime = Instance.new("Sound", banhamma)
				hammertime.SoundId = "rbxassetid://176192087"
				hammertime.Volume = 3
				hammertime:Play()
				wait(1)
				if character:findFirstChild("Head") then
					local scream = Instance.new("Sound", character.Head)
					scream.SoundId = "rbxassetid://176238381"
					scream.Volume = 2
					scream:Play()
					banhamma.Anchored = false
					local angularvel = Instance.new("BodyAngularVelocity", banhamma)
					angularvel.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
					angularvel.AngularVelocity = banhamma.CFrame.rightVector * 20
					local touchedban = false
					local function touched(part)
						if part.Name == "Head" and part.Parent == character then
							touchedban = true
							local aaaaaaaa = Instance.new("Sound", banhamma)
							aaaaaaaa.SoundId = "rbxassetid://147722910"
							aaaaaaaa.Volume = 2
							aaaaaaaa:Play()
							angularvel:Destroy()
							banhamma.CanCollide = true
							for i,v in pairs(character:GetChildren()) do
								if v.ClassName == "Part" and v.Name ~= "ban" or v.ClassName == "Accessory" then
									v:destroy()
								end
							end
						end
					end
					banhamma.Touched:connect(touched)
					wait(2)
					if not touchedban and character:findFirstChild("Head") then
						banhamma.CFrame = character:findFirstChild("Head").CFrame
					end
				end
			elseif punishrandom == 3 then
				character:BreakJoints()
				character:findFirstChildOfClass("Humanoid").Health = 0
				local explo = Instance.new("Explosion", character)
				explo.Position = character.Head.Position
				explo.BlastPressure = 0
				local boom = Instance.new("Sound", character.Head)
				boom.SoundId = "rbxassetid://262562442"
				boom.Volume = 3
				boom.Name = "booom"
				boom:Play()
				for i,v in pairs(character:GetChildren()) do
					if v.ClassName == "Part" or v.ClassName == "MeshPart" then
						local velocity = Instance.new("BodyVelocity", v)
						velocity.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
						velocity.Velocity = Vector3.new(math.random(-60,60),math.random(-60,60),math.random(-60,60))
						game.Debris:AddItem(velocity, 0.5)
					end
				end
				if canragdollkill then
					character:BreakJoints()
					ragdollkill(character)
				else
					if character:findFirstChild("Head") then
						wait(2)
						character:findFirstChild("Head"):destroy()
					end
				end
			elseif punishrandom == 4 then
				character.Head:destroy()
				if character:findFirstChild("HumanoidRootPart") then
					local boom = Instance.new("Sound", character.HumanoidRootPart)
					boom.SoundId = "rbxassetid://775395533"
					boom.Volume = 1.5
					boom.Name = "chinese"
					boom:Play()
				end
				if canragdollkill then
					character:BreakJoints()
					ragdollkill(character)
				end
			elseif punishrandom == 5 then
				local hahahahahah = Instance.new("Sound", workspace)
				hahahahahah.SoundId = "rbxassetid://807874496"
				hahahahahah.Volume = 1.5
				hahahahahah:Play()
				game.Debris:AddItem(hahahahahah, hahahahahah.TimeLength)
				if character:findFirstChild("HumanoidRootPart") then
					local humanoidrootpart = Instance.new("Weld", character.HumanoidRootPart)
					humanoidrootpart.Part0 = character.HumanoidRootPart
					if character:findFirstChild("Torso") then
						humanoidrootpart.Part1 = character.Torso
					elseif character:findFirstChild("UpperTorso") then
						humanoidrootpart.Part1 = character.UpperTorso
					end
					humanoidrootpart.Name = "HumanoidRootPartWeld"
					local function rrreeeeee()
						while humanoidrootpart do
							humanoidrootpart.C0 = humanoidrootpart.C0 * CFrame.Angles(math.random(-2,2),math.random(-2,2),math.random(-2,2))
							wait()
						end
					end
					spawn(rrreeeeee)
				end
				local function thot()
					for i = 1,20 do
						for q,w in pairs(character:GetChildren()) do
							if w.ClassName == "Part" then
								w.Transparency = w.Transparency + 0.05
							end
							if w.ClassName == "Accessory" then
								if w:findFirstChild("Handle") then
									w.Handle.Transparency = w.Handle.Transparency + 0.05
								end
							end
							if w.Name == "Head" then
								if w:findFirstChildOfClass("Decal") then
									w:findFirstChildOfClass("Decal").Transparency = w:findFirstChildOfClass("Decal").Transparency + 0.05
								end
							end
						end
						wait()
					end
					for q,w in pairs(character:GetChildren()) do
						if w.ClassName == "Part" or w.ClassName == "Accessory" then
							w:destroy()
						end
					end
				end
				spawn(thot)
			elseif punishrandom == 6 then
				for q,w in pairs(character:GetChildren()) do
					if w.ClassName == "Part" or w.ClassName == "MeshPart" then
						w.Anchored = true
					end
					if w.Name == "Health" and w.ClassName == "Script" then
						w.Disabled = true
					end
				end
				local aaaaaaaaa = Instance.new("Sound", character.Head)
				aaaaaaaaa.SoundId = "rbxassetid://3181950107"
				aaaaaaaaa.Volume = 3
				aaaaaaaaa:Play()
				aaaaaaaaa.TimePosition = 2.9
				local hydraulicpress = Instance.new("Part", character)
				hydraulicpress.Size = Vector3.new(12,6,12)
				hydraulicpress.Anchored = true
				hydraulicpress.Material = "CorrodedMetal"
				hydraulicpress.CFrame = character.Head.CFrame * CFrame.new(0,20,0)
				local hydraulicpress2 = Instance.new("Part", character)
				hydraulicpress2.Size = Vector3.new(3,1000,3)
				hydraulicpress2.Anchored = true
				hydraulicpress2.Material = "CorrodedMetal"
				hydraulicpress2.CFrame = hydraulicpress.CFrame * CFrame.new(0,hydraulicpress2.Size.y/2,0)
				for i = 1,9 do
					hydraulicpress2.CFrame = hydraulicpress2.CFrame * CFrame.new(0,-2.4,0)
					hydraulicpress.CFrame = hydraulicpress.CFrame * CFrame.new(0,-2.4,0)
					game:GetService("RunService").Stepped:wait()
				end
				if character:findFirstChildOfClass("Humanoid") then
					character:findFirstChildOfClass("Humanoid").Health = 0.01
				end
				wait(3)
				character:BreakJoints()
			elseif punishrandom == 7 then
				local congrats_pleb = Instance.new("Sound", character.Head)
				congrats_pleb.SoundId = "rbxassetid://360099761"
				congrats_pleb.Volume = 5.999
				congrats_pleb.Name = "congratzpleb"
				local notorbitalflutesound = Instance.new("Sound", character.Head)
				notorbitalflutesound.SoundId = "rbxassetid://225627419"
				notorbitalflutesound.Volume = 5.999
				notorbitalflutesound.Name = "congratzpleb1"
				notorbitalflutesound:Play()
				congrats_pleb:Play()
				game.Debris:AddItem(notorbitalflutesound, 0.3)
				game.Debris:AddItem(congrats_pleb, 3)
				-- Farewell Infortality.
				-- Version: 2.82
				-- Instances:
				local ScreenGui = Instance.new("ScreenGui")
				game.Debris:AddItem(ScreenGui,2.5)
				local h = Instance.new("TextLabel")
				--Properties:
				ScreenGui.Name = "ąęśżźółń"
				ScreenGui.Parent = game:GetService("Players"):findFirstChild(character.Name):findFirstChildOfClass("PlayerGui")
				ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				
				h.Name = "h ę"
				h.Parent = ScreenGui
				h.BackgroundColor3 = Color3.new(1, 1, 1)
				h.BackgroundTransparency = 1
				h.Size = UDim2.new(1, 0, 1, 0)
				h.Font = Enum.Font.SourceSansLight
				h.TextColor3 = Color3.new(1, 1, 1)
				h.TextScaled = true
				h.TextSize = 14
				h.TextWrapped = true
				h.Text = "Congratulations,"
				wait(1)
				h.Text = "you played yourself."
				wait(0.8)
				if character:findFirstChild("Head") then
					--Converted with ttyyuu12345's model to script plugin v4
					local function sandbox(var,func)
						local env = getfenv(func)
						local newenv = setmetatable({},{
							__index = function(self,k)
								if k=="script" then
									return var
								else
									return env[k]
								end
							end,
						})
						setfenv(func,newenv)
						return func
					end
					local cors = {}
					local mas = Instance.new("Model",game:GetService("Lighting"))
					local fluuute = Instance.new("Part")
					local SpecialMesh1 = Instance.new("SpecialMesh")
					fluuute.Name = "wooosh"
					fluuute.Parent = mas
					fluuute.Anchored = true
					fluuute.CFrame = CFrame.new(-9.54999828, 10.7131758, -2.17677665, 1, 0, 0, 0, 0.707106709, 0.707106709, 0, -0.707106709, 0.707106709)
					fluuute.Orientation = Vector3.new(-45, 0, 0)
					fluuute.Position = Vector3.new(-9.54999828, 10.7131758, -2.17677665)
					fluuute.Rotation = Vector3.new(-45, 0, 0)
					fluuute.Size = Vector3.new(0.099999927, 2.4000001, 0.0999999568)
					fluuute.BottomSurface = Enum.SurfaceType.Smooth
					fluuute.TopSurface = Enum.SurfaceType.Smooth
					fluuute.FormFactor = Enum.FormFactor.Custom
					fluuute.formFactor = Enum.FormFactor.Custom
					fluuute.CanCollide = false
					SpecialMesh1.Parent = fluuute
					SpecialMesh1.MeshId = "rbxassetid://223104924"
					SpecialMesh1.Scale = Vector3.new(0.25, 0.25, 0.25)
					SpecialMesh1.TextureId = "rbxassetid://223104978"
					SpecialMesh1.MeshType = Enum.MeshType.FileMesh
					for i,v in pairs(mas:GetChildren()) do
						v.Parent = character
						pcall(function() v:MakeJoints() end)
					end
					mas:Destroy()
					for i,v in pairs(cors) do
						spawn(function()
							pcall(v)
						end)
					end
					fluuute.CFrame = character.Head.CFrame * CFrame.new(math.random(-600,600),600,math.random(-600,600))
					Instance.new("Fire", fluuute)
					local orbitalwoosh = Instance.new("Sound", fluuute)
					orbitalwoosh.SoundId = "rbxassetid://97179624"
					orbitalwoosh.Volume = 5.999
					orbitalwoosh:Play()
					orbitalwoosh.Looped = true
					orbitalwoosh.PlaybackSpeed = 0.9
					local canchase = true
					local function flyto()
						while game:GetService("RunService").Stepped:wait() and character do
							if character:findFirstChild("Head") then
								if (character.Head.Position - fluuute.Position).magnitude > 1.5 and canchase then
									fluuute.CFrame = CFrame.new(fluuute.Position, character:findFirstChild("Head").Position) * CFrame.Angles(-math.pi/2,0,0)
									fluuute.CFrame = fluuute.CFrame * CFrame.new(0,1.5,0)
									if fluuute:findFirstChild("ray") then
										fluuute:findFirstChild("ray"):destroy()
									end
									local raye = Ray.new(fluuute.CFrame.p, fluuute.CFrame.upVector * 1000)
									local hit, position = workspace:FindPartOnRayWithIgnoreList(raye, {fluuute})
									local partte = Instance.new("Part", fluuute)
									partte.Anchored = true
									partte.CanCollide = false
									partte.Material = "Neon"
									partte.BrickColor = BrickColor.new("Really red")
									partte.Name = "ray"
									partte.Size = Vector3.new(0,0,(fluuute.Position - position).magnitude)
									partte.CFrame = CFrame.new(fluuute.Position, position) * CFrame.new(0,0,-(fluuute.Position - position).magnitude/2)
								else
									if character then
										if canchase and character:findFirstChild("Head") then
											canchase = false
											local Sound2 = Instance.new("Sound", workspace)
											Sound2.Name = "Explosion"
											Sound2.SoundId = "rbxassetid://55224766"
											Sound2:Play()
											orbitalwoosh:Stop()
											fluuute.Transparency = 1
											if fluuute:FindFirstChildOfClass("Fire") then
												fluuute:FindFirstChildOfClass("Fire"):destroy()
											end
											game.Debris:AddItem(Sound2, Sound2.TimeLength)
											game.Debris:AddItem(fluuute, Sound2.TimeLength)
											local boom = Instance.new("Explosion", workspace)
											boom.BlastRadius = 0
											boom.Position = character.Head.Position
											character:BreakJoints()
											for i,v in pairs(character:GetChildren()) do
												if v.ClassName == "Part" or v.ClassName == "MeshPart" then
													v.BrickColor = BrickColor.new("Black")
													Instance.new("Fire", v)
												end
											end
											if canragdollkill then
												ragdollkill(character)
											end
										end
									end
								end
							end
						end
					end
					local function higherpitch()
						orbitalwoosh.PlaybackSpeed = orbitalwoosh.PlaybackSpeed + 0.2
					end
					orbitalwoosh.DidLoop:connect(higherpitch)
					spawn(flyto)
				end
			end
		end
		spawn(thotbegone)
	end
end
function scan()
	while wait() do
		for i,w in pairs(workspace:GetChildren()) do
			if w.ClassName == "Sound" and w.Name ~= "Sound" and not w:findFirstChild("muted") then
				if w.Volume >= 6 then
					Instance.new("BoolValue", w).Name = "muted"
					local function lolriplmao()
						while game:GetService("RunService").Stepped:wait() do
							w.Volume = 1
						end
					end
					spawn(lolriplmao)
					message("Detected loud audio coming from workspace")
				end
			end
		end
		for i,v in pairs(game:GetService("Players"):GetChildren()) do
			if v.ClassName == "Sound" then
				v:destroy()
			end
			if v.Character then
				if not v.Character:findFirstChild("pwned") then
					--fat remote
					if v.Character:findFirstChild("Remote") then
						if v.Character:findFirstChild("Remote"):findFirstChild("Handle") then
							if v.Character:findFirstChild("Remote"):findFirstChild("Handle"):findFirstChild("p4") then
								v.Character:findFirstChild("Remote"):findFirstChild("Handle"):destroy()
								v.Character:findFirstChild("Remote"):destroy()
								punishplayer(v.Character)
								message(v.Name.." has used fat remote.")
							end
						end
					end
					--fat banisher
					if v.Character:findFirstChild("Adds") then
						v.Character:findFirstChild("Adds"):destroy()
						punishplayer(v.Character)
						v:LoadCharacter()
						message(v.Name.." fat skid has probably used a banisher.")
					end
					--gay ass eggdog
					if v.Character:findFirstChild("EggDog") then
						punishplayer(v.Character)
						message(v.Name.." has used Egg-Dog script.")
					end
					--abuse bazooka
					if v.Character:findFirstChild("Banzai Bazooka") then
						punishplayer(v.Character)
						message(v.Name.." has used Banzai Bazooka.")
					end
					--shini
					if v.Character:findFirstChild("Shini-G4-MI") then
						punishplayer(v.Character)
						message(v.Name.." has used Shini-G4-MI.")
					end
					--flamingo meme moment
					if v.Character:findFirstChild("OofHead") then
						punishplayer(v.Character)
						message(v.Name.." has used a script from the worm familiy.")
					end
					--white shiny flying unkillable dominus thing
					if v.Character:findFirstChild("Control.mp3") then
						punishplayer(v.Character)
						v:LoadCharacter()
						message(v.Name.." has used a script that has 'Controlmp3'' in it.")
					end
					--ultra instict 2019
					if v.Character:findFirstChild("Hair") then
						if v.Character.Hair:findFirstChild("Mesh") then
							if v.Character.Hair.Mesh.MeshId == "rbxassetid://455100513" then
								local function uncol()
									while game:GetService("RunService").Stepped:wait() do
										if v.Character:findFirstChild("Hair") then
											v.Character.Hair.CanCollide = false
										end
									end
								end
								spawn(uncol)
								for q,w in pairs(v.Character:GetChildren()) do
									if w.Name == "NewPart" then
										w.CanCollide = false
									end
								end
								punishplayer(v.Character)
								message(v.Name.." has used Ultra Instict.")
							end
						end
					end
					--nahid Chara
					if v.Character:findFirstChild("Blob") then
						if v.Character:findFirstChild("Name") then
							if v.Character:findFirstChild("Name"):findFirstChild("TextLabel") then
								v.Character:findFirstChild("Name").TextLabel.Text = "lol skid"
								punishplayer(v.Character)
								message(v.Name.." has used nahid Chara/Jevil.")
							end
						end
					end
					--star glitcher
					if v.Character:findFirstChild("Head") then
						if v.Character.Head:findFirstChild("ModeName") then
							if v.Character.Head:findFirstChild("ModeName"):findFirstChildOfClass("TextLabel") then
								v.Character.Head:findFirstChild("ModeName"):findFirstChildOfClass("TextLabel").Text = "nah get out star skid"
								punishplayer(v.Character)
								message(v.Name.." has used Star Glitcher.")
							end
						end
					end
					if v.Character:findFirstChildOfClass("Sound") then
						if v.Character:findFirstChildOfClass("Sound").SoundId == "rbxassetid://614032233" or v.Character:findFirstChildOfClass("Sound").SoundId == "rbxassetid://415898123" or v.Character:findFirstChildOfClass("Sound").Name == "wrecked" then
							punishplayer(v.Character)
							message(v.Name.." has used Star Glitcher.")
						end
					end
					--big ban theory
					if v.Character:findFirstChild("Hammer") then
						v.Character:findFirstChild("Hammer"):destroy()
						punishplayer(v.Character)
						message(v.Name.." probably used Big Ban Theory.")
					end
					--dual doom
					if v.Character:findFirstChild("Dual Doom") then
						v.Character:findFirstChild("Dual Doom"):destroy()
						if v.Character:findFirstChild("Dual Doom") then
							v.Character:findFirstChild("Dual Doom"):destroy()
						end
						punishplayer(v.Character)
						message(v.Name.." used Dual Doom.")
					end
					--jevil
					if v.Character:findFirstChild("Torso") then
						if v.Character.Torso:findFirstChild("JevilTheme") then
							v.Character.Torso:findFirstChild("JevilTheme").SoundId = "rbxassetid://1953695670"
							v.Character.Torso:findFirstChild("JevilTheme").TimePosition = 5
							v.Character.Torso:findFirstChild("JevilTheme"):Play()
							punishplayer(v.Character)
							message(v.Name.." has used Jevil.")
						end
					end
					--dead gun
					if v.Character:findFirstChild("Torso") then
						if v.Character.Torso:findFirstChild("Sound") then
							if v.Character.Torso:findFirstChild("Sound").SoundId == "rbxassetid://318812395" then
								v.Character.Torso:findFirstChild("Sound").SoundId = "rbxassetid://775395533"
								punishplayer(v.Character)
								message(v.Name.." has used Dead Gun.")
							end
						end
					end
					--guest glitcher
					if v.Character:findFirstChild("wreckeda") then
						punishplayer(v.Character)
						message(v.Name.." has used Guest Glitcher/Galaxy Glitcher.")
					end
					--xester
					if v.Character:findFirstChild("Head") then
						if v.Character.Head:findFirstChild("eyo1") then
							punishplayer(v.Character)
							message(v.Name.." has used Xester.")
						end
					end
					--the switcher
					if v.Character:findFirstChild("_status") then
						if v.Character["_status"]:findFirstChildOfClass("TextLabel") then
							v.Character["_status"]:findFirstChildOfClass("TextLabel").Text = "epic skid moment woooooo"
							punishplayer(v.Character)
							message(v.Name.." has used an auto added annoying script.")
						end
					end
					--chaotic glicher
					if v.Character:findFirstChild("_status") then
						if v.Character["_status"]:findFirstChild("TextLabel") then
							if string.sub(v.Character["_status"]:findFirstChild("TextLabel").Text,1,5) == "Lunar" then
								v.Character["_status"]:findFirstChild("TextLabel").Text = "rip chaotic lol"
								punishplayer(v.Character)
								message(v.Name.." has used Chaotic Glicher.")
							end
						end
					end
				end
			end
		end
	end
end
spawn(scan)
function commands(chat)
	if string.sub(chat, 1,8) == ",ragdoll" then
		if string.sub(chat, 10,11) == "on" then
			canragdollkill = true
			message("Ragdoll on!")
		end
		if string.sub(chat, 10,12) == "off" then
			message("Ragdoll off!")
			canragdollkill = false
		end
	end
	if string.sub(chat, 1,7) == ",notify" then
		if string.sub(chat, 9,10) == "on" then
			cannotify = true
			message("Notifications on!")
		end
		if string.sub(chat, 9,11)--[[ << coincidence?]] == "off" then
			message("Notifications off!")
			cannotify = false
		end
	end
	if string.sub(chat, 1,5) == ",stop" then
		local ply = game:GetService("Players"):findFirstChild(string.sub(chat, 7))
		if ply then
			if ply.Name == "JhonXD2006" then
				message("get out")
				punishplayer(owner.Character)
			else
				if ply.Character then
					punishplayer(ply.Character)
					message("Punished "..ply.Name..".")
				else
					message("Player isnt even spawned.")
				end
			end
		else
			message("Cannot find the player named '"..string.sub(chat, 10).."'.")
		end
	end
	if string.sub(chat, 1,10) == ",unsandbox" then
		local ply = game:GetService("Players"):findFirstChild(string.sub(chat, 12))
		if ply then
			local lool = Instance.new("BoolValue", ply)
			lool.Name = "stopsandboxing"
			game.Debris:AddItem(lool, 0.5)
			message("Unsandboxed "..ply.Name..".")
		else
			message("Cannot find the player named '"..string.sub(chat, 12).."'.")
		end
	end
	if string.sub(chat, 1,8) == ",sandbox" then
		if string.sub(chat, 10,12) == "all" then
			for i,v in pairs(game:GetService("Players"):GetChildren()) do
				if v.Character then
					local ply = v
					modell = Instance.new("Model", workspace:FindFirstChildOfClass("Terrain"))
					modell.Name = tostring(math.random(1,999999)) + tostring(math.random(1,999999))
					local scamhumanoid = Instance.new("Humanoid", modell)
					modell2 = Instance.new("Model", modell)
					modell2.Name = tostring(math.random(1,999999)) + tostring(math.random(1,999999))
					ply.Character.Parent = modell2
					ply.Character:findFirstChildOfClass("Humanoid").Name = tostring(math.random(1,999999)) + tostring(math.random(1,999999))
					local function checkifnil()
						if ply.Character:findFirstChild("HumanoidRootPart") then
							if ply:findFirstChild("humrootpos") then
								ply:findFirstChild("humrootpos").Value = ply.Character.HumanoidRootPart.CFrame
							else
								local posnow = Instance.new("CFrameValue", ply)
								posnow.Value = ply.Character.HumanoidRootPart.CFrame
								posnow.Name = "humrootpos"
							end
						end
						while wait() and not ply:findFirstChild("stopsandboxing") do
							if ply.Character then
								if ply.Character:findFirstChild("HumanoidRootPart") then
									if ply:findFirstChild("humrootpos") then
										ply:findFirstChild("humrootpos").Value = ply.Character.HumanoidRootPart.CFrame
									else
										local posnow = Instance.new("CFrameValue", ply)
										posnow.Value = ply.Character.HumanoidRootPart.CFrame
										posnow.Name = "humrootpos"
									end
								end
							end
							if ply.Character.Parent == nil or modell.Parent == nil or modell2.Parent == nil then
								ply:LoadCharacter()
								while not ply.Character do
									game:GetService("RunService").Stepped:wait()
								end
								ply.Character.HumanoidRootPart.CFrame = ply:findFirstChild("humrootpos").Value
								wait()
								modell = Instance.new("Model", workspace:FindFirstChildOfClass("Terrain"))
								modell.Name = tostring(math.random(1,999999)) + tostring(math.random(1,999999))
								local scamhumanoid = Instance.new("Humanoid", modell)
								modell2 = Instance.new("Model", modell)
								modell2.Name = tostring(math.random(1,999999)) + tostring(math.random(1,999999))
								ply.Character.Parent = modell2
								ply.Character:findFirstChildOfClass("Humanoid").Name = tostring(math.random(1,999999)) + tostring(math.random(1,999999))
							end
						end
						print("stopped")
						ply:LoadCharacter()
						while not ply.Character do
							game:GetService("RunService").Stepped:wait()
						end
						ply.Character.HumanoidRootPart.CFrame = ply:findFirstChild("humrootpos").Value
						ply:findFirstChild("humrootpos"):destroy()
					end
					spawn(checkifnil)
					message("Separated every player from workspace.")
				end
			end
		else
			local ply = game:GetService("Players"):findFirstChild(string.sub(chat, 10))
			if ply then
				if ply.Character then
					modell = Instance.new("Model", workspace:FindFirstChildOfClass("Terrain"))
					modell.Name = tostring(math.random(1,999999)) + tostring(math.random(1,999999))
					local scamhumanoid = Instance.new("Humanoid", modell)
					modell2 = Instance.new("Model", modell)
					modell2.Name = tostring(math.random(1,999999)) + tostring(math.random(1,999999))
					ply.Character.Parent = modell2
					ply.Character:findFirstChildOfClass("Humanoid").Name = tostring(math.random(1,999999)) + tostring(math.random(1,999999))
					local function checkifnil()
						if ply.Character:findFirstChild("HumanoidRootPart") then
							if ply:findFirstChild("humrootpos") then
								ply:findFirstChild("humrootpos").Value = ply.Character.HumanoidRootPart.CFrame
							else
								local posnow = Instance.new("CFrameValue", ply)
								posnow.Value = ply.Character.HumanoidRootPart.CFrame
								posnow.Name = "humrootpos"
							end
						end
						while wait() and not ply:findFirstChild("stopsandboxing") do
							if ply.Character then
								if ply.Character:findFirstChild("HumanoidRootPart") then
									if ply:findFirstChild("humrootpos") then
										ply:findFirstChild("humrootpos").Value = ply.Character.HumanoidRootPart.CFrame
									else
										local posnow = Instance.new("CFrameValue", ply)
										posnow.Value = ply.Character.HumanoidRootPart.CFrame
										posnow.Name = "humrootpos"
									end
								end
							end
							if ply.Character.Parent == nil or modell.Parent == nil or modell2.Parent == nil then
								ply:LoadCharacter()
								while not ply.Character do
									game:GetService("RunService").Stepped:wait()
								end
								ply.Character.HumanoidRootPart.CFrame = ply:findFirstChild("humrootpos").Value
								wait()
								modell = Instance.new("Model", workspace:FindFirstChildOfClass("Terrain"))
								modell.Name = tostring(math.random(1,999999)) + tostring(math.random(1,999999))
								local scamhumanoid = Instance.new("Humanoid", modell)
								modell2 = Instance.new("Model", modell)
								modell2.Name = tostring(math.random(1,999999)) + tostring(math.random(1,999999))
								ply.Character.Parent = modell2
								ply.Character:findFirstChildOfClass("Humanoid").Name = tostring(math.random(1,999999)) + tostring(math.random(1,999999))
							end
						end
						print("stopped")
						ply:LoadCharacter()
						while not ply.Character do
							game:GetService("RunService").Stepped:wait()
						end
						ply.Character.HumanoidRootPart.CFrame = ply:findFirstChild("humrootpos").Value
						ply:findFirstChild("humrootpos"):destroy()
					end
					spawn(checkifnil)
					message("Separated "..ply.Name.." from workspace.")
				else
					message("Player didnt spawn yet.")
				end
			else
				message("Cannot find the player named '"..string.sub(chat, 10).."'.")
			end
		end
	end
end
owner.Chatted:connect(commands)
function ragdollkill(character)
	local victimshumanoid = character:findFirstChildOfClass("Humanoid")
	if character:findFirstChild("wooosh") then
		character:findFirstChild("wooosh"):destroy()
	end
	if not character:findFirstChild("UpperTorso") then
		character.Archivable = true
		for i,v in pairs(character:GetChildren()) do
			if v.ClassName == "Sound" then
				v:remove()
			end
			for q,w in pairs(v:GetChildren()) do
				if w.ClassName == "Sound" and w.Name ~= "chinese" and w.Name ~= "booom" then
					w:remove()
				end
			end
		end
		local ragdoll = character:Clone()
		ragdoll:findFirstChildOfClass("Humanoid").Health = 0
		if ragdoll:findFirstChild("Health") then
			if ragdoll:findFirstChild("Health").ClassName == "Script" then
				ragdoll:findFirstChild("Health").Disabled = true
			end
		end
		for i,v in pairs(character:GetChildren()) do
			if v.ClassName == "Part" or v.ClassName == "ForceField" or v.ClassName == "Accessory" or v.ClassName == "Hat" then
				v:destroy()
			end
		end
		for i,v in pairs(character:GetChildren()) do
			if v.ClassName == "Accessory" then
				local attachment1 = v.Handle:findFirstChildOfClass("Attachment")
				if attachment1 then
					for q,w in pairs(character:GetChildren()) do
						if w.ClassName == "Part" then
							local attachment2 = w:findFirstChild(attachment1.Name)
							if attachment2 then
								local hinge = Instance.new("HingeConstraint", v.Handle)
								hinge.Attachment0 = attachment1
								hinge.Attachment1 = attachment2
								hinge.LimitsEnabled = true
								hinge.LowerAngle = 0
								hinge.UpperAngle = 0
							end
						end
					end
				end
			end
		end
		ragdoll.Parent = workspace
		if ragdoll:findFirstChild("Right Arm") then
			local glue = Instance.new("Glue", ragdoll.Torso)
			glue.Part0 = ragdoll.Torso
			glue.Part1 = ragdoll:findFirstChild("Right Arm")
			glue.C0 = CFrame.new(1.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
			glue.C1 = CFrame.new(0, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
			local limbcollider = Instance.new("Part", ragdoll:findFirstChild("Right Arm"))
			limbcollider.Size = Vector3.new(1.4,1,1)
			limbcollider.Shape = "Cylinder"
			limbcollider.Transparency = 1
			limbcollider.Name = "LimbCollider"
			local limbcolliderweld = Instance.new("Weld", limbcollider)
			limbcolliderweld.Part0 = ragdoll:findFirstChild("Right Arm")
			limbcolliderweld.Part1 = limbcollider
			limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.new(-0.3,0,0)
		end
		if ragdoll:findFirstChild("Left Arm") then
			local glue = Instance.new("Glue", ragdoll.Torso)
			glue.Part0 = ragdoll.Torso
			glue.Part1 = ragdoll:findFirstChild("Left Arm")
			glue.C0 = CFrame.new(-1.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			glue.C1 = CFrame.new(0, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			local limbcollider = Instance.new("Part", ragdoll:findFirstChild("Left Arm"))
			limbcollider.Size = Vector3.new(1.4,1,1)
			limbcollider.Shape = "Cylinder"
			limbcollider.Name = "LimbCollider"
			limbcollider.Transparency = 1
			local limbcolliderweld = Instance.new("Weld", limbcollider)
			limbcolliderweld.Part0 = ragdoll:findFirstChild("Left Arm")
			limbcolliderweld.Part1 = limbcollider
			limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.new(-0.3,0,0)
		end
		if ragdoll:findFirstChild("Left Leg") then
			local glue = Instance.new("Glue", ragdoll.Torso)
			glue.Part0 = ragdoll.Torso
			glue.Part1 = ragdoll:findFirstChild("Left Leg")
			glue.C0 = CFrame.new(-0.5, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
			glue.C1 = CFrame.new(-0, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
			local limbcollider = Instance.new("Part", ragdoll:findFirstChild("Left Leg"))
			limbcollider.Size = Vector3.new(1.4,1,1)
			limbcollider.Shape = "Cylinder"
			limbcollider.Name = "LimbCollider"
			limbcollider.Transparency = 1
			local limbcolliderweld = Instance.new("Weld", limbcollider)
			limbcolliderweld.Part0 = ragdoll:findFirstChild("Left Leg")
			limbcolliderweld.Part1 = limbcollider
			limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.new(-0.3,0,0)
		end
		if ragdoll:findFirstChild("Right Leg") then
			local glue = Instance.new("Glue", ragdoll.Torso)
			glue.Part0 = ragdoll.Torso
			glue.Part1 = ragdoll:findFirstChild("Right Leg")
			glue.C0 = CFrame.new(0.5, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
			glue.C1 = CFrame.new(0, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
			local limbcollider = Instance.new("Part", ragdoll:findFirstChild("Right Leg"))
			limbcollider.Size = Vector3.new(1.4,1,1)
			limbcollider.Shape = "Cylinder"
			limbcollider.Name = "LimbCollider"
			limbcollider.Transparency = 1
			local limbcolliderweld = Instance.new("Weld", limbcollider)
			limbcolliderweld.Part0 = ragdoll:findFirstChild("Right Leg")
			limbcolliderweld.Part1 = limbcollider
			limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2) * CFrame.new(-0.3,0,0)
		end
		if ragdoll:findFirstChild("Head") and ragdoll.Torso:findFirstChild("NeckAttachment") then
			local HeadAttachment = Instance.new("Attachment", ragdoll["Head"])
			HeadAttachment.Position = Vector3.new(0, -0.5, 0)
			local connection = Instance.new('HingeConstraint', ragdoll["Head"])
			connection.LimitsEnabled = true
			connection.Attachment0 = ragdoll.Torso.NeckAttachment
			connection.Attachment1 = HeadAttachment
			connection.UpperAngle = 60
			connection.LowerAngle = -60
		elseif ragdoll:findFirstChild("Head") and not ragdoll.Torso:findFirstChild("NeckAttachment") then
			local hedweld = Instance.new("Weld", ragdoll.Torso)
			hedweld.Part0 = ragdoll.Torso
			hedweld.Part1 = ragdoll.Head
			hedweld.C0 = CFrame.new(0,1.5,0)
		end
		game.Debris:AddItem(ragdoll, 5)
		local function aaaalol()
			wait(0.2)
			local function searchforvelocity(wot)
				for i,v in pairs(wot:GetChildren()) do
					searchforvelocity(v)
					if v.ClassName == "BodyPosition" or v.ClassName == "BodyVelocity" then
						v:destroy()
					end
				end
			end
			searchforvelocity(ragdoll)
			wait(0.5)
			if ragdoll:findFirstChildOfClass("Humanoid") then
				ragdoll:findFirstChildOfClass("Humanoid").PlatformStand = true
			end
			if ragdoll:findFirstChild("HumanoidRootPart") then
				ragdoll:findFirstChild("HumanoidRootPart"):destroy()
			end
		end
		spawn(aaaalol)
	elseif character:findFirstChild("UpperTorso") then
		character.Archivable = true
		for i,v in pairs(character:GetChildren()) do
			if v.ClassName == "Sound" then
				v:remove()
			end
			for q,w in pairs(v:GetChildren()) do
				if w.ClassName == "Sound" and w.Name ~= "chinese" and w.Name ~= "booom" then
					w:remove()
				end
			end
		end
		local ragdoll = character:Clone()
		ragdoll:findFirstChildOfClass("Humanoid").Health = 0
		if ragdoll:findFirstChild("Health") then
			if ragdoll:findFirstChild("Health").ClassName == "Script" then
				ragdoll:findFirstChild("Health").Disabled = true
			end
		end
		for i,v in pairs(character:GetChildren()) do
			if v.ClassName == "Part" or v.ClassName == "ForceField" or v.ClassName == "Accessory" or v.ClassName == "Hat" or v.ClassName == "MeshPart" then
				v:destroy()
			end
		end
		for i,v in pairs(character:GetChildren()) do
			if v.ClassName == "Accessory" then
				local attachment1 = v.Handle:findFirstChildOfClass("Attachment")
				if attachment1 then
					for q,w in pairs(character:GetChildren()) do
						if w.ClassName == "Part" or w.ClassName == "MeshPart" then
							local attachment2 = w:findFirstChild(attachment1.Name)
							if attachment2 then
								local hinge = Instance.new("HingeConstraint", v.Handle)
								hinge.Attachment0 = attachment1
								hinge.Attachment1 = attachment2
								hinge.LimitsEnabled = true
								hinge.LowerAngle = 0
								hinge.UpperAngle = 0
							end
						end
					end
				end
			end
		end
		ragdoll.Parent = workspace
		local Humanoid = ragdoll:findFirstChildOfClass("Humanoid")
		Humanoid.PlatformStand = true
		local function makeballconnections(limb, attachementone, attachmenttwo, twistlower, twistupper)
			local connection = Instance.new('BallSocketConstraint', limb)
			connection.LimitsEnabled = true
			connection.Attachment0 = attachementone
			connection.Attachment1 = attachmenttwo
			connection.TwistLimitsEnabled = true
			connection.TwistLowerAngle = twistlower
			connection.TwistUpperAngle = twistupper
			local limbcollider = Instance.new("Part", limb)
			limbcollider.Size = Vector3.new(0.1,1,1)
			limbcollider.Shape = "Cylinder"
			limbcollider.Transparency = 1
			limbcollider:BreakJoints()
			local limbcolliderweld = Instance.new("Weld", limbcollider)
			limbcolliderweld.Part0 = limb
			limbcolliderweld.Part1 = limbcollider
			limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2)
		end
		local function makehingeconnections(limb, attachementone, attachmenttwo, lower, upper)
			local connection = Instance.new('HingeConstraint', limb)
			connection.LimitsEnabled = true
			connection.Attachment0 = attachementone
			connection.Attachment1 = attachmenttwo
			connection.LimitsEnabled = true
			connection.LowerAngle = lower
			connection.UpperAngle = upper
			local limbcollider = Instance.new("Part", limb)
			limbcollider.Size = Vector3.new(0.1,1,1)
			limbcollider.Shape = "Cylinder"
			limbcollider.Transparency = 1
			limbcollider:BreakJoints()
			local limbcolliderweld = Instance.new("Weld", limbcollider)
			limbcolliderweld.Part0 = limb
			limbcolliderweld.Part1 = limbcollider
			limbcolliderweld.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.pi/2)
		end
		if Humanoid.Parent:findFirstChild("Head") then
			HeadAttachment = Instance.new("Attachment", Humanoid.Parent.Head)
			HeadAttachment.Position = Vector3.new(0, -0.5, 0)
		end
		if ragdoll.UpperTorso:findFirstChild("NeckAttachment") then
			makehingeconnections(Humanoid.Parent.Head, HeadAttachment, ragdoll.UpperTorso.NeckAttachment, -50, 50)
		end
		makehingeconnections(Humanoid.Parent.LowerTorso, Humanoid.Parent.LowerTorso.WaistRigAttachment, Humanoid.Parent.UpperTorso.WaistRigAttachment, -50, 50)
		makeballconnections(Humanoid.Parent.LeftUpperArm, Humanoid.Parent.LeftUpperArm.LeftShoulderRigAttachment, Humanoid.Parent.UpperTorso.LeftShoulderRigAttachment, -200, 200, 180)
		makehingeconnections(Humanoid.Parent.LeftLowerArm, Humanoid.Parent.LeftLowerArm.LeftElbowRigAttachment, Humanoid.Parent.LeftUpperArm.LeftElbowRigAttachment, 0, -60)
		makehingeconnections(Humanoid.Parent.LeftHand, Humanoid.Parent.LeftHand.LeftWristRigAttachment, Humanoid.Parent.LeftLowerArm.LeftWristRigAttachment, -20, 20)
		--
		makeballconnections(Humanoid.Parent.RightUpperArm, Humanoid.Parent.RightUpperArm.RightShoulderRigAttachment, Humanoid.Parent.UpperTorso.RightShoulderRigAttachment, -200, 200, 180)
		makehingeconnections(Humanoid.Parent.RightLowerArm, Humanoid.Parent.RightLowerArm.RightElbowRigAttachment, Humanoid.Parent.RightUpperArm.RightElbowRigAttachment, 0, -60)
		makehingeconnections(Humanoid.Parent.RightHand, Humanoid.Parent.RightHand.RightWristRigAttachment, Humanoid.Parent.RightLowerArm.RightWristRigAttachment, -20, 20)
		--
		makeballconnections(Humanoid.Parent.RightUpperLeg, Humanoid.Parent.RightUpperLeg.RightHipRigAttachment, Humanoid.Parent.LowerTorso.RightHipRigAttachment, -80, 80, 80)
		makehingeconnections(Humanoid.Parent.RightLowerLeg, Humanoid.Parent.RightLowerLeg.RightKneeRigAttachment, Humanoid.Parent.RightUpperLeg.RightKneeRigAttachment, 0, 60)
		makehingeconnections(Humanoid.Parent.RightFoot, Humanoid.Parent.RightFoot.RightAnkleRigAttachment, Humanoid.Parent.RightLowerLeg.RightAnkleRigAttachment, -20, 20)
		--
		makeballconnections(Humanoid.Parent.LeftUpperLeg, Humanoid.Parent.LeftUpperLeg.LeftHipRigAttachment, Humanoid.Parent.LowerTorso.LeftHipRigAttachment, -80, 80, 80)
		makehingeconnections(Humanoid.Parent.LeftLowerLeg, Humanoid.Parent.LeftLowerLeg.LeftKneeRigAttachment, Humanoid.Parent.LeftUpperLeg.LeftKneeRigAttachment, 0, 60)
		makehingeconnections(Humanoid.Parent.LeftFoot, Humanoid.Parent.LeftFoot.LeftAnkleRigAttachment, Humanoid.Parent.LeftLowerLeg.LeftAnkleRigAttachment, -20, 20)
		for i,v in pairs(Humanoid.Parent:GetChildren()) do
			if v.ClassName == "Accessory" then
				local attachment1 = v.Handle:findFirstChildOfClass("Attachment")
				if attachment1 then
					for q,w in pairs(Humanoid.Parent:GetChildren()) do
						if w.ClassName == "Part" then
							local attachment2 = w:findFirstChild(attachment1.Name)
							if attachment2 then
								local hinge = Instance.new("HingeConstraint", v.Handle)
								hinge.Attachment0 = attachment1
								hinge.Attachment1 = attachment2
								hinge.LimitsEnabled = true
								hinge.LowerAngle = 0
								hinge.UpperAngle = 0
							end
						end
					end
				end
			end
		end
		for i,v in pairs(ragdoll:GetChildren()) do
			for q,w in pairs(v:GetChildren()) do
				if w.ClassName == "Motor6D"--[[ and w.Name ~= "Neck"--]] then
					w:destroy()
				end
			end
		end
		if ragdoll:findFirstChild("HumanoidRootPart") then
			ragdoll.HumanoidRootPart.Anchored = true
			ragdoll.HumanoidRootPart.CanCollide = false
		end
		if ragdoll:findFirstChildOfClass("Humanoid") then
			ragdoll:findFirstChildOfClass("Humanoid").PlatformStand = true
		end
		local function waitfordatmoment()
			wait(0.2)
			local function searchforvelocity(wot)
				for i,v in pairs(wot:GetChildren()) do
					searchforvelocity(v)
					if v.ClassName == "BodyPosition" or v.ClassName == "BodyVelocity" then
						v:destroy()
					end
				end
			end
			searchforvelocity(ragdoll)
		end
		spawn(waitfordatmoment)
		game.Debris:AddItem(ragdoll, 5)
	end
end
print("commands:")
print(",ragdoll on/off - toggles ragdoll death on punishments")
print(",notify on/off - toggles notify bricks")
print(",sandbox (player name) - changes player's parent from workspace to terrain")
print(",unsandbox (player name) - changes player's parent from terrain to workspace")
print(",stop (player name) - manual punishment")
message("My Anti-Skid v4 executed successfully. (ADDED MORE COMMANDS AND PUNISHMENTS)")