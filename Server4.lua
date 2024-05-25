game.Players.PlayerAdded:Connect(function(plr)
	local function loop1()
		while wait() do
			if plr:findFirstChildOfClass("Backpack") then
				for i, v in pairs(plr:findFirstChild("Backpack"):GetChildren()) do
					if v.Name == "Building Tools" and v.ClassName == "Tool" then
						v.GripPos = Vector3.new(0, 0, 0.4)
					end
				end
			end
		end
	end
	spawn(loop1)
end)
local storage = game.ServerStorage
function newDummy()
	local assetId = 82353
	local insertService = game:GetService("InsertService")
	local dummy = insertService:LoadAsset(124120704)
	dummy.Parent = storage
	dummy.Name = "Dummy"
end
local function loop2()
	while wait() do
		if storage:findFirstChild("Dummy") == nil then
			newDummy()
		end
	end
end
spawn(loop2)

local function punish(character, kickmessage)
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
							local bruh = game.Players:GetPlayerFromCharacter(character)
							if bruh then
								bruh:Kick("[Banner message]: "..kickmessage)
							end
                        end
                    end
                    banhamma.Touched:connect(touched)
                    wait(2)
                    if not touchedban and character:findFirstChild("Head") then
                        banhamma.CFrame = character:findFirstChild("Head").CFrame
                    end
                end
end
game.Players.PlayerAdded:Connect(function(plr)
	if plr.Name == "JhonXD2006" then
		plr.Chatted:Connect(function(msg)
			if msg == "test/banner" then
				if plr.Character then
					punish(plr.Character)
				else
					plr.CharacterAdded:Connect(function(char)
						wait(3)
						punish(char, "Test banner has been executed!")
					end)
				end
			end
		end)
	end
end)